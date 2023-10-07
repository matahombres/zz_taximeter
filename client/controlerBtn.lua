local listenButton = false

RegisterKeyMapping("taximeter", translate("keyMappingTaximeter"), "keyboard", Config.taximeterDefaultKey)
RegisterKeyMapping("taximeterBtn", translate("keyMappingBtn"), "keyboard", Config.taximeterBtnDefaultKey)



RegisterCommand('taximeter', function()

	if canInteractUI(PlayerPedId()) then
		TriggerServerEvent('zz_taximeter:toggleTaximeter')
	end
	
end, false)

RegisterCommand('taximeterBtn',function()
	listenButton = not listenButton
	if listenButton and canInteractUI(PlayerPedId()) then
		SendNUIMessage({type = "focus_active" })
	else
		SendNUIMessage({type = "focus_disable" })
	end
	activeListener()
end)

function activeListener()
	Citizen.CreateThread(function()
		while listenButton do
			Citizen.Wait(1)
			if not (canInteractUI(PlayerPedId())) then
				listenButton = false
			else
				if IsControlJustReleased(0, 174) then -- LEFT ARROW
					SendNUIMessage({type = "left_arrow" })
					Citizen.Wait(200)
				end
				if IsControlJustReleased(0, 175) then -- RIGHT ARROW
					SendNUIMessage({type = "right_arrow" })
					Citizen.Wait(200)
				end
				if IsControlJustReleased(0, 176) then -- ENTER BTN
					SendNUIMessage({type = "enter_btn" })
					Citizen.Wait(200)
				end
			end
		end
	end)
end

function canInteractUI(playerPed)
	return IsPedInAnyVehicle(playerPed, false) and IsDriver(playerPed) and IsInAuthorizedVehicle(GetVehiclePedIsIn(playerPed,false))
end

RegisterNUICallback('selectBtn',function(data,cb)
	local playerPed = PlayerPedId()
	local veh = nil
	local number = tostring(data['numberBtn'])
	if IsPedInAnyVehicle(playerPed, false) and IsDriver(playerPed) and IsInAuthorizedVehicle(GetVehiclePedIsIn(playerPed,false)) then
		local veh = GetVehiclePedIsIn(playerPed,false)
		local vehNet = VehToNet(veh)
		if number == "7" then
			TriggerServerEvent('zz_taximeter:pause', vehNet)
		elseif number == "8" then
			TriggerServerEvent('zz_taximeter:reset', vehNet)
		else
			TriggerServerEvent('zz_taximeter:selectRate', vehNet, number)
		end
	end
	cb("ok")
end)