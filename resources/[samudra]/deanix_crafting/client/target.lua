local spawnedBenches = {}

CreateThread(function()
    for i, data in pairs(Config.Benches) do
        local prop = `gr_prop_gr_bench_04b`
        RequestModel(prop)
        while not HasModelLoaded(prop) do
            Wait(500)
        end
        local obj = CreateObject(prop, data.coords.x, data.coords.y, data.coords.z - 1.0, false, true, false)
        PlaceObjectOnGroundProperly(obj)
        SetEntityRotation(obj, 0.0, 0.0, data.heading, 2, true)
        FreezeEntityPosition(obj, true)
        table.insert(spawnedBenches, obj)
        exports.ox_target:addLocalEntity(obj, {
            {
                label = "Gunakan Bench",
                icon = "fas fa-tools",
                onSelect = function()
                    TriggerEvent(data.event)
                end
            }
        })
    end
end)
