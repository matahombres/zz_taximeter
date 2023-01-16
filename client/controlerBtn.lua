local listenButton = false
local Numbers = { ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162 }

RegisterKeyMapping("taximeter", translate("keyMappingTaximeter"), "keyboard", Config.taximeterDefaultKey)
RegisterKeyMapping("+taximeterBtn", translate("keyMappingBtn"), "keyboard", Config.taximeterBtnDefaultKey)



RegisterCommand('taximeter', function()
	local playerPed = PlayerPedId()

	if IsPedInAnyVehicle(playerPed, false) and IsDriver(playerPed) and IsInAuthorizedVehicle(GetVehiclePedIsIn(playerPed,false)) then
		TriggerServerEvent('zz_taximeter:toggleTaximeter')
	end
	
end, false)



RegisterCommand('-taximeterBtn', function()
	listenButton=false
end,false)

RegisterCommand('+taximeterBtn', function()
	listenButton = true
	local playerPed = PlayerPedId()
	local veh = nil
	Citizen.CreateThread(function()
		while listenButton do
      		Citizen.Wait(1)
			if not (IsPedInAnyVehicle(playerPed, false) and IsDriver(playerPed) and IsInAuthorizedVehicle(GetVehiclePedIsIn(playerPed,false))) then
				listenButton = false
			else
				for key, numKey in pairs(Numbers) do
					if IsControlJustReleased(0, numKey) then 
						local veh = GetVehiclePedIsIn(playerPed,false)
						local vehNet = VehToNet(veh)
						if key == "7" then
							TriggerServerEvent('zz_taximeter:pause', vehNet)
						elseif key == "8" then
							TriggerServerEvent('zz_taximeter:reset', vehNet)
						else
							TriggerServerEvent('zz_taximeter:selectRate', vehNet, key)
						end
						Citizen.Wait(500)
					end
				end
			end
		end
	end)
end,false)