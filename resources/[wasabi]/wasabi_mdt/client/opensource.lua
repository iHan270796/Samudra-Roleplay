-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

wsb.registerCallback('wasabi_mdt:takeScreenshot', function(presignedUrl)
    local p = promise.new()

    SCREENBASIC:requestScreenshotUpload(presignedUrl, 'file', function(data)
        local resp = json.decode(data)
        if resp then
            p:resolve(resp)
        else
            p:resolve(false)
        end
    end)

    return Citizen.Await(p)
end)

function DisablePlayerMovement(ped, disable)
    -- Integrate things like open inventory to disable them when player is using camera
    -- and other that you might want to disable when player is using things
    FreezeEntityPosition(ped, disable)
end

---Returns player ped, coords, street, area used for dispatches
---@return table playerData -- ped, coords, street, area, street_name
local function getPlayerData()
    local playerPed = wsb.cache.ped
    local coords = GetEntityCoords(playerPed)
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    local areaNameHash = GetNameOfZone(coords.x, coords.y, coords.z)
    local areaName = GetLabelText(areaNameHash)
    return {
        ped = playerPed,
        coords = coords,
        location = streetName .. (areaName and areaName ~= "" and (", " .. areaName) or ""),
        street = streetName,
        area = areaName,
        gender = wsb.getGender() == 'm' and 'male' or 'female'
    }
end

exports('GetPlayerData', getPlayerData)

--[[
    CUSTOMIZABLE EVENTS FOR CHARGE LINKING/UNLINKING (CLIENT-SIDE)
    
    These events are called when police officers link charges to players.
    You can customize these events to integrate with your client-side systems.

    IF YOUR SYSTEMS REQUIRE CALLS FROM THE SERVER-SIDE, THESE FUNCTIONS ARE AVAILABLE ON THE SERVER-SIDE AS WELL.
    
    Parameters:
    - chargeData: Table containing charge information (id, title, description, jail_time, fine, category, etc.)
    - primaryIdentifier: The primary identifier of the citizen
    - incidentData: Table containing incident information (id, title, description, etc.)
    - officerData: Table containing officer information (identifier, name, etc.)
    - adjustments: Table containing any charge adjustments (adjusted_fine, adjusted_jail, etc.)
]]

-- On charge linked
RegisterNetEvent('wasabi_mdt:onChargeLinked', function(chargeData, primaryIdentifier, incidentData, officerData, adjustments)
    Debug('wasabi_mdt:onChargeLinked: %s - %s - %s - %s - %s', chargeData.title, primaryIdentifier, incidentData.id, officerData.identifier, adjustments)

    -- Is there a fine?
    if chargeData.fine and chargeData.fine > 0 then
        -- Example implementation:
        -- exports['your_billing_script']:addBill(primaryIdentifier, chargeData.fine, 'MDT Charge: ' .. chargeData.title)
        
        -- Log the charge for debugging
        Debug('Charge linked to citizen: %s - %s ($%d)', primaryIdentifier, chargeData.title, chargeData.fine)
    end

    -- Is there jail time?
    if chargeData.jail_time and chargeData.jail_time > 0 then
        -- Example implementation:
        -- local jailTime = adjustments and adjustments.adjusted_jail or chargeData.jail_time
        -- exports['your_jail_script']:sendToJail(primaryIdentifier, jailTime, 'MDT Charge: ' .. chargeData.title)
        
        -- Log the jail charge for debugging
        local jailTime = adjustments and adjustments.adjusted_jail or chargeData.jail_time
        Debug('Jail charge linked to citizen: ' .. primaryIdentifier .. ' - ' .. chargeData.title .. ' (' .. jailTime .. ' minutes)')
    end
    
    -- Is there a felony?
    if chargeData.category == 'felony' then
        -- Example implementation:
        -- exports['your_script']:addFelonyRecord(primaryIdentifier, chargeData.title)
        -- exports['your_script']:notifyAuthorities(primaryIdentifier, 'Felony charge added')
        
        -- Log the felony charge for debugging
        Debug('Felony charge linked to citizen: %s - %s', primaryIdentifier, chargeData.title)
    end
end)

-- On charge unlinked
RegisterNetEvent('wasabi_mdt:onChargeUnlinked', function(chargeData, primaryIdentifier, incidentData, officerData)
    -- Example implementation:
    -- exports['your_billing_script']:refundBill(primaryIdentifier, chargeData.fine, 'MDT Charge Removed: ' .. chargeData.title)

    -- Log the charge unlinking for debugging
    Debug('Charge unlinked from citizen: %s - %s', primaryIdentifier, chargeData.title)
end)

--[[
    END OF CUSTOMIZABLE EVENTS FOR CHARGE LINKING/UNLINKING
]]



--[[ TEST COMMANDS ]]

-- Test command for dispatch system (tests the exports)
-- RegisterCommand('testexportdispatches', function()
--     local delay = 2000 -- 2 seconds between each dispatch
--     local currentDelay = 0

--     -- Test all premade dispatches
--     for dispatchType, _ in pairs(Config.PremadeDispatches) do
--         SetTimeout(currentDelay, function()
--             Debug('[MDT TEST] Sending premade dispatch: ' .. dispatchType .. '^0')
--             exports['wasabi_mdt']:SendPremadeDispatch(dispatchType)
--         end)
--         currentDelay = currentDelay + delay
--     end

--     -- Test premade dispatches with overrides
--     SetTimeout(currentDelay, function()
--         Debug('[MDT TEST] Sending store_robbery with custom location^0')
--         exports['wasabi_mdt']:SendPremadeDispatch('store_robbery', {
--             location = '24/7 Store - Vinewood Boulevard',
--             coords = {x = 373.8, y = 325.8, z = 103.5}
--         })
--     end)
--     currentDelay = currentDelay + delay

--     SetTimeout(currentDelay, function()
--         Debug('[MDT TEST] Sending bank_robbery with custom description^0')
--         exports['wasabi_mdt']:SendPremadeDispatch('bank_robbery', {
--             description = 'Silent alarm triggered, 3 masked suspects inside Fleeca Bank',
--             location = 'Fleeca Bank - Great Ocean Highway'
--         })
--     end)
--     currentDelay = currentDelay + delay

--     -- Test custom dispatches using CreateDispatch export
--     SetTimeout(currentDelay, function()
--         Debug('[MDT TEST] Sending custom dispatch: Explosion^0')
--         local coords = GetEntityCoords(PlayerPedId())
--         exports['wasabi_mdt']:CreateDispatch({
--             type = 'shooting',
--             title = 'Large Explosion Reported',
--             description = 'Multiple explosions heard, possible terrorist activity',
--             location = 'Industrial Area',
--             coords = {x = coords.x + 100, y = coords.y + 100, z = coords.z},
--             priority = 5
--         })
--     end)
--     currentDelay = currentDelay + delay

--     SetTimeout(currentDelay, function()
--         Debug('[MDT TEST] Sending custom dispatch: Kidnapping^0')
--         exports['wasabi_mdt']:CreateDispatch({
--             type = 'assault',
--             title = 'Kidnapping in Progress',
--             description = 'Witness reports person being forced into vehicle',
--             location = 'Parking Garage',
--             coords = {x = 215.5, y = -810.0, z = 30.7},
--             priority = 4
--         })
--     end)
--     currentDelay = currentDelay + delay

--     SetTimeout(currentDelay, function()
--         Debug('[MDT TEST] Sending custom dispatch: Gang Activity^0')
--         local coords = GetEntityCoords(PlayerPedId())
--         exports['wasabi_mdt']:CreateDispatch({
--             type = 'disturbance',
--             title = 'Gang Activity Reported',
--             description = 'Large group gathering, possible gang meeting',
--             location = GetStreetName(),
--             coords = {x = coords.x, y = coords.y, z = coords.z},
--             priority = 3
--         })
--     end)
--     currentDelay = currentDelay + delay

--     SetTimeout(currentDelay, function()
--         Debug('[MDT TEST] Sending custom dispatch: Hit and Run^0')
--         exports['wasabi_mdt']:CreateDispatch({
--             type = 'traffic_stop',
--             title = 'Hit and Run Accident',
--             description = 'Vehicle fled scene after hitting pedestrian, heading northbound',
--             location = 'Downtown Los Santos',
--             coords = {x = 195.2, y = -933.8, z = 30.6},
--             priority = 3
--         })
--     end)
--     currentDelay = currentDelay + delay

--     Debug('[MDT TEST] All test dispatches queued. Total time: ' .. (currentDelay/1000) .. ' seconds^0')
-- end, false)

-- TriggerEvent('chat:addSuggestion', '/testexportdispatches', 'Test all MDT dispatch exports (premade and custom)')