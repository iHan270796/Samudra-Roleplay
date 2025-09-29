local Slots = {}

-- Add the user's rockstar license or license2: and how many slots they want to have in total
-- If you are using Qbox, change license:xxxxx to license2:xxxxx

-- @ If Slots.DiscordPerm.status is false | for manuel license works
-- This does not include Config.DefaultSlots, it sets the direct slot limit of the character

Slots.List = {
    {license = "license:5cfb8854c078bb60a3c60580e1dcaf9a7d8e76a4", totalSlot = 3}, --riki
    {license = "license:be183086dadbb160f816c8b89a918d9add1ab3ae", totalSlot = 5}, --pusliae
    -- {license = "license:1438b13c4b28954b2a8b7a7ba090ac50a917a463", totalSlot = 2}, --bill
    {license = "license:75f653bdd493b46adcd91e194dcb76220f37a30e", totalSlot = 2}, --jors
    {license = "license:03435eefee8abad59f84f914cb0bf7ae4dc8fa7e", totalSlot = 3}, --kazu
    {license = "license:30fbdbe96255d17bde9b2dd361a49471e364065a", totalSlot = 2}, --dotz
    {license = "license:06d024d0212289f8070041e8529fba96f5bb7e8c", totalSlot = 2}, --halmun
    {license = "license:6cccad731160899fb9cfc19d71eb5c9a1e1eb92d", totalSlot = 2}, --agatha
    {license = "license:82a2042e023f0c6a1f377b9b154b219c2c389ba0", totalSlot = 2}, --poncol
    {license = "license:ce8e7d8a757d53d899ba43a5e0919d2beb95b825", totalSlot = 2}, --pije
    {license = "license:d67cf09689194ef887afc3ca8542dd7ec6e291fd", totalSlot = 2}, --brian
    {license = "license:b4aeaca9e05e968ad8bbdffa7b2e5e4bb5149c63", totalSlot = 2}, --abew
}


-- This structure configures extra slot allocations based on Discord roles.
-- The `Slots.DiscordPerm` structure allows you to assign additional slots to users
-- based on specific Discord roles that they possess

Slots.DiscordPerm = {
    status = false,                           -- Set to true to enable this feature, or false to disable it.
    role = {
        { id = "roleid", addExtraSlot = 20 }, -- Example: Users with this role will have 20 + Config.DefaultSlots = 25 in total.
        { id = "roleid", addExtraSlot = 3 },  -- Replace 'roleid' with your Discord role ID and specify the total extra slots.
        { id = "roleid", addExtraSlot = 4 },  -- Repeat this pattern for as many roles as you need.
        { id = "roleid", addExtraSlot = 5 },
        { id = "roleid", addExtraSlot = 6 },
    }
}

Slots.CustomDeleteCharacterAccess = {
    status = true, -- Set to true to enable this feature, or false to disable it.
    list = {
       "license:be183086dadbb160f816c8b89a918d9add1ab3ae",
        --"license2:xxxxx3",
    }
}

return Slots
