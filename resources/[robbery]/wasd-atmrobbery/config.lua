--[[ All settings of the script are found and edited in this file. ]]

Config = {}

---Interaction with these models
Config.AtmModels = {
    `prop_atm_01`,
    `prop_atm_02`,
    `prop_atm_03`,
    `prop_fleeca_atm`,
}

--[[ The time it takes for the ATM to be rob again | seconds ]]
Config.AtmCooldown = 300

--[[ Cooldown for the player to rob another atm ]]
Config.PlayerCooldown = 300

---Item required for ATM robbery
---@type {name: string, label:string}
Config.RopeItem = { name = 'rope', label = 'Tali Tambang' }

---The time it takes to get the money from the ATM after it is ripped out
Config.BreakTime = 30 -- seconds

---Money to be earned from ATM
Config.MoneyItem = { name = 'markedbills' }

--[[ Required police count for rob ]]
Config.RequiredPoliceCount = 3

--[[ Required police job names | The total number of players with these job will be checked for ``RequiredPoliceCount``]]
Config.PoliceJobName = {
    ['police'] = true,
    ['sheriff'] = false,
}

---The prize amount gives a random amount between max-min
---@type {max:number, min: number, type: 'item'|'bank'}
Config.Reward = {
    type = 'item',
    min = 15,
    max = 16,
}

--[[ DEBUG ]]
Config.debug = false
