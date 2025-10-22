---Global notification function
---@param msg string
---@param type string?
_Notification = function(msg, type)
    lib.notify({
        title = locale('jewellery_store'),
        description = msg,
        type = type
    })
end

---Progress bar
---@param msg string
---@param duration number
---@param anim table?
---@return boolean?
_Progress = function(msg, duration, anim)
    return lib.progressBar({
        duration = duration,
        label = msg,
        useWhileDead = false,
        canCancel = true,
        anim = anim,
        disable = {
            move = true,
            car = true,
            combat = true,
            sprint = true
        }
    })
end

---Trigger dispatch
---@param type string
---@param vitrineId number?
_Dispatch = function(type, vitrineId)
    if GetResourceState('wasabi_mdt') ~= 'started' then
        print('[Dispatch] wasabi_mdt tidak aktif!')
        return
    end

    -- local ped = PlayerPedId()
    local coords = GetEntityCoords(PlayerPedId())
    -- local coords = GetEntityCoords(ped)
    local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))

    if type == 'startThermite' then
        exports['wasabi_mdt']:SendPremadeDispatch('jewellery_robbery', {
            location = 'Vangelico Jewelry Store',
            coords = { x = coords.x, y = coords.y, z = coords.z },
            title = 'Aktivitas Mencurigakan Terdeteksi',
            description = ('Aktivitas mencurigakan dilaporkan di dekat %s. Kemungkinan manipulasi sistem keamanan.'):format(streetName),
            priority = 3
        })

    elseif type == 'explosion' then
        exports['wasabi_mdt']:SendPremadeDispatch('explosion', {
            location = 'Vangelico Jewelry Store',
            coords = { x = coords.x, y = coords.y, z = coords.z },
            title = 'Ledakan Dilaporkan',
            description = ('Ledakan dilaporkan di dekat %s! Petugas diminta untuk menyelidiki.'):format(streetName),
            priority = 2
        })

    elseif type == 'robbery' then
        exports['wasabi_mdt']:SendPremadeDispatch('jewellery_robbery', {
            location = 'Vangelico Jewelry Store',
            coords = { x = coords.x, y = coords.y, z = coords.z },
            title = 'Perampokan Sedang Berlangsung',
            description = ('Perampokan aktif dilaporkan di Vangelico Jewelry Store di %s. Tersangka bersenjata kemungkinan ada di lokasi.'):format(streetName),
            priority = 1
        })
    end
end
-- _Dispatch = function(type, vitrineId)
--     local usePs, useQb, useCd = Config.Dispatch == 'ps' and GetResourceState('ps-dispatch') == 'started', Config.Dispatch == 'qb', Config.Dispatch == 'cd' and GetResourceState('cd_dispatch') == 'started'
--     if type == 'startThermite' then
--         if usePs then
--             exports['ps-dispatch']:VangelicoRobbery(31)
--             exports['ps-dispatch']:SuspiciousActivity()
--         elseif useQb then
--             TriggerServerEvent('police:server:policeAlert', locale('dispatch_suspicious_title'))
--         elseif useCd then
--             local data = exports['cd_dispatch']:GetPlayerInfo()

--             TriggerServerEvent('cd_dispatch:AddNotification', {
--                 job_table = Config.PoliceJobs,
--                 coords = data.coords,
--                 title = locale('dispatch_suspicious_title'),
--                 message = locale('dispatch_suspicious_message', data.sex, data.street),
--                 flash = 0,
--                 unique_id = data.unique_id,
--                 sound = 1,
--                 blip = {
--                     sprite = 586,
--                     scale = 1.2,
--                     colour = 3,
--                     flashes = true,
--                     text = '999 - Suspicious Activity',
--                     time = 5,
--                     radius = 0
--                 }
--             })
--         end
--     elseif type == 'explosion' then
--         if usePs then
--             exports["ps-dispatch"]:Explosion()
--         elseif useQb then
--             TriggerServerEvent('police:server:policeAlert', locale('dispatch_explosion_title'))
--         elseif useCd then
--             local data = exports['cd_dispatch']:GetPlayerInfo()

--             TriggerServerEvent('cd_dispatch:AddNotification', {
--                 job_table = Config.PoliceJobs,
--                 coords = data.coords,
--                 title = locale('dispatch_explosion_title'),
--                 message = locale('dispatch_explosion_message', data.street),
--                 flash = 0,
--                 unique_id = data.unique_id,
--                 sound = 1,
--                 blip = {
--                     sprite = 586,
--                     scale = 1.2,
--                     colour = 3,
--                     flashes = true,
--                     text = '999 - Jewelery Store Robbery',
--                     time = 5,
--                     radius = 5
--                 }
--             })
--         end
--     elseif type == 'robbery' then
--         if usePs then
--             exports['ps-dispatch']:VangelicoRobbery(GetCamID(vitrineId))
--             exports['ps-dispatch']:VangelicoRobbery(GetCamID(vitrineId))
--             exports['ps-dispatch']:VangelicoRobbery(GetCamID(vitrineId))
--             exports['ps-dispatch']:VangelicoRobbery(GetCamID(vitrineId))
--         elseif useQb then
--             TriggerServerEvent('police:server:policeAlert', 'Robbery in progress')
--         elseif useCd then
--             local data = exports['cd_dispatch']:GetPlayerInfo()

--             TriggerServerEvent('cd_dispatch:AddNotification', {
--                 job_table = Config.PoliceJobs,
--                 coords = data.coords,
--                 title = locale('dispatch_robbery_title'),
--                 message = locale('dispatch_robbery_message', data.sex, data.street),
--                 flash = 0,
--                 unique_id = data.unique_id,
--                 sound = 1,
--                 blip = {
--                     sprite = 586,
--                     scale = 1.2,
--                     colour = 3,
--                     flashes = true,
--                     text = '999 - Jewelery Store Robbery',
--                     time = 5,
--                     radius = 0
--                 }
--             })
--         end
--     end
-- end