return {
    DebugPoly = false,
    Freedom = vec4(1848.13, 2586.05, 44.67, 269.5), -- Freedom spawn coords
    RemoveJob = true,          -- Remove player jobs when send to jail

    -- Create Target Zone to Check Time (if XTPrisonJobs is false) --
    CheckOut = {
        coords = vec3(1840.31, 2577.68, 45.01),
        size = vec3(1.5, 7.8, 3.2),
        rotation = 0.5,
    },

    -- Alert When Entering Prison --
    EnterPrisonAlert  = {
        enable = true,
        header = 'Welcome to Prison, Criminal Scum!',
        content = 'To reduce your time in prison, get a job from the guard in the cells. Get your ass to work and maybe you\'ll learn a thing or two.',
    },

    -- Enter Prison Spawn Location & Emotes --
    Spawns = {
        { coords = vec4(1742.26, 2488.48, 50.42, 209.6),   emote = 'pushup' },
        { coords = vec4(1745.47, 2490.12, 50.42, 224.41), emote = 'pushup' },
        { coords = vec4(1748.74, 2491.31, 50.42, 202.49), emote = 'weights' },
        { coords = vec4(1751.69, 2493.3, 50.42, 210.07), emote = 'lean' },
        { coords = vec4(1754.83, 2494.88, 50.42, 210.01), emote = 'weights' },
        { coords = vec4(1773.44, 2482.04, 45.82, 27.61),   emote = 'pushup' },
    },

    -- Canteen Ped --
    CanteenPed = {
        model = 's_m_m_linecook',
        coords = vector4(1778.31, 2560.56, 45.62, 181.13),
        scenario = 'PROP_HUMAN_BBQ',
        mealLength = 2
    },

    -- Prison Doctor --
    PrisonDoctor = {
        model = 's_m_m_doctor_01',
        coords = vector4(1769.76, 2571.82, 45.73, 133.02),
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        healLength = 5
    },

    -- Roster Location --
    RosterLocation = {
        coords = vec3(1837.45, 2592.95, 45.85),
        radius = 0.3,
    },

    -- Set Prison Outfits --
    EnablePrisonOutfits = true,
    PrisonOufits = {
        male = {
            accessories = {
                item = 0,
                texture = 0
            },
            mask = {
                item = 0,
                texture = 0
            },
            pants = {
                item = 5,
                texture = 7
            },
            jacket = {
                item = 0,
                texture = 0
            },
            shirt = {
                item = 15,
                texture = 0
            },
            arms = {
                item = 0,
                texture = 0
            },
            shoes = {
                item = 42,
                texture = 2
            },
            bodyArmor = {
                item = 0,
                texture = 0
            },
        },
        female = {
            accessories = {
                item = 0,
                texture = 0
            },
            mask = {
                item = 0,
                texture = 0
            },
            pants = {
                item = 0,
                texture = 0
            },
            jacket = {
                item = 0,
                texture = 0
            },
            shirt = {
                item = 0,
                texture = 0
            },
            arms = {
                item = 0,
                texture = 0
            },
            shoes = {
                item = 0,
                texture = 0
            },
            bodyArmor = {
                item = 0,
                texture = 0
            },
        }
    },

    -- Reloads Player's Last Skin When Freed --
    ResetClothing = function()
        TriggerEvent('illenium-appearance:client:reloadSkin', true)
    end,

    -- Triggered on Player Heal --
    PlayerHealed = function()
        TriggerEvent('hospital:client:Revive')
        -- TriggerEvent('osp_ambulance:partialRevive')
    end,

    -- Trigger Emote --
    Emote = function(emote)
        -- exports.scully_emotemenu:playEmoteByCommand(emote)
        exports["rpemotes"]:EmoteCommandStart(emote)
    end,

    -- Trigger Prison Break Dispatch --
    Dispatch = function(coords)
        exports['ps-dispatch']:PrisonBreak()
        TriggerEvent('police:client:policeAlert', coords, 'Prison Break')
        
       -- ND Core
        -- exports["ND_MDT"]:createDispatch({
        --             caller = "Boilingbroke Penitentiary",
        --             location = "Sandy Shores",
        --             callDescription = "Prison Break",
        --             coords = vec3(1845.8302, 2585.9011, 45.6726)
        --         })
    end,
}