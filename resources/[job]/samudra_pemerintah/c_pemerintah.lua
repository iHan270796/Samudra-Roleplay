local Config = {}

Config.TargetZones = {
    {
        coords = vector3(1758.09, 3652.19, 35.49),
        size = vector3(1.0, 1.0, 3.0),
        rotation = 0.0,
        debug = false,
        distance = 1.5,
        options = {
            {
                name = 'gantinama_pemerintah',
                icon = 'computer',
                label = 'Akses Komputer',
                groups = 'pemerintah',
                serverEvent = 'changeidentity:checkJob',
                -- clientEvent = 'changeidentity:openForm' -- contoh client event
            }
        }
    },
    {
        coords = vector3(1756.48, 3651.24, 35.49),
        size = vector3(1.0, 1.0, 3.0),
        rotation = 0.0,
        debug = false,
        distance = 1.5,
        options = {
            {
                name = 'Duty_pemerintah',
                icon = 'fas fa-sign-in-alt',
                label = 'Toggle Duty',
                groups = 'pemerintah',
                serverEvent = 'QBCore:ToggleDuty',
                -- clientEvent = 'changeidentity:openForm' -- contoh client event
            }
        }
    }
}

return Config