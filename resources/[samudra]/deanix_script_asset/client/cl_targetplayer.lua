CreateThread(function()
    exports.ox_target:addGlobalPlayer({
        {
            icon = 'fas fa-hands',
            label = 'Gendong',
            distance = 3,
            onSelect = function(data)
                TriggerEvent('gendong:sidia')
            end
        },
        {
            icon = 'fas fa-hands',
            label = 'Carry',
            distance = 3,
            onSelect = function(data)
                TriggerEvent('carry:sidia')
            end
        },
        {
            icon = 'fas fa-hands',
            label = 'Geledah',
            distance = 3,
            onSelect = function(data)
                TriggerEvent('police:client:RobPlayer')
            end
        },
        {
            icon = 'user-lock',
            label = 'Borgol-lepasBorgol',
            distance = 3,
            groups = 'police',
            onSelect = function(data)
                TriggerEvent('police:client:CuffPlayer')
            end
        },
    })
end)