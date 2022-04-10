ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local properties = nil

RegisterNUICallback("buttonSubmit", function(data, cb)
    SetNuiFocus(false)
    properties:resolve(data.data)
    properties = nil
    cb("ok")
end)

RegisterNUICallback("closeMenu", function(data, cb)
    SetNuiFocus(false)
    properties:resolve(nil)
    properties = nil
    cb("ok")
end)

function DialogInput(data)
    Citizen.Wait(150)
    if not data then return end
    if properties then return end
    
    properties = promise.new()

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "OPEN_MENU",
        data = data
    })

    return Citizen.Await(properties)
end

exports("DialogInput", DialogInput)
RegisterNetEvent('zf_dialog:DialogInput')
AddEventHandler('zf_dialog:DialogInput', function(data)
    DialogInput(data)
end)