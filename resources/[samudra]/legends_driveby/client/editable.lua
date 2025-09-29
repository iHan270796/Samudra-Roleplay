-- Auto-detection for notification systems
-- Priority order: qbx_core > qb-core > ESX > ox_lib > none

local NotifyType = "none"

-- Auto-detect notification system
if GetResourceState('qbx_core') == 'started' then
    NotifyType = "qbx"
elseif GetResourceState('qb-core') == 'started' then
    NotifyType = "qb"
elseif GetResourceState('es_extended') == 'started' then
    NotifyType = "esx"
elseif GetResourceState('ox_lib') == 'started' then
    NotifyType = "ox"
else
    NotifyType = "none"
end

-- Universal notification function
function SendNotification(title, message, type)
    if NotifyType == "qbx" then
        exports.qbx_core:Notify(message, type or 'primary')
    elseif NotifyType == "qb" then
        TriggerEvent('QBCore:Notify', message, type or 'primary')
    elseif NotifyType == "esx" then
        local color = '~w~'
        if type == 'error' then
            color = '~r~'
        elseif type == 'success' then
            color = '~g~'
        elseif type == 'warning' then
            color = '~y~'
        end
        ESX.ShowNotification(color .. message)
    elseif NotifyType == "ox" then
        if lib then
            lib.notify({
                title = title or 'Legends DriveBy',
                description = message,
                type = type or 'inform'
            })
        else
            print("^3[Legends DriveBy]^7 ox_lib detected but lib global not available: " .. (title and (title .. ": ") or "") .. message)
        end
    else
        print("^3[Legends DriveBy]^7 " .. (title and (title .. ": ") or "") .. message)
    end
end

-- Export the function for use in other files
exports('SendNotification', SendNotification)