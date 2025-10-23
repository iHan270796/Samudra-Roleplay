Config = {}
Config.Framework = "newqb" -- esx, newqb, oldqb

-- Check full list https://unicode.org/emoji/charts/full-emoji-list.html
Config.Emojis = {
    [":D"] = "1F603",
    [":)"] = "1F604	",
    [":("] = "1F625	",
    [";)"] = "1F609",
    ["<3"] = "2764",
    [":/"] = "1F610",
    [":P"] = "1F92A",
    [":["] = "1F621",
    [":(("] = "1F97A",
    ["B)"] = "1F60E",
    ["o.O"] = "1F910",
    ["like"] = "1F44D",
}

Config.GetFrameWork = function()
    local object = nil
    if Config.Framework == "esx" then
        while object == nil do
            TriggerEvent('esx:getSharedObject', function(obj) object = obj end)
            Citizen.Wait(0)
        end
    end
    if Config.Framework == "newqb" then
        object = exports["qb-core"]:GetCoreObject()
    end
    if Config.Framework == "oldqb" then
        while object == nil do
            TriggerEvent('QBCore:GetObject', function(obj) object = obj end)
            Citizen.Wait(200)
        end
    end
    return object
end

Config.PresetChatThemes = {
    ooc = {
        bgColor = "background: rgb(164,245,255);background: linear-gradient(270deg, rgba(164,245,255,0.43) 0%, rgba(0,51,75,1) 100%);",
        authorPrefixColor = "#00e3fe",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendOOCMessage",
        leftBottomCurvedSrc = "https://media.discordapp.net/attachments/452410479797862400/953405189581340682/Sol-Alt.png?ex=68f9f606&is=68f8a486&hm=1ca517303e15c9a0f0e68e5d4a44f3ab6b331d3368fd0f4ccd65106561dbb70f&=&format=webp&quality=lossless&width=75&height=60",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953405189333848074/Sag-Ust.png?ex=68f9f606&is=68f8a486&hm=71ccd73b6766bca9f182304a399427231527e1dd6bc4583df6d75cd01d9db590&", 
        headerSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430588395209621645/OOC.png?ex=68fa52c4&is=68f90144&hm=ea7a1547a53a0371f13b4cea1c8be875be7f2e5bde2508fe6836f0191965d1f2&",
    },
    ems = {
        bgColor = "background: rgb(255,164,190);background: linear-gradient(90deg, rgba(255,164,190,0.43) 0%, rgba(126,55,57,1) 100%);",
        authorPrefixColor = "#e2123e",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendEMSMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953414310573531216/Sol-Alt.png?ex=68f9fe85&is=68f8ad05&hm=2d9821979e86a25ff11587656d5aa763147983841f39c20332b4e2275e274ef0&",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953414305498406952/Sag-Ust.png?ex=68f9fe84&is=68f8ad04&hm=9f542a3671d0796de06764ccf650c92463a69f0fd829903350133f8e65e04fbb&", 
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953414317229871154/Logo.png?ex=68f9fe86&is=68f8ad06&hm=f12a129f8927874eab4cae0a5291bc2de10276d4722f6f4d6f28416fa66ee80c&", 
        headerSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430588794415091813/MEDIS.png?ex=68fa5323&is=68f901a3&hm=6d79fbba0c9d62d35449000ff1b6d844fd07a91220ec8eefb879f24fa5588e56&",
    },
    lspd = {
        bgColor = "background: rgb(19,31,185);background: linear-gradient(270deg, rgba(19,31,185,0.43) 0%, rgba(126,55,55,1) 100%);",
        authorPrefixColor = "#a4b2f1",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendLSPDMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953417656155918366/Sol-Alt.png?ex=68fa01a2&is=68f8b022&hm=3fe059cb28c24b053a50facb061ef5402e99bbb25a38a9d7ec44709745961495&",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953417650678140968/Sag-Ust.png?ex=68fa01a1&is=68f8b021&hm=084a22fbc43036aca8ebd3e6c289a7c2bd4c240b116f5f75d775815b65b4c27c&", 
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418279601459291/Logo.png?ex=68fa0237&is=68f8b0b7&hm=70a6c78c34be406bd986a1418f20f1ce38c2d828efebf6443ff21127944c7b03&", 
        headerSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430589762452062228/POLISI.png?ex=68fa540a&is=68f9028a&hm=793d3ec7d09849f5238ce3c70120411c2e983e67797e85b1638f54d9fd8a35d5&",
    },
    twt = {
        bgColor = "background: rgb(29,155,240);background: linear-gradient(270deg, rgba(29,155,240,0.43) 0%, rgba(136,197,238,1) 100%);",
        authorPrefixColor = "#0b4771",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendTWTMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418620476739594/unknown.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418620141199371/unknown.png", 
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418619704967209/unknown.png", 
        headerSrc = "https://cdn.discordapp.com/attachments/627135000738922506/958362857299378226/twitter.png",
    },
	htwt = {
        bgColor = "background: rgb(63,238,87);background: linear-gradient(270deg, rgba(16,54,246,0.43) 0%, rgba(53,240,48,1) 100%);",
        authorPrefixColor = "#142938",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendHTWTMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418620476739594/unknown.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418620141199371/unknown.png", 
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418619704967209/unknown.png", 
        headerSrc = "https://cdn.discordapp.com/attachments/627135000738922506/958365049607561316/fakehtwt.png",
    },
    lscustom = {
        bgColor = "background: rgba(237, 216, 59, 0.552);background: linear-gradient(270deg, rgba(218, 255, 118, 0.43) 0%, rgba(237, 216, 59, 0.552) 100%);",
        authorPrefixColor = "#fC0707",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendLSCustomMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953417656155918366/Sol-Alt.png?ex=68fa01a2&is=68f8b022&hm=3fe059cb28c24b053a50facb061ef5402e99bbb25a38a9d7ec44709745961495&",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953417650678140968/Sag-Ust.png?ex=68fa01a1&is=68f8b021&hm=084a22fbc43036aca8ebd3e6c289a7c2bd4c240b116f5f75d775815b65b4c27c&", 
        logoSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430597104430092440/Logo-meknik.png?ex=68fa5ae0&is=68f90960&hm=b4043c546551c95ed19cda7294b58a2cafecdeb9e422c8b66306e3a599507661&", 
        headerSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430596118739423424/MEKANIK.png?ex=68fa59f5&is=68f90875&hm=cd4a7b4af52d1432d141f024593ac3bcdcc45c13c15ca0afcc43136b5dc61fb2&",
    },
    yellowpages = {
        bgColor = "background: rgb(175,185,19);background: linear-gradient(270deg, rgba(175,185,19,0.43) 0%, rgba(103,83,1,1) 100%);",
        authorPrefixColor = "#ecba07",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendYellowPagesMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421074039705630/So-Alt.png?ex=68fa04d1&is=68f8b351&hm=be7e9bb7f73ea8925784769db0d59e7ec44c63c215af043325b7486314272ba5&",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421073863565342/Sag-Ust.png?ex=68fa04d1&is=68f8b351&hm=cd1028f6e2cf18b583b22a7be358e202da5174d1265e386d6de4d33620c65140&", 
        logoSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430598027390881862/Logo-bahamas.png?ex=68fa5bbc&is=68f90a3c&hm=ad5e5d6e6ceebbc7a6dbfe20c00f4aa9cb50b3b49d38809f61df060f40c49e6e&", 
        headerSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430598243624030399/BAHAMAS.png?ex=68fa5bf0&is=68f90a70&hm=87316b0852a4188d590760ff2acd7c57f63e46e47b07dbb71bef484d68f5c888&",
    },
    pemerintah = {
        bgColor = "background: rgb(185, 121, 19);background: linear-gradient(270deg, rgba(15, 239, 251, 0.43) 0%, rgba(185, 121, 19, 0.863) 100%);",
        authorPrefixColor = "FFFF8903",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendpemerintahMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430603042255802458/PEMERINTAH_bawah.png?ex=68fa6068&is=68f90ee8&hm=f930f15f4cf5ccb15023074a4fcae3d8eab41b899986cf955217cc269c859270&",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430603158773563533/PEMERINTAH_atas.png?ex=68fa6084&is=68f90f04&hm=abf3d7c920b28ed0103649cec2385ef61257588d57876621f881016b39fd8b8a&", 
        logoSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430606810741739580/LOGO-PEMERINTA.png?ex=68fa63eb&is=68f9126b&hm=8fde0c28a52d0b2e13b8a9c0185d52febf898d3a4cb448c92840419ebbf43647&", 
        headerSrc = "https://cdn.discordapp.com/attachments/1320755950511980577/1430608153543708733/PEMERINTAHH.png?ex=68fa652b&is=68f913ab&hm=108ccf6f92b8bee63bcc1478825af729a6260d498b3fddc6075301634ce0df96&",
    },
    staff = {
        bgColor = "background: rgb(164,255,207);background: linear-gradient(270deg, rgba(164,255,207,0.43) 0%, rgba(1,103,54,1) 100%);",
        authorPrefixColor = "#64e265",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendStaffMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320996151306/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320723513364/Sag-Ust.png", 
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320366993438/logo.png", 
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953361212287090728/STAFF.png",
    },
    admin = {
        bgColor = "background: rgb(255,164,164);  background: linear-gradient(90deg, rgba(255,164,164,0.43) 0%, rgba(103,1,1,1) 100%);",
        authorPrefixColor = "#d50504",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendAdminMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953423463224315944/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953423463002042368/Sag-Ust.png", 
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953423462779748402/logo.png", 
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953359549421740052/ADMIN.png",
    },
    shop = {
        bgColor = "background: rgb(203,255,164);background: linear-gradient(270deg, rgba(203,255,164,0.43) 0%, rgba(255,0,0,0.2091211484593838) 51%, rgba(178,81,10,1) 100%);",
        useAuthorPrefix = false,
        eventName = "codem-chat:SendShopMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424649302179930/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424649113452625/Sag-Ust.png", 
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424648832426044/logo.png", 
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953358212873191434/24_7_Market.png",
    },
    cab = {
        bgColor = "background: rgb(255,224,164);  background: linear-gradient(270deg, rgba(255,224,164,0.43) 0%, rgba(103,83,1,1) 100%);",
        useAuthorPrefix = true,
        authorPrefixColor = "#db9c07",
        eventName = "codem-chat:SendCabMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424983131037776/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424982950678528/Sag-Ust.png", 
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424982736797696/logo.png", 
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953359132298203146/Downtown_Cab.png",
    },
}

Config.EnableCommands = { -- Enable or disable chat themes
    enableOOC = true,
    enableEMS = true,
    enableLSPD = true,
    enableTWT = false,
    enableLSCUSTOM = true,
    enableYELLOWPAGES = true,
    enableSTAFF = false,
    enableADMIN = false,
    enableSHOP = false,
    enableCAB = false,
    enablepemerintah = true,
}

Config.UseRoleplayNames = {
    ooc = true,
    ems = true,
    lspd = true,
    twt = true,
    yellowpages = true,
    staff = true,
    admin = true,
    cab = true,
    lscustom = true,
    pemerintah = true,
}
Config.CommandJobs = {
    ems = {"ems", "ambulance"},
    lspd = {"police"},
    lscustom = {"mechanic"},
    shop = {"shop"},
    cab = {"taxi"},
    yellowpages = {"bahamas"},
    pemerintah = {"pemerintah"},
} 

Citizen.CreateThread(function()
    if Config.Framework == "esx" then
        Config.StaffPermissions = {
             "tulaj",
			"owner",
			"superadmin",
            "admin",
            "mod",
        }
    else
        Config.StaffPermissions = {
             "tulaj",
			"owner",
			"superadmin",
            "admin",
            "mod",
        }
    end

    if Config.Framework == "esx" then
        Config.AdminPermissions = {
             "tulaj",
			"owner",
			"superadmin",
            "admin",
            "mod",
        }
    else
        Config.AdminPermissions = {
            "tulaj",
			"owner",
			"superadmin",
            "admin",
            "mod",
        }
    end
end)



Config.CommandsPrefix = {
    ooc = "ooc",
    ems = "medis",
    lspd = "polisi",
    twt = "twt",
    lscustom = "mekanik",
    yellowpages = "bahamas",
    staff = "staff",
    admin = "admin",
    shop = "shop",
    cab = "taxi",
    pemerintah = "pemerintah",
}

Config.EnableDotOverHead = true -- if true enable "..." over player head when typing to chat


Config.EnableCustomThemes = true -- Enable or disable custom themes
Config.CustomThemes = { -- Use this if you want to create custom themes
    {
        enable = true,
        bgColor = "background: rgb(164,255,207);background: linear-gradient(270deg, rgba(164,255,207,0.43) 0%, rgba(1,103,54,1) 100%);",
        authorPrefixColor = "#64e265",
        useAuthorPrefix = true,
        eventName = "codem-chat:TestCustomTheme" ,
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320996151306/Sol-Alt.png", -- Leave this blank if you don't want to display this
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320723513364/Sag-Ust.png", -- Leave this blank if you don't want to display this
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320366993438/logo.png", -- Leave this blank if you don't want to display a logo
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953361212287090728/STAFF.png", -- Leave this blank if you don't want to display a header
    },
}

-- Preset left bottom curved images
--[[
    https://cdn.discordapp.com/attachments/452410479797862400/953405189581340682/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953414310573531216/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953417656155918366/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953418620476739594/unknown.png
    https://cdn.discordapp.com/attachments/452410479797862400/953420126445785158/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953421074039705630/So-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953421320996151306/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953423463224315944/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953424649302179930/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953424983131037776/Sol-Alt.png
]]

-- Preset right top curved images
--[[
   https://cdn.discordapp.com/attachments/452410479797862400/953405189333848074/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953414305498406952/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953417650678140968/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953418620141199371/unknown.png
   https://cdn.discordapp.com/attachments/452410479797862400/953420126185717760/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953421073863565342/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953421320723513364/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953423463002042368/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953424649113452625/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953424982950678528/Sag-Ust.png
]]

-- Preset logo images
--[[
    https://cdn.discordapp.com/attachments/452410479797862400/953414317229871154/Logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953418279601459291/Logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953418619704967209/unknown.png
    https://cdn.discordapp.com/attachments/452410479797862400/953420125984395354/logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953421073431547904/logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953421320366993438/logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953423462779748402/logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953424648832426044/logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953424982736797696/logo.png
]]

-- Preset header images
--[[
    https://cdn.discordapp.com/attachments/950484538012864572/953358212873191434/24_7_Market.png
    https://cdn.discordapp.com/attachments/950484538012864572/953359132298203146/Downtown_Cab.png
    https://cdn.discordapp.com/attachments/950484538012864572/953359549421740052/ADMIN.png
    https://cdn.discordapp.com/attachments/950484538012864572/953361212287090728/STAFF.png
    https://cdn.discordapp.com/attachments/950484538012864572/953361603682783272/LS_Customs.png
    https://cdn.discordapp.com/attachments/950484538012864572/953361887792361492/Yellow_Pages.png
    https://cdn.discordapp.com/attachments/950484538012864572/953362211831705650/Twitter.png
    https://cdn.discordapp.com/attachments/950484538012864572/953362642892898394/LSPD.png
    https://cdn.discordapp.com/attachments/950484538012864572/953362975371182110/EMS.png
    https://cdn.discordapp.com/attachments/950484538012864572/953363246285459466/OOC.png
]]