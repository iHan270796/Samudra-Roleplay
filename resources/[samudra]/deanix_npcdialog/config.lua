Config = {}

Config.Peds = {
    [1] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(73.831787, -1392.7, 28.376136, 277.04415),
        ["cam"] = vector4(74.872558, -1392.471, 29.874402, 92.32135), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                --["argument"] = "clothing",
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [2] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-708.8869, -151.7084, 36.415157, 112.55922),
        ["cam"] = vector4(-709.85, -152.4008, 37.845729, 300.95584), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [3] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-1194.551, -767.4291, 16.316188, 214.22518),
        ["cam"] = vector4(-1193.935, -768.4427, 17.816808, 36.585895), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [4] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-822.7662, -1072.156, 10.328105, 208.61535),
        ["cam"] = vector4(-822.2301, -1073.014, 11.873332, 31.267631), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [5] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(426.98831, -806.5037, 28.491153, 88.876358),
        ["cam"] = vector4(425.97729, -806.6006, 29.900154, 269.7893), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [6] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-164.9866, -302.9776, 38.733276, 248.60443),
        ["cam"] = vector4(-163.8953, -303.1748, 40.094676, 74.902046), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [7] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-1448.995, -238.1443, 48.813446, 44.772937),
        ["cam"] = vector4(-1449.776, -237.5166, 50.120895, 232.02082), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [8] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(127.21329, -223.4624, 53.557811, 68.288764),
        ["cam"] = vector4(126.27536, -223.3124, 55.116981, 250.48123), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [9] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(1211.3731, -470.8738, 65.208068, 72.931076),
        ["cam"] = vector4(1210.3597, -470.5536, 66.593284, 254.82261), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Barber Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hey, do you want me to give you a makeover? Trust me, I've been working here for 20 years, so I'll take care of everything for you.", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "I want to change my style", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenBarberShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Nvm, all is good", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [10] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-30.97011, -151.5934, 56.076522, 336.47329),
        ["cam"] = vector4(-30.57501, -150.3951, 57.40493, 161.66781), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Barber Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hey, do you want me to give you a makeover? Trust me, I've been working here for 20 years, so I'll take care of everything for you.", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "I want to change my style", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenBarberShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Nvm, all is good", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [11] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-822.5413, -183.7705, 36.568954, 205.33229),
        ["cam"] = vector4(-822.0149, -184.4744, 38.046318, 29.996673), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Barber Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hey, do you want me to give you a makeover? Trust me, I've been working here for 20 years, so I'll take care of everything for you.", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "I want to change my style", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenBarberShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Nvm, all is good", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [12] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-1284.267, -1115.583, 5.9901189, 87.857849),
        ["cam"] = vector4(-1285.441, -1115.582, 7.371499, 268.25213), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Barber Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hey, do you want me to give you a makeover? Trust me, I've been working here for 20 years, so I'll take care of everything for you.", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "I want to change my style", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenBarberShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Nvm, all is good", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [13] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(134.75442, -1708.134, 28.291595, 135.64788),
        ["cam"] = vector4(134.03141, -1708.987, 29.666297, 320.13534), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Barber Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hey, do you want me to give you a makeover? Trust me, I've been working here for 20 years, so I'll take care of everything for you.", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "I want to change my style", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenBarberShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Nvm, all is good", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [14] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(1931.0506, 3728.2009, 31.844474, 208.01255),
        ["cam"] = vector4(1931.5362, 3727.2888, 33.343334, 29.508123), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Barber Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hey, do you want me to give you a makeover? Trust me, I've been working here for 20 years, so I'll take care of everything for you.", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "I want to change my style", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenBarberShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Nvm, all is good", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [15] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-278.1289, 6230.35, 30.695507, 46.026882),
        ["cam"] = vector4(-278.7981, 6231.0102, 32.119041, 222.89852), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Barber Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hey, do you want me to give you a makeover? Trust me, I've been working here for 20 years, so I'll take care of everything for you.", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "I want to change my style", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenBarberShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Nvm, all is good", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },

    --tattoshop
    [16] = {
        ["model"] = "u_m_y_tattoo_01",
        ["coords"] = vector4(319.77, 180.76, 102.60, 252.64),
        ["cam"] = vector4(321.08, 180.49, 103.80, 73.0), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Tukang", 
            ["lastname"] = "Tatto",
        },
        ["title"] = "Tatto Shop", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Making Tattoos", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenTattooShop", -- Event name
                ---["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ---["argument"] = "tattoo",
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "No Thank You", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },

    [17] = {
        ["model"] = "u_m_y_tattoo_01",
        ["coords"] = vector4(-1152.25, -1423.72, 3.95, 127.99),
        ["cam"] = vector4(-1153.28, -1424.58, 5.30, 298.39), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(79.030975, -1387.765, 28.376119),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Tukang", 
            ["lastname"] = "Tatto",
        },
        ["title"] = "Tatto Shop", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Making Tattooso", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenTattooShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "No Thank You", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    --baju police
    [18] = {
        ["model"] = "s_m_y_cop_01",
        ["coords"] = vector4(459.3, -995.61, 29.69, 177.79),
        ["cam"] = vector4(459.3, -996.11, 31.40, 357.25), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(458.44, -999.79, 30.69),
        ["interactive"] = {
            ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            --["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 2, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Police", 
            ["lastname"] = "",
        },
        ["title"] = "Police", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Toko Pakaian", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = nil, -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Pakaian Dinas", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenClothingRoom", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = 0, -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    --baju mechanic
    [19] = {
        ["model"] = "s_m_m_gaffer_01",
        ["coords"] = vector4(28.14, 6522.76, 30.73, 319.64),
        ["cam"] = vector4(28.55, 6523.22, 32.33, 135.42), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(28.55, 6523.22, 31.73),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Mechanic", 
            ["lastname"] = "",
        },
        ["title"] = "Mechanic", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Toko Pakaian", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = nil, -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Pakaian Dinas", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenClothingRoom", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = 0, -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
 -- rental dan starterpack cowo
    [20] = {
        ["model"] = "a_m_y_gencaspat_01",
        ["coords"] = vector4(-1889.05, 5267.49, 6.11, 228.02),
        ["cam"] = vector4(-1888.67, 5267.16, 7.78, 43.44), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(-1888.67, 5267.16, 7.88),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Claim", 
            ["lastname"] = "Starterpack",
        },
        ["title"] = "Starterpack", -- the text you want to appear maybe character task etc.
        ["question"] = "Halo Pak Ada Yang Bisa Saya Bantu", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Claim Starterpack", -- The answer to the option will appear in the person
                ["event"] = "rst-starterpack:client:claimStarterpack", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = 0, -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Claim Starterpack2", -- The answer to the option will appear in the person
                ["event"] = "rst-starterpack:client:chooseVehicleMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = 0, -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option3"] = {
                ["button"] = 3, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Rental Vehicle", -- The answer to the option will appear in the person
                ["event"] = "rental:kendaraan", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "car_rental1", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option4"] = {
                ["button"] = 4, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Tidak, Terimakasih", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },

    --rental dan starterpack cewe
    [21] = {
        ["model"] = "a_f_y_femaleagent",
        ["coords"] = vector4(-1880.73, 5274.74, 6.11, 223.5),
        ["cam"] = vector4(-1880.31, 5274.35, 7.75, 44.03), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(-1880.31, 5274.35, 7.85),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Claim", 
            ["lastname"] = "Starterpack",
        },
        ["title"] = "Starterpack", -- the text you want to appear maybe character task etc.
        ["question"] = "Halo Bu Ada Yang Bisa Saya Bantu", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Claim Starterpack", -- The answer to the option will appear in the person
                ["event"] = "rst-starterpack:client:claimStarterpack", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = 1, -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Claim Starterpack2", -- The answer to the option will appear in the person
                ["event"] = "rst-starterpack:client:chooseVehicleMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = 1, -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option3"] = {
                ["button"] = 3, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Rental Vehicle", -- The answer to the option will appear in the person
                ["event"] = "rental:kendaraan", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "car_rental1", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option4"] = {
                ["button"] = 4, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Tidak, Terimakasih", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [22] = {
        ["model"] = "u_m_y_tattoo_01",
        ["coords"] = vector4(1324.49, -1650.12, 51.28, 130.76),
        ["cam"] = vector4(1323.54, -1651.07, 53.0, 310.06), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(1324.49, -1650.12, 52.28),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Tattos", 
            ["lastname"] = "Shops",
        },
        ["title"] = "Tattos Shops", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Make a Tattos", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenTattooShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "No, thank you", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },

    [23] = {
        ["model"] = "u_m_y_tattoo_01",
        ["coords"] = vector4(-3170.47, 1073.07, 19.83, 336.64),
        ["cam"] = vector4(-3170.08, 1074.29, 21.40, 164.65), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(-3170.08, 1074.29, 20.83),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Tattos", 
            ["lastname"] = "Shops",
        },
        ["title"] = "Tattos Shops", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Make a Tattos", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenTattooShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "No, Thank You", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [24] = {
        ["model"] = "ig_barry",
        ["coords"] = vector4(1779.44, 3645.47, 34.63, 213.77),
        ["cam"] = vector4(1779.82, 3644.97, 36.33, 35.35), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(1779.82, 3644.97, 35.63),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 1, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Sell", 
            ["lastname"] = "Items",
        },
        ["title"] = "Jual Barang", -- the text you want to appear maybe character task etc.
        ["question"] = "Ada Yang Bisa Saya Bantu", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Jual Barang", -- The answer to the option will appear in the person
                ["event"] = "jualbarang:hasilkerja", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Tidak, Terima Kasih", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },

    --tatto
    [25] = {
        ["model"] = "u_m_y_tattoo_01",
        ["coords"] = vector4(1862.47, 3748.43, 32.03, 35.03),
        ["cam"] = vector4(1861.71, 3749.49, 33.53, 205.73), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(1862.47, 3748.43, 33.03),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Tattos", 
            ["lastname"] = "Shops",
        },
        ["title"] = "Tattos Shops", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Make a Tattos", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:OpenTattooShop", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "No, Thank You", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [26] = {
        ["model"] = "ig_barry",
        ["coords"] = vector4(1230.76, -2911.26, 8.32, 84.97),
        ["cam"] = vector4(1230.24, -2911.28, 10.05, 270.47), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(1230.76, -2911.26, 9.32),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 1, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Sell", 
            ["lastname"] = "Items",
        },
        ["title"] = "Sell Items", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Sell Items", -- The answer to the option will appear in the person
                ["event"] = "jualbarang:Haram", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "No Thank You", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [27] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(613.01, 2762.77, 41.09, 271.52),
        ["cam"] = vector4(614.24, 2762.82, 42.50, 91.74), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(613.01, 2762.77, 41.09),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [28] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(1196.74, 2711.63, 37.22, 173.81),
        ["cam"] = vector4(1196.83, 2710.26, 38.70, 358.52), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(1196.74, 2711.63, 37.22),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [29] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(5.75, 6511.4, 30.88, 41.17),
        ["cam"] = vector4(4.8, 6512.36, 32.25, 222.2), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(5.75, 6511.4, 30.88),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [30] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-1102.4, 2711.61, 18.11, 222.42),
        ["cam"] = vector4(-1101.38, 2710.6, 19.60, 39.48), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(-1101.38, 2710.6, 19.11),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [31] = {
        ["model"] = "a_f_m_eastsa_01",
        ["coords"] = vector4(-3169.43, 1043.27, 19.86, 65.84),
        ["cam"] = vector4(-3170.56, 1043.69, 21.25, 248.7), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(-3170.56, 1043.69, 21.15),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Candy", 
            ["lastname"] = "Miller",
        },
        ["title"] = "Clothing Store", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Clothing Menu", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:openClothingShopMenu", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Wardrobe Access", -- The answer to the option will appear in the person
                ["event"] = "illenium-appearance:client:changeOutfit", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },

    [32] = {
        ["model"] = "ig_barry",
        ["coords"] = vector4(-3412.27, 960.92, 7.35, 273.38),
        ["cam"] = vector4(-3411.59, 960.88, 9.0, 89.61), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(-3411.59, 960.88, 9.35),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 1, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Sell", 
            ["lastname"] = "Items",
        },
        ["title"] = "Sell Items", -- the text you want to appear maybe character task etc.
        ["question"] = "Hello. Is There Anything You Can Help With", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Sell Items", -- The answer to the option will appear in the person
                ["event"] = "jualbarang:HasilMancing", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "No, Thank You", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
    [33] = {
        ["model"] = "a_m_y_gencaspat_01",
        ["coords"] = vector4(-785.43, -1347.5, 4.15, 294.06),
        ["cam"] = vector4(-784.89, -1347.31, 5.85, 110.59), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(-785.43, -1347.5, 5.15),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Rental", 
            ["lastname"] = "Kendaraan",
        },
        ["title"] = "Rental Kendaraan", -- the text you want to appear maybe character task etc.
        ["question"] = "Halo Pak Ada Yang Bisa Saya Bantu", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Rental Vehicle", -- The answer to the option will appear in the person
                ["event"] = "rental:kendaraan", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = "car_rental2", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Tidak Terimakasih", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },

    --tukangayam
    [34] = {
        ["model"] = "a_m_y_gencaspat_01",
        ["coords"] = vector4(2386.41, 5033.77, 45.0, 311.21),
        ["cam"] = vector4(2386.74, 5034.16, 46.83, 139.1), -- If the camera angle doesn't look right, give the heading a full negative value, e.g. -93.0 instead of 93.0. If this doesn't work, enter the heading value of the direction your pad is facing the npc!
        ["markerCoord"] = vector3(2386.74, 5034.16, 46.83),
        ["interactive"] = {
            -- ["type"] = "target", -- or fivem keys https://docs.fivem.net/docs/game-references/controls/
            ["type"] = 38, -- https://docs.fivem.net/docs/game-references/controls/

            ["key_label"] = "e", -- If type fivem is converted to index key, the name of the key must be entered "E"
            ["text"] = "Talk to npc", -- Text that will appear when you approach the npc
            ["icon"] = "fa-solid fa-people-arrows",
            ["distance"] = 3, -- Interactive distance
            
            ["uiMarker"] = true, -- If you make it True, you will have a nice image on the screen, but I do not recommend it for resmon.
            ["uiDrawText"] = true, -- If you make it True, you will have a nice text on the screen, but I do not recommend it for resmon.

            ["drawmarker_distance"] = 4,
            ["interactiveState"] = false, -- -- Don't touch this
            ["drawmarker_math"] = 46 -- It is part of a division process that magnifies the marker according to proximity and distance.
        },
        ["animDict"] = "amb@world_human_clipboard@male@base",
        ["animName"] = "idle_b",
        ["name"] = { -- Ped name
            ["firstname"] = "Tukang",
            ["lastname"] = "Ayam",
        },
        ["title"] = "Tukang Ayam", -- the text you want to appear maybe character task etc.
        ["question"] = "Halo Pak Ada Yang Bisa Saya Bantu", -- question or text
        ["options"] = {
            ["option1"] = {
                ["button"] = 1, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Mulai Bekerja", -- The answer to the option will appear in the person
                ["event"] = "mulaitangkap:ayam", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = true, -- If there will be a client side event trigger, make it true
                ["argument"] = 0, -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
            ["option2"] = {
                ["button"] = 2, -- A, B, C, D or 1, 2, 3, 4, 
                ["label"] = "Tidak Terimakasih", -- The answer to the option will appear in the person
                ["event"] = "", -- Event name
                ["server"] = false, -- Make this true if there will be a server side event trigger
                ["client"] = false, -- If there will be a client side event trigger, make it true
                ["argument"] = "Hello World", -- You can send only 1 argument and this can include framework variables.                   
                ["selected"] = false, -- Don't touch this
            },
        }
    },
}