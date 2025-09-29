return {
	{
		coords = vec3(452.3, -991.4, 30.7),
		target = {
			loc = vec3(451.25, -994.28, 30.69),
			length = 1.2,
			width = 5.6,
			heading = 0,
			minZ = 29.49,
			maxZ = 32.09,
			label = 'Open personal locker'
		},
		name = 'policelocker',
		label = 'Personal locker',
		owner = true,
		slots = 500,
		weight = 4000000,
		groups = shared.police
	},
	-- {
	-- 	coords = vec3(12.54, -425.23, 33.55),
	-- 	target = {
	-- 		loc = vec3(12.54, -425.23, 33.55),
	-- 		length = 1.2,
	-- 		width = 5.6,
	-- 		heading = 0,
	-- 		minZ = 29.49,
	-- 		maxZ = 33.09,
	-- 		label = 'Open Stash'
	-- 	},
	-- 	name = 'policelocker2',
	-- 	label = 'Police Stash',
	-- 	owner = true,
	-- 	slots = 500,
	-- 	weight = 4000000,
	-- 	groups = {['police'] = 0}
	-- },

	{
		coords = vec3(301.3, -600.23, 43.28),
		target = {
			loc = vec3(301.82, -600.99, 43.29),
			length = 0.6,
			width = 1.8,
			heading = 340,
			minZ = 43.34,
			maxZ = 44.74,
			label = 'Open personal locker'
		},
		name = 'emslocker',
		label = 'Personal Locker',
		owner = true,
		slots = 500,
		weight = 4000000,
		groups = {['ambulance'] = 0}
	},
	{
        name = 'bahamasstash',
        label = 'Bahamas Stash',
        slots = 500,
        weight = 4000000,
		groups = {['bahamas'] = 0}
    },
	{
        name = 'mechanicstash',
        label = 'Mechanic Stash',
        slots = 500,
        weight = 4000000,
		groups = {['mechanic'] = 0}
    },
	{
        name = 'bahamastray',
        label = 'Tray',
        slots = 5,
        weight = 10000,
    },
	{
        name = 'ambulancestash',
        label = 'ambulancestash',
        slots = 500,
        weight = 4000000,
		groups = {['ambulance'] = 0}
    },
	{
        name = 'policestash_',
        label = 'POlice Stash',
        slots = 500,
        weight = 4000000,
		groups = {['police'] = 0}
    }
}
