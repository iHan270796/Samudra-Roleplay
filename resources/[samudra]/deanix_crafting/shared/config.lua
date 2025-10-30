Config = {}

Config.Benches = {
    {
        coords = vector3(2330.96, 3060.95, 48.5),
        heading = 89.63,
        event = "deanix_crafting:client:armor"
    },
    {
        coords = vector3(-613.01, -1624.12, 33.01),
        heading = 357.33,
        event = "deanix_crafting:client:senjatabadside"
    },
    {
        coords = vector3(2194.76, 5594.49, 53.76),
        heading = 160.57,
        event = "deanix_crafting:client:ammobadside"
    },
    {
        coords = vector3(1130.67, -2203.55, 31.7),
        heading = 357.11,
        event = "deanix_crafting:client:alatrampok"
    }
}

Config.MaxXP = 1500
Config.MaxLevel = 15

Config.JobCrafting = {
    ['alatrampok'] = {
        {
            item = 'lockpick',
            label = 'Lockpick',
            requirements = {
                { item = 'metalscrap', amount = 20 },
                { item = 'plastic',    amount = 10 },
                { item = 'tembaga',    amount = 15 },
                { item = 'rubber',    amount = 5 },
                { item = 'besi',    amount = 5 },
                { item = 'steel',    amount = 10 }
            },
            time = 4000,
            xp_gain = 25,
            level = 1
        },
        {
            item = 'rope',
            label = 'Rope',
            requirements = {
                { item = 'besi', amount = 15 },
                { item = 'metalscrap',    amount = 25 },
                { item = 'steel',    amount = 10 },
                { item = 'kulit_kayu',    amount = 10 }
            },
            time = 3000,
            xp_gain = 15,
            level = 2
        },
        {
            item = 'phonehack',
            label = 'phone hack',
            requirements = {
                { item = 'metalscrap', amount = 30 },
                { item = 'tembaga',    amount = 20 },
                { item = 'besi',    amount = 20 },
                { item = 'plastic',    amount = 15 },
                { item = 'aluminum',    amount = 10 },
                { item = 'glass',    amount = 15 }
            },
            time = 4000,
            xp_gain = 30,
            level = 3
        },
        {
            item = 'thermite_bomb',
            label = 'Thermite Bomb',
            requirements = {
                { item = 'metalscrap', amount = 35 },
                { item = 'tembaga',    amount = 15 },
                { item = 'besi',    amount = 25 },
                { item = 'plastic',    amount = 20 },
                { item = 'aluminum',    amount = 15 },
                { item = 'steel',    amount = 10 },
                { item = 'rubber',    amount = 15 }
            },
            time = 4000,
            xp_gain = 30,
            level = 4
        },
        {
            item = 'laptop',
            label = 'Laptop',
            requirements = {
                { item = 'metalscrap', amount = 100 },
                { item = 'tembaga',    amount = 15 },
                { item = 'besi',    amount = 30 },
                { item = 'emas',    amount = 15 },
                { item = 'plastic',    amount = 20 },
                { item = 'aluminum',    amount = 20 },
                { item = 'diamon',    amount = 30 },
                { item = 'glass',    amount = 30 },
                { item = 'rubber',    amount = 15 }
            },
            time = 4000,
            xp_gain = 30,
            level = 5
        },
        {
            item = 'security_card_01',
            label = 'Security Card A',
            requirements = {
                { item = 'metalscrap', amount = 10 },
                { item = 'tembaga',    amount = 15 },
                { item = 'besi',    amount = 15 },
                { item = 'plastic',    amount = 10 },
                { item = 'steel',    amount = 10 },
                { item = 'rubber',    amount = 5 }
            },
            time = 4000,
            xp_gain = 30,
            level = 6
        },
        {
            item = 'c4_bomb',
            label = 'C4 Bomb',
            requirements = {
                { item = 'metalscrap', amount = 50 },
                { item = 'tembaga',    amount = 25 },
                { item = 'besi',    amount = 25 },
                { item = 'plastic',    amount = 25 },
                { item = 'steel',    amount = 15 },
                { item = 'kulit_kayu',    amount = 15 },
                { item = 'aluminum',    amount = 20 },
                { item = 'rubber',    amount = 25 },
                { item = 'glass',    amount = 20 }
            },
            time = 4000,
            xp_gain = 30,
            level = 7
        },
        {
            item = 'usb_stick',
            label = 'Usb Stick',
            requirements = {
                { item = 'metalscrap', amount = 20 },
                { item = 'tembaga',    amount = 15 },
                { item = 'besi',    amount = 15 },
                { item = 'plastic',    amount = 25 },
                { item = 'rubber',    amount = 25 },
                { item = 'steel',    amount = 10 }
            },
            time = 4000,
            xp_gain = 30,
            level = 8
        },
        {
            item = 'WEAPON_SWITCHBLADE',
            label = 'Switchblade',
            requirements = {
                { item = 'tembaga',    amount = 25 },
                { item = 'besi',    amount = 10 },
                { item = 'kayu',    amount = 5 },
                { item = 'steel',    amount = 10 }
            },
            time = 4000,
            xp_gain = 30,
            level = 9
        }
    },
    ['armor'] = {
        {
            item = 'armour',
            label = 'Rompi Anti Pluru',
            requirements = {
                { item = 'tembaga',    amount = 25 },
                { item = 'besi',    amount = 25 },
                { item = 'steel',    amount = 15 },
                { item = 'kulit_kayu',    amount = 15 },
                { item = 'rubber',    amount = 25 },
                { item = 'glass',    amount = 20 }
            },
            time = 4000,
            xp_gain = 30,
            level = 1
        },
        {
            item = 'armour_plate',
            label = 'Besi Rompi',
            requirements = {
                { item = 'tembaga',    amount = 30 },
                { item = 'besi',    amount = 30 },
                { item = 'steel',    amount = 20 },
                { item = 'kulit_kayu',    amount = 20 },
                { item = 'rubber',    amount = 30 },
                { item = 'glass',    amount = 25 }
            },
            time = 4000,
            xp_gain = 30,
            level = 2
        }
    },
    ['senjatabadside'] = {
        --class 1
        {
            item = 'weapon_pistol50',
            label = 'Pistol 50',
            requirements = {
                { item = 'metalscrap', amount = 35 },
                { item = 'diamon',    amount = 10 },
                { item = 'besi',    amount = 15 },
                { item = 'plastic',    amount = 10 },
                { item = 'kulit_kayu',    amount = 15 }
            },
            time = 4000,
            xp_gain = 15,
            level = 1
        },
        {
            item = 'weapon_machinepistol',
            label = 'Machine Pistol',
            requirements = {
                { item = 'metalscrap', amount = 45 },
                { item = 'tembaga',    amount = 20 },
                { item = 'besi',    amount = 20 },
                { item = 'diamon',    amount = 15 },
                { item = 'emas',    amount = 15 }
            },
            time = 4000,
            xp_gain = 15,
            level = 2
        },
        {
            item = 'weapon_minismg',
            label = 'Mini SMG',
            requirements = {
                { item = 'metalscrap', amount = 50 },
                { item = 'plastic',    amount = 15 },
                { item = 'tembaga',    amount = 25 },
                { item = 'besi',    amount = 25 },
                { item = 'glass',    amount = 15 }
            },
            time = 4000,
            xp_gain = 15,
            level = 3
        },
        --class 2
        {
            item = 'weapon_doubleaction',
            label = 'Revolver',
            requirements = {
                { item = 'metalscrap', amount = 60 },
                { item = 'tembaga',    amount = 30 },
                { item = 'besi',    amount = 30 },
                { item = 'steel',    amount = 15 },
                { item = 'glass',    amount = 20 }
            },
            time = 4000,
            xp_gain = 20,
            level = 4
        },
        {
            item = 'weapon_microsmg',
            label = 'Micro SMG',
            requirements = {
                { item = 'metalscrap', amount = 65 },
                { item = 'plastic',    amount = 20 },
                { item = 'tembaga',    amount = 35 },
                { item = 'besi',    amount = 35 },
                { item = 'emas',    amount = 20 }
            },
            time = 4000,
            xp_gain = 20,
            level = 5
        },
        {
            item = 'weapon_gusenberg',
            label = 'Thompshon',
            requirements = {
                { item = 'metalscrap', amount = 67 },
                { item = 'plastic',    amount = 25 },
                { item = 'tembaga',    amount = 37 },
                { item = 'besi',    amount = 37 },
                { item = 'emas',    amount = 25 }
            },
            time = 4000,
            xp_gain = 20,
            level = 6
        },
        --class tiga
        {
            item = 'weapon_compactrifle',
            label = 'Compact Rifle',
            requirements = {
                { item = 'metalscrap', amount = 70 },
                { item = 'plastic',    amount = 28 },
                { item = 'tembaga',    amount = 40 },
                { item = 'besi',    amount = 40 },
                { item = 'emas',    amount = 28 }
            },
            time = 4000,
            xp_gain = 20,
            level = 7
        },
        {
            item = 'weapon_assaultrifle_mk2',
            label = 'Rifle Mk2',
            requirements = {
                { item = 'metalscrap', amount = 72 },
                { item = 'plastic',    amount = 30 },
                { item = 'tembaga',    amount = 42 },
                { item = 'besi',    amount = 42 },
                { item = 'emas',    amount = 30 }
            },
            time = 4000,
            xp_gain = 20,
            level = 8
        },
        {
            item = 'weapon_sawnoffshotgun',
            label = 'Sawn Off ShotGun',
            requirements = {
                { item = 'metalscrap', amount = 75 },
                { item = 'plastic',    amount = 32 },
                { item = 'tembaga',    amount = 45 },
                { item = 'besi',    amount = 45 },
                { item = 'emas',    amount = 33 }
            },
            time = 4000,
            xp_gain = 20,
            level = 8
        },
        {
            item = 'weapon_tacticalrifle',
            label = 'Tactical Rifle',
            requirements = {
                { item = 'metalscrap', amount = 77 },
                { item = 'plastic',    amount = 35 },
                { item = 'tembaga',    amount = 47 },
                { item = 'besi',    amount = 47 },
                { item = 'emas',    amount = 35 }
            },
            time = 4000,
            xp_gain = 20,
            level = 8
        },
        {
            item = 'weapon_marksmanpistol',
            label = 'Marksman Pistol',
            requirements = {
                { item = 'metalscrap', amount = 77 },
                { item = 'plastic',    amount = 35 },
                { item = 'tembaga',    amount = 47 },
                { item = 'besi',    amount = 47 },
                { item = 'emas',    amount = 35 }
            },
            time = 4000,
            xp_gain = 20,
            level = 8
        },
        --class empat
        {
            item = 'weapon_heavysniper_mk2',
            label = 'Heavy Sniper MK2',
            requirements = {
                { item = 'metalscrap', amount = 80 },
                { item = 'plastic',    amount = 45 },
                { item = 'tembaga',    amount = 55 },
                { item = 'besi',    amount = 55 },
                { item = 'emas',    amount = 40 }
            },
            time = 4000,
            xp_gain = 20,
            level = 9
        },
        {
            item = 'weapon_pumpshotgun',
            label = 'Pumps ShotGun',
            requirements = {
                { item = 'metalscrap', amount = 80 },
                { item = 'plastic',    amount = 45 },
                { item = 'tembaga',    amount = 55 },
                { item = 'besi',    amount = 55 },
                { item = 'emas',    amount = 40 }
            },
            time = 4000,
            xp_gain = 20,
            level = 10
        }
    },
    ['ammobadside'] = {
        --class satu
        {
            item = 'ammo-9',
            label = 'Ammo 9mm',
            requirements = {
                { item = 'metalscrap', amount = 1 },
                { item = 'aluminum',    amount = 1 },
                { item = 'emas',    amount = 1 }
            },
            time = 3000,
            xp_gain = 15,
            level = 1
        },
        {
            item = 'ammo-50',
            label = 'Ammo 50Ae',
            requirements = {
                { item = 'metalscrap', amount = 1 },
                { item = 'aluminum',    amount = 1 },
                { item = 'emas',    amount = 1 }
            },
            time = 3000,
            xp_gain = 15,
            level = 2
        },
        --class dua
        {
            item = 'ammo-38',
            label = 'Ammo 38',
            requirements = {
                { item = 'metalscrap', amount = 2 },
                { item = 'aluminum',    amount = 2 },
                { item = 'emas',    amount = 2 }
            },
            time = 3000,
            xp_gain = 15,
            level = 3
        },
        {
            item = 'ammo-45',
            label = 'Ammo 45',
            requirements = {
                { item = 'metalscrap', amount = 2 },
                { item = 'aluminum',    amount = 2 },
                { item = 'emas',    amount = 2 }
            },
            time = 3000,
            xp_gain = 20,
            level = 4
        },
        --class tiga
        {
            item = 'ammo-rifle2',
            label = 'Ammo Rifle2',
            requirements = {
                { item = 'metalscrap', amount = 3 },
                { item = 'aluminum',    amount = 3 },
                { item = 'emas',    amount = 3 }
            },
            time = 3000,
            xp_gain = 20,
            level = 5
        },
        {
            item = 'ammo-rifle',
            label = 'Ammo Rifle',
            requirements = {
                { item = 'metalscrap', amount = 3 },
                { item = 'aluminum',    amount = 3 },
                { item = 'emas',    amount = 3 }
            },
            time = 3000,
            xp_gain = 20,
            level = 6
        },
        {
            item = 'ammo-shotgun',
            label = 'Ammo ShotGun',
            requirements = {
                { item = 'metalscrap', amount = 3 },
                { item = 'aluminum',    amount = 3 },
                { item = 'emas',    amount = 3 }
            },
            time = 3000,
            xp_gain = 20,
            level = 7
        },
        {
            item = 'ammo-22',
            label = 'Ammo 22',
            requirements = {
                { item = 'metalscrap', amount = 3 },
                { item = 'aluminum',    amount = 3 },
                { item = 'emas',    amount = 3 }
            },
            time = 3000,
            xp_gain = 20,
            level = 8
        },
        --class empat
        {
            item = 'ammo-heavysniper',
            label = 'Ammo Heavy Sniper',
            requirements = {
                { item = 'metalscrap', amount = 4 },
                { item = 'aluminum',    amount = 4 },
                { item = 'emas',    amount = 4 }
            },
            time = 3000,
            xp_gain = 20,
            level = 9
        },
        {
            item = 'at_clip_extended_pistol',
            label = 'Magazin Pistol',
            requirements = {
                { item = 'metalscrap', amount = 15 },
                { item = 'aluminum',    amount = 15 },
                { item = 'emas',    amount = 15 }
            },
            time = 3000,
            xp_gain = 15,
            level = 10
        },
        {
            item = 'at_suppressor_light',
            label = 'Suppressor',
            requirements = {
                { item = 'metalscrap', amount = 15 },
                { item = 'aluminum',    amount = 15 },
                { item = 'emas',    amount = 15 }
            },
            time = 3000,
            xp_gain = 15,
            level = 10
        }
    },
    ['weedproses'] = {
        {
            item = 'weed_box',
            label = '1 Box Marijuana',
            requirements = {
                { item = 'cannabis', amount = 5 },
                { item = 'packaged', amount = 1 }
            },
            time = 4000,
            xp_gain = 10,
            level = 1
        }
    },
    ['heroinproses'] = {
        {
            item = 'heroin_box',
            label = '1 Box Heroin',
            requirements = {
                { item = 'poppyresin', amount = 5 },
                { item = 'packaged', amount = 1 }
            },
            time = 4000,
            xp_gain = 10,
            level = 1
        }
    },
    ['prosescocain1'] = {
        {
            item = 'coke',
            label = 'Cocaine',
            requirements = {
                { item = 'coca_leaf', amount = 5 }
            },
            time = 4000,
            xp_gain = 10,
            level = 1
        }
    },
    ['prosescocain2'] = {
        {
            item = 'coke_small_brick',
            label = 'Coke Package',
            requirements = {
                { item = 'coke', amount = 1 },
                { item = 'bakingsoda', amount = 1 }
            },
            time = 4000,
            xp_gain = 10,
            level = 1
        }
    },
    ['prosescocain3'] = {
        {
            item = 'coke_box',
            label = '1 Box Cocain',
            requirements = {
                { item = 'coke_small_brick', amount = 1 },
                { item = 'packaged', amount = 1 }
            },
            time = 4000,
            xp_gain = 10,
            level = 1
        }
    },
    ['mechanic'] = {
        {
            item = 'nitrous',
            label = 'Nitrous',
            requirements = {
                { item = 'metalscrap', amount = 10 },
                { item = 'plastic',    amount = 5 }
            },
            time = 5000,
            xp_gain = 15,
            level = 1
        },
        {
            item = 'cleaningkit',
            label = 'Cleaning kit',
            requirements = {
                { item = 'metalscrap', amount = 10 },
                { item = 'plastic',    amount = 5 }
            },
            time = 5000,
            xp_gain = 15,
            level = 1
        },
        {
            item = 'tirerepairkit',
            label = 'Tire Repairkit',
            requirements = {
                { item = 'metalscrap', amount = 10 },
                { item = 'plastic',    amount = 5 }
            },
            time = 5000,
            xp_gain = 15,
            level = 2
        },
        {
            item = 'advancedrepairkit',
            label = 'Advanced Repairkit',
            requirements = {
                { item = 'metalscrap', amount = 10 },
                { item = 'plastic',    amount = 5 }
            },
            time = 5000,
            xp_gain = 15,
            level = 3
        },
        {
            item = 'repairkit',
            label = 'Repairkit',
            requirements = {
                { item = 'metalscrap', amount = 10 },
                { item = 'plastic',    amount = 5 }
            },
            time = 5000,
            xp_gain = 15,
            level = 3
        }
    },

    ['police'] = {
        {
            item = 'phone',
            label = 'IFAK',
            requirements = {
                { item = 'bandage',     amount = 2 },
                { item = 'painkillers', amount = 1 }
            },
            time = 4000,
            xp_gain = 10,
            level = 1
        },
        {
            item = 'water',
            label = 'IFAK',
            requirements = {
                { item = 'bandage',     amount = 2 },
                { item = 'painkillers', amount = 1 }
            },
            time = 4000,
            xp_gain = 10,
            level = 3
        },
    },
    ['bahamas'] = {
        {
            item = 'chiken_wings',
            label = 'Chiken Wings',
            requirements = {
                { item = 'cutted_cucumber', amount = 1 },
                { item = 'ayam_packing',  amount = 1 },
                { item = 'cutted_onion',    amount = 1 }
            },
            time = 4000,
            xp_gain = 25,
            level = 1
        },
        {
            item = 'chiken_teriyaki',
            label = 'Chiken Teriyaki',
            requirements = {
                { item = 'cutted_cucumber', amount = 1 },
                { item = 'ayam_packing',  amount = 1 },
                { item = 'cutted_onion',    amount = 1 },
                { item = 'cutted_tomato',  amount = 1 }
            },
            time = 4000,
            xp_gain = 25,
            level = 2
        },
        {
            item = 'burger',
            label = 'Burger',
            requirements = {
                { item = 'cutted_cucumber', amount = 1 },
                { item = 'cutted_lettuce',  amount = 1 },
                { item = 'cutted_bun',      amount = 1 },
                { item = 'cutted_onion',    amount = 1 }
            },
            time = 4000,
            xp_gain = 25,
            level = 3
        },
        {
            item = 'chicken_burger',
            label = 'Chicken burger',
            requirements = {
                { item = 'cutted_bun',     amount = 1 },
                { item = 'cutted_tomato',  amount = 1 },
                { item = 'cutted_chicken', amount = 1 }
            },
            time = 4000,
            xp_gain = 25,
            level = 4
        },
        {
            item = 'cheese_burger',
            label = 'Cheese burger',
            requirements = {
                { item = 'cutted_tomato', amount = 1 },
                { item = 'cutted_onion',  amount = 1 },
                { item = 'cutted_bun',    amount = 1 },
                { item = 'cutted_meat',   amount = 1 },
                { item = 'cheese_slice',  amount = 1 }
            },
            time = 4000,
            xp_gain = 25,
            level = 5
        }
    },
     ['burgershot2'] = {
        {
            item = 'squash_lemon',
            label = 'Squash lemon',
            requirements = {
                { item = 'cutted_lemon',  amount = 1 },
                { item = 'cutted_orange', amount = 1 },
                { item = 'sugar',         amount = 1 },
                { item = 'water_bottle',  amount = 1 }
            },
            time = 4000,
            xp_gain = 25,
            level = 1
        },
        {
            item = 'milkshake_strawberry',
            label = 'Milkshake Smoothie strawberry',
            requirements = {
                { item = 'milkshake_formula', amount = 1 },
                { item = 'cutted_strawberry', amount = 1 },
                { item = 'milk',              amount = 1 },
                { item = 'sugar',             amount = 1 },
                { item = 'water_bottle',      amount = 1 }
            },
            time = 4000,
            xp_gain = 25,
            level = 2
        },
        {
            item = 'buble_tea_orange',
            label = 'Buble tea orange',
            requirements = {
                { item = 'tea',           amount = 1 },
                { item = 'boba',          amount = 1 },
                { item = 'sugar',         amount = 1 },
                { item = 'cutted_orange', amount = 1 },
                { item = 'water_bottle',  amount = 1 }
            },
            time = 4000,
            xp_gain = 25,
            level = 3
        }
    }
}
Config.GangCrafting = {
    ['ballas'] = {
        {
            item = 'rope',
            label = 'Tali Baja',
            requirements = {
                { item = 'besi',       amount = 3 },
                { item = 'metalscrap', amount = 3 }
            },
            time = 3000,
            xp_gain = 15,
            level = 1
        },
        {
            item = 'lockpick',
            label = 'Lockpick',
            requirements = {
                { item = 'metalscrap', amount = 4 },
                { item = 'plastic',    amount = 4 },
                { item = 'tembaga',    amount = 4 }
            },
            time = 4000,
            xp_gain = 25,
            level = 2
        },
        {
            item = 'phonehack',
            label = 'phone hack',
            requirements = {
                { item = 'metalscrap', amount = 5 },
                { item = 'tembaga',    amount = 5 },
                { item = 'besi',       amount = 5 }
            },
            time = 4000,
            xp_gain = 30,
            level = 3
        },
        {
            item = 'thermite_bomb',
            label = 'Thermite Bomb',
            requirements = {
                { item = 'metalscrap', amount = 5 },
                { item = 'tembaga',    amount = 5 },
                { item = 'besi',       amount = 5 }
            },
            time = 4000,
            xp_gain = 30,
            level = 3
        },
        {
            item = 'laptop',
            label = 'Laptop',
            requirements = {
                { item = 'metalscrap', amount = 5 },
                { item = 'tembaga',    amount = 5 },
                { item = 'besi',       amount = 5 }
            },
            time = 4000,
            xp_gain = 30,
            level = 4
        },
        {
            item = 'security_card_01',
            label = 'Security Card A',
            requirements = {
                { item = 'metalscrap', amount = 5 },
                { item = 'tembaga',    amount = 5 },
                { item = 'besi',       amount = 5 }
            },
            time = 4000,
            xp_gain = 30,
            level = 4
        },
        {
            item = 'armour',
            label = 'Rompi Anti Pluru',
            requirements = {
                { item = 'kulit_kayu', amount = 5 },
                { item = 'diamon',     amount = 5 },
                { item = 'tembaga',    amount = 5 },
                { item = 'emas',       amount = 5 }
            },
            time = 4000,
            xp_gain = 30,
            level = 4
        },
        {
            item = 'weapon_pistol50',
            label = 'Pistol 50',
            requirements = {
                { item = 'metalscrap', amount = 5 },
                { item = 'besi',       amount = 5 },
                { item = 'tembaga',    amount = 5 },
                { item = 'kayu',       amount = 5 }
            },
            time = 4000,
            xp_gain = 30,
            level = 5
        }
    },

    ['vagos'] = {
        {
            item = 'joint',
            label = 'Marijuana Joint',
            requirements = {
                { item = 'weed',          amount = 1 },
                { item = 'rolling_paper', amount = 1 }
            },
            time = 2000,
            xp_gain = 10,
            level = 1
        }
    }
}

Config.Recipes = {}

local function addToRecipes(group)
    for _, crafts in pairs(group) do
        for _, craft in ipairs(crafts) do
            Config.Recipes[craft.item] = {
                label = craft.label,
                materials = craft.requirements,
                time = craft.time,
                xp_gain = craft.xp_gain or 10,
                level = craft.level or 1
            }
        end
    end
end

addToRecipes(Config.JobCrafting)
addToRecipes(Config.GangCrafting)
