Config = {
    proximityDistances = {
        vehicle = 50.0,             -- Proximity distance for vehicles
        handHeld = 30.0,            -- Proximity distance for handheld megaphone
        stage = 100.0,              -- Proximity distance for mics as objects
    },
    models = {                      -- Find object here - https://forge.plebmasters.de/objects
        `v_club_roc_micstd`, 
        `prop_table_mic_01` 
    },
    volume = -1.0,                  -- A value between 0.0 and 1.0. -1.0 for the default volume.
    specifyVehicles = true,        -- If false it will use the vehicleClass value below
    vehicleClass = {18, 15},        -- If above is set to false it will only apply to these vehicle class
    vehicles = {
        "polgt500",
        "buffalosxpol",
        "riot",
        "g63amg6x6cop",
        "polchiron"
      },
    framework = 'qbox',             -- none / qb / qbox / esx
    keybind = 'F9',                -- Default keybind for vehicle megaphone
    debug = false,                  -- Enables printing of basic debug info / polys
}

notify = function(text)
    lib.notify({title = text, type = 'inform'})
end