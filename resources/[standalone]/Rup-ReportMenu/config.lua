Config = {}

Config.Debug = false
Config.DebugPrint = false

-- Language
Config.Language = { -- en, es
    Default = 'en',
}

-- Permissions
Config.Permissions = {
    -- Admin
    'reportmenu.admin.view',
    'reportmenu.admin.manage',
    'reportmenu.admin.delete',
    -- Mod
    'reportmenu.mod.view',
    'reportmenu.mod.manage',
}

-- Cooldowns
Config.Cooldowns = {
    Chat = 5000,    -- 5 seconds
    Report = 10000, -- 10 seconds
    Theme = 10000   -- 10 seconds
}

-- Discord Webhook
Config.Discord = {
    Enabled = true, -- Set to true to enable Discord integration
    Webhook = 'https://discord.com/api/webhooks/1379027995125354596/zZ8oGGTyoFFEJn9bfolsBPfAOsl_BOAswlfAanlvr-KnSXtrjIjJeAD127cWMqtPbr6v', -- Replace with your actual webhook URL
    ImageUrl = 'https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/deanix.png', 
    ReportEmbedColor = 16711680, -- Red
    CreateEmebedColor = 65280, -- Green
}

-- FiveManage API
Config.FiveManage = {
    ApiKey = "1BeRzmeRkoW4VjVQQFyhjddBS6yBzuf5",  -- Replace with your actual API key (https://fivemanage.com/)
    DeleteMedia = true,       -- Delete media files after report deletion
}