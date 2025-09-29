lib.load('modules.player.injury')
-- local useArmour = false

-- AddEventHandler('ox_inventory:updateInventory', function(changes)
--     for _, v in pairs(changes) do
--         if IsItemType(v, 'armor') and not useArmour then
--             useArmour = true
--             local metadata = v.metadata or {}
--             if metadata.armour ~= GetPedArmour(cache.ped) then
--                 exports[cache.resource]:useItem(v, function()
--                     SetPlayerMaxArmour(cache.playerId, 100)
--                     SetPedArmour(cache.ped, metadata.armour)
--                 end)
--             end
--             return
--         end
--     end
--     useArmour = false
-- end)

-- local lastArmour = 0

-- function CheckArmour(skip)
--     local armour = GetPedArmour(cache.ped)
--     if armour ~= lastArmour and armour == 0 or skip then
--         lastArmour = armour
--         TriggerServerEvent('ox_inventory:server:UpdateArmour')
--     end

--     if armour == 0 then
--         useArmour = false
--     end
-- end

-- CreateThread(function()
--     while true do
--         CheckArmour()
--         Wait(5000)
--     end
-- end)
