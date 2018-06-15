local anchored = false
local boat = nil
Citizen.CreateThread(function()
	while true do

		Wait(0)
		local ped = GetPlayerPed(-1)
		if IsPedInAnyBoat(ped) then
			boat  = GetVehiclePedIsIn(ped, true)
		end
		if IsControlJustPressed(1, 182) and not IsPedInAnyVehicle(ped) and boat ~= nil  then
			if not anchored then
				SetBoatAnchor(boat, true)
				Notify("Boat is anchored")
			else
				SetBoatAnchor(boat, false)
				Notify("Boat is not anchored")
			end
			anchored = not anchored
		end
		if IsVehicleEngineOn(boat) then
			anchored = false
		end
	end
end)

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end
