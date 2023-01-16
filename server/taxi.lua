
currentTaxiDrivers = {}


function addTaxi(taxiVeh, driveId)
    currentTaxiDrivers[getPlate(taxiVeh)] = {
        rate = nil,
        driveId = driveId,
        vehId = taxiVeh,
        price = 0,
        pricePause = 0,
        pause = false,
        secPause = 0,
        totalDistance = 0,
        oldPosition = GetEntityCoords(taxiVeh)
    }
end

function resetTaxi(taxiVeh, driveId)
    currentTaxiDrivers[getPlate(taxiVeh)]= {
        rate = nil,
        driveId = driveId,
        vehId = taxiVeh,
        price = 0,
        pricePause = 0,
        pause = false,
        secPause = 0,
        totalDistance = 0,
        oldPosition = GetEntityCoords(taxiVeh)
    }
end

function removeTaxi(taxiVeh)
    currentTaxiDrivers[getPlate(taxiVeh)] = nil
end

function removeTaxiFromPlate(taxiPlate)
    currentTaxiDrivers[taxiPlate] = nil
end

function getTaxi(taxiVeh)
    return currentTaxiDrivers[getPlate(taxiVeh)]
end

function getTaxiFromPlate(taxePlate)
    return currentTaxiDrivers[taxePlate]
end

function setDrive(taxiVeh, driveId)
    local plate = getPlate(taxiVeh)
    currentTaxiDrivers[plate]["driveId"] = driveId
    currentTaxiDrivers[plate]["vehId"] = taxiVeh
end

function setPause(taxiVeh, newPause)
    local plate = getPlate(taxiVeh)
    currentTaxiDrivers[plate]["pause"] = newPause
    currentTaxiDrivers[plate]["vehId"] = taxiVeh
end

function setRate(taxiVeh, rateSel)
    local plate = getPlate(taxiVeh)
    currentTaxiDrivers[plate]["rate"] = rateSel
    currentTaxiDrivers[plate]["vehId"] = taxiVeh
end

function setPrice(taxiVeh, price)
    local plate = getPlate(taxiVeh)
    currentTaxiDrivers[plate]["price"] = price
    currentTaxiDrivers[plate]["vehId"] = taxiVeh
end

function setPricePauseFromPlate(taxiPlate, pricePause)
    currentTaxiDrivers[taxiPlate]["pricePause"] = pricePause
end

function setSecPauseFromPlate(taxiPlate, secPause)
    currentTaxiDrivers[taxiPlate]["secPause"] = secPause
end

function setPriceFromPlate(taxiPlate, price)
    currentTaxiDrivers[taxiPlate]["price"] = price
end

function setOldPositionFromPlate(taxiPlate, oldPosition)
    currentTaxiDrivers[taxiPlate]["oldPosition"] = oldPosition
end

function setDistanceFromPlate(taxiPlate, distance)
    currentTaxiDrivers[taxiPlate]["totalDistance"] = distance
end

function isAlreadyTaxi(taxiVeh)
    return getTaxi(taxiVeh) ~= nil
end

function sendAllFromTaxi(taxiVeh, fnAction)
    for k, seat in pairs({-1, 0, 1, 2, 3, 4, 5, 6}) do
        local tryPlayer = GetPedInVehicleSeat(taxiVeh, seat)
        if tryPlayer ~= 0 then
            for _, player in ipairs(GetPlayers()) do
                local ped = GetPlayerPed(player)
                if ped == tryPlayer then
                    fnAction(player)
                    break
                end
            end
        end
    end 
end