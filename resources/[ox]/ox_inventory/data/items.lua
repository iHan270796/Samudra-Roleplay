return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 500,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = false, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 800000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
        label = 'Radio',
        weight = 1000,
        allowArmed = true,
        consume = 0,
        client = {
           event = 'sbs-radio:use'
        },
    },

	['armour'] = {
		label = 'Armor Biasa',
		weight = 1500,
		stack = true,
		close = true,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},
	['armourr'] = {
		label = 'Armor Standar',
		weight = 1500,
		stack = true,
		close = true,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},
	['heavy_armour'] = {
		label = 'Armor Super',
		weight = 2000,
		stack = true,
		close = true,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500,
		},
		decay = true
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	-- yseries
	["phone"] = {
        label = "Phone",
        weight = 1500,
        stack = false,
        consume = 0,
        client = {
            export = "yseries.UsePhoneItem",
            remove = function()
                TriggerEvent("yseries:phone-item-removed")
            end,
            add = function()
                TriggerEvent("yseries:phone-item-added")
            end
        }
    },

    -- YPhone
    ["yphone_natural"] = {
        label = "YPhone Natural",
        weight = 1500,
        stack = false,
        consume = 0,
        client = {
            export = "yseries.UsePhoneItem",
            remove = function()
                TriggerEvent("yseries:phone-item-removed")
            end,
            add = function()
                TriggerEvent("yseries:phone-item-added")
            end
        }
    },
["yphone_black"] = {
    label = "YPhone Black",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},
["yphone_white"] = {
    label = "YPhone White",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},
["yphone_blue"] = {
    label = "Phone",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},

-- YFlip Phone
["yflip_mint"] = {
    label = "YFlip Mint",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},
["yflip_gold"] = {
    label = "YFlip Gold",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},
["yflip_graphite"] = {
    label = "YFlip Graphite",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},
["yflip_lavender"] = {
    label = "YFlip Lavender",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},

-- YSeries only(won't work for other versions)
["y24_black"] = {
    label = "Y24 Black",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},
["y24_silver"] = {
    label = "Y24 Silver",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},
["y24_violet"] = {
    label = "Y24 Violet",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},
["y24_yellow"] = {
    label = "Y24 Yellow",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},
["yfold_black"] = {
    label = "YFold Black",
    weight = 1500,
    stack = false,
    consume = 0,
    client = {
        export = "yseries.UsePhoneItem",
        remove = function()
            TriggerEvent("yseries:phone-item-removed")
        end,
        add = function()
            TriggerEvent("yseries:phone-item-added")
        end
    }
},
    ["yphone_fold_black"] = {
        label = "YPhone Fold Black",
        weight = 1500,
        stack = false,
        consume = 0,
        client = {
            export = "yseries.UsePhoneItem",
            remove = function()
                TriggerEvent("yseries:phone-item-removed")
            end,
            add = function()
                TriggerEvent("yseries:phone-item-added")
            end
        }
    },
    ['ys_sim_card'] = {
        label = 'Sim Card',
        stack = false,
        weight = 10,
        consume = 0,
    },

	["semi_slick_tyres"] = {
		label = "Semi Slick Tyres",
		weight = 500,
		stack = true,
		close = true,
		description = "Semi Slick Tyres.",
		client = {
			image = "semi_slick_tyres.png",
		}
	},

	["glasses2"] = {
		label = "Pet Glasses",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "glasses2.png",
		}
	},

	["heroin"] = {
		label = "Heroin",
		weight = 500,
		stack = true,
		close = false,
		description = "Really addictive depressant...",
		client = {
			image = "heroin.png",
		}
	},

	["unihorn"] = {
		label = "Unicorn Horn",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "unihorn.png",
		}
	},

	["tradingcard_rare"] = {
		label = "Card Rare",
		weight = 10,
		stack = false,
		close = true,
		description = "This letter is strange, how crazy...",
		client = {
			image = "tradingcard_rare.png",
		}
	},

	["coke_box"] = {
		label = "Box with Coke",
		weight = 200,
		stack = true,
		close = true,
		description = "Box with Coke",
		client = {
			image = "coke_box.png",
		}
	},

	["syringe"] = {
		label = "Syringe",
		weight = 500,
		stack = true,
		close = true,
		description = "A Syringe works every time",
		client = {
			image = "syringe.png",
		}
	},

	["collar2"] = {
		label = "Pet Collar",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "collar2.png",
		}
	},

	["pumpkinseed"] = {
		label = "Pumpkin Seed",
		weight = 500,
		stack = true,
		close = false,
		description = "Pumpkin Seed",
	},

	["grape"] = {
		label = "Grape",
		weight = 100,
		stack = true,
		close = false,
		description = "Mmmmh yummie, grapes",
		client = {
			image = "grape.png",
		}
	},

	["leash3"] = {
		label = "Pet Leash",
		weight = 0,
		stack = true,
		close = false,
		description = "Handle your pet",
		client = {
			image = "leash3.png",
		}
	},

	["brakepad_replacement"] = {
		label = "Brakepad Replacement",
		weight = 500,
		stack = true,
		close = true,
		description = "Brakepad Replacement.",
		client = {
			image = "brakepad_replacement.png",
		}
	},

	["trimming_scissors"] = {
		label = "Trimming Scissors",
		weight = 1500,
		stack = true,
		close = false,
		description = "Very Sharp Trimming Scissors",
		client = {
			image = "trimming_scissors.png",
		}
	},

	["rembrandt"] = {
		label = "Rembrandt",
		weight = 10,
		stack = true,
		close = true,
		description = "Rembrandt",
		client = {
			image = "rembrandt.png",
		}
	},

	["meth_packaged"] = {
		label = "Packaged Methamphetamine",
		weight = 10,
		stack = true,
		close = true,
		description = "Oh shit brother, that's hard, very hard.",
		client = {
			image = "meth_packaged.png",
		}
	},

	["tape"] = {
		label = "Tape",
		weight = 500,
		stack = true,
		close = true,
		description = "A Tape works every time",
		client = {
			image = "tape.png",
		}
	},

	["cocaine"] = {
		label = "Cocaine",
		weight = 10,
		stack = true,
		close = true,
		description = "The powder of love, who would have thought it would be so addictive?",
		client = {
			image = "cocaine.png",
		}
	},

	["forceps"] = {
		label = "Forceps",
		weight = 500,
		stack = true,
		close = true,
		description = "A Forceps works every time",
		client = {
			image = "forceps.png",
		}
	},

	["drive"] = {
		label = "drive",
		weight = 1,
		stack = false,
		close = true,
		description = "Documenti.",
		client = {
			image = "drive.png",
		}
	},

	["thermite_bomb"] = {
		label = "Thermite Bomb",
		weight = 1000,
		stack = true,
		close = true,
		description = "Thermite Bomb",
		client = {
			image = "thermite_bomb.png",
		}
	},

	["pink_sapphire"] = {
		label = "Pink Sapphire",
		weight = 150,
		stack = true,
		close = true,
		description = "A delicate pink sapphire.",
		client = {
			image = "pink_sapphire.png",
		}
	},

	["charger_hp"] = {
		label = "Charger Handphone",
		weight = 150,
		stack = false,
		close = true,
		description = "Charger Handphone",
		client = {
			image = "charger_hp.png",
		}
	},
	["usb_cable"] = {
		label = "Usb Cable",
		weight = 150,
		stack = false,
		close = true,
		description = "charger for the vehicle",
		client = {
            image = 'usb_cable.png',
            export = "yseries.UseUSBCable"
        }
	},
	-- ['portable_charger'] = {
    --     label = 'Portable Charger',
    --     weight = 500,
    --     stack = false,
    --     close = true,
    --     description = 'A portable battery pack for charging devices',
    --     client = {
    --         export = 'rd_phonecharger.toggleCharger'
    --     }
    -- },
    -- ['iphone_charger'] = {
    --     label = 'iPhone Charger Cable',
    --     weight = 100,
    --     stack = false,
    --     close = true,
    --     description = 'Cable to connect your iPhone to the charger'
    -- },

	["weed_brick"] = {
		label = "Weed Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "1KG Weed Brick to sell to large customers.",
		client = {
			image = "weed_brick.png",
		}
	},

	["bluebandana"] = {
		label = "Blue Bandana",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "bluebandana.png",
		}
	},

	["sorted_money"] = {
		label = "Sorted Money",
		weight = 10,
		stack = true,
		close = true,
		description = "Oh shit brother, that's hard, very hard.",
		client = {
			image = "sorted_money.png",
		}
	},

	["besi"] = {
		label = "Iron",
		weight = 400,
		stack = true,
		close = true,
		description = "Iron metal resulting from smelting rock.",
		client = {
			image = "besi.png",
		}
	},

	["melon"] = {
		label = "Watermelon",
		weight = 500,
		stack = true,
		close = false,
		description = "Watermelon",
		client = {
			image = "melon.png",
		}
	},

	["weed_ak47"] = {
		label = "AK47 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g AK47",
		client = {
			image = "weed_baggy.png",
		}
	},

	["hat"] = {
		label = "Pet Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "hat.png",
		}
	},

	["firstaid"] = {
		label = "First Aid",
		weight = 2500,
		stack = true,
		close = true,
		description = "You can use this First Aid kit to get people back on their feet",
		client = {
			image = "firstaid.png",
		}
	},

	["briefcase"] = {
		label = "briefcase",
		weight = 0,
		stack = false,
		close = true,
		description = "No have",
		client = {
			image = "weapon_briefcase.png",
		}
	},

	["licenseplate"] = {
		label = "License Plate",
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect",
		client = {
			image = "licenseplate.png",
		}
	},

	["clutch_replacement"] = {
		label = "Clutch Replacement",
		weight = 500,
		stack = true,
		close = true,
		description = "Clutch Replacement.",
		client = {
			image = "clutch_replacement.png",
		}
	},

	["iron"] = {
		label = "Iron",
		weight = 100,
		stack = true,
		close = false,
		description = "Handy piece of metal that you can probably use for something",
		client = {
			image = "iron.png",
		}
	},

	["cryptostick"] = {
		label = "cryptostick",
		weight = 1,
		stack = true,
		close = true,
		description = "Special item.",
		client = {
			image = "cryptostick.png",
		}
	},

	["woodland_weapontint"] = {
		label = "Woodland Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Woodland Camo Tint",
		client = {
			image = "woodcamo_attachment.png",
		}
	},

	["lsa"] = {
		label = "LSA",
		weight = 500,
		stack = true,
		close = false,
		description = "Almost ready to party...",
		client = {
			image = "lsa.png",
		}
	},

	["coke_access"] = {
		label = "Access card",
		weight = 200,
		stack = true,
		close = true,
		description = "Access card",
		client = {
			image = "coke_access.png",
		}
	},

	["ironoxide"] = {
		label = "Iron Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with.",
		client = {
			image = "ironoxide.png",
		}
	},

	["hen"] = {
		label = "Chicken",
		weight = 200,
		stack = true,
		close = false,
		description = "Some fresh chicken meat",
		client = {
			image = "chicken.png",
		}
	},

	["harness"] = {
		label = "Race Harness",
		weight = 1000,
		stack = false,
		close = true,
		description = "Racing Harness so no matter what you stay in the car",
		client = {
			event = "qbx_seatbelt:client:UseHarness",
		}
	},
	-- ["racing_gps"] = {
	-- 	label = "Racing Gps",
	-- 	weight = 250,
	-- 	stack = false,
	-- 	close = true,
	-- 	description = "Racing Gps",
	-- },

	["pumpkin"] = {
		label = "Pumpkin",
		weight = 200,
		stack = true,
		close = false,
		description = "A PUMPKIN",
		client = {
			image = "pumpkin.png",
		}
	},

	['joint'] = {
		label = 'joint',
		weight = 220,
		client = {
			anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c' },
			prop = 'ng_proc_cigarette01a',
			usetime = 5000,
			notification = 'You ate a delicious burger'
		},
	},

	["ifaks"] = {
		label = "ifaks",
		weight = 200,
		stack = true,
		close = true,
		description = "ifaks for healing and a complete stress remover.",
		client = {
			image = "ifaks.png",
		}
	},

	["unihorn4"] = {
		label = "Unicorn Horn",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "unihorn4.png",
		}
	},

	["chicken_meat2"] = {
		label = "Chicken Meat (High)",
		weight = 100,
		stack = true,
		close = true,
		description = "Chicken Meat (High)",
		client = {
			image = "chicken_meat2.png",
		}
	},

	["melonseed"] = {
		label = "Melon Seed",
		weight = 500,
		stack = true,
		close = false,
		description = "Melon Seed",
		client = {
			image = "wheatseed.png",
		}
	},

	["weed_white-widow_seed"] = {
		label = "White Widow Seed",
		weight = 0,
		stack = true,
		close = false,
		description = "A weed seed of White Widow",
		client = {
			image = "weed_seed.png",
		}
	},

	["coke_small_brick"] = {
		label = "Coke Package",
		weight = 350,
		stack = true,
		close = true,
		description = "Small package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_small_brick.png",
		}
	},

	["blackvest"] = {
		label = "Black Vest",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "blackvest.png",
		}
	},

	["backpack"] = {
		label = "Backpack",
		weight = 0,
		stack = false,
		close = true,
		description = "No have",
		client = {
			image = "bag.png",
		}
	},

	["tablet"] = {
		label = "Tablet",
		weight = 2000,
		stack = true,
		close = true,
		description = "Expensive tablet",
		client = {
			image = "tablet.png",
		}
	},

	["petfood"] = {
		label = "Pet Food",
		weight = 0,
		stack = false,
		close = false,
		description = "Pet Food",
		client = {
			image = "petfood.png",
		}
	},

	["grapejuice"] = {
		label = "Grape Juice",
		weight = 200,
		stack = true,
		close = false,
		description = "Grape juice is said to be healthy",
		client = {
			image = "grapejuice.png",
		}
	},

	["c4_bomb"] = {
		label = "C4 bomb",
		weight = 10,
		stack = true,
		close = true,
		description = "C4 bomb",
		client = {
			image = "c4_bomb.png",
		}
	},

	["deer_bait2"] = {
		label = "Deer Bait (High)",
		weight = 100,
		stack = true,
		close = true,
		description = "Deer Bait (High)",
		client = {
			image = "deer_bait2.png",
		}
	},

	["beryl_chunk"] = {
		label = "Beryl Chunk",
		weight = 200,
		stack = true,
		close = true,
		description = "A chunk of beryl.",
		client = {
			image = "beryl_chunk.png",
		}
	},

	["tinyhat"] = {
		label = "Tiny Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "tinyhat.png",
		}
	},

	["watch"] = {
		label = "Watch",
		weight = 100,
		stack = true,
		close = false,
		description = "It is very fragile, watch out",
		client = {
			image = "rolex.png",
		}
	},

	["cutted_tomato"] = {
		label = "Cutted Tomato",
		weight = 100,
		stack = true,
		close = true,
		description = "Cutted Tomato",
		client = {
			image = "cutted_tomato.png",
		}
	},

	["fairyvest"] = {
		label = "Fairy Vest",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "fairyvest.png",
		}
	},

	["tomato_seed"] = {
		label = "Tomato Seed",
		weight = 200,
		stack = true,
		close = true,
		description = "A TOMATO SEED",
		client = {
			image = "tomatoseed.png",
		}
	},

	["cheese_slice"] = {
		label = "Cheese Slice",
		weight = 100,
		stack = true,
		close = true,
		description = "Cheese Slice",
		client = {
			image = "cheese_slice.png",
		}
	},

	["blue_diamond"] = {
		label = "Blue Diamond",
		weight = 150,
		stack = true,
		close = true,
		description = "A rare and valuable blue diamond.",
		client = {
			image = "blue_diamond.png",
		}
	},

	["tinyhat5"] = {
		label = "Tiny Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "tinyhat5.png",
		}
	},

	["pumpkin_seed"] = {
		label = "Pumpkin Seed",
		weight = 200,
		stack = true,
		close = true,
		description = "A PUMPKIN SEED",
		client = {
			image = "pumpkin_seed.png",
		}
	},

	["tinyhat4"] = {
		label = "Tiny Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "tinyhat4.png",
		}
	},

	["cutted_lettuce"] = {
		label = "Cutted Lettuce",
		weight = 100,
		stack = true,
		close = true,
		description = "Cutted Lettuce",
		client = {
			image = "cutted_lettuce.png",
		}
	},

	["batu_bersih"] = {
		label = "Clean Stone",
		weight = 800,
		stack = true,
		close = true,
		description = "Washed stone.",
		client = {
			image = "batu_bersih.png",
		}
	},

	["chemicalvapor"] = {
		label = "Chemical Vapors",
		weight = 1500,
		stack = true,
		close = false,
		description = "High Pressure Chemical Vapors, Explosive!",
		client = {
			image = "chemicalvapor.png",
		}
	},

	["awd_drivetrain"] = {
		label = "AWD Drivetrain",
		weight = 500,
		stack = true,
		close = true,
		description = "AWD Drivetrain.",
		client = {
			image = "awd_drivetrain.png",
		}
	},

	["gold_weapontint"] = {
		label = "Gold Tint",
		weight = 1000,
		stack = true,
		close = true,
		description = "Gold Weapon Tint",
		client = {
			image = "gold_attachment.png",
		}
	},

	["diamond_ring"] = {
		label = "Diamond Ring",
		weight = 1500,
		stack = true,
		close = true,
		description = "A diamond ring seems like the jackpot to me!",
		client = {
			image = "diamond_ring.png",
		}
	},

	["methkey"] = {
		label = "Key A",
		weight = 200,
		stack = true,
		close = false,
		description = "Random Key, with \"Walter\" Engraved on the Back...",
		client = {
			image = "keya.png",
		}
	},

	["weed"] = {
		label = "Marijuana",
		weight = 10,
		stack = true,
		close = true,
		description = "Hey brother, I think this is so natural...",
		client = {
			image = "weed.png",
		}
	},

	["tinyhat7"] = {
		label = "Tiny Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "tinyhat7.png",
		}
	},

	["metalscrap"] = {
		label = "Metal Scrap",
		weight = 100,
		stack = true,
		close = false,
		description = "You can probably make something nice out of this",
		client = {
			image = "metalscrap.png",
		}
	},

	["lawyerpass"] = {
		label = "Lawyer Pass",
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect",
		client = {
			image = "lawyerpass.png",
		}
	},

	["mask"] = {
		label = "Mask",
		weight = 0,
		stack = false,
		close = true,
		description = "A nice piece of clothing",
		client = {
			image = "mask.png",
		}
	},

	["sugar"] = {
		label = "Sugar",
		weight = 1000,
		stack = true,
		close = true,
		description = "Sugar",
		client = {
			image = "sugar.png",
		}
	},

	["stone"] = {
		label = "Batu Kotor",
		weight = 1000,
		stack = true,
		close = true,
		description = "Batu Kotor",
		client = {
			image = "stone.png",
		}
	},

	["fish_bait"] = {
		label = "Fish Bait",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fish Bait",
		client = {
			image = "fish_bait.png",
		}
	},

	["thionyl_chloride"] = {
		label = "Thionyl Chloride",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care!",
		client = {
			image = "thionyl_chloride.png",
		}
	},

	["copper"] = {
		label = "Copper",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "copper.png",
		}
	},

	["microwave"] = {
		label = "Microwave",
		weight = 46000,
		stack = false,
		close = true,
		description = "Microwave",
		client = {
			image = "placeholder.png",
		}
	},

	["tradingcard_basic"] = {
		label = "Card Basic",
		weight = 10,
		stack = false,
		close = true,
		description = "Basic letter, it will serve for your collection",
		client = {
			image = "tradingcard_basic.png",
		}
	},

	["weaponlicense"] = {
		label = "Weapon License",
		weight = 0,
		stack = false,
		close = true,
		description = "Weapon License",
		client = {
			image = "weapon_license.png",
		}
	},

	["tembaga"] = {
		label = "Copper",
		weight = 300,
		stack = true,
		close = true,
		description = "Copper metal from stone.",
		client = {
			image = "tembaga.png",
		}
	},

	["drift_tuning_kit"] = {
		label = "Drift Tuning Kit",
		weight = 500,
		stack = true,
		close = true,
		description = "Drift Tuning Kit.",
		client = {
			image = "drift_tuning_kit.png",
		}
	},

	["pinksweater"] = {
		label = "Pink Sweater",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "pinksweater.png",
		}
	},

	["tennisball"] = {
		label = "Tennis Ball",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "tennisball.png",
		}
	},

	["cokebaggy"] = {
		label = "Bag of Coke",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy real quick",
		client = {
			image = "cokebaggy.png",
		}
	},

	['fishingrod'] = {
        label = 'Fishing Rod',
        weight = 1000,
        stack = false,
        close = true,
        description = 'Rod used for fishing.',
        client = {
            export = 'deanix_fishingjob.useRod'
        }
    },

	["slick_tyres"] = {
		label = "Slick Tyres",
		weight = 500,
		stack = true,
		close = true,
		description = "Slick Tyres.",
		client = {
			image = "slick_tyres.png",
		}
	},

	["churn"] = {
		label = "churn",
		weight = 500,
		stack = true,
		close = false,
		description = "Milk Churn",
		client = {
			image = "churn.png",
		}
	},

	["fwd_drivetrain"] = {
		label = "FWD Drivetrain",
		weight = 500,
		stack = true,
		close = true,
		description = "FWD Drivetrain.",
		client = {
			image = "fwd_drivetrain.png",
		}
	},

	["surgical_staple"] = {
		label = "Surgical staple",
		weight = 500,
		stack = true,
		close = true,
		description = "A Surgical staple works every time",
		client = {
			image = "surgical_staple.png",
		}
	},

	["cheese_burger"] = {
		label = "Cheese Burger",
		weight = 100,
		stack = true,
		close = true,
		description = "Cheese Burger",
		client = {
			status = { hunger = 800000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Cheese Burger'
		},
	},

	["chiken_wings"] = {
		label = "Chicken wings",
		weight = 100,
		stack = true,
		close = true,
		description = "Chicken wings",
		client = {
			status = { hunger = 800000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Chicken wings'
		},
	},

	["chiken_teriyaki"] = {
		label = "Chicken Teriyaki",
		weight = 100,
		stack = true,
		close = true,
		description = "Chicken Teriyaki",
		client = {
			status = { hunger = 800000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Chicken Teriyaki'
		},
	},

	["gold_bar"] = {
		label = "Gold bar",
		weight = 10,
		stack = true,
		close = true,
		description = "Gold bar",
		client = {
			image = "gold_bar.png",
		}
	},

	["empty_nitrous_bottle"] = {
		label = "Empty Nitrous Bottle",
		weight = 500,
		stack = true,
		close = true,
		description = "Empty Nitrous Bottle.",
		client = {
			image = "empty_nitrous_bottle.png",
		}
	},

	["respray_kit"] = {
		label = "Respray Kit",
		weight = 500,
		stack = true,
		close = true,
		description = "Respray Kit.",
		client = {
			image = "respray_kit.png",
		}
	},

	["collar3"] = {
		label = "Pet Collar",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "collar3.png",
		}
	},

	["offroad_tyres"] = {
		label = "Offroad Tyres",
		weight = 500,
		stack = true,
		close = true,
		description = "Offroad Tyres.",
		client = {
			image = "offroad_tyres.png",
		}
	},

	["meth"] = {
		label = "Methamphetamine",
		weight = 10,
		stack = true,
		close = true,
		description = "Oh shit brother, that's hard, very hard.",
		client = {
			image = "meth.png",
		}
	},

	["gold_dust"] = {
		label = "Gold Dust",
		weight = 150,
		stack = true,
		close = true,
		description = "A pinch of gold dust.",
		client = {
			image = "gold_dust.png",
		}
	},

	["weapons"] = {
		label = "weapons",
		weight = 1,
		stack = false,
		close = true,
		description = "Weapon License",
		client = {
			image = "weapons.png",
		}
	},

	["liquidmix"] = {
		label = "Liquid Chem Mix",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care!",
		client = {
			image = "liquidmix.png",
		}
	},

	["brownshoes"] = {
		label = "Brown Shoes",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "brownshoes.png",
		}
	},

	["creditcard"] = {
		label = "Credit Card",
		weight = 0,
		stack = false,
		close = false,
		description = "Visa card, can be used via ATM",
		client = {
			image = "bank_card.png",
		}
	},

	["boba"] = {
		label = "Boba",
		weight = 100,
		stack = true,
		close = true,
		description = "Boba",
		client = {
			image = "boba.png",
		}
	},

	["phone_dongle"] = {
		label = "Phone Dongle",
		weight = 50,
		stack = true,
		close = false,
		description = "Telephone key to make a bypass, maybe...",
		client = {
			image = "phone_dongle.png",
		}
	},

	["methtray"] = {
		label = "Meth Tray",
		weight = 200,
		stack = true,
		close = false,
		description = "make some meth",
		client = {
			image = "meth_tray.png",
		}
	},

	["beadnecklace"] = {
		label = "Bead Necklace",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "beadnecklace.png",
		}
	},

	["xmasvest"] = {
		label = "XMas Vest",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "xmasvest.png",
		}
	},

	["rwd_drivetrain"] = {
		label = "RWD Drivetrain",
		weight = 500,
		stack = true,
		close = true,
		description = "RWD Drivetrain.",
		client = {
			image = "rwd_drivetrain.png",
		}
	},

	["jeans"] = {
		label = "Jeans",
		weight = 0,
		stack = false,
		close = true,
		description = "A nice piece of clothing",
		client = {
			image = "jeans.png",
		}
	},

	["handcuffs"] = {
		label = "Handcuffs",
		weight = 100,
		stack = true,
		close = true,
		description = "Comes in handy when people misbehave. Maybe it can be used for something else?",
		client = {
			image = "handcuffs.png",
		}
	},

	["wheatseed"] = {
		label = "Wheat Seed",
		weight = 500,
		stack = true,
		close = false,
		description = "Wheat Seed",
		client = {
			image = "wheatseed.png",
		}
	},

	["filled_evidence_bag"] = {
		label = "Evidence Bag",
		weight = 200,
		stack = false,
		close = false,
		description = "A filled evidence bag to see who committed the crime >:(",
		client = {
			image = "evidence.png",
		}
	},

	["sodium_hydroxide"] = {
		label = "Sodium Hydroxide",
		weight = 1500,
		stack = true,
		close = true,
		description = "Chemicals, handle with care!",
		client = {
			image = "sodium_hydroxide.png",
		}
	},

	["pill"] = {
		label = "Pill",
		weight = 500,
		stack = true,
		close = true,
		description = "A Pill works every time",
		client = {
			image = "pill.png",
		}
	},

	["milkshake_formula"] = {
		label = "Milkshake Formula",
		weight = 100,
		stack = true,
		close = true,
		description = "Milkshake Formula",
		client = {
			image = "milkshake_formula.png",
		}
	},

	["cosmetic_part"] = {
		label = "Body Kit",
		weight = 500,
		stack = true,
		close = true,
		description = "Body Kit.",
		client = {
			image = "cosmetic_part.png",
		}
	},

	["sulfur_chunk"] = {
		label = "Sulfur Chunk",
		weight = 200,
		stack = true,
		close = true,
		description = "A chunk of sulfur.",
		client = {
			image = "sulfur_chunk.png",
		}
	},

	["leash2"] = {
		label = "Pet Leash",
		weight = 0,
		stack = true,
		close = false,
		description = "Handle your pet",
		client = {
			image = "leash2.png",
		}
	},

	["apple"] = {
		label = "Apple",
		weight = 200,
		stack = true,
		close = false,
		description = "AN APPLE",
		client = {
			image = "apple.png",
		}
	},

	["tomato"] = {
		label = "Tomato",
		weight = 200,
		stack = true,
		close = false,
		description = "A TOMATO",
		client = {
			image = "tomato.png",
		}
	},

	["10kgoldchain"] = {
		label = "10k Gold Chain",
		weight = 2000,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["lsd"] = {
		label = "LSD",
		weight = 500,
		stack = true,
		close = false,
		description = "Lets get this party started!",
		client = {
			image = "lsd.png",
		}
	},

	["orange_weapontint"] = {
		label = "Orange Tint",
		weight = 1000,
		stack = true,
		close = true,
		description = "Orange Weapon Tint",
		client = {
			image = "orange_attachment.png",
		}
	},

	["hunting_knife"] = {
		label = "Hunting Knife",
		weight = 100,
		stack = true,
		close = true,
		description = "Hunting Knife",
		client = {
			image = "hunting_knife.png",
		}
	},

	["leopard_weapontint"] = {
		label = "Leopard Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Leopard Camo Tint",
		client = {
			image = "leopardcamo_attachment.png",
		}
	},

	["zebra_weapontint"] = {
		label = "Zebra Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Zebra Camo Tint",
		client = {
			image = "zebracamo_attachment.png",
		}
	},

	["whiskey"] = {
		label = "Whiskey",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "whiskey.png",
		}
	},

	["lapis_panther"] = {
		label = "Lapis panther",
		weight = 10,
		stack = true,
		close = true,
		description = "Lapis panther",
		client = {
			image = "lapis_panther.png",
		}
	},

	["rope"] = {
		label = "Rope",
		weight = 400,
		stack = true,
		close = true,
		description = "Rope.",
		client = {
			image = "rope.png",
		}
	},

	["coke_leaf"] = {
		label = "Coca leaves",
		weight = 200,
		stack = true,
		close = true,
		description = "Coca leaves",
		client = {
			image = "coke_leaf.png",
		}
	},

	["red_phone"] = {
		label = "Red Phone",
		weight = 150,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "red_phone.png",
		}
	},

	["cocainekey"] = {
		label = "Key B",
		weight = 200,
		stack = true,
		close = false,
		description = "Random Key, with a \"Razorblade\" Engraved on the Back...",
		client = {
			image = "keyb.png",
		}
	},

	["corundum_chunk"] = {
		label = "Corundum Chunk",
		weight = 200,
		stack = true,
		close = true,
		description = "A chunk of corundum.",
		client = {
			image = "corundum_chunk.png",
		}
	},

	["v8_engine"] = {
		label = "V8 Engine",
		weight = 500,
		stack = true,
		close = true,
		description = "V8 Engine.",
		client = {
			image = "v8_engine.png",
		}
	},

	["security_card_02"] = {
		label = "Security Card B",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_02.png",
		}
	},

	["snikkel_candy"] = {
		label = "Snikkel",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	["samsungphone"] = {
		label = "Samsung S10",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "samsungphone.png",
		}
	},

	["advancedlockpick"] = {
		label = "Advanced Lockpick",
		weight = 500,
		stack = true,
		close = true,
		description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["cutted_strawberry"] = {
		label = "Cutted Strawberry",
		weight = 100,
		stack = true,
		close = true,
		description = "Cutted Strawberry",
		client = {
			image = "cutted_strawberry.png",
		}
	},

	["police_stormram"] = {
		label = "Stormram",
		weight = 18000,
		stack = true,
		close = true,
		description = "A nice tool to break into doors",
		client = {
			image = "police_stormram.png",
		}
	},

	["unihorn6"] = {
		label = "Unicorn Horn",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "unihorn6.png",
		}
	},

	["weed_nutrition"] = {
		label = "Plant Fertilizer",
		weight = 2000,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["glass"] = {
		label = "Glass",
		weight = 100,
		stack = true,
		close = false,
		description = "It is very fragile, watch out",
		client = {
			image = "glass.png",
		}
	},

	["diamond_crystal"] = {
		label = "Diamond Crystal",
		weight = 250,
		stack = true,
		close = true,
		description = "An exquisite diamond crystal.",
		client = {
			image = "diamond_crystal.png",
		}
	},

	['stickynote'] = {
    label = 'Nota Pesanan',
    weight = 100,
    stack = false,
    close = true,
    description = 'Nota berisi pesanan pelanggan',
    client = {
        export = 'ox_inventory.displayItemInfo'
    },
    info = true -- WAJIB supaya info bisa dibaca di tooltip
},

	-- ["stickynote"] = {
	-- 	label = "Sticky Note",
	-- 	weight = 0,
	-- 	stack = false,
	-- 	close = false,
	-- 	description = "Catatan pesanan pelanggan.",
	-- 	client = {
	-- 		image = "stickynote.png",
	-- 	}
	-- },

	["cutted_lemon"] = {
		label = "Cutted Lemon",
		weight = 100,
		stack = true,
		close = true,
		description = "Cutted Lemon",
		client = {
			image = "cutted_lemon.png",
		}
	},

	["green_garnet"] = {
		label = "Green Garnet",
		weight = 150,
		stack = true,
		close = true,
		description = "A precious green garnet.",
		client = {
			image = "green_garnet.png",
		}
	},

	["partyglasses"] = {
		label = "Party Glasses",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "partyglasses.png",
		}
	},

	["diamon"] = {
		label = "Diamond",
		weight = 100,
		stack = true,
		close = true,
		description = "Diamond metal resulting from smelting.",
		client = {
			image = "diamon.png",
		}
	},

	["ev_coolant"] = {
		label = "EV Coolant",
		weight = 500,
		stack = true,
		close = true,
		description = "EV Coolant.",
		client = {
			image = "ev_coolant.png",
		}
	},

	["collar7"] = {
		label = "Pet Collar",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "collar7.png",
		}
	},

	["firework4"] = {
		label = "Weeping Willow",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework4.png",
		}
	},

	["suspension_parts"] = {
		label = "Suspension Parts",
		weight = 500,
		stack = true,
		close = true,
		description = "Suspension Parts.",
		client = {
			image = "suspension_parts.png",
		}
	},

	["collar6"] = {
		label = "Pet Collar",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "collar6.png",
		}
	},

	["nitrous"] = {
		label = "Nitrous",
		weight = 1000,
		stack = true,
		close = true,
		description = "Speed up, gas pedal! :D",
		client = {
			image = "nitrous.png",
		}
	},

	["ev_battery"] = {
		label = "EV Battery",
		weight = 500,
		stack = true,
		close = true,
		description = "EV Battery.",
		client = {
			image = "ev_battery.png",
		}
	},

	["unihorn9"] = {
		label = "Unicorn Horn",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "unihorn9.png",
		}
	},

	["chicken_meat"] = {
		label = "Chicken Meat (Low)",
		weight = 100,
		stack = true,
		close = true,
		description = "Chicken Meat (Low)",
		client = {
			image = "chicken_meat.png",
		}
	},

	["batmanvest"] = {
		label = "Batman Vest",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "batmanvest.png",
		}
	},

	["redvest"] = {
		label = "Red Vest",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "redvest.png",
		}
	},

	["spark_plug"] = {
		label = "Spark Plug",
		weight = 500,
		stack = true,
		close = true,
		description = "Spark Plug.",
		client = {
			image = "spark_plug.png",
		}
	},

	["clear_crystal"] = {
		label = "Clear Crystal",
		weight = 150,
		stack = true,
		close = true,
		description = "A clear and pristine crystal.",
		client = {
			image = "clear_crystal.png",
		}
	},

	["toaster"] = {
		label = "Toaster",
		weight = 18000,
		stack = false,
		close = true,
		description = "Toast",
		client = {
			image = "placeholder.png",
		}
	},

	["flint"] = {
		label = "Flint",
		weight = 150,
		stack = true,
		close = true,
		description = "A sharp piece of flint.",
		client = {
			image = "flint.png",
		}
	},

	['coke_brick'] = {
		label = 'Coke Brick',
		weight = 500,
		client = {
			anim = { dict = 'impexp_int-0', clip = 'mp_m_waremech_01_dual-0' },
			prop = { model = `prop_weed_block_01`, pos = vec3(0.01, 0.01, 0.05), rot = vec3(0.0, -90.0, 90.0) },
			usetime = 5000,
			cancel = true,
			notification = 'A Coke Brick works every time'
		}
	},

	["glasses"] = {
		label = "Glasses",
		weight = 0,
		stack = false,
		close = true,
		description = "A nice piece of clothing",
		client = {
			image = "glasses.png",
		}
	},

	["controller"] = {
		label = "Controller",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "controller.png",
		}
	},

	["green_weapontint"] = {
		label = "Green Tint",
		weight = 1000,
		stack = true,
		close = true,
		description = "Green Weapon Tint",
		client = {
			image = "green_attachment.png",
		}
	},

	["coke"] = {
		label = "Cocaine",
		weight = 1000,
		stack = true,
		close = false,
		description = "Processed cocaine",
		client = {
			image = "coke.png",
		}
	},

	["collar5"] = {
		label = "Pet Collar",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "collar5.png",
		}
	},

	["tinyhat9"] = {
		label = "Tiny Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "tinyhat9.png",
		}
	},

	["petchef"] = {
		label = "Chef Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "petchef.png",
		}
	},

	["packaged"] = {
		label = "Packaged",
		weight = 10,
		stack = true,
		close = true,
		description = "Hey brother, I think this is so natural...",
		client = {
			image = "packaged.png",
		}
	},

	["twerks_candy"] = {
		label = "Twerks",
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O",
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	["screwdriverset"] = {
		label = "Toolkit",
		weight = 1000,
		stack = true,
		close = false,
		description = "Very useful to screw... screws...",
		client = {
			image = "screwdriverset.png",
		}
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 500,
		stack = true,
		close = true,
		description = "Some fine smelling buds.",
		client = {
			image = "marijuana.png",
		}
	},

	["laptop"] = {
		label = "Laptop",
		weight = 4000,
		stack = true,
		close = true,
		description = "Expensive laptop",
		client = {
			image = "laptop.png",
		}
	},

	["ev_motor"] = {
		label = "EV Motor",
		weight = 500,
		stack = true,
		close = true,
		description = "EV Motor.",
		client = {
			image = "ev_motor.png",
		}
	},

	["guidebook"] = {
		label = "Guide Book Tutorial",
		weight = 50,
		stack = true,
		close = true,
		description = "Guide Book Tutorial",
		client = {
			event = "custom-guidebook:client:open",
		}
	},

	["goldchain"] = {
		label = "Golden Chain",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden chain seems like the jackpot to me!",
		client = {
			image = "goldchain.png",
		}
	},

	["mechanic_tablet"] = {
		label = "Mechanic Tablet",
		weight = 500,
		stack = true,
		close = true,
		description = "Mechanic Tablet.",
		client = {
			event = "jg-mechanic:client:use-tablet",
		}
	},

	["trowel"] = {
		label = "Trowel",
		weight = 200,
		stack = true,
		close = true,
		description = "Trowel",
		client = {
			image = "trowel.png",
		}
	},

	["rolex"] = {
		label = "Golden Watch",
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden watch seems like the jackpot to me!",
		client = {
			image = "rolex.png",
		}
	},

	["bandageg"] = {
		label = "Bandageg",
		weight = 500,
		stack = true,
		close = true,
		description = "A bandageg works every time",
		client = {
			image = "bandageg.png",
		}
	},

	["beetail"] = {
		label = "Bee Tail",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "beetail.png",
		}
	},

	["boombox"] = {
		label = "Boombox",
		weight = 0,
		stack = true,
		close = true,
		description = "Boombox.",
		client = {
			event = "wasabi_boombox:useBoombox",
		}
	},

	["jerry_can"] = {
		label = "Jerrycan 20L",
		weight = 20000,
		stack = true,
		close = true,
		description = "A can full of Fuel",
		client = {
			image = "jerry_can.png",
		}
	},

	["bulletproof_tyres"] = {
		label = "Bulletproof Tyres",
		weight = 500,
		stack = true,
		close = true,
		description = "Bulletproof Tyres.",
		client = {
			image = "bulletproof_tyres.png",
		}
	},

	["lspd_weapontint"] = {
		label = "LSPD Tint",
		weight = 1000,
		stack = true,
		close = true,
		description = "LSPD Weapon Tint",
		client = {
			image = "lspd_attachment.png",
		}
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice bread for your stomach",
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	["bluegill"] = {
		label = "Blue Gill",
		weight = 5100,
		stack = true,
		close = true,
		description = "Blue Gill",
		client = {
			image = "bluegill.png",
		}
	},

	["chemicals"] = {
		label = "Chemicals",
		weight = 10,
		stack = true,
		close = true,
		description = "Oh shit brother, that's hard, very hard.",
		client = {
			image = "chemicals.png",
		}
	},

	["kayu"] = {
		label = "Wood",
		weight = 400,
		stack = true,
		close = true,
		description = "Wood.",
		client = {
			image = "Kayu.png",
		}
	},

	["petbed2"] = {
		label = "Pet Bed",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "petbed2.png",
		}
	},

	["coolglasses"] = {
		label = "Pet Glasses",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "coolglasses.png",
		}
	},

	["collar4"] = {
		label = "Pet Collar",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "collar4.png",
		}
	},

	["empty_evidence_bag"] = {
		label = "Empty Evidence Bag",
		weight = 0,
		stack = true,
		close = false,
		description = "Used a lot to keep DNA from blood, bullet shells and more",
		client = {
			image = "evidence.png",
		}
	},

	["markedbills"] = {
		label = "Uang Merah",
		weight = 0,
		stack = true,
		close = true,
		description = "Money?",
		client = {
			image = "markedbills.png",
		}
	},

	["walkstick"] = {
		label = "Walking Stick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Walking stick for ya'll grannies out there.. HAHA",
		client = {
			image = "walkstick.png",
		}
	},

	["tiket_oplas"] = {
		label = "Plastic surgery tickets",
		weight = 20,
		stack = true,
		close = true,
		description = "Plastic surgery tickets",
		client = {
            event = 'deanix:usePlasticSurgeryItem'
        }
	},

	["petthirst"] = {
		label = "Pet Thirst",
		weight = 0,
		stack = false,
		close = false,
		description = "Pet Thirst",
		client = {
			image = "health3.png",
		}
	},

	["iodine"] = {
		label = "Iodine",
		weight = 500,
		stack = true,
		close = true,
		description = "A Iodine works every time",
		client = {
			image = "iodine.png",
		}
	},

	["daisycrown"] = {
		label = "Daisy Crown",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "daisycrown.png",
		}
	},

	["moneybag"] = {
		label = "Money Bag",
		weight = 0,
		stack = false,
		close = true,
		description = "A bag with cash",
		client = {
			image = "moneybag.png",
		}
	},

	["weed_og-kush_seed"] = {
		label = "OGKush Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush",
		client = {
			image = "weed_seed.png",
		}
	},

	["digital_weapontint"] = {
		label = "Digital Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Digital Camo Tint",
		client = {
			image = "digicamo_attachment.png",
		}
	},

	["v6_engine"] = {
		label = "V6 Engine",
		weight = 500,
		stack = true,
		close = true,
		description = "V6 Engine.",
		client = {
			image = "v6_engine.png",
		}
	},

	["bowtie"] = {
		label = "Bowtie",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "bowtie.png",
		}
	},

	["coca_leaf"] = {
		label = "Cocaine leaves",
		weight = 1500,
		stack = true,
		close = false,
		description = "Cocaine leaves that must be processed !",
		client = {
			image = "coca_leaf.png",
		}
	},

	["certificate"] = {
		label = "Certificate",
		weight = 0,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff",
		client = {
			image = "certificate.png",
		}
	},

	["beewings"] = {
		label = "Bee Wings",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "beewings.png",
		}
	},

	["quartz_crystal"] = {
		label = "Quartz Crystal",
		weight = 200,
		stack = true,
		close = true,
		description = "A clear quartz crystal.",
		client = {
			image = "quartz_crystal.png",
		}
	},

	["painkillers"] = {
		label = "Painkillers",
		weight = 0,
		stack = true,
		close = true,
		description = "For pain you can't stand anymore, take this pill that'd make you feel great again",
		client = {
			image = "painkillers.png",
		}
	},

	["fertilizer"] = {
		label = "Fertilizer",
		weight = 200,
		stack = true,
		close = true,
		description = "FERTILIZER FOR SHIIITS",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 2500,
		stack = true,
		close = true,
		description = "Uncured cannabis",
		client = {
			image = "cannabis.png",
		}
	},

	["casinochips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling",
		client = {
			image = "casinochips.png",
		}
	},

	["aluminumoxide"] = {
		label = "Aluminium Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with",
		client = {
			image = "aluminumoxide.png",
		}
	},

	["visa"] = {
		label = "Visa Card",
		weight = 0,
		stack = false,
		close = false,
		description = "Visa can be used via ATM",
		client = {
			image = "visa.png",
		}
	},

	["nitrous_bottle"] = {
		label = "Nitrous Bottle",
		weight = 500,
		stack = true,
		close = true,
		description = "Nitrous Bottle.",
		client = {
			event = "jg-mechanic:client:use-nitrous-bottle",
		}
	},

	["coal_ore"] = {
		label = "Coal Ore",
		weight = 250,
		stack = true,
		close = true,
		description = "A piece of coal ore.",
		client = {
			image = "coal_ore.png",
		}
	},

	["tradingcard_booster_legends"] = {
		label = "Card Booster Legends",
		weight = 50,
		stack = false,
		close = true,
		description = "Pack with random TCG cards",
		client = {
			image = "tradingcard_booster_legends.png",
		}
	},

	["cigarette"] = {
		label = "Cigarette",
		weight = 1,
		stack = true,
		close = false,
		description = "A cigar, a simple cigarette...",
		client = {
			image = "cigarette.png",
		}
	},

	["gauze"] = {
		label = "Gauze",
		weight = 500,
		stack = true,
		close = true,
		description = "A Gauze works every time",
		client = {
			image = "gauze.png",
		}
	},

	["cocaine_packaged"] = {
		label = "Packaged Cocaine",
		weight = 10,
		stack = true,
		close = true,
		description = "The powder of love, who would have thought it would be so addictive?",
		client = {
			image = "cocaine_packaged.png",
		}
	},

	["patriot_weapontint"] = {
		label = "Patriotic Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Patriotic Camo Tint",
		client = {
			image = "patriotcamo_attachment.png",
		}
	},

	["amethyst_geode"] = {
		label = "Amethyst Geode",
		weight = 250,
		stack = true,
		close = true,
		description = "A beautiful amethyst geode.",
		client = {
			image = "amethyst_geode.png",
		}
	},

	--tambahan engine jg-mechanic
	["r488sound"] = {
        label = "R488", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
    }, 

    ["k20a"] = {
        label = "K20a Type R", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
    }, 

    ["urusv8"] = {
        label = "Urus V8", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
    }, 

    ["m297zonda"] = {
        label = "M297 ZONDA", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
    }, 

    ["v8engine"] = {
        label = "Brabus 850", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
    }, 

    ["shonen"] = {
        label = "Shonen Engine", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
    }, 

    ["predatorv8"] = {
        label = "Predator v8", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
    }, 

    ["gt3flat6"] = {
        label = "GT3 Flat 6", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
    }, 

	["lambov10"] = {
		label = "Lambo v10", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["rotary7"] = {
		label = "Rotary 7", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["supra2jzgtett"] = {
		label = "Supra 2JZ GTE Twin Turbo", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["m158huayra"] = {
		label = "Huayra", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["viperv10"] = {
		label = "Viper V10", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["veyronsound"] = {
		label = "Veyron", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["perfov10"] = {
		label = "Perfo V10", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["sestov10"] = {
		label = "Sesto V10", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["mclarenv8"] = {
		label = "Mclaren V8", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["murciev12"] = {
		label = "Murcie V12", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["r35sound"] = {
		label = "GTR 35", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	},
	
	["musv8"] = {
		label = "Mustang V8", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["apollosv8"] = {
		label = "Apollos v8", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["avesvv12"] = {
		label = "Avesv V12", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["diablov12"] = {
		label = "Diablo V12", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["f40v8"] = {
		label = "F40 V8", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["f50v12"] = {
		label = "F50 V12", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["ferrarif12"] = {
		label = "Ferrari F12", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	}, 
	
	["gtaspanov10"] = {
		label = "Spano V10", 
		weight = 500,
		stack = false,
		close = true,
		description = ''
	},

	["i4_engine"] = {
		label = "I4 Engine",
		weight = 500,
		stack = true,
		close = true,
		description = "I4 Engine.",
		client = {
			image = "i4_engine.png",
		}
	},

	["engine_oil"] = {
		label = "Engine Oil",
		weight = 500,
		stack = true,
		close = true,
		description = "Engine Oil.",
		client = {
			image = "engine_oil.png",
		}
	},

	["shovel"] = {
		label = "Garden Shovel",
		weight = 500,
		stack = true,
		close = false,
		description = "Garden Shovel",
		client = {
			image = "shovel.png",
		}
	},

	["ruby_crystal"] = {
		label = "Ruby Crystal",
		weight = 250,
		stack = true,
		close = true,
		description = "A brilliant ruby crystal.",
		client = {
			image = "ruby_crystal.png",
		}
	},

	["tinyhat3"] = {
		label = "Tiny Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "tinyhat3.png",
		}
	},

	["cutted_onion"] = {
		label = "Cutted Onion",
		weight = 100,
		stack = true,
		close = true,
		description = "Cutted Onion",
		client = {
			image = "cutted_onion.png",
		}
	},

	["shoes"] = {
		label = "Shoes",
		weight = 0,
		stack = false,
		close = true,
		description = "A nice piece of clothing",
		client = {
			image = "shoes.png",
		}
	},

	["jerrycan"] = {
		label = "Jerrycan 20L",
		weight = 20000,
		stack = true,
		close = true,
		description = "A can full of Fuel",
		client = {
			image = "jerrycan.png",
		}
	},

	["plat_weapontint"] = {
		label = "Platinum Tint",
		weight = 1000,
		stack = true,
		close = true,
		description = "Platinum Weapon Tint",
		client = {
			image = "plat_attachment.png",
		}
	},

	["v12_engine"] = {
		label = "V12 Engine",
		weight = 500,
		stack = true,
		close = true,
		description = "V12 Engine.",
		client = {
			image = "v12_engine.png",
		}
	},

	["lighting_controller"] = {
		label = "Lighting Controller",
		weight = 500,
		stack = true,
		close = true,
		description = "Lighting Controller.",
		client = {
            event = "jg-mechanic:client:show-lighting-controller",
        }
	},

	["leash"] = {
		label = "Pet Leash",
		weight = 0,
		stack = true,
		close = false,
		description = "Handle your pet",
		client = {
			image = "leash.png",
		}
	},

	["firework3"] = {
		label = "WipeOut",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework3.png",
		}
	},

	["ceramic_brakes"] = {
		label = "Ceramic Brakes",
		weight = 500,
		stack = true,
		close = true,
		description = "Ceramic Brakes.",
		client = {
			image = "ceramic_brakes.png",
		}
	},

	["nitrous_install_kit"] = {
		label = "Nitrous Install Kit",
		weight = 500,
		stack = true,
		close = true,
		description = "Nitrous Install Kit.",
		client = {
			image = "nitrous_install_kit.png",
		}
	},

	["weed_skunk"] = {
		label = "Skunk 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Skunk",
		client = {
			image = "weed_baggy.png",
		}
	},

	["wateringcan"] = {
		label = "Watering Can",
		weight = 500,
		stack = true,
		close = false,
		description = "Watering Can",
		client = {
			image = "wateringcan.png",
		}
	},

	["antique_bottle"] = {
		label = "Antique bottle",
		weight = 10,
		stack = true,
		close = true,
		description = "Antique bottle",
		client = {
			image = "antique_bottle.png",
		}
	},

	["extras_kit"] = {
		label = "Extras Kit",
		weight = 500,
		stack = true,
		close = true,
		description = "Extras Kit.",
		client = {
			image = "extras_kit.png",
		}
	},

	["weed_ak47_seed"] = {
		label = "AK47 Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of AK47",
		client = {
			image = "weed_seed.png",
		}
	},

	["gold_monkey"] = {
		label = "Gold monkey",
		weight = 10,
		stack = true,
		close = true,
		description = "Gold monkey",
		client = {
			image = "gold_monkey.png",
		}
	},

	["pig_bait"] = {
		label = "Pig Bait (Low)",
		weight = 100,
		stack = true,
		close = true,
		description = "Pig Bait (Low)",
		client = {
			image = "pig_bait.png",
		}
	},

	["pig"] = {
		label = "Pigmeat",
		weight = 200,
		stack = true,
		close = false,
		description = "Some freshly slaughtered pig meat",
		client = {
			image = "pig.png",
		}
	},

	["cocaine_cut"] = {
		label = "Cut Cocaine",
		weight = 10,
		stack = true,
		close = true,
		description = "The powder of love, who would have thought it would be so addictive?",
		client = {
			image = "cocaine_cut.png",
		}
	},

	["nametag"] = {
		label = "Name Tag",
		weight = 0,
		stack = true,
		close = false,
		description = "Rename your pet",
		client = {
			image = "nametag.png",
		}
	},

	["unihorn7"] = {
		label = "Unicorn Horn",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "unihorn7.png",
		}
	},

	["weed_box"] = {
		label = "1Box Marijuana",
		weight = 200,
		stack = true,
		close = true,
		description = "1Box Marijuana",
		client = {
			image = "weed_box.png",
		}
	},

	["paramedicbag"] = {
		label = "paramedicbag",
		weight = 0,
		stack = false,
		close = true,
		description = "No have",
		client = {
			image = "paramedicbag.png",
		}
	},

	["turbocharger"] = {
		label = "Turbo",
		weight = 500,
		stack = true,
		close = true,
		description = "Turbo.",
		client = {
			image = "turbocharger.png",
		}
	},

	["gold_nugget"] = {
		label = "Gold Nugget",
		weight = 250,
		stack = true,
		close = true,
		description = "A small nugget of gold.",
		client = {
			image = "gold_nugget.png",
		}
	},

	["black_weapontint"] = {
		label = "Black Tint",
		weight = 1000,
		stack = true,
		close = true,
		description = "Default/Black Weapon Tint",
		client = {
			image = "black_attachment.png",
		}
	},

	["petbed"] = {
		label = "Pet Bed",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "petbed.png",
		}
	},

	["manual_gearbox"] = {
		label = "Manual Gearbox",
		weight = 500,
		stack = true,
		close = true,
		description = "Manual Gearbox.",
		client = {
			image = "manual_gearbox.png",
		}
	},

	["beer"] = {
		label = "Beer",
		weight = 500,
		stack = true,
		close = true,
		description = "Nothing like a good cold beer!",
		client = {
			image = "beer.png",
		}
	},

	["luxuryfinish_weapontint"] = {
		label = "Luxury Finish",
		weight = 1000,
		stack = true,
		close = true,
		description = "Luxury Finish Tint",
		client = {
			image = "luxuryfinish_attachment.png",
		}
	},

	["goldbar"] = {
		label = "Gold Bar",
		weight = 7000,
		stack = true,
		close = true,
		description = "Looks pretty expensive to me",
		client = {
			image = "goldbar.png",
		}
	},

	["pdbadge"] = {
        label = "PD Badge",
        weight = 150,
        stack = false,
        close = true,
        description = "Police Department Identification Badge",
        consume = 0, -- supaya nggak hilang setelah dipakai
    },

	["motelkey"] = {
		label = "Motel Key",
		weight = 100,
		stack = false,
		close = false,
		description = "Damn you lost your key again?",
		client = {
			image = "motelkey.png",
		}
	},

	["bodycam"] = {
		label = "Body Cam",
		weight = 500,
		stack = true,
		close = true,
		description = "Body Cam.",
		client = {
			event = "spy-bodycam:bodycamstatus",
		}
	},

	["pig_bait2"] = {
		label = "Pig Bait (High)",
		weight = 100,
		stack = true,
		close = true,
		description = "Pig Bait (High)",
		client = {
			image = "pig_bait2.png",
		}
	},

	["plastic"] = {
		label = "Plastic",
		weight = 100,
		stack = true,
		close = false,
		description = "RECYCLE! - Greta Thunberg 2019",
		client = {
			image = "plastic.png",
		}
	},

	["licensehunting"] = {
		label = "Hunting License",
		weight = 0,
		stack = false,
		close = true,
		description = "Hunting License",
		client = {
			image = "licensehunting.png",
		}
	},

	["blackbandana"] = {
		label = "Black Bandana",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "blackbandana.png",
		}
	},

	["green_phone"] = {
		label = "Green Phone",
		weight = 150,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "green_phone.png",
		}
	},

	["performance_part"] = {
		label = "Performance Part",
		weight = 500,
		stack = true,
		close = true,
		description = "Performance Part.",
		client = {
			image = "performance_part.png",
		}
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1000,
		stack = true,
		close = true,
		description = "A diamond seems like the jackpot to me!",
		client = {
			image = "diamond.png",
		}
	},

	["antipatharia_coral"] = {
		label = "Antipatharia",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as black corals or thorn corals",
		client = {
			image = "antipatharia_coral.png",
		}
	},

	["electronickit"] = {
		label = "Electronic Kit",
		weight = 100,
		stack = true,
		close = true,
		description = "If you've always wanted to build a robot you can maybe start here. Maybe you'll be the new Elon Musk?",
		client = {
			image = "electronickit.png",
		}
	},

	["bakingsoda"] = {
		label = "Baking Soda",
		weight = 1500,
		stack = true,
		close = false,
		description = "Household Baking Soda!",
		client = {
			image = "bakingsoda.png",
		}
	},

	["chicken_burger"] = {
		label = "Chicken Burger",
		weight = 100,
		stack = true,
		close = true,
		description = "Chicken Burger",
		client = {
			status = { hunger = 800000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Cheese Burger'
		},
	},

	["hat2"] = {
		label = "Pet Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "hat2.png",
		}
	},

	["finescale"] = {
		label = "Fine Scale",
		weight = 200,
		stack = true,
		close = false,
		description = "Scale Used for Fine Powders and Materials.",
		client = {
			image = "finescale.png",
		}
	},

	["hydrochloric_acid"] = {
		label = "Hydrochloric Acid",
		weight = 1500,
		stack = true,
		close = true,
		description = "Chemicals, handle with care!",
		client = {
			image = "hydrochloric_acid.png",
		}
	},

	["diving_gear"] = {
		label = "Diving Gear",
		weight = 30000,
		stack = false,
		close = true,
		description = "An oxygen tank and a rebreather",
		client = {
			image = "diving_gear.png",
		}
	},

	["wine"] = {
		label = "Wine",
		weight = 300,
		stack = true,
		close = false,
		description = "Some good wine to drink on a fine evening",
		client = {
			image = "wine.png",
		}
	},

	["revivekit"] = {
		label = "Pet Revive Kit",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "revivekit.png",
		}
	},

	["small_tv"] = {
		label = "Small TV",
		weight = 30000,
		stack = false,
		close = true,
		description = "TV",
		client = {
			image = "placeholder.png",
		}
	},

	["trojan_usb"] = {
		label = "Trojan USB",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems",
		client = {
			image = "usb_device.png",
		}
	},

	["deer_meat2"] = {
		label = "Deer Meat (High)",
		weight = 100,
		stack = true,
		close = true,
		description = "Deer Meat (High)",
		client = {
			image = "deer_meat2.png",
		}
	},

	["tradingcard_booster_pack"] = {
		label = "Card Booster Pack",
		weight = 50,
		stack = false,
		close = true,
		description = "Pack with random TCG cards",
		client = {
			image = "tradingcard_booster_pack.png",
		}
	},

	["brown_trout"] = {
		label = "Brown Trout",
		weight = 1300,
		stack = true,
		close = true,
		description = "Brown Trout",
		client = {
			image = "brown_trout.png",
		}
	},

	["emerald_crystal"] = {
		label = "Emerald Crystal",
		weight = 250,
		stack = true,
		close = true,
		description = "A radiant emerald crystal.",
		client = {
			image = "emerald_crystal.png",
		}
	},

	["cutted_chicken"] = {
		label = "Cutted chicken",
		weight = 100,
		stack = true,
		close = true,
		description = "Cutted chicken",
		client = {
			image = "cutted_chicken.png",
		}
	},

	["petbowl"] = {
		label = "Pet Feed Bowl",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "petbowl.png",
		}
	},

	["food_bag"] = {
		label = "Food Bag",
		weight = 100,
		stack = true,
		close = true,
		description = "Food Bag",
		client = {
			image = "food_bag.png",
		}
	},

	["cigarettebox"] = {
		label = "Cigarette Box",
		weight = 5,
		stack = false,
		close = true,
		description = "Open it, there will be 20 cigarettes inside",
		client = {
			image = "cigarettebox.png",
		}
	},

	["milkbottle"] = {
		label = "Milk Bottle",
		weight = 500,
		stack = true,
		close = false,
		description = "Bottle of Milk",
		client = {
			image = "burger-milk.png",
		}
	},

	["cabbage_seed"] = {
		label = "Cabbage Seed",
		weight = 200,
		stack = true,
		close = true,
		description = "A CABBAGE SEED",
		client = {
			image = "cabbage_seed.png",
		}
	},

	["tinyhat2"] = {
		label = "Tiny Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "tinyhat2.png",
		}
	},

	["duct_tape"] = {
		label = "Duct Tape",
		weight = 500,
		stack = true,
		close = true,
		description = "Duct Tape.",
		client = {
			event = "jg-mechanic:client:use-duct-tape",
		}
	},

	["army_weapontint"] = {
		label = "Army Tint",
		weight = 1000,
		stack = true,
		close = true,
		description = "Army Weapon Tint",
		client = {
			image = "army_attachment.png",
		}
	},

	["pink_weapontint"] = {
		label = "Pink Tint",
		weight = 1000,
		stack = true,
		close = true,
		description = "Pink Weapon Tint",
		client = {
			image = "pink_attachment.png",
		}
	},

	['id_card'] = {
        label = 'KTP',
    },

	-- ["id_card"] = {
	-- 	label = "ID Card",
	-- 	weight = 0,
	-- 	stack = false,
	-- 	close = false,
	-- 	description = "A card containing all your information to identify yourself",
	-- 	client = {
	-- 		image = "id_card.png",
	-- 	}
	-- },

	["ticket_ped"] = {
		label = "peds tickets",
		weight = 20,
		stack = true,
		close = true,
		description = "peds tickets",
		client = {
            export = 'deanix_smallresources.usetiketped'
        }
	},

	["mushroom"] = {
		label = "Mushroom",
		weight = 200,
		stack = true,
		close = false,
		description = "A MUSHROOM",
		client = {
			image = "mushroom.png",
		}
	},

	["oxy"] = {
		label = "Prescription Oxy",
		weight = 0,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off",
		client = {
			image = "oxy.png",
		}
	},

	["wheat"] = {
		label = "Wheat",
		weight = 200,
		stack = true,
		close = false,
		description = "Fresh from the grounds",
		client = {
			image = "wheat.png",
		}
	},

	["collar"] = {
		label = "Pet Collar",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "collar.png",
		}
	},

	["helmet"] = {
		label = "Helmet",
		weight = 0,
		stack = false,
		close = true,
		description = "A nice piece of clothing",
		client = {
			image = "helmet.png",
		}
	},

	["treatmentpills"] = {
		label = "Pet Treatment Pills",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "treatmentpills.png",
		}
	},

	["tyre_smoke_kit"] = {
		label = "Tyre Smoke Kit",
		weight = 500,
		stack = true,
		close = true,
		description = "Tyre Smoke Kit.",
		client = {
			image = "tyre_smoke_kit.png",
		}
	},

	["sessanta_weapontint"] = {
		label = "Sessanta Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Sessanta Camo Tint",
		client = {
			image = "sessantacamo_attachment.png",
		}
	},

	["pethealth"] = {
		label = "Pet Health",
		weight = 0,
		stack = false,
		close = false,
		description = "Pet Health",
		client = {
			image = "pethealth.png",
		}
	},

	["parkingticket"] = {
		label = "Ticket Parking",
		weight = 0,
		stack = false,
		close = true,
		description = "Ticket Parking.",
		client = {
			image = "stickynote.png",
		}
	},

	["tosti"] = {
		label = "Grilled Cheese Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat",
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	["unihorn8"] = {
		label = "Unicorn Horn",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "unihorn8.png",
		}
	},

	["firework1"] = {
		label = "2Brothers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework1.png",
		}
	},

	["rockfish"] = {
		label = "Rock Fish",
		weight = 8100,
		stack = true,
		close = true,
		description = "Rock Fish",
		client = {
			image = "rockfish.png",
		}
	},

	["buble_tea_orange"] = {
        label = "Buble Tea Orange",
        weight = 100,
        stack = true,
        close = true,
        description = "Buble Tea Orange",
        client = {
            status = { thirst = 800000 },
            anim = { dict = 'smo@milkshake_idle', clip = 'milkshake_idle_clip' },
			prop = { model = `brum_cherryshake_raspberry`, pos =  vec3(0.0850, 0.0670, -0.0350), rot = vec3(-115.0862, -165.7841, 24.1318),  bone = 28422, },
            usetime = 2500,
            cancel = true,
            notification = "You drank some refreshing Buble Tea Orange"
        }
    },
	["milkshake_strawberry"] = {
        label = "Milkshake Smoothie strawberry",
        weight = 100,
        stack = true,
        close = true,
        description = "Milkshake Smoothie strawberry",
        client = {
            status = { thirst = 800000 },
            anim = { dict = 'smo@milkshake_idle', clip = 'milkshake_idle_clip' },
			prop = { model = `brum_cherryshake_strawberry`, pos =  vec3(0.0850, 0.0670, -0.0350), rot = vec3(-115.0862, -165.7841, 24.1318),  bone = 28422, },
            usetime = 2500,
            cancel = true,
            notification = "You drank some refreshing Milkshake Smoothie strawberry"
        }
    },
	["squash_lemon"] = {
        label = "Squash Lemon",
        weight = 100,
        stack = true,
        close = true,
        description = "Squash Lemon",
        client = {
            status = { thirst = 800000 },
            anim = { dict = 'smo@milkshake_idle', clip = 'milkshake_idle_clip' },
			prop = { model = `brum_cherryshake_lemon`, pos =  vec3(0.0850, 0.0670, -0.0350), rot = vec3(-115.0862, -165.7841, 24.1318),  bone = 28422, },
            usetime = 2500,
            cancel = true,
            notification = "You drank some refreshing Squash Lemon"
        }
    },
	["spray_remover"] = {
		label = "Spray Remover",
		weight = 50,
		stack = true,
		close = true,
		description = "Spray Remover",
		client = {
			image = "spray_remover.png",
		}
	},

	["wet_weed"] = {
		label = "Moist Weed",
		weight = 3000,
		stack = true,
		close = false,
		description = "Wet weed that needs to be treated!",
		client = {
			image = "wet_weed.png",
		}
	},

	["stancing_kit"] = {
		label = "Stance Kit",
		weight = 500,
		stack = true,
		close = true,
		description = "Stance Kit.",
		client = {
			event = "jg-mechanic:client:show-stancer-kit",
		}
	},

	["petball"] = {
		label = "Pet Ball",
		weight = 0,
		stack = false,
		close = false,
		description = "Pet Ball",
		client = {
			image = "toys3.png",
		}
	},

	["phonehack"] = {
		label = "Phone Hack",
		weight = 400,
		stack = true,
		close = true,
		description = "Phone Hack.",
		client = {
			image = "phonehack.png",
		}
	},

	["petchain"] = {
		label = "Chain",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "petchain.png",
		}
	},

	["spray"] = {
		label = "Spray",
		weight = 50,
		stack = true,
		close = true,
		description = "Spray",
		client = {
			image = "spray.png",
		}
	},

	["treatmentkit"] = {
		label = "Pet Treatment Kit",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "treatmentkit.png",
		}
	},

	["black_phone"] = {
		label = "Black Phone",
		weight = 150,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "black_phone.png",
		}
	},

	["sunfish"] = {
		label = "Sun Fish",
		weight = 3600,
		stack = true,
		close = true,
		description = "Sun Fish",
		client = {
			image = "sunfish.png",
		}
	},

	["k9vest"] = {
		label = "K9 Vest",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "k9vest.png",
		}
	},

	["sulfuric_acid"] = {
		label = "Sulfuric Acid",
		weight = 1500,
		stack = true,
		close = false,
		description = "Chemicals, handle with care!",
		client = {
			image = "sulfuric_acid.png",
		}
	},

	["milk"] = {
		label = "Milk",
		weight = 100,
		stack = true,
		close = true,
		description = "Milk",
		client = {
			image = "milk.png",
		}
	},

	["geometric_weapontint"] = {
		label = "Geometric Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Geometric Camo Tint",
		client = {
			image = "geocamo_attachment.png",
		}
	},

	["firework2"] = {
		label = "Poppelers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework2.png",
		}
	},

	["petrope"] = {
		label = "Pet Rope",
		weight = 0,
		stack = false,
		close = false,
		description = "Pet Rope",
		client = {
			image = "toys2.png",
		}
	},

	["air_filter"] = {
		label = "Air Filter",
		weight = 500,
		stack = true,
		close = true,
		description = "Air Filter.",
		client = {
			image = "air_filter.png",
		}
	},

	["tea"] = {
		label = "Tea",
		weight = 100,
		stack = true,
		close = true,
		description = "Tea",
		client = {
			image = "tea.png",
		}
	},

	["orange"] = {
		label = "Orange",
		weight = 200,
		stack = true,
		close = false,
		description = "AN ORANGE",
		client = {
			image = "orange.png",
		}
	},

	["pig_meat"] = {
		label = "Pig Meat (Low)",
		weight = 100,
		stack = true,
		close = true,
		description = "Pig Meat (Low)",
		client = {
			image = "pig_meat.png",
		}
	},

	["purple_quartz"] = {
		label = "Purple Quartz",
		weight = 200,
		stack = true,
		close = true,
		description = "A piece of purple quartz.",
		client = {
			image = "purple_quartz.png",
		}
	},

	["tradingcard_legendary"] = {
		label = "Card Legendary",
		weight = 10,
		stack = false,
		close = true,
		description = "A card of peculiar rarity, I would say legendary!",
		client = {
			image = "tradingcard_legendary.png",
		}
	},

	["repair_kit"] = {
		label = "Vehicle Repair Kit",
		weight = 500,
		stack = true,
		close = true,
		description = "Vehicle Repair Kit.",
		client = {
			event = "jg-mechanic:client:repair-vehicle",
		}
	},

	["deer_bait"] = {
		label = "Deer Bait (Low)",
		weight = 100,
		stack = true,
		close = true,
		description = "Deer Bait (Low)",
		client = {
			image = "deer_bait.png",
		}
	},

	["chain"] = {
		label = "Chain",
		weight = 100,
		stack = false,
		close = false,
		description = "It is very fragile, watch out",
		client = {
			image = "goldchain.png",
		}
	},

	["dashcam"] = {
		label = "Dash Cam",
		weight = 500,
		stack = true,
		close = true,
		description = "Dash Cam.",
		client = {
			event = "spy-bodycam:toggleCarCam",
		}
	},

	["tyre_replacement"] = {
		label = "Tyre Replacement",
		weight = 500,
		stack = true,
		close = true,
		description = "Tyre Replacement.",
		client = {
			image = "tyre_replacement.png",
		}
	},

	["drill"] = {
		label = "Drill",
		weight = 20000,
		stack = true,
		close = false,
		description = "The real deal...",
		client = {
			image = "drill.png",
		}
	},

	["graphite_chunk"] = {
		label = "Graphite Chunk",
		weight = 200,
		stack = true,
		close = true,
		description = "A chunk of graphite.",
		client = {
			image = "graphite_chunk.png",
		}
	},

	["bracelets"] = {
		label = "Bracelets",
		weight = 100,
		stack = false,
		close = false,
		description = "It is very fragile, watch out",
		client = {
			image = "bracelets.png",
		}
	},

	["cow"] = {
		label = "Cowmeat",
		weight = 200,
		stack = true,
		close = false,
		description = "Some freshly slaughtered beef",
		client = {
			image = "cowmeat.png",
		}
	},

	["weed_white-widow"] = {
		label = "White Widow 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed_baggy.png",
		}
	},

	["tinyhat8"] = {
		label = "Tiny Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "tinyhat8.png",
		}
	},

	["empty_weed_bag"] = {
		label = "Empty Weed Bag",
		weight = 0,
		stack = true,
		close = true,
		description = "A small empty bag",
		client = {
			image = "weed_baggy_empty.png",
		}
	},

	["tinyhat6"] = {
		label = "Tiny Hat",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "tinyhat6.png",
		}
	},

	["ears"] = {
		label = "Ears",
		weight = 0,
		stack = false,
		close = true,
		description = "A nice piece of clothing",
		client = {
			image = "ears.png",
		}
	},

	['water_bottle'] = {
		label = 'Bottle of Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},
	['ecola'] = {
		label = 'Cola',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing Cola'
		}
	},

	["garbage_tablet"] = {
		label = "Garbage Tablet",
		weight = 500,
		stack = true,
		close = true,
		description = "Garbage Tablet",
		client = {
			image = "garbage_tablet.png",
		}
	},

	["weed_amnesia_seed"] = {
		label = "Amnesia Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Amnesia",
		client = {
			image = "weed_seed.png",
		}
	},

	["cutted_bun"] = {
		label = "Cutted Bun",
		weight = 100,
		stack = true,
		close = true,
		description = "Cutted Bun",
		client = {
			image = "cutted_bun.png",
		}
	},

	["axe"] = {
		label = "Axe",
		weight = 400,
		stack = true,
		close = true,
		description = "Axe.",
		client = {
			image = "axe.png",
		}
	},

	["van_gogh"] = {
		label = "Van gogh",
		weight = 10,
		stack = true,
		close = true,
		description = "Van gogh",
		client = {
			image = "van_gogh.png",
		}
	},

	["poppyresin"] = {
		label = "Poppy resin",
		weight = 2000,
		stack = true,
		close = false,
		description = "It sticks to your fingers when you handle it.",
		client = {
			image = "poppyresin.png",
		}
	},

	["weed_og-kush"] = {
		label = "OGKush 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush",
		client = {
			image = "weed_baggy.png",
		}
	},

	["heroin_box"] = {
		label = "1Box Heroin",
		weight = 200,
		stack = true,
		close = true,
		description = "1Box Heroin",
		client = {
			image = "heroin_box.png",
		}
	},

	["petdeer"] = {
		label = "Deer Horn",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "petdeer.png",
		}
	},

	["backpack2"] = {
		label = "backpack2",
		weight = 0,
		stack = false,
		close = true,
		description = "No have",
		client = {
			image = "bag-bag.png",
		}
	},

	["ruby_diamond"] = {
		label = "Ruby diamond",
		weight = 10,
		stack = true,
		close = true,
		description = "Ruby diamond",
		client = {
			image = "ruby_diamond.png",
		}
	},

	["dendrogyra_coral"] = {
		label = "Dendrogyra",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as pillar coral",
		client = {
			image = "dendrogyra_coral.png",
		}
	},

	["diving_fill"] = {
		label = "Diving Tube",
		weight = 3000,
		stack = false,
		close = true,
		description = "An oxygen tube and a rebreather",
		client = {
			image = "diving_fill.png",
		}
	},

	["weedkey"] = {
		label = "Key C",
		weight = 200,
		stack = true,
		close = false,
		description = "Random Key, with a \"Seed\" Engraved on the Back...",
		client = {
			image = "keyc.png",
		}
	},

	["boom_weapontint"] = {
		label = "Boom! Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Boom! Camo Tint",
		client = {
			image = "boomcamo_attachment.png",
		}
	},

	["cutted_orange"] = {
		label = "Cutted Orange",
		weight = 100,
		stack = true,
		close = true,
		description = "Cutted Orange",
		client = {
			image = "cutted_orange.png",
		}
	},

	["perseus_weapontint"] = {
		label = "Perseus Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Perseus Camo Tint",
		client = {
			image = "perseuscamo_attachment.png",
		}
	},

	["security_card_01"] = {
		label = "Security Card A",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_01.png",
		}
	},

	["rubber"] = {
		label = "Rubber",
		weight = 100,
		stack = true,
		close = false,
		description = "Rubber, I believe you can make your own rubber ducky with it :D",
		client = {
			image = "rubber.png",
		}
	},

	["papan_kayu"] = {
		label = "Wood Planks",
		weight = 400,
		stack = true,
		close = true,
		description = "Wood Planks.",
		client = {
			image = "papan_kayu.png",
		}
	},

	["rolling_paper"] = {
		label = "Rolling Paper",
		weight = 0,
		stack = true,
		close = true,
		description = "Paper made specifically for encasing and smoking tobacco or cannabis.",
		client = {
			image = "rolling_paper.png",
		}
	},

	["platinum_bar"] = {
		label = "Platinum bar",
		weight = 10,
		stack = true,
		close = true,
		description = "Platinum bar",
		client = {
			image = "platinum_bar.png",
		}
	},

	["unihorn3"] = {
		label = "Unicorn Horn",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "unihorn3.png",
		}
	},

	["pig_meat2"] = {
		label = "Pig Meat (High)",
		weight = 100,
		stack = true,
		close = true,
		description = "Pig Meat (High)",
		client = {
			image = "pig_meat2.png",
		}
	},

	["aluminum"] = {
		label = "Aluminium",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "aluminum.png",
		}
	},

	["documents"] = {
		label = "documents",
		weight = 1,
		stack = false,
		close = true,
		description = "Documenti.",
		client = {
			event = "k5_documents:useItem",
		}
	},

	["unihorn5"] = {
		label = "Unicorn Horn",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "unihorn5.png",
		}
	},

	["surgical_tray"] = {
		label = "Surgical tray",
		weight = 500,
		stack = true,
		close = true,
		description = "A Surgical tray works every time",
		client = {
			image = "surgical_tray.png",
		}
	},

	["brushstroke_weapontint"] = {
		label = "Brushstroke Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Brushstroke Camo Tint",
		client = {
			image = "brushcamo_attachment.png",
		}
	},

	["tradingcard_stash"] = {
		label = "Card Book",
		weight = 50,
		stack = false,
		close = true,
		description = "Album for collectible cards!",
		client = {
			image = "tradingcard_stash.png",
		}
	},

	["delivery_tablet"] = {
		label = "Delivery Tablet",
		weight = 500,
		stack = true,
		close = true,
		description = "Delivery Tablet",
		client = {
			image = "delivery_tablet.png",
		}
	},

	["pinger"] = {
		label = "Pinger",
		weight = 1000,
		stack = true,
		close = true,
		description = "With a pinger and your phone you can send out your location",
		client = {
			image = "pinger.png",
		}
	},

	["raker"] = {
		label = "Raker",
		weight = 500,
		stack = true,
		close = false,
		description = "Raker",
		client = {
			image = "raker.png",
		}
	},

	["usb_stick"] = {
		label = "USB stick",
		weight = 10,
		stack = true,
		close = true,
		description = "USB stick",
		client = {
			image = "usb_stick.png",
		}
	},

	["package_money"] = {
		label = "Packaged Money",
		weight = 10,
		stack = true,
		close = true,
		description = "Oh shit brother, that's hard, very hard.",
		client = {
			image = "package_money.png",
		}
	},

	["weed_purple-haze"] = {
		label = "Purple Haze 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Purple Haze",
		client = {
			image = "weed_baggy.png",
		}
	},

	["surgical_gloves"] = {
		label = "Surgical gloves",
		weight = 500,
		stack = true,
		close = true,
		description = "A Surgical gloves works every time",
		client = {
			image = "surgical_gloves.png",
		}
	},

	["binoculars"] = {
		label = "Binoculars",
		weight = 600,
		stack = true,
		close = true,
		description = "Sneaky Breaky...",
		client = {
			image = "binoculars.png",
		}
	},

	["gatecrack"] = {
		label = "Gatecrack",
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to tear down some fences",
		client = {
			image = "usb_device.png",
		}
	},

	["weed_amnesia"] = {
		label = "Amnesia 2g",
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Amnesia",
		client = {
			image = "weed_baggy.png",
		}
	},

	["arms"] = {
		label = "Arms",
		weight = 0,
		stack = false,
		close = true,
		description = "A nice piece of clothing",
		client = {
			image = "arms.png",
		}
	},

	["unihorn2"] = {
		label = "Unicorn Horn",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "unihorn2.png",
		}
	},

	["cabbage"] = {
		label = "Cabbage",
		weight = 200,
		stack = true,
		close = false,
		description = "A CABBAGE",
		client = {
			image = "cabbage.png",
		}
	},

	["cutted_cucumber"] = {
		label = "Cutted Cucumbar",
		weight = 100,
		stack = true,
		close = true,
		description = "Cutted Cucumbar",
		client = {
			image = "cutted_cucumber.png",
		}
	},

	["weed_skunk_seed"] = {
		label = "Skunk Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Skunk",
		client = {
			image = "weed_seed.png",
		}
	},

	["labkey"] = {
		label = "Key",
		weight = 500,
		stack = false,
		close = true,
		description = "Key for a lock...?",
		client = {
			image = "labkey.png",
		}
	},

	["steel"] = {
		label = "Steel",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "steel.png",
		}
	},

	["kulit_kayu"] = {
		label = "Tree bark",
		weight = 400,
		stack = true,
		close = true,
		description = "Tree bark.",
		client = {
			image = "kulit_kayu.png",
		}
	},

	["tradingcard_psa"] = {
		label = "Card Psa",
		weight = 50,
		stack = false,
		close = true,
		description = "Letter verified with PSA, lets wait for your qualification!",
		client = {
			image = "tradingcard_psa.png",
		}
	},

	["torso"] = {
		label = "Torso",
		weight = 0,
		stack = false,
		close = true,
		description = "A nice piece of clothing",
		client = {
			image = "torso.png",
		}
	},

	["vodka"] = {
		label = "Vodka",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "vodka.png",
		}
	},

	["radioscanner"] = {
		label = "Radio Scanner",
		weight = 1000,
		stack = true,
		close = true,
		description = "With this you can get some police alerts. Not 100% effective however",
		client = {
			image = "radioscanner.png",
		}
	},

	["skull_weapontint"] = {
		label = "Skull Camo",
		weight = 1000,
		stack = true,
		close = true,
		description = "Skull Camo Tint",
		client = {
			image = "skullcamo_attachment.png",
		}
	},

	["weed_purple-haze_seed"] = {
		label = "Purple Haze Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Purple Haze",
		client = {
			image = "weed_seed.png",
		}
	},

	["driver_license"] = {
		label = "Sim A",
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle",
		client = {
			image = "driver_license.png",
		}
	},
	["driver_licenseb"] = {
		label = "Sim B",
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle",
		client = {
			image = "driver_license.png",
		}
	},
	["driver_licensec"] = {
		label = "Sim c",
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle",
		client = {
			image = "driver_license.png",
		}
	},

	["stickleback"] = {
		label = "Stick Leback",
		weight = 2500,
		stack = true,
		close = true,
		description = "Stick Leback",
		client = {
			image = "stickleback.png",
		}
	},

	["kurkakola"] = {
		label = "Cola",
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	["tshirt"] = {
		label = "T-shirt",
		weight = 0,
		stack = false,
		close = true,
		description = "A nice piece of clothing",
		client = {
			image = "tshirt.png",
		}
	},

	["printerdocument"] = {
		label = "Document",
		weight = 500,
		stack = false,
		close = true,
		description = "A nice document",
		client = {
			image = "printerdocument.png",
		}
	},

	["lighter"] = {
		label = "Lighter",
		weight = 0,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to",
		client = {
			image = "lighter.png",
		}
	},

	["crack_baggy"] = {
		label = "Bag of Crack",
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy faster",
		client = {
			image = "crack_baggy.png",
		}
	},

	["rose"] = {
		label = "Rose",
		weight = 0,
		stack = true,
		close = false,
		description = "Rose for pet",
		client = {
			image = "rose.png",
		}
	},

	["emas"] = {
		label = "Gold",
		weight = 200,
		stack = true,
		close = true,
		description = "Gold metal resulting from smelting.",
		client = {
			image = "emas.png",
		}
	},

	["jacksmelt"] = {
		label = "jack Smelt",
		weight = 1200,
		stack = true,
		close = true,
		description = "jack Smelt",
		client = {
			image = "jacksmelt.png",
		}
	},

	["xtcbaggy"] = {
		label = "Bag of XTC",
		weight = 0,
		stack = true,
		close = true,
		description = "Pop those pills baby",
		client = {
			image = "xtcbaggy.png",
		}
	},

	["yellow_phone"] = {
		label = "Yellow Phone",
		weight = 150,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "yellow_phone.png",
		}
	},

	["vehicle_wheels"] = {
		label = "Vehicle Wheels Set",
		weight = 500,
		stack = true,
		close = true,
		description = "Vehicle Wheels Set.",
		client = {
			image = "vehicle_wheels.png",
		}
	},

	["iphone"] = {
		label = "iPhone",
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "iphone.png",
		}
	},

	["coffee"] = {
		label = "Coffee",
		weight = 200,
		stack = true,
		close = true,
		description = "Pump 4 Caffeine",
		client = {
			image = "coffee.png",
		}
	},

	["white_phone"] = {
		label = "White Phone",
		weight = 150,
		stack = false,
		close = true,
		description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?",
		client = {
			image = "white_phone.png",
		}
	},

	["cleaning_kit"] = {
		label = "Cleaning Kit",
		weight = 500,
		stack = true,
		close = true,
		description = "Cleaning Kit.",
		client = {
			event = "jg-mechanic:client:clean-vehicle",
		}
	},

	["deer_meat"] = {
		label = "Deer Meat (Low)",
		weight = 100,
		stack = true,
		close = true,
		description = "Deer Meat (Low)",
		client = {
			image = "deer_meat.png",
		}
	},

	["cutted_meat"] = {
		label = "Cutted Meat",
		weight = 100,
		stack = true,
		close = true,
		description = "Cutted Meat",
		client = {
			image = "cutted_meat.png",
		}
	},

	["diamond_necklace"] = {
		label = "Diamond necklace",
		weight = 10,
		stack = true,
		close = true,
		description = "Diamond necklace",
		client = {
			image = "diamond_necklace.png",
		}
	},

	["powerbank"] = {
		label = "Power Bank",
		weight = 50,
		stack = true,
		close = false,
		description = "Portable charger for high-end phones",
		client = {
			image = "powerbank.png",
		}
	},

	["goverment_bodycam"] = {
		label = "Goverment issued bodycam",
		weight = 1,
		stack = false,
		close = true,
		server = { export = 'bbs_bodycam.GovermentCam' }, consume = 0, allowArmed = true,
	},

	["commercial_bodycam"] = {
		label = "Commercial bodycam",
		weight = 1,
		stack = false,
		close = true,
		server = { export = 'bbs_bodycam.CommercialCam' }, consume = 0, allowArmed = true,
	},

	["cleaningkit"] = {
        label = "Cleaning Kit",
        weight = 250,
        stack = true,
        close = true,
        description = "A microfiber cloth with some soap will let your car sparkle again!",
        client = {
            image = "cleaningkit.png",
        },
        server = {
            export = 'vehiclehandler.cleaningkit'
        }
    },

    ["tirekit"] = {
        label = "Tire Kit",
        weight = 250,
        stack = true,
        close = true,
        description = "A nice toolbox with stuff to repair your tire",
        client = {
            image = "tirekit.png",
        },
        server = {
            export = 'vehiclehandler.tirekit'
        }
    },

    ["repairkit"] = {
        label = "Repairkit",
        weight = 2500,
        stack = true,
        close = true,
        description = "A nice toolbox with stuff to repair your vehicle",
        client = {
            image = "repairkit.png",
        },
        server = {
            export = 'vehiclehandler.repairkit',
        }
    },

    ["advancedrepairkit"] = {
        label = "Advanced Repairkit",
        weight = 5000,
        stack = true,
        close = true,
        description = "A nice toolbox with stuff to repair your vehicle",
        client = {
            image = "advancedrepairkit.png",
        },
        server = {
            export = 'vehiclehandler.advancedrepairkit',
        }
    },

    ["keybag"] = {
	    label = "Key Bag",
	    description = 'This is a key bag, you can store all your keys in it',
	    weight = 10,
	    stack = false
    },
	["megaphone"] = {
        label = "Megaphone",
        weight = 500,
        stack = false,
        close = true,
        description = "A usable megaphone"
    },
	['bag'] = {
		label = 'Tas Biasa',
		weight = 1000,
		stack = false,
		close = false,
		consume = 0
	},
	['bag2'] = {
		label = 'Tas Standart',
		weight = 1500,
		stack = false,
		close = false,
		consume = 0,
		client = {
			image = 'bag.png',
		}
	},
	['billing_tablet'] = {
        label = 'Billing Tablet',
        weight = 1000,
        stack = false,
        close = true,
        description = 'Used to issue and manage bills',
        client = {
 	        event = 'peleg-billing:client:invOpen'
 	    }
    },
	['rental_papers'] = {
        label = 'Rental Papers',
        weight = 50,
    },

	--tukang ayam
	['ayam'] = {
        label = 'Ayam',
        weight = 50,
    },
	['ayam_bersih'] = {
        label = 'Ayam Bersih',
        weight = 50,
    },
	['ayam_potong'] = {
        label = 'Ayam Potong',
        weight = 50,
    },
	['ayam_packing'] = {
        label = 'Ayam Paking',
        weight = 50,
    },
	['mdt_tablet'] = {
        label = 'Mdt Tablet',
        weight = 50,
    },

	--penjahit
	['kapas'] = {
        label = '50Kg Kapas',
        weight = 5000,
    },
	['benang'] = {
        label = '50 Gulung Benang',
        weight = 5000,
    },
	['kain'] = {
        label = '50 Meter Kain',
        weight = 5000,
    },
	['baju'] = {
        label = 'Baju',
        weight = 50,
    },
}