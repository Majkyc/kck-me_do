
local function Draw3DText(coords, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    SetDrawOrigin(coords, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

RegisterNetEvent("show3dtext")
AddEventHandler("show3dtext", function(id, text)
    local ped = GetPlayerPed(GetPlayerFromServerId(id))
    if ped ~= -1 then
        Citizen.CreateThread(function()
            local displayTime = 5000
            local endTime = GetGameTimer() + displayTime
            while GetGameTimer() < endTime do
                local coords = GetEntityCoords(ped) + vector3(0, 0, 1.0)
                Draw3DText(coords, text)
                Citizen.Wait(0)
            end
        end)
    end
end)

RegisterCommand("me", function(source, args)
    local text = "* " .. table.concat(args, " ")
    TriggerServerEvent("send3dtext", text)
end)

RegisterCommand("do", function(source, args)
    local text = table.concat(args, " ") .. " *"
    TriggerServerEvent("send3dtext", text)
end)
