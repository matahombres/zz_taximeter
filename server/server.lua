
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		for plate, taxi in pairs(currentTaxiDrivers) do
			if not DoesEntityExist(taxi.vehId) then
				removeTaxiFromPlate(plate)
			end
			if DoesEntityExist(taxi.vehId) and not taxi.pause and taxi.rate ~= nil then
				TriggerClientEvent('zz_taximeter:calculeDistance', taxi.driveId, taxi.oldPosition, GetEntityCoords(taxi.vehId), plate, taxi)
			end
		end
	end
end)


function forcePause(veh, activePause)
	setPause(veh, activePause)
	sendAllFromTaxi(veh, function(ply)
		TriggerClientEvent('zz_taximeter:pauseTaximeter', ply, not activePause)
	end)
end

RegisterNetEvent('zz_taximeter:distanceCalculated',function(diference, totalDistance, plate, taxi)
	local veh = GetVehiclePedIsIn(GetPlayerPed(source), false)
	local plate = getPlate(taxi.vehId)
	setOldPositionFromPlate(plate, GetEntityCoords(taxi.vehId))
	setDistanceFromPlate(plate, totalDistance)
	
	local isStopped = true

	if diference > 5 then
		isStopped = false
	end
	
	--calculeTotalDistance(taxi)
	local rate = Config.Rates[taxi.rate]

	if isStopped then
		local totalSec = taxi.secPause + 2
		setSecPauseFromPlate(plate, totalSec)
		setPricePauseFromPlate(plate, totalSec * rate.onStop)
	else
		local metters = 1000.00
		if Config.distanceMeasurement == "MI" then
			metters = 1609.34
		end

		setPriceFromPlate(plate, ( totalDistance / metters ) * rate.inMotion)
	end

	local taxiNew = getTaxiFromPlate(plate)

	local totalPrice = rate.base + taxiNew.pricePause + taxiNew.price

	sendAllFromTaxi(veh, function(ply)
		TriggerClientEvent('zz_taximeter:updateMoney', ply, totalPrice)
	end)
end)

RegisterNetEvent('zz_taximeter:toggleTaximeter', function()
	local _src = source
	local veh = GetVehiclePedIsIn(GetPlayerPed(_src), false)

	if not IsInAuthorizedVehicle(veh) then return end

	if isAlreadyTaxi(veh) then
		removeTaxi(veh)
		sendAllFromTaxi(veh, function(ply)
			TriggerClientEvent('zz_taximeter:pauseTaximeter', ply, true)
			TriggerClientEvent('zz_taximeter:resetTaximeter', ply)
			TriggerClientEvent('zz_taximeter:hideTaximeter', ply)
		end)
	else 
		addTaxi(veh, _src)
		sendAllFromTaxi(veh, function(ply)
			TriggerClientEvent('zz_taximeter:showTaximeter', ply)
		end)
	end

end)

RegisterNetEvent('zz_taximeter:pause', function(vehNetId)
	local veh = NetworkGetEntityFromNetworkId(vehNetId)
	local taxi = getTaxi(veh)
	setPause(veh, not taxi.pause)
	sendAllFromTaxi(veh, function(ply)
		TriggerClientEvent('zz_taximeter:pauseTaximeter', ply, not taxi.pause)
	end)
end)

RegisterNetEvent('zz_taximeter:reset', function(vehNetId)
	local veh = NetworkGetEntityFromNetworkId(vehNetId)
	resetTaxi(veh, source)
	setPause(veh, false)
	sendAllFromTaxi(veh, function(ply)
		TriggerClientEvent('zz_taximeter:pauseTaximeter', ply, true)
		TriggerClientEvent('zz_taximeter:resetTaximeter', ply)
	end)
end)

RegisterNetEvent('zz_taximeter:selectRate', function(vehNetId, rateSel)
	local veh = NetworkGetEntityFromNetworkId(vehNetId)
	rateSel = tonumber(rateSel)
	local taxi = getTaxi(veh)
	setRate(veh, rateSel)
	forcePause(veh, false)
	sendAllFromTaxi(veh, function(ply)
		local rate = Config.Rates[rateSel]
		TriggerClientEvent('zz_taximeter:selRateTaximeter', ply, rateSel)
		if taxi.price == 0 then
			TriggerClientEvent('zz_taximeter:updateMoney', ply, rate.base)
		end
	end)
end)



RegisterNetEvent('baseevents:enteringVehicle', function(vehClient, seat, vehLabel, vehNetId) 
	local veh = NetworkGetEntityFromNetworkId(vehNetId)
	if not IsInAuthorizedVehicle(veh) then return end
	debugDump("Enter in vehicle")
	if isAlreadyTaxi(veh) then
		local taxi = getTaxi(veh)
		local totalPrice = taxi.price + taxi.pricePause
		if seat == -1 then
			setDrive(veh, source)
		end
		if taxi.pause and taxi.rate ~= nil then
			TriggerClientEvent('zz_taximeter:pauseTaximeter', source, not taxi.pause)
		end
		if taxi.rate ~= nil then
			TriggerClientEvent('zz_taximeter:selRateTaximeter', source, taxi.rate)
			totalPrice = totalPrice + Config.Rates[taxi.rate].base
			TriggerClientEvent('zz_taximeter:updateMoney', source, totalPrice)
		end
		TriggerClientEvent('zz_taximeter:showTaximeter', source)
	end
end)

RegisterNetEvent('baseevents:leftVehicle', function(vehClient, seat, vehLabel, vehNetId) 
	TriggerClientEvent('zz_taximeter:hideTaximeter', source)
	TriggerClientEvent('zz_taximeter:resetTaximeter', source)
	local veh = NetworkGetEntityFromNetworkId(vehNetId)
	if not IsInAuthorizedVehicle(veh) then return end
	debugDump("Exit in vehicle")
	if isAlreadyTaxi(veh) then
		local taxi = getTaxi(veh)
		if seat == -1 and taxi.rate ~= nil then
			forcePause(veh, true)
		end
	end
end)


AddEventHandler('esx:playerDropped', function(playerId, reason)
	local playerPed = GetPlayerPed(playerId)
	local veh = GetVehiclePedIsIn(playerPed, true)
	if not IsInAuthorizedVehicle(veh) then return end
	for k, seat in pairs({-1, 0, 1, 2, 3, 4, 5, 6}) do
			local tryPlayer = GetLastPedInVehicleSeat(veh, seat)
			if tryPlayer ~= 0 and tryPlayer == playerPed and seat == -1 then
				forcePause(veh, true)
			end
	end 
end)