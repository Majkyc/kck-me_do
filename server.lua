RegisterNetEvent("send3dtext")
AddEventHandler("send3dtext", function(text)
    TriggerClientEvent("show3dtext", -1, source, text)
end)
