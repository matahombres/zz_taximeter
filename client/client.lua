
local isPausing = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		if IsPauseMenuActive() and not isPausing then
			isPausing = true
			SendNUIMessage({type = "menuOpacityActive"})
		elseif not IsPauseMenuActive() and isPausing then
			isPausing = false
			SendNUIMessage({type = "menuOpacityDisabled"})
		end
	end
end)


RegisterNUICallback('initialConfig', function(data,cb)
	SendNUIMessage({type = "initialData", lang=Locales[Config.lang], formatMoney = Config.formatMoney })
	cb('OK')
end)

RegisterNetEvent('zz_taximeter:showTaximeter', function() 
	SendNUIMessage({type = "open" })
end)
RegisterNetEvent('zz_taximeter:hideTaximeter', function() 
	SendNUIMessage({type = "close" })
end)
RegisterNetEvent('zz_taximeter:pauseTaximeter', function(activePause)
	if activePause then
		SendNUIMessage({type = "play" })
	else
		SendNUIMessage({type = "pause" })
	end
end)
RegisterNetEvent('zz_taximeter:resetTaximeter', function()
	SendNUIMessage({type = "reset" })
end)
RegisterNetEvent('zz_taximeter:selRateTaximeter', function(rate)
	SendNUIMessage({type = "select_rate", rate = rate })
end)
RegisterNetEvent('zz_taximeter:updateMoney', function(price)
	SendNUIMessage({type = "update_total", price = price })
end)

RegisterNetEvent('zz_taximeter:calculeDistance', function(lastLocation, currentLocation, plate, taxi)
	local distance = CalculateTravelDistanceBetweenPoints(lastLocation, currentLocation)

	TriggerServerEvent('zz_taximeter:distanceCalculated', distance, taxi.totalDistance + distance, plate, taxi)
end)