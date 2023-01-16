Locales = {}

function translate(str, ...)  -- Translate string

	if Locales[Config.lang] ~= nil then

		if Locales[Config.lang][str] ~= nil then
			return string.format(Locales[Config.lang][str], ...)
		else
			return 'Translation [' .. Config.lang .. '][' .. str .. '] does not exist'
		end

	else
		return 'Locale [' .. Config.lang .. '] does not exist'
	end

end

function debugDump(data)
    if Config.debug then
        dump(data)
    end
end

function dump(data)
	local dumFn
	dumFn = function (o,val)
		if val == nil then
			val = 2
		end
		if type(o) == 'table' then
			local addVal=string.rep(" ", val)
			local s = '{ '
			for k,v in pairs(o) do
				if type(k) ~= 'number' then k = '"'..k..'"' end
				s = s .. '\n'..addVal..'['..k..'] = ' .. dumFn(v,val+2) .. ','
			end
			if val > 2 then
				return s .. '\n'..string.rep(" ", val-2)..'} '
			else
				return s .. '\n} '
			end
		else
			return tostring(o)
		end
	end
    print(dumFn(data))
end


function getPlate(veh)
    return GetVehicleNumberPlateText(veh)
end

function IsDriver(ped)
  return GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1) == ped
end

function IsInAuthorizedVehicle(veh)
	return IsInAuthorizedVehicleModel(GetEntityModel(veh))
end

function IsInAuthorizedVehicleModel(vehModel)

	for i=1, #Config.AuthorizedVehicles, 1 do
		if vehModel == GetHashKey(Config.AuthorizedVehicles[i]) then
			debugDump({"Vehicle is authorized", vehModel, GetHashKey(Config.AuthorizedVehicles[i])})
			return true
		end
	end
	
	debugDump({"Vehicle isnt authorized", vehModel})
	return false
end