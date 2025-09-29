Config = Config or {}

Config.Companies = {}
Config.RefreshInterval = 120                            -- 120 seconds(default). Recommended: 60 seconds or higher.
Config.Companies.MaxEmployeesToCall = 2                 -- The maximum number of employees(random) to call when calling a company.

Config.Companies.PoliceAlwaysAvailable = false          -- If true, the police company will always appear as online.
Config.Companies.AppearAsAlwaysAvailable = { 'police' } -- The job name of the police job. -- This is used to determine if the police company should always appear as online.

-- Deprecated - Set your job name manually in the config below. This option will be removed in the future.
Config.Companies.PoliceJob = 'police' -- The job name of the police job.

--[[
    The name of the script that will be used for companies funds.
    [*RECOMMENDED*] tgg-banking: If you are using the latest version of tgg-banking. - https://store.teamsgg.com/package/6545202
    * esx_society: If you are using esx_society.
    * qb-management: If you are using qb-management.
    * qb-banking: If you are using the latest version of qb-banking.
    * okokBanking: If you are using the latest version of okokBanking.
    * renewed-banking: If you are using the latest version of renewed-banking.
    * custom: If you are using a custom or not supported banking script. NOTE: You need to implement the banking functions for your script.
]]
Config.Companies.Banking = 'renewed-banking'

Config.Companies.Services = {
    {
        job = Config.Companies.PoliceJob,
        name = "Polisi",
        icon = "https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/logo_samudra_polisi.png",
        canCall = true,    -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        location = {
            name = "Kantor Polisi",
            coords = {
                x = 445.6,
                y = -985.71,
            }
        },
        hasJobActions = true,  -- if true, and the player job is configured here they can see the job actions
        hasBossActions = true, -- if true, and the player job is configured here they can see the boss actions(only if the player hash boss rank)
        management = {
            duty = true,       -- if true, employees can go on/off duty
            -- Boss actions
            deposit = true,    -- if true, the boss can deposit money into the company
            withdraw = true,   -- if true, the boss can withdraw money from the company
            hire = true,       -- if true, the boss can hire employees
            fire = true,       -- if true, the boss can fire employees
            promote = true,    -- if true, the boss can promote employees
            block = true,      -- if true, the boss can block callers
        }
    },
    {
        job = "ambulance",
        name = "Medis",
        icon = "https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/logo_samudra_medis.png",
        canCall = true,    -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        location = {
            name = "Rumah Sakit",
            coords = {
                x = 1153.16,
                y = -1514.04
            }
        },
        hasJobActions = true,  -- if true, and the player job is configured here they can see the job actions
        hasBossActions = true, -- if true, and the player job is configured here they can see the boss actions(only if the player hash boss rank)
        management = {
            duty = true,       -- if true, employees can go on/off duty
            -- Boss actions
            deposit = true,    -- if true, the boss can deposit money into the company
            withdraw = true,   -- if true, the boss can withdraw money from the company
            hire = true,       -- if true, the boss can hire employees
            fire = true,       -- if true, the boss can fire employees
            promote = true,    -- if true, the boss can promote employees
            block = true,      -- if true, the boss can block callers
        }
    },
    {
        job = "mechanic",
        name = "Mechanic",
        icon = "https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/logo_hp_mekanik.png",
        canCall = true,    -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        location = {
            name = "FTD Mechanic",
            coords = {
                x = 63.49,
                y = 6532.47
            }
        },
        hasJobActions = true,  -- if true, and the player job is configured here they can see the job actions
        hasBossActions = true, -- if true, and the player job is configured here they can see the boss actions(only if the player hash boss rank)
        management = {
            duty = true,       -- if true, employees can go on/off duty
            -- Boss actions
            deposit = true,    -- if true, the boss can deposit money into the company
            withdraw = true,   -- if true, the boss can withdraw money from the company
            hire = true,       -- if true, the boss can hire employees
            fire = true,       -- if true, the boss can fire employees
            promote = true,    -- if true, the boss can promote employees
            block = true,      -- if true, the boss can block callers
        }
    },
    {
        job = "bahamas",
        name = "Bahamas",
        icon = "https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/logo_samudra_bahamas.png",
        canCall = true,    -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        location = {
            name = "Bahamas",
            coords = {
                x = -1391.84,
                y = -585.64
            }
        },
        hasJobActions = true,  -- if true, and the player job is configured here they can see the job actions
        hasBossActions = true, -- if true, and the player job is configured here they can see the boss actions(only if the player hash boss rank)
        management = {
            duty = true,       -- if true, employees can go on/off duty
            -- Boss actions
            deposit = true,    -- if true, the boss can deposit money into the company
            withdraw = true,   -- if true, the boss can withdraw money from the company
            hire = true,       -- if true, the boss can hire employees
            fire = true,       -- if true, the boss can fire employees
            promote = true,    -- if true, the boss can promote employees
            block = true,      -- if true, the boss can block callers
        }
    },
    {
        job = "pemerintah",
        name = "Pemerintah",
        icon = "https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/logo_samudra_pemerintah.png",
        canCall = true,    -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        location = {
            name = "Pemerintah",
            coords = {
                x = 1773.59,
                y = 3640.28
            }
        },
        hasJobActions = true,  -- if true, and the player job is configured here they can see the job actions
        hasBossActions = true, -- if true, and the player job is configured here they can see the boss actions(only if the player hash boss rank)
        management = {
            duty = true,       -- if true, employees can go on/off duty
            -- Boss actions
            deposit = true,    -- if true, the boss can deposit money into the company
            withdraw = true,   -- if true, the boss can withdraw money from the company
            hire = true,       -- if true, the boss can hire employees
            fire = true,       -- if true, the boss can fire employees
            promote = true,    -- if true, the boss can promote employees
            block = true,      -- if true, the boss can block callers
        }
    },
}
