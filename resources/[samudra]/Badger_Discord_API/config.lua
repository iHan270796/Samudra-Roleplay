Config = {
	Guild_ID = '1033755628537122826', -- Set to the ID of your guild (or your Primary guild if using Multiguild)
	Multiguild = false, -- Set to true if you want to use multiple guilds
	Guilds = {
		["main"] = "1033755628537122826", -- Replace this with a name, like "main"
	},
	Bot_Token = 'MTQyMDc1MjcwMzIzNTI5NzI5MA.GutNSV.LtLS-vP-8_-JeuwfIc3LuXx7sA3xi0I0AmyFII',
	RoleList = {
		['HIGH ADMIN'] = 597446100206616596,
		['ADMIN'] = 1420785589552287884,
		['HELPER'] = 1033975598177079337,
	},
	DebugScript = false,
	CacheDiscordRoles = true, -- true to cache player roles, false to make a new Discord Request every time
	CacheDiscordRolesTime = 60, -- if CacheDiscordRoles is true, how long to cache roles before clearing (in seconds)
}

Config.Splash = {
	Header_IMG = 'https://forum.cfx.re/uploads/default/original/3X/a/6/a6ad03c9fb60fa7888424e7c9389402846107c7e.png',
	Enabled = false,
	Wait = 10, -- How many seconds should splash page be shown for? (Max is 12)
	Heading1 = "Welcome to [Samudra Roleplay]",
	Heading2 = "Make sure to join our Discord and check out our website!",
	Discord_Link = 'https://discord.gg',
	Website_Link = 'https://badger.store',
}