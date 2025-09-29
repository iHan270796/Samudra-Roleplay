local isInFishingZone = false
local fishingZones = {}

-- Zone 1
fishingZones[#fishingZones+1] = lib.zones.poly({
    name = 'fishing_zone_1',
    points = {
        vec3(-1864.87, -1236.88, 8.62),
        vec3(-1827.9, -1267.09, 8.62),
        vec3(-1842.99, -1285.22, 8.64),
        vec3(-1875.05, -1260.94, 8.16),
    },
    thickness = 15.0, -- maxZ - minZ
    debug = false,
    onEnter = function()
        isInFishingZone = true
    end,
    onExit = function()
        isInFishingZone = false
    end
})

-- Zone 2
fishingZones[#fishingZones+1] = lib.zones.poly({
    name = 'fishing_zone_2',
    points = {
        vec3(-1826.93, -1265.93, 8.62),
        vec3(-1808.46, -1243.6, 13.02),
        vec3(-1816.84, -1236.52, 13.02),
        vec3(-1787.23, -1200.58, 13.02),
        vec3(-1769.63, -1214.6, 13.68),
        vec3(-1803.89, -1281.36, 13.77),
    },
    thickness = 30.0,
    debug = false,
    onEnter = function()
        isInFishingZone = true
    end,
    onExit = function()
        isInFishingZone = false
    end
})

-- Zone 3
fishingZones[#fishingZones+1] = lib.zones.poly({
    name = 'fishing_zone_3',
    points = {
        vec3(-1787.31, -1200.5, 13.02),
        vec3(-1795.46, -1191.76, 13.02),
        vec3(-1735.53, -1119.69, 13.07),
        vec3(-1674.04, -1170.06, 13.02),
        vec3(-1755.69, -1222.28, 8.7),
    },
    thickness = 30.0,
    debug = false,
    onEnter = function()
        isInFishingZone = true
    end,
    onExit = function()
        isInFishingZone = false
    end
})
-- Zone 4
fishingZones[#fishingZones+1] = lib.zones.poly({
    name = 'fishing_zone_4',
    points = {
        vec3(-1853.93, -1231.16, 13.02),
        vec3(-1861.48, -1240.4, 8.62),
        vec3(-1893.01, -1220.09, 12.94),
        vec3(-1776.27, -1011.69, 18.81),
        vec3(-1708.78, -1066.5, 13.02),
        vec3(-1803.68, -1183.62, 13.02),
        vec3(-1831.91, -1160.96, 13.02),
        vec3(-1875.21, -1213.57, 13.02)
    },
    thickness = 30.0,
    debug = false,
    onEnter = function()
        isInFishingZone = true
    end,
    onExit = function()
        isInFishingZone = false
    end
})

local function IsNearWater()
    return isInFishingZone
end

exports('IsNearWater', IsNearWater)