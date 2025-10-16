local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = IsDuplicityVersion
L0_1 = L0_1()
if L0_1 then
  L0_1 = GetPlayerPositionInRealTime66
  L0_1()
end
usingattraction = false
playerloaded = true
oldframes = 100
oldtime = 0
currentfps = 100
L0_1 = {}
L0_1.gforce = false
L0_1.topscan = false
L0_1.vortex = false
L0_1.detonator = false
L0_1.boat = false
L0_1.ferris = false
L0_1.rollercoaster = false
L0_1.shootingrange = false
L0_1.bumpercars = false
L0_1.prater = false
L0_1.brakedance = false
L0_1.slingshot = false
L0_1.carousel = false
L0_1.extasy = false
L0_1.spinride = false
L0_1.hauntedhouse = false
L0_1.rollercoaster2 = false
L0_1.cannon = false
tickets = L0_1
L0_1 = {}
L0_1.owned = false
L0_1.own = false
themeparkowned = L0_1
nearbyticketmachineid = nil
inticketmachinemenu = false
ticketmachineid = nil
nearbystandid = nil
nearbythemepark = false
streamermodeactivated = false
inattractioncontrolmenu = false
attractioncontrolid = nil
attractioncontrolledid = nil
L0_1 = vector3
L1_1 = 0.0
L2_1 = 0.0
L3_1 = 0.0
L0_1 = L0_1(L1_1, L2_1, L3_1)
playercurrentcoords = L0_1
L0_1 = false
L1_1 = Config
L1_1 = L1_1.ThemeParkPassTime
L1_1 = L1_1 * 60
L2_1 = {}
L3_1 = {}
L4_1 = vector3
L5_1 = -1640.79
L6_1 = -1077.25
L7_1 = 12.15
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1.coords = L4_1
L3_1.heading = 225.5
L4_1 = Config
L4_1 = L4_1.AttractionsSettings
L4_1 = L4_1.gforce
L4_1 = L4_1.ticketprice
L3_1.ticketprice = L4_1
L3_1.attractionid = 1
L3_1.tickettype = 1
L4_1 = Config
L4_1 = L4_1.AttractionsSettings
L4_1 = L4_1.gforce
L4_1 = L4_1.disable
L3_1.disabled = L4_1
L4_1 = {}
L5_1 = vector3
L6_1 = -1624.01
L7_1 = -1072.69
L8_1 = 12.03
L5_1 = L5_1(L6_1, L7_1, L8_1)
L4_1.coords = L5_1
L4_1.heading = 178.5
L5_1 = Config
L5_1 = L5_1.AttractionsSettings
L5_1 = L5_1.topscan
L5_1 = L5_1.ticketprice
L4_1.ticketprice = L5_1
L4_1.attractionid = 2
L4_1.tickettype = 2
L5_1 = Config
L5_1 = L5_1.AttractionsSettings
L5_1 = L5_1.topscan
L5_1 = L5_1.disable
L4_1.disabled = L5_1
L5_1 = {}
L6_1 = vector3
L7_1 = -1643.14
L8_1 = -1119.59
L9_1 = 12.02
L6_1 = L6_1(L7_1, L8_1, L9_1)
L5_1.coords = L6_1
L5_1.heading = 137.5
L6_1 = Config
L6_1 = L6_1.AttractionsSettings
L6_1 = L6_1.rollercoaster
L6_1 = L6_1.ticketprice
L5_1.ticketprice = L6_1
L5_1.attractionid = 3
L5_1.tickettype = 7
L6_1 = Config
L6_1 = L6_1.AttractionsSettings
L6_1 = L6_1.rollercoaster
L6_1 = L6_1.disable
L5_1.disabled = L6_1
L6_1 = {}
L7_1 = vector3
L8_1 = -1637.59
L9_1 = -1102.01
L10_1 = 12.02
L7_1 = L7_1(L8_1, L9_1, L10_1)
L6_1.coords = L7_1
L6_1.heading = 321.5
L7_1 = Config
L7_1 = L7_1.AttractionsSettings
L7_1 = L7_1.shootingrange
L7_1 = L7_1.ticketprice
L6_1.ticketprice = L7_1
L6_1.attractionid = 5
L6_1.tickettype = 8
L7_1 = Config
L7_1 = L7_1.AttractionsSettings
L7_1 = L7_1.shootingrange
L7_1 = L7_1.disable
L6_1.disabled = L7_1
L7_1 = {}
L8_1 = vector3
L9_1 = -1669.85
L10_1 = -1134.16
L11_1 = 12.01
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L7_1.heading = 247.5
L8_1 = Config
L8_1 = L8_1.AttractionsSettings
L8_1 = L8_1.shootingrange
L8_1 = L8_1.ticketprice
L7_1.ticketprice = L8_1
L7_1.attractionid = 5
L7_1.tickettype = 8
L8_1 = Config
L8_1 = L8_1.AttractionsSettings
L8_1 = L8_1.shootingrange
L8_1 = L8_1.disable
L7_1.disabled = L8_1
L8_1 = {}
L9_1 = vector3
L10_1 = -1595.73
L11_1 = -1098.3
L12_1 = 12.01
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L8_1.heading = 230.5
L9_1 = Config
L9_1 = L9_1.AttractionsSettings
L9_1 = L9_1.shootingrange
L9_1 = L9_1.ticketprice
L8_1.ticketprice = L9_1
L8_1.attractionid = 5
L8_1.tickettype = 8
L9_1 = Config
L9_1 = L9_1.AttractionsSettings
L9_1 = L9_1.shootingrange
L9_1 = L9_1.disable
L8_1.disabled = L9_1
L9_1 = {}
L10_1 = vector3
L11_1 = -1697.91
L12_1 = -1111.28
L13_1 = 12.15
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.heading = 137.5
L10_1 = Config
L10_1 = L10_1.AttractionsSettings
L10_1 = L10_1.vortex
L10_1 = L10_1.ticketprice
L9_1.ticketprice = L10_1
L9_1.attractionid = 7
L9_1.tickettype = 3
L10_1 = Config
L10_1 = L10_1.AttractionsSettings
L10_1 = L10_1.vortex
L10_1 = L10_1.disable
L9_1.disabled = L10_1
L10_1 = {}
L11_1 = vector3
L12_1 = -1691.58
L13_1 = -1093.49
L14_1 = 12.15
L11_1 = L11_1(L12_1, L13_1, L14_1)
L10_1.coords = L11_1
L10_1.heading = 315.5
L11_1 = Config
L11_1 = L11_1.AttractionsSettings
L11_1 = L11_1.ferris
L11_1 = L11_1.ticketprice
L10_1.ticketprice = L11_1
L10_1.attractionid = 8
L10_1.tickettype = 6
L11_1 = Config
L11_1 = L11_1.AttractionsSettings
L11_1 = L11_1.ferris
L11_1 = L11_1.disable
L10_1.disabled = L11_1
L11_1 = {}
L12_1 = vector3
L13_1 = -1688.31
L14_1 = -1119.0
L15_1 = 12.91
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.coords = L12_1
L11_1.heading = 69.5
L12_1 = Config
L12_1 = L12_1.AttractionsSettings
L12_1 = L12_1.detonator
L12_1 = L12_1.ticketprice
L11_1.ticketprice = L12_1
L11_1.attractionid = 9
L11_1.tickettype = 4
L12_1 = Config
L12_1 = L12_1.AttractionsSettings
L12_1 = L12_1.detonator
L12_1 = L12_1.disable
L11_1.disabled = L12_1
L12_1 = {}
L13_1 = vector3
L14_1 = -1661.67
L15_1 = -1118.84
L16_1 = 12.02
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.coords = L13_1
L12_1.heading = 207.5
L13_1 = Config
L13_1 = L13_1.AttractionsSettings
L13_1 = L13_1.boat
L13_1 = L13_1.ticketprice
L12_1.ticketprice = L13_1
L12_1.attractionid = 10
L12_1.tickettype = 5
L13_1 = Config
L13_1 = L13_1.AttractionsSettings
L13_1 = L13_1.boat
L13_1 = L13_1.disable
L12_1.disabled = L13_1
L13_1 = {}
L14_1 = vector3
L15_1 = -1601.14
L16_1 = -1111.8
L17_1 = 12.01
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.coords = L14_1
L13_1.heading = 48.5
L14_1 = Config
L14_1 = L14_1.AttractionsSettings
L14_1 = L14_1.prater
L14_1 = L14_1.ticketprice
L13_1.ticketprice = L14_1
L13_1.attractionid = 11
L13_1.tickettype = 10
L14_1 = Config
L14_1 = L14_1.AttractionsSettings
L14_1 = L14_1.prater
L14_1 = L14_1.disable
L13_1.disabled = L14_1
L14_1 = {}
L15_1 = vector3
L16_1 = -1586.13
L17_1 = -1104.63
L18_1 = 12.01
L15_1 = L15_1(L16_1, L17_1, L18_1)
L14_1.coords = L15_1
L14_1.heading = 223.5
L15_1 = Config
L15_1 = L15_1.AttractionsSettings
L15_1 = L15_1.brakedance
L15_1 = L15_1.ticketprice
L14_1.ticketprice = L15_1
L14_1.attractionid = 12
L14_1.tickettype = 11
L15_1 = Config
L15_1 = L15_1.AttractionsSettings
L15_1 = L15_1.brakedance
L15_1 = L15_1.disable
L14_1.disabled = L15_1
L15_1 = {}
L16_1 = vector3
L17_1 = -1584.4
L18_1 = -1090.63
L19_1 = 12.01
L16_1 = L16_1(L17_1, L18_1, L19_1)
L15_1.coords = L16_1
L15_1.heading = 312.5
L16_1 = Config
L16_1 = L16_1.AttractionsSettings
L16_1 = L16_1.slingshot
L16_1 = L16_1.ticketprice
L15_1.ticketprice = L16_1
L15_1.attractionid = 13
L15_1.tickettype = 12
L16_1 = Config
L16_1 = L16_1.AttractionsSettings
L16_1 = L16_1.slingshot
L16_1 = L16_1.disable
L15_1.disabled = L16_1
L16_1 = {}
L17_1 = vector3
L18_1 = -1637.8
L19_1 = -1163.99
L20_1 = 12.01
L17_1 = L17_1(L18_1, L19_1, L20_1)
L16_1.coords = L17_1
L16_1.heading = 224.5
L17_1 = Config
L17_1 = L17_1.AttractionsSettings
L17_1 = L17_1.carousel
L17_1 = L17_1.ticketprice
L16_1.ticketprice = L17_1
L16_1.attractionid = 14
L16_1.tickettype = 13
L17_1 = Config
L17_1 = L17_1.AttractionsSettings
L17_1 = L17_1.carousel
L17_1 = L17_1.disable
L16_1.disabled = L17_1
L17_1 = {}
L18_1 = vector3
L19_1 = -1640.83
L20_1 = -1147.46
L21_1 = 12.45
L18_1 = L18_1(L19_1, L20_1, L21_1)
L17_1.coords = L18_1
L17_1.heading = 47.5
L18_1 = Config
L18_1 = L18_1.AttractionsSettings
L18_1 = L18_1.extasy
L18_1 = L18_1.ticketprice
L17_1.ticketprice = L18_1
L17_1.attractionid = 15
L17_1.tickettype = 14
L18_1 = Config
L18_1 = L18_1.AttractionsSettings
L18_1 = L18_1.extasy
L18_1 = L18_1.disable
L17_1.disabled = L18_1
L18_1 = {}
L19_1 = vector3
L20_1 = -1648.65
L21_1 = -1181.3
L22_1 = 12.01
L19_1 = L19_1(L20_1, L21_1, L22_1)
L18_1.coords = L19_1
L18_1.heading = 48.5
L19_1 = Config
L19_1 = L19_1.AttractionsSettings
L19_1 = L19_1.spinride
L19_1 = L19_1.ticketprice
L18_1.ticketprice = L19_1
L18_1.attractionid = 16
L18_1.tickettype = 15
L19_1 = Config
L19_1 = L19_1.AttractionsSettings
L19_1 = L19_1.spinride
L19_1 = L19_1.disable
L18_1.disabled = L19_1
L19_1 = {}
L20_1 = vector3
L21_1 = -1603.71
L22_1 = -1140.61
L23_1 = 13.34
L20_1 = L20_1(L21_1, L22_1, L23_1)
L19_1.coords = L20_1
L19_1.heading = 229.5
L20_1 = Config
L20_1 = L20_1.AttractionsSettings
L20_1 = L20_1.hauntedhouse
L20_1 = L20_1.ticketprice
L19_1.ticketprice = L20_1
L19_1.attractionid = 17
L19_1.tickettype = 16
L20_1 = Config
L20_1 = L20_1.AttractionsSettings
L20_1 = L20_1.hauntedhouse
L20_1 = L20_1.disable
L19_1.disabled = L20_1
L20_1 = {}
L21_1 = vector3
L22_1 = -1625.51
L23_1 = -1184.38
L24_1 = 12.01
L21_1 = L21_1(L22_1, L23_1, L24_1)
L20_1.coords = L21_1
L20_1.heading = 137.5
L21_1 = Config
L21_1 = L21_1.AttractionsSettings
L21_1 = L21_1.rollercoaster2
L21_1 = L21_1.ticketprice
L20_1.ticketprice = L21_1
L20_1.attractionid = 18
L20_1.tickettype = 17
L21_1 = Config
L21_1 = L21_1.AttractionsSettings
L21_1 = L21_1.rollercoaster2
L21_1 = L21_1.disable
L20_1.disabled = L21_1
L21_1 = {}
L22_1 = vector3
L23_1 = -1644.85
L24_1 = -1188.88
L25_1 = 12.01
L22_1 = L22_1(L23_1, L24_1, L25_1)
L21_1.coords = L22_1
L21_1.heading = 139.5
L22_1 = Config
L22_1 = L22_1.AttractionsSettings
L22_1 = L22_1.cannon
L22_1 = L22_1.ticketprice
L21_1.ticketprice = L22_1
L21_1.attractionid = 19
L21_1.tickettype = 18
L22_1 = Config
L22_1 = L22_1.AttractionsSettings
L22_1 = L22_1.cannon
L22_1 = L22_1.disable
L21_1.disabled = L22_1
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L2_1[12] = L14_1
L2_1[13] = L15_1
L2_1[14] = L16_1
L2_1[15] = L17_1
L2_1[16] = L18_1
L2_1[17] = L19_1
L2_1[18] = L20_1
L2_1[19] = L21_1
ticketmachines = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.vortex
L4_1 = L4_1.coords
L3_1.coords = L4_1
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.vortex
L4_1 = L4_1.rotation
L3_1.rotation = L4_1
L3_1.attractionid = 3
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.vortex
L4_1 = L4_1.label
L3_1.label = L4_1
L3_1.using = false
L3_1.smokeactivated = false
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.vortex
L4_1 = L4_1.disablesmoke
L3_1.smokedisabled = L4_1
L3_1.turndisabled = false
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.vortex
L4_1 = L4_1.disablemusic
L3_1.musicdisabled = L4_1
L3_1.music = false
L3_1.musicurl = ""
L3_1.musicvolume = 100
L3_1.musichandler = nil
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.vortex
L4_1 = L4_1.musiccoords
L3_1.musiccoords = L4_1
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.vortex
L4_1 = L4_1.musicmaxdistance
L3_1.musicmaxdistance = L4_1
L3_1.handler = nil
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.vortex
L4_1 = L4_1.smokecolor
L3_1.smokecolor = L4_1
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.vortex
L4_1 = L4_1.smokelocations
L3_1.smokelocations = L4_1
L4_1 = {}
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.bumpercars
L5_1 = L5_1.coords
L4_1.coords = L5_1
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.bumpercars
L5_1 = L5_1.rotation
L4_1.rotation = L5_1
L4_1.attractionid = 6
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.bumpercars
L5_1 = L5_1.label
L4_1.label = L5_1
L4_1.using = false
L4_1.smokeactivated = false
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.bumpercars
L5_1 = L5_1.disablesmoke
L4_1.smokedisabled = L5_1
L4_1.turndisabled = true
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.bumpercars
L5_1 = L5_1.disablemusic
L4_1.musicdisabled = L5_1
L4_1.music = false
L4_1.musicurl = ""
L4_1.musicvolume = 100
L4_1.musichandler = nil
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.bumpercars
L5_1 = L5_1.musiccoords
L4_1.musiccoords = L5_1
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.bumpercars
L5_1 = L5_1.musicmaxdistance
L4_1.musicmaxdistance = L5_1
L4_1.handler = nil
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.bumpercars
L5_1 = L5_1.smokecolor
L4_1.smokecolor = L5_1
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.bumpercars
L5_1 = L5_1.smokelocations
L4_1.smokelocations = L5_1
L5_1 = {}
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.boat
L6_1 = L6_1.coords
L5_1.coords = L6_1
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.boat
L6_1 = L6_1.rotation
L5_1.rotation = L6_1
L5_1.attractionid = 5
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.boat
L6_1 = L6_1.label
L5_1.label = L6_1
L5_1.using = false
L5_1.smokeactivated = false
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.boat
L6_1 = L6_1.disablesmoke
L5_1.smokedisabled = L6_1
L5_1.turndisabled = false
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.boat
L6_1 = L6_1.disablemusic
L5_1.musicdisabled = L6_1
L5_1.music = false
L5_1.musicurl = ""
L5_1.musicvolume = 100
L5_1.musichandler = nil
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.boat
L6_1 = L6_1.musiccoords
L5_1.musiccoords = L6_1
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.boat
L6_1 = L6_1.musicmaxdistance
L5_1.musicmaxdistance = L6_1
L5_1.handler = nil
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.boat
L6_1 = L6_1.smokecolor
L5_1.smokecolor = L6_1
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.boat
L6_1 = L6_1.smokelocations
L5_1.smokelocations = L6_1
L6_1 = {}
L7_1 = Config
L7_1 = L7_1.ThemeParkControlMachineSettings
L7_1 = L7_1.attractions
L7_1 = L7_1.rollercoaster
L7_1 = L7_1.coords
L6_1.coords = L7_1
L7_1 = Config
L7_1 = L7_1.ThemeParkControlMachineSettings
L7_1 = L7_1.attractions
L7_1 = L7_1.rollercoaster
L7_1 = L7_1.rotation
L6_1.rotation = L7_1
L6_1.attractionid = 8
L7_1 = Config
L7_1 = L7_1.ThemeParkControlMachineSettings
L7_1 = L7_1.attractions
L7_1 = L7_1.rollercoaster
L7_1 = L7_1.label
L6_1.label = L7_1
L6_1.using = false
L6_1.smokeactivated = false
L6_1.smokedisabled = true
L6_1.turndisabled = false
L7_1 = Config
L7_1 = L7_1.ThemeParkControlMachineSettings
L7_1 = L7_1.attractions
L7_1 = L7_1.rollercoaster
L7_1 = L7_1.disablemusic
L6_1.musicdisabled = L7_1
L6_1.music = false
L6_1.musicurl = ""
L6_1.musicvolume = 100
L6_1.musichandler = nil
L7_1 = Config
L7_1 = L7_1.ThemeParkControlMachineSettings
L7_1 = L7_1.attractions
L7_1 = L7_1.rollercoaster
L7_1 = L7_1.musiccoords
L6_1.musiccoords = L7_1
L7_1 = Config
L7_1 = L7_1.ThemeParkControlMachineSettings
L7_1 = L7_1.attractions
L7_1 = L7_1.rollercoaster
L7_1 = L7_1.musicmaxdistance
L6_1.musicmaxdistance = L7_1
L6_1.handler = nil
L7_1 = {}
L8_1 = Config
L8_1 = L8_1.ThemeParkControlMachineSettings
L8_1 = L8_1.attractions
L8_1 = L8_1.detonator
L8_1 = L8_1.coords
L7_1.coords = L8_1
L8_1 = Config
L8_1 = L8_1.ThemeParkControlMachineSettings
L8_1 = L8_1.attractions
L8_1 = L8_1.detonator
L8_1 = L8_1.rotation
L7_1.rotation = L8_1
L7_1.attractionid = 4
L8_1 = Config
L8_1 = L8_1.ThemeParkControlMachineSettings
L8_1 = L8_1.attractions
L8_1 = L8_1.detonator
L8_1 = L8_1.label
L7_1.label = L8_1
L7_1.using = false
L7_1.smokeactivated = false
L7_1.smokedisabled = true
L7_1.turndisabled = false
L8_1 = Config
L8_1 = L8_1.ThemeParkControlMachineSettings
L8_1 = L8_1.attractions
L8_1 = L8_1.detonator
L8_1 = L8_1.disablemusic
L7_1.musicdisabled = L8_1
L7_1.music = false
L7_1.musicurl = ""
L7_1.musicvolume = 100
L7_1.musichandler = nil
L8_1 = Config
L8_1 = L8_1.ThemeParkControlMachineSettings
L8_1 = L8_1.attractions
L8_1 = L8_1.detonator
L8_1 = L8_1.musiccoords
L7_1.musiccoords = L8_1
L8_1 = Config
L8_1 = L8_1.ThemeParkControlMachineSettings
L8_1 = L8_1.attractions
L8_1 = L8_1.detonator
L8_1 = L8_1.musicmaxdistance
L7_1.musicmaxdistance = L8_1
L7_1.handler = nil
L8_1 = {}
L9_1 = Config
L9_1 = L9_1.ThemeParkControlMachineSettings
L9_1 = L9_1.attractions
L9_1 = L9_1.gforce
L9_1 = L9_1.coords
L8_1.coords = L9_1
L9_1 = Config
L9_1 = L9_1.ThemeParkControlMachineSettings
L9_1 = L9_1.attractions
L9_1 = L9_1.gforce
L9_1 = L9_1.rotation
L8_1.rotation = L9_1
L8_1.attractionid = 1
L9_1 = Config
L9_1 = L9_1.ThemeParkControlMachineSettings
L9_1 = L9_1.attractions
L9_1 = L9_1.gforce
L9_1 = L9_1.label
L8_1.label = L9_1
L8_1.using = false
L8_1.smokeactivated = false
L8_1.smokedisabled = true
L8_1.turndisabled = false
L9_1 = Config
L9_1 = L9_1.ThemeParkControlMachineSettings
L9_1 = L9_1.attractions
L9_1 = L9_1.gforce
L9_1 = L9_1.disablemusic
L8_1.musicdisabled = L9_1
L8_1.music = false
L8_1.musicurl = ""
L8_1.musicvolume = 100
L8_1.musichandler = nil
L9_1 = Config
L9_1 = L9_1.ThemeParkControlMachineSettings
L9_1 = L9_1.attractions
L9_1 = L9_1.gforce
L9_1 = L9_1.musiccoords
L8_1.musiccoords = L9_1
L9_1 = Config
L9_1 = L9_1.ThemeParkControlMachineSettings
L9_1 = L9_1.attractions
L9_1 = L9_1.gforce
L9_1 = L9_1.musicmaxdistance
L8_1.musicmaxdistance = L9_1
L8_1.handler = nil
L9_1 = {}
L10_1 = Config
L10_1 = L10_1.ThemeParkControlMachineSettings
L10_1 = L10_1.attractions
L10_1 = L10_1.topscan
L10_1 = L10_1.coords
L9_1.coords = L10_1
L10_1 = Config
L10_1 = L10_1.ThemeParkControlMachineSettings
L10_1 = L10_1.attractions
L10_1 = L10_1.topscan
L10_1 = L10_1.rotation
L9_1.rotation = L10_1
L9_1.attractionid = 2
L10_1 = Config
L10_1 = L10_1.ThemeParkControlMachineSettings
L10_1 = L10_1.attractions
L10_1 = L10_1.topscan
L10_1 = L10_1.label
L9_1.label = L10_1
L9_1.using = false
L9_1.smokeactivated = false
L9_1.smokedisabled = true
L9_1.turndisabled = false
L10_1 = Config
L10_1 = L10_1.ThemeParkControlMachineSettings
L10_1 = L10_1.attractions
L10_1 = L10_1.topscan
L10_1 = L10_1.disablemusic
L9_1.musicdisabled = L10_1
L9_1.music = false
L9_1.musicurl = ""
L9_1.musicvolume = 100
L9_1.musichandler = nil
L10_1 = Config
L10_1 = L10_1.ThemeParkControlMachineSettings
L10_1 = L10_1.attractions
L10_1 = L10_1.topscan
L10_1 = L10_1.musiccoords
L9_1.musiccoords = L10_1
L10_1 = Config
L10_1 = L10_1.ThemeParkControlMachineSettings
L10_1 = L10_1.attractions
L10_1 = L10_1.topscan
L10_1 = L10_1.musicmaxdistance
L9_1.musicmaxdistance = L10_1
L9_1.handler = nil
L10_1 = {}
L11_1 = Config
L11_1 = L11_1.ThemeParkControlMachineSettings
L11_1 = L11_1.attractions
L11_1 = L11_1.ferris
L11_1 = L11_1.coords
L10_1.coords = L11_1
L11_1 = Config
L11_1 = L11_1.ThemeParkControlMachineSettings
L11_1 = L11_1.attractions
L11_1 = L11_1.ferris
L11_1 = L11_1.rotation
L10_1.rotation = L11_1
L10_1.attractionid = 7
L11_1 = Config
L11_1 = L11_1.ThemeParkControlMachineSettings
L11_1 = L11_1.attractions
L11_1 = L11_1.ferris
L11_1 = L11_1.label
L10_1.label = L11_1
L10_1.using = false
L10_1.smokeactivated = false
L10_1.smokedisabled = true
L10_1.turndisabled = false
L11_1 = Config
L11_1 = L11_1.ThemeParkControlMachineSettings
L11_1 = L11_1.attractions
L11_1 = L11_1.ferris
L11_1 = L11_1.disablemusic
L10_1.musicdisabled = L11_1
L10_1.music = false
L10_1.musicurl = ""
L10_1.musicvolume = 100
L10_1.musichandler = nil
L11_1 = Config
L11_1 = L11_1.ThemeParkControlMachineSettings
L11_1 = L11_1.attractions
L11_1 = L11_1.ferris
L11_1 = L11_1.musiccoords
L10_1.musiccoords = L11_1
L11_1 = Config
L11_1 = L11_1.ThemeParkControlMachineSettings
L11_1 = L11_1.attractions
L11_1 = L11_1.ferris
L11_1 = L11_1.musicmaxdistance
L10_1.musicmaxdistance = L11_1
L10_1.handler = nil
L11_1 = {}
L12_1 = Config
L12_1 = L12_1.ThemeParkControlMachineSettings
L12_1 = L12_1.attractions
L12_1 = L12_1.prater
L12_1 = L12_1.coords
L11_1.coords = L12_1
L12_1 = Config
L12_1 = L12_1.ThemeParkControlMachineSettings
L12_1 = L12_1.attractions
L12_1 = L12_1.prater
L12_1 = L12_1.rotation
L11_1.rotation = L12_1
L11_1.attractionid = 9
L12_1 = Config
L12_1 = L12_1.ThemeParkControlMachineSettings
L12_1 = L12_1.attractions
L12_1 = L12_1.prater
L12_1 = L12_1.label
L11_1.label = L12_1
L11_1.using = false
L11_1.smokeactivated = false
L11_1.smokedisabled = true
L11_1.turndisabled = false
L12_1 = Config
L12_1 = L12_1.ThemeParkControlMachineSettings
L12_1 = L12_1.attractions
L12_1 = L12_1.prater
L12_1 = L12_1.disablemusic
L11_1.musicdisabled = L12_1
L11_1.music = false
L11_1.musicurl = ""
L11_1.musicvolume = 100
L11_1.musichandler = nil
L12_1 = Config
L12_1 = L12_1.ThemeParkControlMachineSettings
L12_1 = L12_1.attractions
L12_1 = L12_1.prater
L12_1 = L12_1.musiccoords
L11_1.musiccoords = L12_1
L12_1 = Config
L12_1 = L12_1.ThemeParkControlMachineSettings
L12_1 = L12_1.attractions
L12_1 = L12_1.prater
L12_1 = L12_1.musicmaxdistance
L11_1.musicmaxdistance = L12_1
L11_1.handler = nil
L12_1 = {}
L13_1 = Config
L13_1 = L13_1.ThemeParkControlMachineSettings
L13_1 = L13_1.attractions
L13_1 = L13_1.brakedance
L13_1 = L13_1.coords
L12_1.coords = L13_1
L13_1 = Config
L13_1 = L13_1.ThemeParkControlMachineSettings
L13_1 = L13_1.attractions
L13_1 = L13_1.brakedance
L13_1 = L13_1.rotation
L12_1.rotation = L13_1
L12_1.attractionid = 10
L13_1 = Config
L13_1 = L13_1.ThemeParkControlMachineSettings
L13_1 = L13_1.attractions
L13_1 = L13_1.brakedance
L13_1 = L13_1.label
L12_1.label = L13_1
L12_1.using = false
L12_1.smokeactivated = false
L12_1.smokedisabled = true
L12_1.turndisabled = false
L13_1 = Config
L13_1 = L13_1.ThemeParkControlMachineSettings
L13_1 = L13_1.attractions
L13_1 = L13_1.brakedance
L13_1 = L13_1.disablemusic
L12_1.musicdisabled = L13_1
L12_1.music = false
L12_1.musicurl = ""
L12_1.musicvolume = 100
L12_1.musichandler = nil
L13_1 = Config
L13_1 = L13_1.ThemeParkControlMachineSettings
L13_1 = L13_1.attractions
L13_1 = L13_1.brakedance
L13_1 = L13_1.musiccoords
L12_1.musiccoords = L13_1
L13_1 = Config
L13_1 = L13_1.ThemeParkControlMachineSettings
L13_1 = L13_1.attractions
L13_1 = L13_1.brakedance
L13_1 = L13_1.musicmaxdistance
L12_1.musicmaxdistance = L13_1
L12_1.handler = nil
L13_1 = {}
L14_1 = Config
L14_1 = L14_1.ThemeParkControlMachineSettings
L14_1 = L14_1.attractions
L14_1 = L14_1.slingshot
L14_1 = L14_1.coords
L13_1.coords = L14_1
L14_1 = Config
L14_1 = L14_1.ThemeParkControlMachineSettings
L14_1 = L14_1.attractions
L14_1 = L14_1.slingshot
L14_1 = L14_1.rotation
L13_1.rotation = L14_1
L13_1.attractionid = 11
L14_1 = Config
L14_1 = L14_1.ThemeParkControlMachineSettings
L14_1 = L14_1.attractions
L14_1 = L14_1.slingshot
L14_1 = L14_1.label
L13_1.label = L14_1
L13_1.using = false
L13_1.smokeactivated = false
L13_1.smokedisabled = true
L13_1.turndisabled = false
L14_1 = Config
L14_1 = L14_1.ThemeParkControlMachineSettings
L14_1 = L14_1.attractions
L14_1 = L14_1.slingshot
L14_1 = L14_1.disablemusic
L13_1.musicdisabled = L14_1
L13_1.music = false
L13_1.musicurl = ""
L13_1.musicvolume = 100
L13_1.musichandler = nil
L14_1 = Config
L14_1 = L14_1.ThemeParkControlMachineSettings
L14_1 = L14_1.attractions
L14_1 = L14_1.slingshot
L14_1 = L14_1.musiccoords
L13_1.musiccoords = L14_1
L14_1 = Config
L14_1 = L14_1.ThemeParkControlMachineSettings
L14_1 = L14_1.attractions
L14_1 = L14_1.slingshot
L14_1 = L14_1.musicmaxdistance
L13_1.musicmaxdistance = L14_1
L13_1.handler = nil
L14_1 = {}
L15_1 = Config
L15_1 = L15_1.ThemeParkControlMachineSettings
L15_1 = L15_1.attractions
L15_1 = L15_1.carousel
L15_1 = L15_1.coords
L14_1.coords = L15_1
L15_1 = Config
L15_1 = L15_1.ThemeParkControlMachineSettings
L15_1 = L15_1.attractions
L15_1 = L15_1.carousel
L15_1 = L15_1.rotation
L14_1.rotation = L15_1
L14_1.attractionid = 12
L15_1 = Config
L15_1 = L15_1.ThemeParkControlMachineSettings
L15_1 = L15_1.attractions
L15_1 = L15_1.carousel
L15_1 = L15_1.label
L14_1.label = L15_1
L14_1.using = false
L14_1.smokeactivated = false
L14_1.smokedisabled = true
L14_1.turndisabled = false
L15_1 = Config
L15_1 = L15_1.ThemeParkControlMachineSettings
L15_1 = L15_1.attractions
L15_1 = L15_1.carousel
L15_1 = L15_1.disablemusic
L14_1.musicdisabled = L15_1
L14_1.music = false
L14_1.musicurl = ""
L14_1.musicvolume = 100
L14_1.musichandler = nil
L15_1 = Config
L15_1 = L15_1.ThemeParkControlMachineSettings
L15_1 = L15_1.attractions
L15_1 = L15_1.carousel
L15_1 = L15_1.musiccoords
L14_1.musiccoords = L15_1
L15_1 = Config
L15_1 = L15_1.ThemeParkControlMachineSettings
L15_1 = L15_1.attractions
L15_1 = L15_1.carousel
L15_1 = L15_1.musicmaxdistance
L14_1.musicmaxdistance = L15_1
L14_1.handler = nil
L15_1 = {}
L16_1 = Config
L16_1 = L16_1.ThemeParkControlMachineSettings
L16_1 = L16_1.attractions
L16_1 = L16_1.extasy
L16_1 = L16_1.coords
L15_1.coords = L16_1
L16_1 = Config
L16_1 = L16_1.ThemeParkControlMachineSettings
L16_1 = L16_1.attractions
L16_1 = L16_1.extasy
L16_1 = L16_1.rotation
L15_1.rotation = L16_1
L15_1.attractionid = 13
L16_1 = Config
L16_1 = L16_1.ThemeParkControlMachineSettings
L16_1 = L16_1.attractions
L16_1 = L16_1.extasy
L16_1 = L16_1.label
L15_1.label = L16_1
L15_1.using = false
L15_1.smokeactivated = false
L15_1.smokedisabled = true
L15_1.turndisabled = false
L16_1 = Config
L16_1 = L16_1.ThemeParkControlMachineSettings
L16_1 = L16_1.attractions
L16_1 = L16_1.extasy
L16_1 = L16_1.disablemusic
L15_1.musicdisabled = L16_1
L15_1.music = false
L15_1.musicurl = ""
L15_1.musicvolume = 100
L15_1.musichandler = nil
L16_1 = Config
L16_1 = L16_1.ThemeParkControlMachineSettings
L16_1 = L16_1.attractions
L16_1 = L16_1.extasy
L16_1 = L16_1.musiccoords
L15_1.musiccoords = L16_1
L16_1 = Config
L16_1 = L16_1.ThemeParkControlMachineSettings
L16_1 = L16_1.attractions
L16_1 = L16_1.extasy
L16_1 = L16_1.musicmaxdistance
L15_1.musicmaxdistance = L16_1
L15_1.handler = nil
L16_1 = {}
L17_1 = Config
L17_1 = L17_1.ThemeParkControlMachineSettings
L17_1 = L17_1.attractions
L17_1 = L17_1.spinride
L17_1 = L17_1.coords
L16_1.coords = L17_1
L17_1 = Config
L17_1 = L17_1.ThemeParkControlMachineSettings
L17_1 = L17_1.attractions
L17_1 = L17_1.spinride
L17_1 = L17_1.rotation
L16_1.rotation = L17_1
L16_1.attractionid = 14
L17_1 = Config
L17_1 = L17_1.ThemeParkControlMachineSettings
L17_1 = L17_1.attractions
L17_1 = L17_1.spinride
L17_1 = L17_1.label
L16_1.label = L17_1
L16_1.using = false
L16_1.smokeactivated = false
L16_1.smokedisabled = true
L16_1.turndisabled = false
L17_1 = Config
L17_1 = L17_1.ThemeParkControlMachineSettings
L17_1 = L17_1.attractions
L17_1 = L17_1.spinride
L17_1 = L17_1.disablemusic
L16_1.musicdisabled = L17_1
L16_1.music = false
L16_1.musicurl = ""
L16_1.musicvolume = 100
L16_1.musichandler = nil
L17_1 = Config
L17_1 = L17_1.ThemeParkControlMachineSettings
L17_1 = L17_1.attractions
L17_1 = L17_1.spinride
L17_1 = L17_1.musiccoords
L16_1.musiccoords = L17_1
L17_1 = Config
L17_1 = L17_1.ThemeParkControlMachineSettings
L17_1 = L17_1.attractions
L17_1 = L17_1.spinride
L17_1 = L17_1.musicmaxdistance
L16_1.musicmaxdistance = L17_1
L16_1.handler = nil
L17_1 = {}
L18_1 = Config
L18_1 = L18_1.ThemeParkControlMachineSettings
L18_1 = L18_1.attractions
L18_1 = L18_1.hauntedhouse
L18_1 = L18_1.coords
L17_1.coords = L18_1
L18_1 = Config
L18_1 = L18_1.ThemeParkControlMachineSettings
L18_1 = L18_1.attractions
L18_1 = L18_1.hauntedhouse
L18_1 = L18_1.rotation
L17_1.rotation = L18_1
L17_1.attractionid = 15
L18_1 = Config
L18_1 = L18_1.ThemeParkControlMachineSettings
L18_1 = L18_1.attractions
L18_1 = L18_1.hauntedhouse
L18_1 = L18_1.label
L17_1.label = L18_1
L17_1.using = false
L17_1.smokeactivated = false
L17_1.smokedisabled = true
L17_1.turndisabled = false
L17_1.musicdisabled = true
L17_1.music = false
L17_1.musicurl = ""
L17_1.musicvolume = 100
L17_1.musichandler = nil
L18_1 = vector3
L19_1 = 0.0
L20_1 = 0.0
L21_1 = 0.0
L18_1 = L18_1(L19_1, L20_1, L21_1)
L17_1.musiccoords = L18_1
L17_1.musicmaxdistance = 0.0
L17_1.handler = nil
L18_1 = {}
L19_1 = Config
L19_1 = L19_1.ThemeParkControlMachineSettings
L19_1 = L19_1.attractions
L19_1 = L19_1.rollercoaster2
L19_1 = L19_1.coords
L18_1.coords = L19_1
L19_1 = Config
L19_1 = L19_1.ThemeParkControlMachineSettings
L19_1 = L19_1.attractions
L19_1 = L19_1.rollercoaster2
L19_1 = L19_1.rotation
L18_1.rotation = L19_1
L18_1.attractionid = 16
L19_1 = Config
L19_1 = L19_1.ThemeParkControlMachineSettings
L19_1 = L19_1.attractions
L19_1 = L19_1.rollercoaster2
L19_1 = L19_1.label
L18_1.label = L19_1
L18_1.using = false
L18_1.smokeactivated = false
L18_1.smokedisabled = true
L18_1.turndisabled = false
L19_1 = Config
L19_1 = L19_1.ThemeParkControlMachineSettings
L19_1 = L19_1.attractions
L19_1 = L19_1.rollercoaster2
L19_1 = L19_1.disablemusic
L18_1.musicdisabled = L19_1
L18_1.music = false
L18_1.musicurl = ""
L18_1.musicvolume = 100
L18_1.musichandler = nil
L19_1 = Config
L19_1 = L19_1.ThemeParkControlMachineSettings
L19_1 = L19_1.attractions
L19_1 = L19_1.rollercoaster2
L19_1 = L19_1.musiccoords
L18_1.musiccoords = L19_1
L19_1 = Config
L19_1 = L19_1.ThemeParkControlMachineSettings
L19_1 = L19_1.attractions
L19_1 = L19_1.rollercoaster2
L19_1 = L19_1.musicmaxdistance
L18_1.musicmaxdistance = L19_1
L18_1.handler = nil
L19_1 = {}
L20_1 = Config
L20_1 = L20_1.ThemeParkControlMachineSettings
L20_1 = L20_1.attractions
L20_1 = L20_1.cannon
L20_1 = L20_1.coords
L19_1.coords = L20_1
L20_1 = Config
L20_1 = L20_1.ThemeParkControlMachineSettings
L20_1 = L20_1.attractions
L20_1 = L20_1.cannon
L20_1 = L20_1.rotation
L19_1.rotation = L20_1
L19_1.attractionid = 17
L20_1 = Config
L20_1 = L20_1.ThemeParkControlMachineSettings
L20_1 = L20_1.attractions
L20_1 = L20_1.cannon
L20_1 = L20_1.label
L19_1.label = L20_1
L19_1.using = false
L19_1.smokeactivated = false
L19_1.smokedisabled = true
L19_1.turndisabled = false
L20_1 = Config
L20_1 = L20_1.ThemeParkControlMachineSettings
L20_1 = L20_1.attractions
L20_1 = L20_1.cannon
L20_1 = L20_1.disablemusic
L19_1.musicdisabled = L20_1
L19_1.music = false
L19_1.musicurl = ""
L19_1.musicvolume = 100
L19_1.musichandler = nil
L20_1 = vector3
L21_1 = 0.0
L22_1 = 0.0
L23_1 = 0.0
L20_1 = L20_1(L21_1, L22_1, L23_1)
L19_1.musiccoords = L20_1
L19_1.musicmaxdistance = 0.0
L19_1.handler = nil
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L2_1[12] = L14_1
L2_1[13] = L15_1
L2_1[14] = L16_1
L2_1[15] = L17_1
L2_1[16] = L18_1
L2_1[17] = L19_1
controlmachines = L2_1
L2_1 = vector3
L3_1 = -1646.97
L4_1 = -1083.27
L5_1 = 12.15
L2_1 = L2_1(L3_1, L4_1, L5_1)
inmanagmentmenu = false
nearbymanagmentmenu = false
parkcammanagment = nil
iteminhand = false
iteminhandtype = ""
iteminhandballonid = 1
L3_1 = false
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = AddTextEntry
  L2_2 = "gtavclassicinteractionrtxtheme"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = BeginTextCommandDisplayHelp
  L2_2 = "gtavclassicinteractionrtxtheme"
  L1_2(L2_2)
  L1_2 = EndTextCommandDisplayHelp
  L2_2 = 0
  L3_2 = false
  L4_2 = true
  L5_2 = -1
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
ShowGtaClassicInteraction = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L0_2 = true
  L3_1 = L0_2
  L0_2 = Config
  L0_2 = L0_2.ThemeParkCanBeOwned
  if L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "coords"
    L2_2 = "themeparkmanagment"
    L3_2 = Config
    L3_2 = L3_2.ThemeParkOwnedSettings
    L3_2 = L3_2.themeparkcoords
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.ThemeParkOwnedSettings
    L5_2 = L5_2.themeparkdistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.openthemeparkmanagment
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.managmenticon
    L8_2 = "rtx_themepark:Global:ManagmentMenuTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = ipairs
  L1_2 = ticketmachines
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L5_2.disabled
    if false == L6_2 then
      L6_2 = AddTargetZone
      L7_2 = "coords"
      L8_2 = "themeparkticketbuy"
      L9_2 = L4_2
      L10_2 = ""
      L8_2 = L8_2 .. L9_2 .. L10_2
      L9_2 = L5_2.coords
      L10_2 = 0.0
      L11_2 = Config
      L11_2 = L11_2.ThemeParkTicketMachineSettings
      L11_2 = L11_2.usedistance
      L12_2 = Language
      L13_2 = Config
      L13_2 = L13_2.Language
      L12_2 = L12_2[L13_2]
      L12_2 = L12_2.openthemeparkticket
      L13_2 = Config
      L13_2 = L13_2.TargetIcons
      L13_2 = L13_2.ticketicon
      L14_2 = "rtx_themepark:Global:OpenTicketMachineTarget"
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    end
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.bumpercars
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "coords"
    L2_2 = "themeparkticketbumper"
    L3_2 = bumperhandler
    L3_2 = L3_2.coordsbuy
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.ThemeParkTicketMachineSettings
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.openthemeparkticket
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.ticketicon
    L8_2 = "rtx_themepark:Bumper:OpenTicketTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.rollercoaster
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = ipairs
    L1_2 = rollercoasterhandler
    L1_2 = L1_2.carts
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = ipairs
      L7_2 = L5_2.platforms
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
      for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
        L12_2 = AddTargetZone
        L13_2 = "coords"
        L14_2 = "themeparkrollercoasteruse"
        L15_2 = L4_2
        L16_2 = "-"
        L17_2 = L10_2
        L18_2 = ""
        L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
        L15_2 = L11_2.coords
        L16_2 = 0.0
        L17_2 = Config
        L17_2 = L17_2.AttractionsSettings
        L17_2 = L17_2.rollercoaster
        L17_2 = L17_2.usedistance
        L18_2 = Language
        L19_2 = Config
        L19_2 = L19_2.Language
        L18_2 = L18_2[L19_2]
        L18_2 = L18_2.bindrollercoasterseatuse
        L19_2 = Config
        L19_2 = L19_2.TargetIcons
        L19_2 = L19_2.seaticon
        L20_2 = "rtx_themepark:Rollercoaster:SeatUseTarget"
        L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      end
    end
  end
  L0_2 = ipairs
  L1_2 = shooterhandler
  L1_2 = L1_2.shooters
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = AddTargetZone
    L7_2 = "coords"
    L8_2 = "themeparkshootingrangeuse"
    L9_2 = L4_2
    L10_2 = ""
    L8_2 = L8_2 .. L9_2 .. L10_2
    L9_2 = L5_2.coords
    L10_2 = 0.0
    L11_2 = Config
    L11_2 = L11_2.AttractionsSettings
    L11_2 = L11_2.shootingrange
    L11_2 = L11_2.usedistance
    L12_2 = Language
    L13_2 = Config
    L13_2 = L13_2.Language
    L12_2 = L12_2[L13_2]
    L12_2 = L12_2.playshootingrange
    L13_2 = Config
    L13_2 = L13_2.TargetIcons
    L13_2 = L13_2.seaticon
    L14_2 = "rtx_themepark:Shooter:UseShooter"
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L0_2 = ipairs
  L1_2 = Config
  L1_2 = L1_2.Stands
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = AddTargetZone
    L7_2 = "coords"
    L8_2 = "themeparkstandbuy"
    L9_2 = L4_2
    L10_2 = ""
    L8_2 = L8_2 .. L9_2 .. L10_2
    L9_2 = L5_2.coords
    L10_2 = 0.0
    L11_2 = Config
    L11_2 = L11_2.ThemeParkItemsSettings
    L11_2 = L11_2.buydistance
    L12_2 = Language
    L13_2 = Config
    L13_2 = L13_2.Language
    L12_2 = L12_2[L13_2]
    L12_2 = L12_2.buyitem
    L13_2 = Config
    L13_2 = L13_2.TargetIcons
    L13_2 = L13_2.buyicon
    L14_2 = "rtx_themepark:Global:BuyStandItemTarget"
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L0_2 = Config
  L0_2 = L0_2.ThemeParkControlAttractions
  if L0_2 then
    L0_2 = ipairs
    L1_2 = controlmachines
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = AddTargetZone
      L7_2 = "coords"
      L8_2 = "themeparkcontrolmachineuse"
      L9_2 = L4_2
      L10_2 = ""
      L8_2 = L8_2 .. L9_2 .. L10_2
      L9_2 = L5_2.coords
      L10_2 = 0.0
      L11_2 = Config
      L11_2 = L11_2.ThemeParkControlMachineSettings
      L11_2 = L11_2.usedistance
      L12_2 = Language
      L13_2 = Config
      L13_2 = L13_2.Language
      L12_2 = L12_2[L13_2]
      L12_2 = L12_2.controlattraction
      L13_2 = Config
      L13_2 = L13_2.TargetIcons
      L13_2 = L13_2.controlicon
      L14_2 = "rtx_themepark:Global:ControlAttractionTarget"
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    end
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.gforce
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkgforceuse"
    L3_2 = "sempre_delperropier_gbooster_sedacka"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.gforce
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:GForce:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.topscan
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparktopscanuse"
    L3_2 = "sempre_delperropier_topscan_sedacka"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.topscan
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:TopScan:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.vortex
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkvortexuse"
    L3_2 = "sempre_delperropier_vortex_sedacka"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.vortex
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Vortex:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.detonator
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkdetonatoruse"
    L3_2 = "sempre_delperropier_detonator_sedacka"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.detonator
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Detonator:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.boat
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkboatuse"
    L3_2 = "sempre_delperropier_boat_lodka"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.boat
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Boat:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.ferris
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkferrisuse"
    L3_2 = "sempre_delperropier_ferris_sedacka"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.ferris
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Ferris:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.rollercoaster
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkrollercoaster1use"
    L3_2 = "ind_prop_dlc_roller_car"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.rollercoaster
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Rollercoaster:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.rollercoaster
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkrollercoaster12use"
    L3_2 = "ind_prop_dlc_roller_car_02"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.rollercoaster
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Rollercoaster:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.prater
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkprateruse"
    L3_2 = "sempre_delperropier_prater_sedacka"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.prater
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Prater:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.brakedance
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkbreakdance1use"
    L3_2 = "sempre_delperropier_breakdance_auticko"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.brakedance
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:BrakeDance:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.brakedance
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkbreakdance2use"
    L3_2 = "sempre_delperropier_breakdance_auticko_01"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.brakedance
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:BrakeDance:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.slingshot
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkslingshotuse"
    L3_2 = "sempre_delperropier_slingshot_sedacka"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.slingshot
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:SlingShot:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.carousel
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkcarouseluse"
    L3_2 = "sempre_delperropier_carousel_horse"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.carousel
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Carousel:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.extasy
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkextasyuse"
    L3_2 = "sempre_delperropier_extasy_seat"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.extasy
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Extasy:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.spinride
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkspinrideuse"
    L3_2 = "sempre_delperropier_spinride_seat"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.spinride
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:SpinRide:SeatTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.hauntedhouse
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkhauntedhouseuse"
    L3_2 = "sempre_delperropier_hauntedhouse_vozik"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.hauntedhouse
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:HauntedHouse:SeatUseTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.rollercoaster2
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "model"
    L2_2 = "themeparkrollercoasteruse"
    L3_2 = "sempre_delperropier_rollercoaster_vozik"
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.rollercoaster2
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Rollercoaster2:SeatUseTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L0_2 = Config
  L0_2 = L0_2.AttractionsSettings
  L0_2 = L0_2.cannon
  L0_2 = L0_2.disable
  if false == L0_2 then
    L0_2 = AddTargetZone
    L1_2 = "coords"
    L2_2 = "themeparkcannonuse"
    L3_2 = vector3
    L4_2 = -1648.38
    L5_2 = -1195.84
    L6_2 = 14.2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L4_2 = 0.0
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.cannon
    L5_2 = L5_2.usedistance
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.bindseatuse
    L7_2 = Config
    L7_2 = L7_2.TargetIcons
    L7_2 = L7_2.seaticon
    L8_2 = "rtx_themepark:Cannon:SeatUseTarget"
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
end
CreateTargets = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = {}
  L1_2 = ipairs
  L2_2 = GetActivePlayers
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L2_2()
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = GetPlayerPed
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L8_2 = DoesEntityExist
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = L0_2
      L10_2 = L6_2
      L8_2(L9_2, L10_2)
    end
  end
  return L0_2
end
GetPlayers = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if nil == A0_2 then
    L1_2 = GetEntityCoords
    L2_2 = GetPlayerPed
    L3_2 = tonumber
    L4_2 = "-1"
    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L3_2(L4_2)
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    A0_2 = L1_2
  end
  L1_2 = GetPlayerFromCoords
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = tonumber
  L3_2 = "-1"
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = "-1"
  L3_2 = L3_2(L4_2)
  L4_2 = 1
  L5_2 = #L1_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L1_2[L7_2]
    L9_2 = PlayerId
    L9_2 = L9_2()
    if L8_2 ~= L9_2 then
      L8_2 = L1_2[L7_2]
      L9_2 = tonumber
      L10_2 = "-1"
      L9_2 = L9_2(L10_2)
      if L8_2 ~= L9_2 then
        L8_2 = GetEntityCoords
        L9_2 = GetPlayerPed
        L10_2 = L1_2[L7_2]
        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L9_2(L10_2)
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        L9_2 = GetDistanceBetweenCoords
        L10_2 = L8_2.x
        L11_2 = L8_2.y
        L12_2 = L8_2.z
        L13_2 = A0_2.x
        L14_2 = A0_2.y
        L15_2 = A0_2.z
        L16_2 = true
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        L10_2 = tonumber
        L11_2 = "-1"
        L10_2 = L10_2(L11_2)
        if L2_2 == L10_2 or L2_2 > L9_2 then
          L3_2 = L1_2[L7_2]
          L2_2 = L9_2
        end
      end
    end
  end
  L4_2 = L3_2
  L5_2 = L2_2
  return L4_2, L5_2
end
GetClosestPlayer = L4_1
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = GetPlayers
  L2_2 = L2_2()
  L3_2 = {}
  if nil == A0_2 then
    L4_2 = GetEntityCoords
    L5_2 = GetPlayerPed
    L6_2 = tonumber
    L7_2 = "-1"
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L6_2(L7_2)
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    A0_2 = L4_2
  end
  if nil == A1_2 then
    L4_2 = tonumber
    L5_2 = "5.0"
    L4_2 = L4_2(L5_2)
    A1_2 = L4_2
  end
  L4_2 = pairs
  L5_2 = L2_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = GetPlayerPed
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    L11_2 = GetEntityCoords
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    L12_2 = GetDistanceBetweenCoords
    L13_2 = L11_2
    L14_2 = A0_2.x
    L15_2 = A0_2.y
    L16_2 = A0_2.z
    L17_2 = true
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
    if A1_2 >= L12_2 then
      L13_2 = table
      L13_2 = L13_2.insert
      L14_2 = L3_2
      L15_2 = L9_2
      L13_2(L14_2, L15_2)
    end
  end
  return L3_2
end
GetPlayerFromCoords = L4_1
function L4_1(A0_2, ...)
  local L1_2, L2_2, L3_2
  L1_2 = string
  L1_2 = L1_2.format
  L2_2 = Language
  L3_2 = Config
  L3_2 = L3_2.Language
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2[A0_2]
  L3_2 = ...
  return L1_2(L2_2, L3_2)
end
LanguageFile2 = L4_1
function L4_1(A0_2, ...)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = tostring
  L2_2 = LanguageFile2
  L3_2 = A0_2
  L4_2, L5_2 = ...
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = L2_2
  L2_2 = L2_2.gsub
  L4_2 = "^%l"
  L5_2 = string
  L5_2 = L5_2.upper
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2, L5_2)
  return L1_2(L2_2, L3_2, L4_2, L5_2)
end
LanguageFile = L4_1
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A1_2 and A1_2 > 0 then
    L2_2 = 10
    L2_2 = L2_2 ^ A1_2
    L3_2 = math
    L3_2 = L3_2.floor
    L4_2 = A0_2 * L2_2
    L4_2 = L4_2 + 0.5
    L3_2 = L3_2(L4_2)
    L3_2 = L3_2 / L2_2
    return L3_2
  end
  L2_2 = math
  L2_2 = L2_2.floor
  L3_2 = A0_2 + 0.5
  return L2_2(L3_2)
end
round = L4_1
function L4_1()
  local L0_2, L1_2
  L0_2 = usingattraction
  return L0_2
end
IsPlayerOnRide = L4_1
L4_1 = false
function L5_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L4_1
  if false == L0_2 then
    L0_2 = true
    L4_1 = L0_2
    L0_2 = AddBlipForCoord
    L1_2 = Config
    L1_2 = L1_2.ThemeParkBlip
    L1_2 = L1_2.blipcoords
    L1_2 = L1_2.x
    L2_2 = Config
    L2_2 = L2_2.ThemeParkBlip
    L2_2 = L2_2.blipcoords
    L2_2 = L2_2.y
    L3_2 = Config
    L3_2 = L3_2.ThemeParkBlip
    L3_2 = L3_2.blipcoords
    L3_2 = L3_2.z
    L0_2 = L0_2(L1_2, L2_2, L3_2)
    L1_2 = SetBlipSprite
    L2_2 = L0_2
    L3_2 = Config
    L3_2 = L3_2.ThemeParkBlip
    L3_2 = L3_2.blipiconid
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipDisplay
    L2_2 = L0_2
    L3_2 = Config
    L3_2 = L3_2.ThemeParkBlip
    L3_2 = L3_2.blipdisplay
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipScale
    L2_2 = L0_2
    L3_2 = Config
    L3_2 = L3_2.ThemeParkBlip
    L3_2 = L3_2.blipscale
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipColour
    L2_2 = L0_2
    L3_2 = Config
    L3_2 = L3_2.ThemeParkBlip
    L3_2 = L3_2.blipcolor
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipAsShortRange
    L2_2 = L0_2
    L3_2 = Config
    L3_2 = L3_2.ThemeParkBlip
    L3_2 = L3_2.blipshortrange
    L1_2(L2_2, L3_2)
    L1_2 = BeginTextCommandSetBlipName
    L2_2 = "STRING"
    L1_2(L2_2)
    L1_2 = AddTextComponentSubstringPlayerName
    L2_2 = Config
    L2_2 = L2_2.ThemeParkBlip
    L2_2 = L2_2.bliptext
    L1_2(L2_2)
    L1_2 = EndTextCommandSetBlipName
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
CreateThemeParkBlip = L5_1
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:Global:AttractionUsing"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:Global:AttractionUsing"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2
  usingattraction = A0_2
  L1_2 = TriggerServerEvent
  L2_2 = "rtx_themepark:Global:UsingAttractionPlayer"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:Notify"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:Notify"
function L7_1(A0_2)
  local L1_2, L2_2
  L1_2 = Notify
  L2_2 = A0_2
  L1_2(L2_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:Global:TicketHandler"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:Global:TicketHandler"
function L7_1(A0_2, A1_2)
  local L2_2
  if 1 == A0_2 then
    L2_2 = tickets
    L2_2.gforce = A1_2
  elseif 2 == A0_2 then
    L2_2 = tickets
    L2_2.topscan = A1_2
  elseif 3 == A0_2 then
    L2_2 = tickets
    L2_2.vortex = A1_2
  elseif 4 == A0_2 then
    L2_2 = tickets
    L2_2.detonator = A1_2
  elseif 5 == A0_2 then
    L2_2 = tickets
    L2_2.boat = A1_2
  elseif 6 == A0_2 then
    L2_2 = tickets
    L2_2.ferris = A1_2
  elseif 7 == A0_2 then
    L2_2 = tickets
    L2_2.rollercoaster = A1_2
  elseif 8 == A0_2 then
    L2_2 = tickets
    L2_2.shootingrange = A1_2
  elseif 9 == A0_2 then
    L2_2 = tickets
    L2_2.bumpercars = A1_2
  elseif 10 == A0_2 then
    L2_2 = tickets
    L2_2.prater = A1_2
  elseif 11 == A0_2 then
    L2_2 = tickets
    L2_2.brakedance = A1_2
  elseif 12 == A0_2 then
    L2_2 = tickets
    L2_2.slingshot = A1_2
  elseif 13 == A0_2 then
    L2_2 = tickets
    L2_2.carousel = A1_2
  elseif 14 == A0_2 then
    L2_2 = tickets
    L2_2.extasy = A1_2
  elseif 15 == A0_2 then
    L2_2 = tickets
    L2_2.spinride = A1_2
  elseif 16 == A0_2 then
    L2_2 = tickets
    L2_2.hauntedhouse = A1_2
  elseif 17 == A0_2 then
    L2_2 = tickets
    L2_2.rollercoaster2 = A1_2
  elseif 18 == A0_2 then
    L2_2 = tickets
    L2_2.cannon = A1_2
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:Global:OpenTicketMachineMenuClient"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:Global:OpenTicketMachineMenuClient"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = inticketmachinemenu
  if false == L1_2 then
    L1_2 = SendNUIMessage
    L2_2 = {}
    L2_2.message = "updateinterfacedata"
    L3_2 = Config
    L3_2 = L3_2.InterfaceColor
    L2_2.interfacecolordata = L3_2
    L3_2 = tostring
    L4_2 = GetCurrentResourceName
    L4_2 = L4_2()
    L3_2 = L3_2(L4_2)
    L2_2.themeparkresourcenamedata = L3_2
    L1_2(L2_2)
    L1_2 = ticketmachines
    L1_2 = L1_2[A0_2]
    ticketmachineid = A0_2
    inticketmachinemenu = true
    L2_2 = SetNuiFocus
    L3_2 = true
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "attractionbuyticketshow"
    L4_2 = L1_2.ticketprice
    L3_2.ticketprice = L4_2
    L2_2(L3_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = Config
L5_1 = L5_1.Target
if true == L5_1 then
  L5_1 = RegisterNetEvent
  L6_1 = "rtx_themepark:Global:OpenTicketMachineTarget"
  L5_1(L6_1)
  L5_1 = AddEventHandler
  L6_1 = "rtx_themepark:Global:OpenTicketMachineTarget"
  function L7_1()
    local L0_2, L1_2, L2_2
    L0_2 = inticketmachinemenu
    if false == L0_2 then
      L0_2 = usingattraction
      if false == L0_2 then
        L0_2 = nearbyticketmachineid
        if nil ~= L0_2 then
          L0_2 = iteminhand
          if false == L0_2 then
            L0_2 = TriggerServerEvent
            L1_2 = "rtx_themepark:Global:OpenTicketMachineMenu"
            L2_2 = nearbyticketmachineid
            L0_2(L1_2, L2_2)
          else
            L0_2 = Notify
            L1_2 = Language
            L2_2 = Config
            L2_2 = L2_2.Language
            L1_2 = L1_2[L2_2]
            L1_2 = L1_2.iteminhand
            L0_2(L1_2)
          end
        end
      end
    end
  end
  L5_1(L6_1, L7_1)
  L5_1 = RegisterNetEvent
  L6_1 = "rtx_themepark:Global:BuyStandItemTarget"
  L5_1(L6_1)
  L5_1 = AddEventHandler
  L6_1 = "rtx_themepark:Global:BuyStandItemTarget"
  function L7_1()
    local L0_2, L1_2, L2_2
    L0_2 = iteminhand
    if false == L0_2 then
      L0_2 = nearbystandid
      if nil ~= L0_2 then
        L0_2 = TriggerServerEvent
        L1_2 = "rtx_themepark:Global:BuyItemToHand"
        L2_2 = nearbystandid
        L0_2(L1_2, L2_2)
        nearbystandid = nil
      end
    end
  end
  L5_1(L6_1, L7_1)
end
L5_1 = {}
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:Global:InHandItem"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:Global:InHandItem"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2
  if "hotdog" == A0_2 then
    L2_2 = IncreaseHunger
    L3_2 = "hotdog"
    L2_2(L3_2)
  elseif "juice" == A0_2 then
    L2_2 = IncreaseHunger
    L3_2 = "juice"
    L2_2(L3_2)
  elseif "burger" == A0_2 then
    L2_2 = IncreaseHunger
    L3_2 = "burger"
    L2_2(L3_2)
  elseif "popcorn" == A0_2 then
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "iteminhandshow"
    L2_2(L3_2)
    iteminhand = true
    iteminhandtype = A0_2
  elseif "cotton" == A0_2 then
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "iteminhandshow"
    L2_2(L3_2)
    iteminhand = true
    iteminhandtype = A0_2
  elseif "balloon" == A0_2 then
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "iteminhandshow"
    L2_2(L3_2)
    iteminhandballonid = A1_2
    iteminhand = true
    iteminhandtype = A0_2
  end
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:Global:InHandItemRemoveInterface"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:Global:InHandItemRemoveInterface"
function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.message = "hideiteminhand"
  L0_2(L1_2)
  iteminhand = false
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = ClearPedTasks
  L2_2 = L0_2
  L1_2(L2_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:Global:GiveHandItem"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:Global:GiveHandItem"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L3_2 = GetPlayerFromServerId
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if -1 ~= L3_2 then
    L4_2 = GetPlayerPed
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = DoesEntityExist
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = L5_1
      L5_2 = L5_2[A0_2]
      if nil ~= L5_2 then
        L5_2 = DoesEntityExist
        L6_2 = L5_1
        L6_2 = L6_2[A0_2]
        L5_2 = L5_2(L6_2)
        if L5_2 then
          L5_2 = DeleteEntity
          L6_2 = L5_1
          L6_2 = L6_2[A0_2]
          L5_2(L6_2)
        end
      end
      if "hotdog" == A1_2 then
        L5_2 = GetEntityCoords
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L6_2 = GetHashKey
        L7_2 = "prop_cs_hotdog_02"
        L6_2 = L6_2(L7_2)
        L7_2 = RequestModel
        L8_2 = L6_2
        L7_2(L8_2)
        while true do
          L7_2 = HasModelLoaded
          L8_2 = L6_2
          L7_2 = L7_2(L8_2)
          if L7_2 then
            break
          end
          L7_2 = RequestModel
          L8_2 = L6_2
          L7_2(L8_2)
          L7_2 = Citizen
          L7_2 = L7_2.Wait
          L8_2 = 5
          L7_2(L8_2)
        end
        L7_2 = L5_1
        L8_2 = CreateObject
        L9_2 = L6_2
        L10_2 = L5_2.x
        L11_2 = L5_2.y
        L12_2 = L5_2.z
        L12_2 = L12_2 + 0.2
        L13_2 = false
        L14_2 = true
        L15_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        L7_2[A0_2] = L8_2
        L7_2 = GetPedBoneIndex
        L8_2 = L4_2
        L9_2 = 60309
        L7_2 = L7_2(L8_2, L9_2)
        L8_2 = AttachEntityToEntity
        L9_2 = L5_1
        L9_2 = L9_2[A0_2]
        L10_2 = L4_2
        L11_2 = L7_2
        L12_2 = -0.03
        L13_2 = 0.01
        L14_2 = -0.01
        L15_2 = 95.1071
        L16_2 = 94.7001
        L17_2 = -66.9179
        L18_2 = true
        L19_2 = true
        L20_2 = false
        L21_2 = true
        L22_2 = 1
        L23_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
        L8_2 = "mp_player_inteat@burger"
        while true do
          L9_2 = HasAnimDictLoaded
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          if L9_2 then
            break
          end
          L9_2 = RequestAnimDict
          L10_2 = L8_2
          L9_2(L10_2)
          L9_2 = Citizen
          L9_2 = L9_2.Wait
          L10_2 = 5
          L9_2(L10_2)
        end
        L9_2 = TaskPlayAnim
        L10_2 = L4_2
        L11_2 = L8_2
        L12_2 = "mp_player_int_eat_burger"
        L13_2 = 8.0
        L14_2 = 8.0
        L15_2 = -1
        L16_2 = 51
        L17_2 = 0
        L18_2 = 0
        L19_2 = 0
        L20_2 = 0
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L9_2 = IncreaseHunger
        L10_2 = "hotdog"
        L9_2(L10_2)
      elseif "juice" == A1_2 then
        L5_2 = GetEntityCoords
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L6_2 = GetHashKey
        L7_2 = "prop_plastic_cup_02"
        L6_2 = L6_2(L7_2)
        L7_2 = RequestModel
        L8_2 = L6_2
        L7_2(L8_2)
        while true do
          L7_2 = HasModelLoaded
          L8_2 = L6_2
          L7_2 = L7_2(L8_2)
          if L7_2 then
            break
          end
          L7_2 = RequestModel
          L8_2 = L6_2
          L7_2(L8_2)
          L7_2 = Citizen
          L7_2 = L7_2.Wait
          L8_2 = 5
          L7_2(L8_2)
        end
        L7_2 = L5_1
        L8_2 = CreateObject
        L9_2 = L6_2
        L10_2 = L5_2.x
        L11_2 = L5_2.y
        L12_2 = L5_2.z
        L12_2 = L12_2 + 0.2
        L13_2 = false
        L14_2 = true
        L15_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        L7_2[A0_2] = L8_2
        L7_2 = GetPedBoneIndex
        L8_2 = L4_2
        L9_2 = 28422
        L7_2 = L7_2(L8_2, L9_2)
        L8_2 = AttachEntityToEntity
        L9_2 = L5_1
        L9_2 = L9_2[A0_2]
        L10_2 = L4_2
        L11_2 = L7_2
        L12_2 = 0.0
        L13_2 = 0.0
        L14_2 = 0.0
        L15_2 = 0.0
        L16_2 = 0.0
        L17_2 = 0.0
        L18_2 = true
        L19_2 = true
        L20_2 = false
        L21_2 = true
        L22_2 = 1
        L23_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
        L8_2 = "amb@world_human_drinking@coffee@male@idle_a"
        while true do
          L9_2 = HasAnimDictLoaded
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          if L9_2 then
            break
          end
          L9_2 = RequestAnimDict
          L10_2 = L8_2
          L9_2(L10_2)
          L9_2 = Citizen
          L9_2 = L9_2.Wait
          L10_2 = 5
          L9_2(L10_2)
        end
        L9_2 = TaskPlayAnim
        L10_2 = L4_2
        L11_2 = L8_2
        L12_2 = "idle_a"
        L13_2 = 8.0
        L14_2 = 8.0
        L15_2 = -1
        L16_2 = 51
        L17_2 = 0
        L18_2 = 0
        L19_2 = 0
        L20_2 = 0
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L9_2 = IncreaseHunger
        L10_2 = "juice"
        L9_2(L10_2)
      elseif "burger" == A1_2 then
        L5_2 = GetEntityCoords
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L6_2 = GetHashKey
        L7_2 = "prop_cs_burger_01"
        L6_2 = L6_2(L7_2)
        L7_2 = RequestModel
        L8_2 = L6_2
        L7_2(L8_2)
        while true do
          L7_2 = HasModelLoaded
          L8_2 = L6_2
          L7_2 = L7_2(L8_2)
          if L7_2 then
            break
          end
          L7_2 = RequestModel
          L8_2 = L6_2
          L7_2(L8_2)
          L7_2 = Citizen
          L7_2 = L7_2.Wait
          L8_2 = 5
          L7_2(L8_2)
        end
        L7_2 = L5_1
        L8_2 = CreateObject
        L9_2 = L6_2
        L10_2 = L5_2.x
        L11_2 = L5_2.y
        L12_2 = L5_2.z
        L12_2 = L12_2 + 0.2
        L13_2 = false
        L14_2 = true
        L15_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        L7_2[A0_2] = L8_2
        L7_2 = GetPedBoneIndex
        L8_2 = L4_2
        L9_2 = 18905
        L7_2 = L7_2(L8_2, L9_2)
        L8_2 = AttachEntityToEntity
        L9_2 = L5_1
        L9_2 = L9_2[A0_2]
        L10_2 = L4_2
        L11_2 = L7_2
        L12_2 = 0.13
        L13_2 = 0.05
        L14_2 = 0.02
        L15_2 = -50.0
        L16_2 = 16.0
        L17_2 = 60.0
        L18_2 = true
        L19_2 = true
        L20_2 = false
        L21_2 = true
        L22_2 = 1
        L23_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
        L8_2 = "mp_player_inteat@burger"
        while true do
          L9_2 = HasAnimDictLoaded
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          if L9_2 then
            break
          end
          L9_2 = RequestAnimDict
          L10_2 = L8_2
          L9_2(L10_2)
          L9_2 = Citizen
          L9_2 = L9_2.Wait
          L10_2 = 5
          L9_2(L10_2)
        end
        L9_2 = TaskPlayAnim
        L10_2 = L4_2
        L11_2 = L8_2
        L12_2 = "mp_player_int_eat_burger"
        L13_2 = 8.0
        L14_2 = 8.0
        L15_2 = -1
        L16_2 = 51
        L17_2 = 0
        L18_2 = 0
        L19_2 = 0
        L20_2 = 0
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L9_2 = IncreaseHunger
        L10_2 = "burger"
        L9_2(L10_2)
      elseif "popcorn" == A1_2 then
        L5_2 = GetEntityCoords
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L6_2 = GetHashKey
        L7_2 = "sempre_delperropier_popcorn_box"
        L6_2 = L6_2(L7_2)
        L7_2 = RequestModel
        L8_2 = L6_2
        L7_2(L8_2)
        while true do
          L7_2 = HasModelLoaded
          L8_2 = L6_2
          L7_2 = L7_2(L8_2)
          if L7_2 then
            break
          end
          L7_2 = RequestModel
          L8_2 = L6_2
          L7_2(L8_2)
          L7_2 = Citizen
          L7_2 = L7_2.Wait
          L8_2 = 5
          L7_2(L8_2)
        end
        L7_2 = L5_1
        L8_2 = CreateObject
        L9_2 = L6_2
        L10_2 = L5_2.x
        L11_2 = L5_2.y
        L12_2 = L5_2.z
        L12_2 = L12_2 + 0.2
        L13_2 = false
        L14_2 = true
        L15_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        L7_2[A0_2] = L8_2
        L7_2 = GetPedBoneIndex
        L8_2 = L4_2
        L9_2 = 60309
        L7_2 = L7_2(L8_2, L9_2)
        L8_2 = AttachEntityToEntity
        L9_2 = L5_1
        L9_2 = L9_2[A0_2]
        L10_2 = L4_2
        L11_2 = L7_2
        L12_2 = 0.103
        L13_2 = 0.015
        L14_2 = 0.072
        L15_2 = -99.949997
        L16_2 = 0.0
        L17_2 = 10.4
        L18_2 = true
        L19_2 = true
        L20_2 = false
        L21_2 = true
        L22_2 = 1
        L23_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
        L8_2 = "impexp_int-0"
        while true do
          L9_2 = HasAnimDictLoaded
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          if L9_2 then
            break
          end
          L9_2 = RequestAnimDict
          L10_2 = L8_2
          L9_2(L10_2)
          L9_2 = Citizen
          L9_2 = L9_2.Wait
          L10_2 = 5
          L9_2(L10_2)
        end
        L9_2 = TaskPlayAnim
        L10_2 = L4_2
        L11_2 = L8_2
        L12_2 = "mp_m_waremech_01_dual-0"
        L13_2 = 8.0
        L14_2 = 8.0
        L15_2 = -1
        L16_2 = 51
        L17_2 = 0
        L18_2 = 0
        L19_2 = 0
        L20_2 = 0
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      elseif "cotton" == A1_2 then
        L5_2 = GetEntityCoords
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L6_2 = GetHashKey
        L7_2 = "sempre_delperropier_candycotton_prop"
        L6_2 = L6_2(L7_2)
        L7_2 = RequestModel
        L8_2 = L6_2
        L7_2(L8_2)
        while true do
          L7_2 = HasModelLoaded
          L8_2 = L6_2
          L7_2 = L7_2(L8_2)
          if L7_2 then
            break
          end
          L7_2 = RequestModel
          L8_2 = L6_2
          L7_2(L8_2)
          L7_2 = Citizen
          L7_2 = L7_2.Wait
          L8_2 = 5
          L7_2(L8_2)
        end
        L7_2 = L5_1
        L8_2 = CreateObject
        L9_2 = L6_2
        L10_2 = L5_2.x
        L11_2 = L5_2.y
        L12_2 = L5_2.z
        L12_2 = L12_2 + 0.2
        L13_2 = false
        L14_2 = true
        L15_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        L7_2[A0_2] = L8_2
        L7_2 = GetPedBoneIndex
        L8_2 = L4_2
        L9_2 = 60309
        L7_2 = L7_2(L8_2, L9_2)
        L8_2 = AttachEntityToEntity
        L9_2 = L5_1
        L9_2 = L9_2[A0_2]
        L10_2 = L4_2
        L11_2 = L7_2
        L12_2 = -0.049
        L13_2 = 0.024
        L14_2 = 0.018
        L15_2 = 62.349998
        L16_2 = 0.0
        L17_2 = 20.299999
        L18_2 = true
        L19_2 = true
        L20_2 = false
        L21_2 = true
        L22_2 = 1
        L23_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
        L8_2 = "anim@heists@humane_labs@finale@keycards"
        while true do
          L9_2 = HasAnimDictLoaded
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          if L9_2 then
            break
          end
          L9_2 = RequestAnimDict
          L10_2 = L8_2
          L9_2(L10_2)
          L9_2 = Citizen
          L9_2 = L9_2.Wait
          L10_2 = 5
          L9_2(L10_2)
        end
        L9_2 = TaskPlayAnim
        L10_2 = L4_2
        L11_2 = L8_2
        L12_2 = "ped_a_enter_loop"
        L13_2 = 8.0
        L14_2 = 8.0
        L15_2 = -1
        L16_2 = 51
        L17_2 = 0
        L18_2 = 0
        L19_2 = 0
        L20_2 = 0
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      elseif "balloon" == A1_2 then
        iteminhandballonid = A2_2
        L5_2 = GetEntityCoords
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L6_2 = ""
        if 1 == A2_2 then
          L7_2 = GetHashKey
          L8_2 = "sempre_delperropier_balloon_b"
          L7_2 = L7_2(L8_2)
          L6_2 = L7_2
        elseif 2 == A2_2 then
          L7_2 = GetHashKey
          L8_2 = "sempre_delperropier_balloon_g"
          L7_2 = L7_2(L8_2)
          L6_2 = L7_2
        elseif 3 == A2_2 then
          L7_2 = GetHashKey
          L8_2 = "sempre_delperropier_balloon_p"
          L7_2 = L7_2(L8_2)
          L6_2 = L7_2
        elseif 4 == A2_2 then
          L7_2 = GetHashKey
          L8_2 = "sempre_delperropier_balloon_r"
          L7_2 = L7_2(L8_2)
          L6_2 = L7_2
        end
        L7_2 = RequestModel
        L8_2 = L6_2
        L7_2(L8_2)
        while true do
          L7_2 = HasModelLoaded
          L8_2 = L6_2
          L7_2 = L7_2(L8_2)
          if L7_2 then
            break
          end
          L7_2 = RequestModel
          L8_2 = L6_2
          L7_2(L8_2)
          L7_2 = Citizen
          L7_2 = L7_2.Wait
          L8_2 = 5
          L7_2(L8_2)
        end
        L7_2 = L5_1
        L8_2 = CreateObject
        L9_2 = L6_2
        L10_2 = L5_2.x
        L11_2 = L5_2.y
        L12_2 = L5_2.z
        L12_2 = L12_2 + 0.2
        L13_2 = false
        L14_2 = true
        L15_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        L7_2[A0_2] = L8_2
        L7_2 = GetPedBoneIndex
        L8_2 = L4_2
        L9_2 = 60309
        L7_2 = L7_2(L8_2, L9_2)
        L8_2 = AttachEntityToEntity
        L9_2 = L5_1
        L9_2 = L9_2[A0_2]
        L10_2 = L4_2
        L11_2 = L7_2
        L12_2 = -0.062
        L13_2 = 0.031
        L14_2 = 0.038
        L15_2 = 63.599998
        L16_2 = 0.0
        L17_2 = 18.049999
        L18_2 = true
        L19_2 = true
        L20_2 = false
        L21_2 = true
        L22_2 = 1
        L23_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
        L8_2 = "anim@heists@humane_labs@finale@keycards"
        while true do
          L9_2 = HasAnimDictLoaded
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          if L9_2 then
            break
          end
          L9_2 = RequestAnimDict
          L10_2 = L8_2
          L9_2(L10_2)
          L9_2 = Citizen
          L9_2 = L9_2.Wait
          L10_2 = 5
          L9_2(L10_2)
        end
        L9_2 = TaskPlayAnim
        L10_2 = L4_2
        L11_2 = L8_2
        L12_2 = "ped_a_enter_loop"
        L13_2 = 8.0
        L14_2 = 8.0
        L15_2 = -1
        L16_2 = 51
        L17_2 = 0
        L18_2 = 0
        L19_2 = 0
        L20_2 = 0
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      end
    end
  end
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:Global:RemoveHandItem"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:Global:RemoveHandItem"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = GetPlayerFromServerId
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if -1 ~= L3_2 then
    L4_2 = GetPlayerPed
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = DoesEntityExist
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = L5_1
      L5_2 = L5_2[A0_2]
      if nil ~= L5_2 then
        L5_2 = DoesEntityExist
        L6_2 = L5_1
        L6_2 = L6_2[A0_2]
        L5_2 = L5_2(L6_2)
        if L5_2 then
          L5_2 = DeleteEntity
          L6_2 = L5_1
          L6_2 = L6_2[A0_2]
          L5_2(L6_2)
        end
        L5_2 = ClearPedTasks
        L6_2 = L4_2
        L5_2(L6_2)
      end
    end
  end
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:Global:RemoveHandItemThrow"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:Global:RemoveHandItemThrow"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L3_2 = GetPlayerFromServerId
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if -1 ~= L3_2 then
    L4_2 = GetPlayerPed
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = DoesEntityExist
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = L5_1
      L5_2 = L5_2[A0_2]
      if nil ~= L5_2 then
        L5_2 = DoesEntityExist
        L6_2 = L5_1
        L6_2 = L6_2[A0_2]
        L5_2 = L5_2(L6_2)
        if L5_2 then
          L5_2 = DeleteEntity
          L6_2 = L5_1
          L6_2 = L6_2[A0_2]
          L5_2(L6_2)
        end
        L5_2 = ClearPedTasks
        L6_2 = L4_2
        L5_2(L6_2)
        if "baloon" == A1_2 then
          L5_2 = ""
          if 1 == A2_2 then
            L6_2 = GetHashKey
            L7_2 = "sempre_delperropier_balloon_b"
            L6_2 = L6_2(L7_2)
            L5_2 = L6_2
          elseif 2 == A2_2 then
            L6_2 = GetHashKey
            L7_2 = "sempre_delperropier_balloon_g"
            L6_2 = L6_2(L7_2)
            L5_2 = L6_2
          elseif 3 == A2_2 then
            L6_2 = GetHashKey
            L7_2 = "sempre_delperropier_balloon_p"
            L6_2 = L6_2(L7_2)
            L5_2 = L6_2
          elseif 4 == A2_2 then
            L6_2 = GetHashKey
            L7_2 = "sempre_delperropier_balloon_r"
            L6_2 = L6_2(L7_2)
            L5_2 = L6_2
          end
          L6_2 = RequestModel
          L7_2 = L5_2
          L6_2(L7_2)
          while true do
            L6_2 = HasModelLoaded
            L7_2 = L5_2
            L6_2 = L6_2(L7_2)
            if L6_2 then
              break
            end
            L6_2 = RequestModel
            L7_2 = L5_2
            L6_2(L7_2)
            L6_2 = Citizen
            L6_2 = L6_2.Wait
            L7_2 = 5
            L6_2(L7_2)
          end
          L6_2 = GetPedBoneIndex
          L7_2 = L4_2
          L8_2 = 60309
          L6_2 = L6_2(L7_2, L8_2)
          L7_2 = GetWorldPositionOfEntityBone
          L8_2 = L4_2
          L9_2 = L6_2
          L7_2 = L7_2(L8_2, L9_2)
          L8_2 = CreateObject
          L9_2 = L5_2
          L10_2 = L7_2.x
          L11_2 = L7_2.y
          L12_2 = L7_2.z
          L13_2 = false
          L14_2 = true
          L15_2 = true
          L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
          L9_2 = FreezeEntityPosition
          L10_2 = L8_2
          L11_2 = true
          L9_2(L10_2, L11_2)
          L9_2 = GetEntityCoords
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          L10_2 = L9_2.z
          L11_2 = L9_2.z
          L11_2 = L11_2 + 100.0
          L12_2 = ClearPedTasks
          L13_2 = L4_2
          L12_2(L13_2)
          while L10_2 < L11_2 do
            L12_2 = Citizen
            L12_2 = L12_2.Wait
            L13_2 = 25
            L12_2(L13_2)
            L10_2 = L10_2 + 0.1
            L12_2 = SetEntityCoordsNoOffset
            L13_2 = L8_2
            L14_2 = L9_2.x
            L15_2 = L9_2.y
            L16_2 = L10_2
            L17_2 = true
            L18_2 = false
            L19_2 = false
            L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
          end
          L12_2 = DeleteEntity
          L13_2 = L8_2
          L12_2(L13_2)
        end
      end
    end
  end
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNUICallback
L7_1 = "buythemeparkticket"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = inticketmachinemenu
  if true == L2_2 then
    L2_2 = ticketmachineid
    if nil ~= L2_2 then
      L2_2 = TriggerServerEvent
      L3_2 = "rtx_themepark:Global:ThemeParkBuyTicket"
      L4_2 = ticketmachineid
      L2_2(L3_2, L4_2)
      ticketmachineid = nil
      inticketmachinemenu = false
      L2_2 = SetNuiFocus
      L3_2 = false
      L4_2 = false
      L2_2(L3_2, L4_2)
      L2_2 = SendNUIMessage
      L3_2 = {}
      L3_2.message = "hideticket"
      L2_2(L3_2)
    end
  end
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNUICallback
L7_1 = "closethemeparkticket"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = inticketmachinemenu
  if true == L2_2 then
    ticketmachineid = nil
    inticketmachinemenu = false
    L2_2 = SetNuiFocus
    L3_2 = false
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "hideticket"
    L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L6_1(L7_1, L8_1)
L6_1 = Citizen
L6_1 = L6_1.CreateThread
function L7_1()
  local L0_2, L1_2
  while true do
    L0_2 = NetworkIsPlayerActive
    L1_2 = PlayerId
    L1_2 = L1_2()
    L0_2 = L0_2(L1_2)
    if L0_2 then
      L0_2 = NetworkIsSessionStarted
      L0_2 = L0_2()
      if L0_2 then
        break
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 250
    L0_2(L1_2)
    L0_2 = GetFrameCount
    L0_2 = L0_2()
    oldframes = L0_2
    L0_2 = GetGameTimer
    L0_2 = L0_2()
    oldtime = L0_2
  end
  while true do
    L0_2 = GetGameTimer
    L0_2 = L0_2()
    currenttime = L0_2
    L0_2 = GetFrameCount
    L0_2 = L0_2()
    currentframes = L0_2
    L0_2 = currenttime
    L1_2 = oldtime
    L0_2 = L0_2 - L1_2
    L1_2 = 1000
    if L0_2 > L1_2 then
      L0_2 = currentframes
      L1_2 = oldframes
      L0_2 = L0_2 - L1_2
      L0_2 = L0_2 - 1
      currentfps = L0_2
      L0_2 = currenttime
      oldtime = L0_2
      L0_2 = currentframes
      oldframes = L0_2
    end
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 1000
      L0_2(L1_2)
    else
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 50
      L0_2(L1_2)
    end
    L0_2 = nearbythemepark
    if false == L0_2 then
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 500
      L0_2(L1_2)
    end
  end
end
L6_1(L7_1)
L6_1 = Citizen
L6_1 = L6_1.CreateThread
function L7_1()
  local L0_2, L1_2, L2_2, L3_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1000
    L0_2(L1_2)
    L0_2 = NetworkIsSessionStarted
    L0_2 = L0_2()
    if L0_2 then
      L0_2 = NetworkIsPlayerActive
      L1_2 = PlayerId
      L1_2, L2_2, L3_2 = L1_2()
      L0_2 = L0_2(L1_2, L2_2, L3_2)
      if L0_2 then
        L0_2 = SendNUIMessage
        L1_2 = {}
        L1_2.message = "updateinterfacedata"
        L2_2 = Config
        L2_2 = L2_2.InterfaceColor
        L1_2.interfacecolordata = L2_2
        L2_2 = tostring
        L3_2 = GetCurrentResourceName
        L3_2 = L3_2()
        L2_2 = L2_2(L3_2)
        L1_2.themeparkresourcenamedata = L2_2
        L0_2(L1_2)
        return
      end
    end
  end
end
L6_1(L7_1)
L6_1 = Citizen
L6_1 = L6_1.CreateThread
function L7_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
    L0_2 = nearbythemepark
    if true == L0_2 then
      L0_2 = PlayerPedId
      L0_2 = L0_2()
      L1_2 = GetEntityCoords
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      playercurrentcoords = L1_2
    else
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 1000
      L0_2(L1_2)
    end
  end
end
L6_1(L7_1)
L6_1 = false
function L7_1()
  local L0_2, L1_2
  L0_2 = L6_1
  if L0_2 then
    return
  end
  L0_2 = true
  L6_1 = L0_2
  L0_2 = TriggerServerEvent
  L1_2 = "rtx_themepark:Global:ParkSynchronize"
  L0_2(L1_2)
  L0_2 = L3_1
  if false == L0_2 then
    L0_2 = Config
    L0_2 = L0_2.Target
    if true == L0_2 then
      L0_2 = CreateTargets
      L0_2()
    end
  end
  L0_2 = Config
  L0_2 = L0_2.ThemeParkBlip
  L0_2 = L0_2.blip
  if true == L0_2 then
    L0_2 = CreateThemeParkBlip
    L0_2()
  end
end
InitializeThemePark = L7_1
L7_1 = AddEventHandler
L8_1 = "playerSpawned"
function L9_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3
    L0_3 = Citizen
    L0_3 = L0_3.Wait
    L1_3 = 2000
    L0_3(L1_3)
    L0_3 = InitializeThemePark
    L0_3()
  end
  L0_2(L1_2)
end
L7_1(L8_1, L9_1)
L7_1 = AddEventHandler
L8_1 = "onClientResourceStart"
function L9_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 == L1_2 then
    L1_2 = Citizen
    L1_2 = L1_2.CreateThread
    function L2_2()
      local L0_3, L1_3
      while true do
        L0_3 = NetworkIsPlayerActive
        L1_3 = PlayerId
        L1_3 = L1_3()
        L0_3 = L0_3(L1_3)
        if L0_3 then
          L0_3 = DoesEntityExist
          L1_3 = PlayerPedId
          L1_3 = L1_3()
          L0_3 = L0_3(L1_3)
          if L0_3 then
            break
          end
        end
        L0_3 = Citizen
        L0_3 = L0_3.Wait
        L1_3 = 500
        L0_3(L1_3)
      end
      L0_3 = Citizen
      L0_3 = L0_3.Wait
      L1_3 = 1000
      L0_3(L1_3)
      L0_3 = InitializeThemePark
      L0_3()
    end
    L1_2(L2_2)
  end
end
L7_1(L8_1, L9_1)
L7_1 = Citizen
L7_1 = L7_1.CreateThread
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 2500
    L0_2(L1_2)
    L0_2 = NetworkIsSessionStarted
    L0_2 = L0_2()
    if L0_2 then
      L0_2 = NetworkIsPlayerActive
      L1_2 = PlayerId
      L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2()
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
      if L0_2 then
        L0_2 = PlayerPedId
        L0_2 = L0_2()
        L1_2 = GetEntityCoords
        L2_2 = L0_2
        L1_2 = L1_2(L2_2)
        L2_2 = L2_1
        L2_2 = L1_2 - L2_2
        L2_2 = #L2_2
        L3_2 = Config
        L3_2 = L3_2.MaximumParkDistance
        if L2_2 < L3_2 then
          L3_2 = nearbythemepark
          if false == L3_2 then
            nearbythemepark = true
            L3_2 = TriggerServerEvent
            L4_2 = "rtx_themepark:Global:ParkResync"
            L3_2(L4_2)
            L3_2 = TriggerServerEvent
            L4_2 = "rtx_themepark:Global:NearbyThemeParkHandler"
            L5_2 = true
            L3_2(L4_2, L5_2)
            L3_2 = IsIplActive
            L4_2 = "ferris_finale_anim"
            L3_2 = L3_2(L4_2)
            if L3_2 then
              L3_2 = RemoveIpl
              L4_2 = "ferris_finale_anim"
              L3_2(L4_2)
            end
          end
        else
          L3_2 = nearbythemepark
          if true == L3_2 then
            L3_2 = TriggerServerEvent
            L4_2 = "rtx_themepark:Global:NearbyThemeParkHandler"
            L5_2 = false
            L3_2(L4_2, L5_2)
            nearbythemepark = false
          end
        end
      end
    end
  end
end
L7_1(L8_1)
L7_1 = Config
L7_1 = L7_1.ThemeParkCanBeOwned
if L7_1 then
  L7_1 = RegisterNetEvent
  L8_1 = "rtx_themepark:Global:ParkOwned"
  L7_1(L8_1)
  L7_1 = AddEventHandler
  L8_1 = "rtx_themepark:Global:ParkOwned"
  function L9_1(A0_2)
    local L1_2
    L1_2 = themeparkowned
    L1_2.owned = A0_2
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNetEvent
  L8_1 = "rtx_themepark:Global:ParkOwn"
  L7_1(L8_1)
  L7_1 = AddEventHandler
  L8_1 = "rtx_themepark:Global:ParkOwn"
  function L9_1(A0_2)
    local L1_2
    L1_2 = themeparkowned
    L1_2.own = A0_2
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNetEvent
  L8_1 = "rtx_themepark:Global:ManagmentMenuUpdate"
  L7_1(L8_1)
  L7_1 = AddEventHandler
  L8_1 = "rtx_themepark:Global:ManagmentMenuUpdate"
  function L9_1(A0_2)
    local L1_2, L2_2
    L1_2 = inmanagmentmenu
    if true == L1_2 then
      L1_2 = SendNUIMessage
      L2_2 = {}
      L2_2.message = "updateparkbalance"
      L2_2.parkbalance = A0_2
      L1_2(L2_2)
    end
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNetEvent
  L8_1 = "rtx_themepark:Global:OpenThemeParkManagmentMenuClient"
  L7_1(L8_1)
  L7_1 = AddEventHandler
  L8_1 = "rtx_themepark:Global:OpenThemeParkManagmentMenuClient"
  function L9_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
    L1_2 = inmanagmentmenu
    if false == L1_2 then
      inmanagmentmenu = true
      L1_2 = SetNuiFocus
      L2_2 = true
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = CreateCamWithParams
      L2_2 = "DEFAULT_SCRIPTED_CAMERA"
      L3_2 = -1673.0793255157
      L4_2 = -1102.1116497344
      L5_2 = 140.49196777344
      L6_2 = -89.811023622751
      L7_2 = 0.0
      L8_2 = -129.70078587532
      L9_2 = 78.0
      L10_2 = true
      L11_2 = 2
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      parkcammanagment = L1_2
      L1_2 = SetCamActive
      L2_2 = parkcammanagment
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = RenderScriptCams
      L2_2 = true
      L3_2 = 2500
      L4_2 = 2500
      L5_2 = true
      L6_2 = false
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 2500
      L1_2(L2_2)
      L1_2 = SendNUIMessage
      L2_2 = {}
      L2_2.message = "updateinterfacedata"
      L3_2 = Config
      L3_2 = L3_2.InterfaceColor
      L2_2.interfacecolordata = L3_2
      L3_2 = tostring
      L4_2 = GetCurrentResourceName
      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L4_2()
      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      L2_2.themeparkresourcenamedata = L3_2
      L1_2(L2_2)
      L1_2 = Config
      L1_2 = L1_2.ThemeParkOwnedSettings
      L1_2 = L1_2.enablepermissionsystem
      if false == L1_2 then
        L1_2 = SendNUIMessage
        L2_2 = {}
        L2_2.message = "parkmanagmentmainshow"
        L2_2.parkbalance = A0_2
        L3_2 = Config
        L3_2 = L3_2.ThemeParkOwnedSettings
        L3_2 = L3_2.disablesell
        L2_2.selldisable = L3_2
        L3_2 = Config
        L3_2 = L3_2.ThemeParkOwnedSettings
        L3_2 = L3_2.disabletransfer
        L2_2.transferdisable = L3_2
        L1_2(L2_2)
      else
        L1_2 = SendNUIMessage
        L2_2 = {}
        L2_2.message = "parkmanagmentmainshow"
        L2_2.parkbalance = A0_2
        L2_2.selldisable = true
        L2_2.transferdisable = true
        L1_2(L2_2)
      end
    end
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNetEvent
  L8_1 = "rtx_themepark:Global:OpenThemeParkManagmentMenuAttractionsClient"
  L7_1(L8_1)
  L7_1 = AddEventHandler
  L8_1 = "rtx_themepark:Global:OpenThemeParkManagmentMenuAttractionsClient"
  function L9_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
    L1_2 = inmanagmentmenu
    if true == L1_2 then
      L1_2 = ipairs
      L2_2 = A0_2
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        L7_2 = SendNUIMessage
        L8_2 = {}
        L8_2.message = "changeattractionstatus"
        L9_2 = "parkattractionopendata"
        L10_2 = L5_2
        L11_2 = ""
        L9_2 = L9_2 .. L10_2 .. L11_2
        L8_2.attractionstatusname = L9_2
        L8_2.attractionhandler = L6_2
        L7_2(L8_2)
      end
    end
  end
  L7_1(L8_1, L9_1)
  L7_1 = Config
  L7_1 = L7_1.Target
  if true == L7_1 then
    L7_1 = RegisterNetEvent
    L8_1 = "rtx_themepark:Global:ManagmentMenuTarget"
    L7_1(L8_1)
    L7_1 = AddEventHandler
    L8_1 = "rtx_themepark:Global:ManagmentMenuTarget"
    function L9_1()
      local L0_2, L1_2, L2_2
      L0_2 = inmanagmentmenu
      if false == L0_2 then
        L0_2 = usingattraction
        if false == L0_2 then
          L0_2 = nearbymanagmentmenu
          if true == L0_2 then
            L0_2 = iteminhand
            if false == L0_2 then
              L0_2 = themeparkowned
              L0_2 = L0_2.owned
              if false == L0_2 then
                L0_2 = Config
                L0_2 = L0_2.ThemeParkOwnedSettings
                L0_2 = L0_2.enablepermissionsystem
                if false == L0_2 then
                  inmanagmentmenu = true
                  L0_2 = SetNuiFocus
                  L1_2 = true
                  L2_2 = true
                  L0_2(L1_2, L2_2)
                  L0_2 = SendNUIMessage
                  L1_2 = {}
                  L1_2.message = "parkbuyshow"
                  L2_2 = Config
                  L2_2 = L2_2.ThemeParkOwnedSettings
                  L2_2 = L2_2.themeparkprice
                  L1_2.parkprice = L2_2
                  L0_2(L1_2)
              end
              else
                L0_2 = themeparkowned
                L0_2 = L0_2.own
                if true ~= L0_2 then
                  L0_2 = Config
                  L0_2 = L0_2.ThemeParkOwnedSettings
                  L0_2 = L0_2.enablepermissionsystem
                end
                if true == L0_2 then
                  L0_2 = TriggerServerEvent
                  L1_2 = "rtx_themepark:Global:OpenThemeParkManagmentMenu"
                  L0_2(L1_2)
                end
              end
            else
              L0_2 = Notify
              L1_2 = Language
              L2_2 = Config
              L2_2 = L2_2.Language
              L1_2 = L1_2[L2_2]
              L1_2 = L1_2.iteminhand
              L0_2(L1_2)
            end
          end
        end
      end
    end
    L7_1(L8_1, L9_1)
  end
  L7_1 = Citizen
  L7_1 = L7_1.CreateThread
  function L8_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = true
      L1_2 = false
      L2_2 = inmanagmentmenu
      if false == L2_2 then
        L2_2 = usingattraction
        if false == L2_2 then
          L2_2 = nearbythemepark
          if true == L2_2 then
            L2_2 = themeparkowned
            L2_2 = L2_2.owned
            if false ~= L2_2 then
              L2_2 = themeparkowned
              L2_2 = L2_2.own
              if true ~= L2_2 then
                L2_2 = Config
                L2_2 = L2_2.ThemeParkOwnedSettings
                L2_2 = L2_2.enablepermissionsystem
                if true ~= L2_2 then
                  goto lbl_43
                end
              end
            end
            L2_2 = playercurrentcoords
            L3_2 = Config
            L3_2 = L3_2.ThemeParkOwnedSettings
            L3_2 = L3_2.themeparkcoords
            L2_2 = L2_2 - L3_2
            L2_2 = #L2_2
            L3_2 = Config
            L3_2 = L3_2.ThemeParkOwnedSettings
            L3_2 = L3_2.themeparkdistance
            if L2_2 < L3_2 then
              L1_2 = true
              nearbymanagmentmenu = true
            end
          end
        end
      end
      ::lbl_43::
      if L1_2 then
        L0_2 = false
        L2_2 = Config
        L2_2 = L2_2.Target
        if false == L2_2 then
          L2_2 = themeparkowned
          L2_2 = L2_2.owned
          if false == L2_2 then
            L2_2 = Config
            L2_2 = L2_2.ThemeParkOwnedSettings
            L2_2 = L2_2.enablepermissionsystem
            if false == L2_2 then
              L2_2 = Config
              L2_2 = L2_2.ThemeParkInteractionSystem
              if 1 == L2_2 then
                L2_2 = SendNUIMessage
                L3_2 = {}
                L3_2.message = "infonotifyshow"
                L4_2 = Language
                L5_2 = Config
                L5_2 = L5_2.Language
                L4_2 = L4_2[L5_2]
                L4_2 = L4_2.pressforbuythemeparkinteract
                L3_2.infonotifytext = L4_2
                L2_2(L3_2)
              else
                L2_2 = Config
                L2_2 = L2_2.ThemeParkInteractionSystem
                if 2 == L2_2 then
                  L2_2 = DrawText3D
                  L3_2 = Config
                  L3_2 = L3_2.ThemeParkOwnedSettings
                  L3_2 = L3_2.themeparkcoords
                  L3_2 = L3_2.x
                  L4_2 = Config
                  L4_2 = L4_2.ThemeParkOwnedSettings
                  L4_2 = L4_2.themeparkcoords
                  L4_2 = L4_2.y
                  L5_2 = Config
                  L5_2 = L5_2.ThemeParkOwnedSettings
                  L5_2 = L5_2.themeparkcoords
                  L5_2 = L5_2.z
                  L5_2 = L5_2 + 1.0
                  L6_2 = Language
                  L7_2 = Config
                  L7_2 = L7_2.Language
                  L6_2 = L6_2[L7_2]
                  L6_2 = L6_2.pressforbuythemepark
                  L2_2(L3_2, L4_2, L5_2, L6_2)
                else
                  L2_2 = Config
                  L2_2 = L2_2.ThemeParkInteractionSystem
                  if 3 == L2_2 then
                    L2_2 = ShowGtaClassicInteraction
                    L3_2 = Language
                    L4_2 = Config
                    L4_2 = L4_2.Language
                    L3_2 = L3_2[L4_2]
                    L3_2 = L3_2.pressforbuythemeparkinteractclassic
                    L2_2(L3_2)
                  end
                end
              end
          end
          else
            L2_2 = themeparkowned
            L2_2 = L2_2.own
            if true ~= L2_2 then
              L2_2 = Config
              L2_2 = L2_2.ThemeParkOwnedSettings
              L2_2 = L2_2.enablepermissionsystem
            end
            if true == L2_2 then
              L2_2 = Config
              L2_2 = L2_2.ThemeParkInteractionSystem
              if 1 == L2_2 then
                L2_2 = SendNUIMessage
                L3_2 = {}
                L3_2.message = "infonotifyshow"
                L4_2 = Language
                L5_2 = Config
                L5_2 = L5_2.Language
                L4_2 = L4_2[L5_2]
                L4_2 = L4_2.pressformanagmentthemeparkinteract
                L3_2.infonotifytext = L4_2
                L2_2(L3_2)
              else
                L2_2 = Config
                L2_2 = L2_2.ThemeParkInteractionSystem
                if 2 == L2_2 then
                  L2_2 = DrawText3D
                  L3_2 = Config
                  L3_2 = L3_2.ThemeParkOwnedSettings
                  L3_2 = L3_2.themeparkcoords
                  L3_2 = L3_2.x
                  L4_2 = Config
                  L4_2 = L4_2.ThemeParkOwnedSettings
                  L4_2 = L4_2.themeparkcoords
                  L4_2 = L4_2.y
                  L5_2 = Config
                  L5_2 = L5_2.ThemeParkOwnedSettings
                  L5_2 = L5_2.themeparkcoords
                  L5_2 = L5_2.z
                  L5_2 = L5_2 + 1.0
                  L6_2 = Language
                  L7_2 = Config
                  L7_2 = L7_2.Language
                  L6_2 = L6_2[L7_2]
                  L6_2 = L6_2.pressformanagmentthemepark
                  L2_2(L3_2, L4_2, L5_2, L6_2)
                else
                  L2_2 = Config
                  L2_2 = L2_2.ThemeParkInteractionSystem
                  if 3 == L2_2 then
                    L2_2 = ShowGtaClassicInteraction
                    L3_2 = Language
                    L4_2 = Config
                    L4_2 = L4_2.Language
                    L3_2 = L3_2[L4_2]
                    L4_2 = "pressformanagmentthemeparkinteractclassic"
                    L3_2 = L3_2[L4_2]
                    L2_2(L3_2)
                  end
                end
              end
            end
          end
        end
      else
        nearbymanagmentmenu = false
        L2_2 = Config
        L2_2 = L2_2.ThemeParkInteractionSystem
        if 1 == L2_2 then
          L2_2 = SendNUIMessage
          L3_2 = {}
          L3_2.message = "hide"
          L2_2(L3_2)
        end
      end
      if L0_2 then
        L2_2 = Citizen
        L2_2 = L2_2.Wait
        L3_2 = 1000
        L2_2(L3_2)
      end
    end
  end
  L7_1(L8_1)
  L7_1 = RegisterNUICallback
  L8_1 = "closemanagment"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
    L2_2 = inmanagmentmenu
    if true == L2_2 then
      L2_2 = SetNuiFocus
      L3_2 = false
      L4_2 = false
      L2_2(L3_2, L4_2)
      L2_2 = themeparkowned
      L2_2 = L2_2.owned
      if false == L2_2 then
        L2_2 = Config
        L2_2 = L2_2.ThemeParkOwnedSettings
        L2_2 = L2_2.enablepermissionsystem
        if false == L2_2 then
          L2_2 = SendNUIMessage
          L3_2 = {}
          L3_2.message = "hideparkbuy"
          L2_2(L3_2)
      end
      else
        L2_2 = themeparkowned
        L2_2 = L2_2.own
        if true ~= L2_2 then
          L2_2 = Config
          L2_2 = L2_2.ThemeParkOwnedSettings
          L2_2 = L2_2.enablepermissionsystem
          if true ~= L2_2 then
            goto lbl_48
          end
        end
        L2_2 = DestroyCam
        L3_2 = parkcammanagment
        L4_2 = false
        L2_2(L3_2, L4_2)
        L2_2 = RenderScriptCams
        L3_2 = false
        L4_2 = 2500
        L5_2 = 2500
        L6_2 = true
        L7_2 = false
        L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
        L2_2 = SendNUIMessage
        L3_2 = {}
        L3_2.message = "hidemanagmentmenu"
        L2_2(L3_2)
      end
      ::lbl_48::
      inmanagmentmenu = false
    end
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "buythemepark"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2
    L2_2 = inmanagmentmenu
    if true == L2_2 then
      inmanagmentmenu = false
      L2_2 = SetNuiFocus
      L3_2 = false
      L4_2 = false
      L2_2(L3_2, L4_2)
      L2_2 = SendNUIMessage
      L3_2 = {}
      L3_2.message = "hideparkbuy"
      L2_2(L3_2)
      L2_2 = TriggerServerEvent
      L3_2 = "rtx_themepark:Global:BuyThemePark"
      L2_2(L3_2)
    end
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "withdrawthemepark"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2
    L2_2 = inmanagmentmenu
    if true == L2_2 then
      L2_2 = themeparkowned
      L2_2 = L2_2.own
      if true ~= L2_2 then
        L2_2 = Config
        L2_2 = L2_2.ThemeParkOwnedSettings
        L2_2 = L2_2.enablepermissionsystem
        if true ~= L2_2 then
          goto lbl_16
        end
      end
      L2_2 = TriggerServerEvent
      L3_2 = "rtx_themepark:Global:ThemeParkManagmentWithdraw"
      L2_2(L3_2)
    end
    ::lbl_16::
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "sellthemepark"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
    L2_2 = inmanagmentmenu
    if true == L2_2 then
      L2_2 = Config
      L2_2 = L2_2.ThemeParkOwnedSettings
      L2_2 = L2_2.disablesell
      if false == L2_2 then
        L2_2 = themeparkowned
        L2_2 = L2_2.own
        if true == L2_2 then
          L2_2 = Config
          L2_2 = L2_2.ThemeParkOwnedSettings
          L2_2 = L2_2.enablepermissionsystem
          if false == L2_2 then
            L2_2 = themeparkowned
            L2_2.own = false
            L2_2 = TriggerServerEvent
            L3_2 = "rtx_themepark:Global:SellThemePark"
            L2_2(L3_2)
            inmanagmentmenu = false
            L2_2 = DestroyCam
            L3_2 = parkcammanagment
            L4_2 = false
            L2_2(L3_2, L4_2)
            L2_2 = RenderScriptCams
            L3_2 = false
            L4_2 = 2500
            L5_2 = 2500
            L6_2 = true
            L7_2 = false
            L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
            L2_2 = SendNUIMessage
            L3_2 = {}
            L3_2.message = "hidemanagmentmenu"
            L2_2(L3_2)
            L2_2 = SetNuiFocus
            L3_2 = false
            L4_2 = false
            L2_2(L3_2, L4_2)
          end
        end
      else
        inmanagmentmenu = false
        L2_2 = DestroyCam
        L3_2 = parkcammanagment
        L4_2 = false
        L2_2(L3_2, L4_2)
        L2_2 = RenderScriptCams
        L3_2 = false
        L4_2 = 2500
        L5_2 = 2500
        L6_2 = true
        L7_2 = false
        L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
        L2_2 = SendNUIMessage
        L3_2 = {}
        L3_2.message = "hidemanagmentmenu"
        L2_2(L3_2)
        L2_2 = SetNuiFocus
        L3_2 = false
        L4_2 = false
        L2_2(L3_2, L4_2)
      end
    end
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "transferthemepark"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
    L2_2 = inmanagmentmenu
    if true == L2_2 then
      L2_2 = Config
      L2_2 = L2_2.ThemeParkOwnedSettings
      L2_2 = L2_2.disabletransfer
      if false == L2_2 then
        L2_2 = Config
        L2_2 = L2_2.ThemeParkOwnedSettings
        L2_2 = L2_2.enablepermissionsystem
        if false == L2_2 then
          L2_2 = themeparkowned
          L2_2 = L2_2.own
          if true == L2_2 then
            L2_2 = GetClosestPlayer
            L2_2, L3_2 = L2_2()
            if -1 ~= L2_2 then
              L4_2 = Config
              L4_2 = L4_2.ThemeParkOwnedSettings
              L4_2 = L4_2.themeparkmaxtransferdistance
              if L3_2 < L4_2 then
                L4_2 = themeparkowned
                L4_2.own = false
                L4_2 = TriggerServerEvent
                L5_2 = "rtx_themepark:Global:TransferThemePark"
                L6_2 = GetPlayerServerId
                L7_2 = L2_2
                L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
                L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
                inmanagmentmenu = false
                L4_2 = DestroyCam
                L5_2 = parkcammanagment
                L6_2 = false
                L4_2(L5_2, L6_2)
                L4_2 = RenderScriptCams
                L5_2 = false
                L6_2 = 2500
                L7_2 = 2500
                L8_2 = true
                L9_2 = false
                L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
                L4_2 = SendNUIMessage
                L5_2 = {}
                L5_2.message = "hidemanagmentmenu"
                L4_2(L5_2)
                L4_2 = SetNuiFocus
                L5_2 = false
                L6_2 = false
                L4_2(L5_2, L6_2)
            end
            else
              L4_2 = Notify
              L5_2 = Language
              L6_2 = Config
              L6_2 = L6_2.Language
              L5_2 = L5_2[L6_2]
              L5_2 = L5_2.noplayernearbymanagment
              L4_2(L5_2)
            end
          end
      end
      else
        inmanagmentmenu = false
        L2_2 = DestroyCam
        L3_2 = parkcammanagment
        L4_2 = false
        L2_2(L3_2, L4_2)
        L2_2 = RenderScriptCams
        L3_2 = false
        L4_2 = 2500
        L5_2 = 2500
        L6_2 = true
        L7_2 = false
        L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
        L2_2 = SendNUIMessage
        L3_2 = {}
        L3_2.message = "hidemanagmentmenu"
        L2_2(L3_2)
        L2_2 = SetNuiFocus
        L3_2 = false
        L4_2 = false
        L2_2(L3_2, L4_2)
      end
    end
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "parkmanagmentsattractions"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2
    L2_2 = inmanagmentmenu
    if true == L2_2 then
      L2_2 = themeparkowned
      L2_2 = L2_2.own
      if true ~= L2_2 then
        L2_2 = Config
        L2_2 = L2_2.ThemeParkOwnedSettings
        L2_2 = L2_2.enablepermissionsystem
        if true ~= L2_2 then
          goto lbl_21
        end
      end
      L2_2 = SendNUIMessage
      L3_2 = {}
      L3_2.message = "parkmanagmentshow"
      L2_2(L3_2)
      L2_2 = TriggerServerEvent
      L3_2 = "rtx_themepark:Global:OpenThemeParkManagmentMenuAttractions"
      L2_2(L3_2)
    end
    ::lbl_21::
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "updateattractionstatus"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2
    L2_2 = inmanagmentmenu
    if true == L2_2 then
      L2_2 = A0_2.attractionid
      if nil ~= L2_2 then
        L2_2 = themeparkowned
        L2_2 = L2_2.own
        if true ~= L2_2 then
          L2_2 = Config
          L2_2 = L2_2.ThemeParkOwnedSettings
          L2_2 = L2_2.enablepermissionsystem
          if true ~= L2_2 then
            goto lbl_23
          end
        end
        L2_2 = TriggerServerEvent
        L3_2 = "rtx_themepark:Global:UpdateAttractionStatus"
        L4_2 = tonumber
        L5_2 = A0_2.attractionid
        L4_2 = L4_2(L5_2)
        L5_2 = A0_2.attractionstatushandler
        L2_2(L3_2, L4_2, L5_2)
      end
    end
    ::lbl_23::
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = Config
  L7_1 = L7_1.Target
  if false == L7_1 then
    L7_1 = RegisterCommand
    L8_1 = "openthemeparkmanagmentmenu"
    function L9_1()
      local L0_2, L1_2, L2_2
      L0_2 = inmanagmentmenu
      if false == L0_2 then
        L0_2 = usingattraction
        if false == L0_2 then
          L0_2 = nearbymanagmentmenu
          if true == L0_2 then
            L0_2 = iteminhand
            if false == L0_2 then
              L0_2 = themeparkowned
              L0_2 = L0_2.owned
              if false == L0_2 then
                L0_2 = Config
                L0_2 = L0_2.ThemeParkOwnedSettings
                L0_2 = L0_2.enablepermissionsystem
                if false == L0_2 then
                  inmanagmentmenu = true
                  L0_2 = SetNuiFocus
                  L1_2 = true
                  L2_2 = true
                  L0_2(L1_2, L2_2)
                  L0_2 = SendNUIMessage
                  L1_2 = {}
                  L1_2.message = "parkbuyshow"
                  L2_2 = Config
                  L2_2 = L2_2.ThemeParkOwnedSettings
                  L2_2 = L2_2.themeparkprice
                  L1_2.parkprice = L2_2
                  L0_2(L1_2)
              end
              else
                L0_2 = themeparkowned
                L0_2 = L0_2.own
                if true ~= L0_2 then
                  L0_2 = Config
                  L0_2 = L0_2.ThemeParkOwnedSettings
                  L0_2 = L0_2.enablepermissionsystem
                end
                if true == L0_2 then
                  L0_2 = TriggerServerEvent
                  L1_2 = "rtx_themepark:Global:OpenThemeParkManagmentMenu"
                  L0_2(L1_2)
                end
              end
            else
              L0_2 = Notify
              L1_2 = Language
              L2_2 = Config
              L2_2 = L2_2.Language
              L1_2 = L1_2[L2_2]
              L1_2 = L1_2.iteminhand
              L0_2(L1_2)
            end
          end
        end
      end
    end
    L7_1(L8_1, L9_1)
    L7_1 = RegisterKeyMapping
    L8_1 = "openthemeparkmanagmentmenu"
    L9_1 = Language
    L10_1 = Config
    L10_1 = L10_1.Language
    L9_1 = L9_1[L10_1]
    L9_1 = L9_1.openthemeparkmanagment
    L10_1 = "keyboard"
    L11_1 = Config
    L11_1 = L11_1.ThemeParkOwnedSettings
    L11_1 = L11_1.openmanagmentkey
    L7_1(L8_1, L9_1, L10_1, L11_1)
  end
end
L7_1 = Config
L7_1 = L7_1.ThemeParkDisableTicketSystem
if false == L7_1 then
  L7_1 = Citizen
  L7_1 = L7_1.CreateThread
  function L8_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = true
      L1_2 = false
      L2_2 = -1
      L3_2 = nil
      L4_2 = nearbythemepark
      if true == L4_2 then
        L4_2 = ipairs
        L5_2 = ticketmachines
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          L10_2 = L9_2.disabled
          if false == L10_2 then
            L10_2 = playercurrentcoords
            L11_2 = L9_2.coords
            L10_2 = L10_2 - L11_2
            L10_2 = #L10_2
            if L10_2 < 20.0 then
              L11_2 = Config
              L11_2 = L11_2.ThemeParkTicketMachineSettings
              L11_2 = L11_2.usedistance
              if L10_2 < L11_2 and (-1 == L2_2 or L2_2 > L10_2) then
                L2_2 = L10_2
                L1_2 = true
                L3_2 = L8_2
              end
            end
          end
        end
      end
      if L1_2 then
        nearbyticketmachineid = L3_2
        L4_2 = usingattraction
        if false == L4_2 then
          L4_2 = inticketmachinemenu
          if false == L4_2 then
            L0_2 = false
            L4_2 = Config
            L4_2 = L4_2.Target
            if false == L4_2 then
              L4_2 = ticketmachines
              L5_2 = nearbyticketmachineid
              L4_2 = L4_2[L5_2]
              L5_2 = Config
              L5_2 = L5_2.ThemeParkInteractionSystem
              if 1 == L5_2 then
                L5_2 = SendNUIMessage
                L6_2 = {}
                L6_2.message = "infonotifyshow"
                L7_2 = Language
                L8_2 = Config
                L8_2 = L8_2.Language
                L7_2 = L7_2[L8_2]
                L7_2 = L7_2.pressforbuyticketthemeparkinteract
                L6_2.infonotifytext = L7_2
                L5_2(L6_2)
              else
                L5_2 = Config
                L5_2 = L5_2.ThemeParkInteractionSystem
                if 2 == L5_2 then
                  L5_2 = DrawText3D
                  L6_2 = L4_2.coords
                  L6_2 = L6_2.x
                  L7_2 = L4_2.coords
                  L7_2 = L7_2.y
                  L8_2 = L4_2.coords
                  L8_2 = L8_2.z
                  L8_2 = L8_2 + 1.0
                  L9_2 = Language
                  L10_2 = Config
                  L10_2 = L10_2.Language
                  L9_2 = L9_2[L10_2]
                  L9_2 = L9_2.pressforbuyticketthemepark
                  L5_2(L6_2, L7_2, L8_2, L9_2)
                else
                  L5_2 = Config
                  L5_2 = L5_2.ThemeParkInteractionSystem
                  if 3 == L5_2 then
                    L5_2 = ShowGtaClassicInteraction
                    L6_2 = Language
                    L7_2 = Config
                    L7_2 = L7_2.Language
                    L6_2 = L6_2[L7_2]
                    L7_2 = "pressforbuyticketthemeparkinteractclassic"
                    L6_2 = L6_2[L7_2]
                    L5_2(L6_2)
                  end
                end
              end
            end
        end
        else
          L4_2 = Config
          L4_2 = L4_2.ThemeParkInteractionSystem
          if 1 == L4_2 then
            L4_2 = nearbyticketmachineid
            if nil ~= L4_2 then
              L4_2 = SendNUIMessage
              L5_2 = {}
              L5_2.message = "hide"
              L4_2(L5_2)
            end
          end
        end
      else
        L4_2 = Config
        L4_2 = L4_2.ThemeParkInteractionSystem
        if 1 == L4_2 then
          L4_2 = nearbyticketmachineid
          if nil ~= L4_2 then
            L4_2 = SendNUIMessage
            L5_2 = {}
            L5_2.message = "hide"
            L4_2(L5_2)
          end
        end
        nearbyticketmachineid = nil
      end
      if L0_2 then
        L4_2 = Citizen
        L4_2 = L4_2.Wait
        L5_2 = 1000
        L4_2(L5_2)
      end
    end
  end
  L7_1(L8_1)
end
L7_1 = Citizen
L7_1 = L7_1.CreateThread
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 0
    L0_2(L1_2)
    L0_2 = true
    L1_2 = false
    L2_2 = -1
    L3_2 = nil
    L4_2 = iteminhand
    if false == L4_2 then
      L4_2 = nearbythemepark
      if true == L4_2 then
        L4_2 = ipairs
        L5_2 = Config
        L5_2 = L5_2.Stands
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          L10_2 = playercurrentcoords
          L11_2 = L9_2.coords
          L10_2 = L10_2 - L11_2
          L10_2 = #L10_2
          if L10_2 < 20.0 then
            L11_2 = Config
            L11_2 = L11_2.ThemeParkItemsSettings
            L11_2 = L11_2.buydistance
            if L10_2 < L11_2 then
              if -1 ~= L2_2 then
                L11_2 = Config
                L11_2 = L11_2.ThemeParkItemsSettings
                L11_2 = L11_2.buydistance
                if not (L2_2 > L11_2) then
                  goto lbl_42
                end
              end
              L2_2 = L10_2
              L1_2 = true
              L3_2 = L8_2
            end
          end
          ::lbl_42::
        end
      end
    end
    if L1_2 then
      nearbystandid = L3_2
      L4_2 = usingattraction
      if false == L4_2 then
        L0_2 = false
        L4_2 = Config
        L4_2 = L4_2.Target
        if false == L4_2 then
          L4_2 = Config
          L4_2 = L4_2.Stands
          L5_2 = nearbystandid
          L4_2 = L4_2[L5_2]
          L5_2 = Config
          L5_2 = L5_2.ThemeParkInteractionSystem
          if 1 == L5_2 then
            L5_2 = SendNUIMessage
            L6_2 = {}
            L6_2.message = "infonotifyshow"
            L7_2 = LanguageFile
            L8_2 = "pressforbuyitemthemeparkinteract"
            L9_2 = L4_2.standtype
            L7_2 = L7_2(L8_2, L9_2)
            L6_2.infonotifytext = L7_2
            L5_2(L6_2)
          else
            L5_2 = Config
            L5_2 = L5_2.ThemeParkInteractionSystem
            if 2 == L5_2 then
              L5_2 = DrawText3D
              L6_2 = L4_2.coords
              L6_2 = L6_2.x
              L7_2 = L4_2.coords
              L7_2 = L7_2.y
              L8_2 = L4_2.coords
              L8_2 = L8_2.z
              L8_2 = L8_2 + 1.0
              L9_2 = LanguageFile
              L10_2 = "pressforbuyitemthemepark"
              L11_2 = L4_2.standtype
              L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2)
              L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
            else
              L5_2 = Config
              L5_2 = L5_2.ThemeParkInteractionSystem
              if 3 == L5_2 then
                L5_2 = ShowGtaClassicInteraction
                L6_2 = LanguageFile
                L7_2 = "pressforbuyitemthemeparkinteractclassic"
                L8_2 = L4_2.standtype
                L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2, L8_2)
                L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
              end
            end
          end
        end
      else
        L4_2 = Config
        L4_2 = L4_2.ThemeParkInteractionSystem
        if 1 == L4_2 then
          L4_2 = nearbystandid
          if nil ~= L4_2 then
            L4_2 = SendNUIMessage
            L5_2 = {}
            L5_2.message = "hide"
            L4_2(L5_2)
          end
        end
      end
    else
      L4_2 = Config
      L4_2 = L4_2.ThemeParkInteractionSystem
      if 1 == L4_2 then
        L4_2 = nearbystandid
        if nil ~= L4_2 then
          L4_2 = SendNUIMessage
          L5_2 = {}
          L5_2.message = "hide"
          L4_2(L5_2)
        end
      end
      nearbystandid = nil
    end
    if L0_2 then
      L4_2 = Citizen
      L4_2 = L4_2.Wait
      L5_2 = 1000
      L4_2(L5_2)
    end
  end
end
L7_1(L8_1)
L7_1 = Config
L7_1 = L7_1.Target
if false == L7_1 then
  L7_1 = RegisterCommand
  L8_1 = "openthemeparkticketmenu"
  function L9_1()
    local L0_2, L1_2, L2_2
    L0_2 = inticketmachinemenu
    if false == L0_2 then
      L0_2 = usingattraction
      if false == L0_2 then
        L0_2 = nearbyticketmachineid
        if nil ~= L0_2 then
          L0_2 = iteminhand
          if false == L0_2 then
            L0_2 = TriggerServerEvent
            L1_2 = "rtx_themepark:Global:OpenTicketMachineMenu"
            L2_2 = nearbyticketmachineid
            L0_2(L1_2, L2_2)
          else
            L0_2 = Notify
            L1_2 = Language
            L2_2 = Config
            L2_2 = L2_2.Language
            L1_2 = L1_2[L2_2]
            L1_2 = L1_2.iteminhand
            L0_2(L1_2)
          end
        end
      end
    end
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterKeyMapping
  L8_1 = "openthemeparkticketmenu"
  L9_1 = Language
  L10_1 = Config
  L10_1 = L10_1.Language
  L9_1 = L9_1[L10_1]
  L9_1 = L9_1.openthemeparkticket
  L10_1 = "keyboard"
  L11_1 = Config
  L11_1 = L11_1.ThemeParkTicketMachineSettings
  L11_1 = L11_1.usekey
  L7_1(L8_1, L9_1, L10_1, L11_1)
end
L7_1 = RegisterCommand
L8_1 = "giveparkitem"
function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = iteminhand
  if true == L0_2 then
    L0_2 = iteminhandtype
    if "popcorn" ~= L0_2 then
      L0_2 = iteminhandtype
      if "cotton" ~= L0_2 then
        L0_2 = iteminhandtype
        if "balloon" ~= L0_2 then
          goto lbl_38
        end
      end
    end
    L0_2 = GetClosestPlayer
    L0_2, L1_2 = L0_2()
    if -1 ~= L0_2 then
      L2_2 = Config
      L2_2 = L2_2.ThemeParkItemsSettings
      L2_2 = L2_2.givedistance
      if L1_2 < L2_2 then
        L2_2 = TriggerServerEvent
        L3_2 = "rtx_themepark:Global:GiveItemInHand"
        L4_2 = GetPlayerServerId
        L5_2 = L0_2
        L4_2 = L4_2(L5_2)
        L5_2 = iteminhandtype
        L6_2 = iteminhandballonid
        L2_2(L3_2, L4_2, L5_2, L6_2)
    end
    else
      L2_2 = Notify
      L3_2 = Language
      L4_2 = Config
      L4_2 = L4_2.Language
      L3_2 = L3_2[L4_2]
      L3_2 = L3_2.noplayernearbyitem
      L2_2(L3_2)
    end
  end
  ::lbl_38::
end
L7_1(L8_1, L9_1)
L7_1 = RegisterKeyMapping
L8_1 = "giveparkitem"
L9_1 = Language
L10_1 = Config
L10_1 = L10_1.Language
L9_1 = L9_1[L10_1]
L9_1 = L9_1.giveplayeritem
L10_1 = "keyboard"
L11_1 = Config
L11_1 = L11_1.ThemeParkItemsSettings
L11_1 = L11_1.givekey
L7_1(L8_1, L9_1, L10_1, L11_1)
L7_1 = RegisterCommand
L8_1 = "throwparkitem"
function L9_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = iteminhand
  if true == L0_2 then
    L0_2 = iteminhandtype
    if "popcorn" ~= L0_2 then
      L0_2 = iteminhandtype
      if "cotton" ~= L0_2 then
        L0_2 = iteminhandtype
        if "balloon" ~= L0_2 then
          goto lbl_32
        end
      end
    end
    L0_2 = SendNUIMessage
    L1_2 = {}
    L1_2.message = "hideiteminhand"
    L0_2(L1_2)
    L0_2 = iteminhandtype
    if "balloon" == L0_2 then
      L0_2 = TriggerServerEvent
      L1_2 = "rtx_themepark:Global:RemoveItemInHand"
      L2_2 = "baloon"
      L3_2 = iteminhandballonid
      L0_2(L1_2, L2_2, L3_2)
    else
      L0_2 = TriggerServerEvent
      L1_2 = "rtx_themepark:Global:RemoveItemInHand"
      L2_2 = "normal"
      L3_2 = nil
      L0_2(L1_2, L2_2, L3_2)
    end
  end
  ::lbl_32::
end
L7_1(L8_1, L9_1)
L7_1 = RegisterKeyMapping
L8_1 = "throwparkitem"
L9_1 = Language
L10_1 = Config
L10_1 = L10_1.Language
L9_1 = L9_1[L10_1]
L9_1 = L9_1.throwitem
L10_1 = "keyboard"
L11_1 = Config
L11_1 = L11_1.ThemeParkItemsSettings
L12_1 = "throwkey"
L11_1 = L11_1[L12_1]
L7_1(L8_1, L9_1, L10_1, L11_1)
L7_1 = Config
L7_1 = L7_1.Target
L8_1 = false
if L7_1 == L8_1 then
  L7_1 = RegisterCommand
  L8_1 = "buythemeparkitem"
  function L9_1()
    local L0_2, L1_2, L2_2
    L0_2 = iteminhand
    if false == L0_2 then
      L0_2 = nearbystandid
      if nil ~= L0_2 then
        L0_2 = TriggerServerEvent
        L1_2 = "rtx_themepark:Global:BuyItemToHand"
        L2_2 = nearbystandid
        L0_2(L1_2, L2_2)
        nearbystandid = nil
      end
    end
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterKeyMapping
  L8_1 = "buythemeparkitem"
  L9_1 = Language
  L10_1 = Config
  L10_1 = L10_1.Language
  L9_1 = L9_1[L10_1]
  L9_1 = L9_1.throwitem
  L10_1 = "keyboard"
  L11_1 = Config
  L11_1 = L11_1.ThemeParkItemsSettings
  L12_1 = "buykey"
  L11_1 = L11_1[L12_1]
  L7_1(L8_1, L9_1, L10_1, L11_1)
end
L7_1 = Config
L8_1 = "ThemeParkControlAttractions"
L7_1 = L7_1[L8_1]
if L7_1 then
  L7_1 = RegisterNUICallback
  L8_1 = "updatesmokecolor"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2
    L2_2 = inattractioncontrolmenu
    if true == L2_2 then
      L2_2 = attractioncontrolledid
      if nil ~= L2_2 then
        L2_2 = controlmachines
        L3_2 = attractioncontrolledid
        L2_2 = L2_2[L3_2]
        L3_2 = L2_2.smokedisabled
        if false == L3_2 then
          L3_2 = L2_2.smokecolor
          L4_2 = tonumber
          L5_2 = A0_2.colorR
          L4_2 = L4_2(L5_2)
          L3_2.r = L4_2
          L3_2 = L2_2.smokecolor
          L4_2 = tonumber
          L5_2 = A0_2.colorG
          L4_2 = L4_2(L5_2)
          L3_2.g = L4_2
          L3_2 = L2_2.smokecolor
          L4_2 = tonumber
          L5_2 = A0_2.colorB
          L4_2 = L4_2(L5_2)
          L3_2.b = L4_2
          L3_2 = TriggerServerEvent
          L4_2 = "rtx_themepark:Global:ThemeParkControlSmokeColor"
          L5_2 = attractioncontrolledid
          L6_2 = L2_2.smokecolor
          L3_2(L4_2, L5_2, L6_2)
        end
      end
    end
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "smokecontrol"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2
    L2_2 = inattractioncontrolmenu
    if true == L2_2 then
      L2_2 = attractioncontrolledid
      if nil ~= L2_2 then
        L2_2 = controlmachines
        L3_2 = attractioncontrolledid
        L2_2 = L2_2[L3_2]
        L3_2 = L2_2.smokedisabled
        if false == L3_2 then
          L3_2 = A0_2.smokehandler
          if true == L3_2 then
            L3_2 = L2_2.smokeactivated
            if false == L3_2 then
              L2_2.smokeactivated = true
              L3_2 = TriggerServerEvent
              L4_2 = "rtx_themepark:Global:ThemeParkControlSmokeHandler"
              L5_2 = attractioncontrolledid
              L6_2 = true
              L3_2(L4_2, L5_2, L6_2)
            end
          else
            L3_2 = A0_2.smokehandler
            if false == L3_2 then
              L3_2 = L2_2.smokeactivated
              if true == L3_2 then
                L2_2.smokeactivated = false
                L3_2 = TriggerServerEvent
                L4_2 = "rtx_themepark:Global:ThemeParkControlSmokeHandler"
                L5_2 = attractioncontrolledid
                L6_2 = false
                L3_2(L4_2, L5_2, L6_2)
              end
            end
          end
        end
      end
    end
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "closecontrolmenu"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2
    L2_2 = inattractioncontrolmenu
    if true == L2_2 then
      L2_2 = attractioncontrolledid
      if nil ~= L2_2 then
        L2_2 = TriggerServerEvent
        L3_2 = "rtx_themepark:Global:ThemeParkOpenControlMenuClose"
        L4_2 = attractioncontrolledid
        L2_2(L3_2, L4_2)
        attractioncontrolledid = nil
        inattractioncontrolmenu = false
        L2_2 = SetNuiFocus
        L3_2 = false
        L4_2 = false
        L2_2(L3_2, L4_2)
        L2_2 = SendNUIMessage
        L3_2 = {}
        L3_2.message = "hideattractioncontrol"
        L2_2(L3_2)
      end
    end
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "attractionnewurl"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
    L2_2 = inattractioncontrolmenu
    if true == L2_2 then
      L2_2 = attractioncontrolledid
      if nil ~= L2_2 then
        L2_2 = controlmachines
        L3_2 = attractioncontrolledid
        L2_2 = L2_2[L3_2]
        L3_2 = L2_2.musicdisabled
        if false == L3_2 then
          L3_2 = tostring
          L4_2 = A0_2.musicurldata
          L3_2 = L3_2(L4_2)
          L4_2 = false
          L5_2 = string
          L5_2 = L5_2.find
          L6_2 = L3_2
          L7_2 = "youtube.com"
          L5_2 = L5_2(L6_2, L7_2)
          if L5_2 then
            L5_2 = string
            L5_2 = L5_2.find
            L6_2 = L3_2
            L7_2 = "^https://www.youtube.com"
            L5_2 = L5_2(L6_2, L7_2)
            if L5_2 then
              L4_2 = true
            else
              L5_2 = string
              L5_2 = L5_2.find
              L6_2 = L3_2
              L7_2 = "^https://youtube.com"
              L5_2 = L5_2(L6_2, L7_2)
              if L5_2 then
                L4_2 = true
              else
                L5_2 = string
                L5_2 = L5_2.find
                L6_2 = L3_2
                L7_2 = "^http://youtube.com"
                L5_2 = L5_2(L6_2, L7_2)
                if L5_2 then
                  L4_2 = true
                else
                  L5_2 = string
                  L5_2 = L5_2.find
                  L6_2 = L3_2
                  L7_2 = "^http://www.youtube.com"
                  L5_2 = L5_2(L6_2, L7_2)
                  if L5_2 then
                    L4_2 = true
                  else
                    L5_2 = string
                    L5_2 = L5_2.find
                    L6_2 = L3_2
                    L7_2 = "^www.youtube.com"
                    L5_2 = L5_2(L6_2, L7_2)
                    if L5_2 then
                      L4_2 = true
                    else
                      L5_2 = string
                      L5_2 = L5_2.find
                      L6_2 = L3_2
                      L7_2 = "^youtube.com"
                      L5_2 = L5_2(L6_2, L7_2)
                      if L5_2 then
                        L4_2 = true
                      end
                    end
                  end
                end
              end
            end
          else
            L5_2 = string
            L5_2 = L5_2.find
            L6_2 = L3_2
            L7_2 = "youtu.be"
            L5_2 = L5_2(L6_2, L7_2)
            if L5_2 then
              L5_2 = string
              L5_2 = L5_2.find
              L6_2 = L3_2
              L7_2 = "^https://www.youtu.be"
              L5_2 = L5_2(L6_2, L7_2)
              if L5_2 then
                L4_2 = true
              else
                L5_2 = string
                L5_2 = L5_2.find
                L6_2 = L3_2
                L7_2 = "^https://youtu.be"
                L5_2 = L5_2(L6_2, L7_2)
                if L5_2 then
                  L4_2 = true
                else
                  L5_2 = string
                  L5_2 = L5_2.find
                  L6_2 = L3_2
                  L7_2 = "^http://youtu.be"
                  L5_2 = L5_2(L6_2, L7_2)
                  if L5_2 then
                    L4_2 = true
                  else
                    L5_2 = string
                    L5_2 = L5_2.find
                    L6_2 = L3_2
                    L7_2 = "^http://www.youtu.be"
                    L5_2 = L5_2(L6_2, L7_2)
                    if L5_2 then
                      L4_2 = true
                    else
                      L5_2 = string
                      L5_2 = L5_2.find
                      L6_2 = L3_2
                      L7_2 = "^www.youtu.be"
                      L5_2 = L5_2(L6_2, L7_2)
                      if L5_2 then
                        L4_2 = true
                      else
                        L5_2 = string
                        L5_2 = L5_2.find
                        L6_2 = L3_2
                        L7_2 = "^youtu.be"
                        L5_2 = L5_2(L6_2, L7_2)
                        if L5_2 then
                          L4_2 = true
                        end
                      end
                    end
                  end
                end
              end
            else
              L5_2 = string
              L5_2 = L5_2.find
              L6_2 = L3_2
              L7_2 = ".mp3"
              L5_2 = L5_2(L6_2, L7_2)
              if L5_2 then
                L5_2 = string
                L5_2 = L5_2.find
                L6_2 = L3_2
                L7_2 = ".mp3"
                L5_2 = L5_2(L6_2, L7_2)
                if L5_2 then
                  L5_2 = string
                  L5_2 = L5_2.find
                  L6_2 = L3_2
                  L7_2 = "https://"
                  L5_2 = L5_2(L6_2, L7_2)
                  if L5_2 then
                    L4_2 = true
                  else
                    L5_2 = string
                    L5_2 = L5_2.find
                    L6_2 = L3_2
                    L7_2 = "https://"
                    L5_2 = L5_2(L6_2, L7_2)
                    if L5_2 then
                      L4_2 = true
                    else
                      L5_2 = string
                      L5_2 = L5_2.find
                      L6_2 = L3_2
                      L7_2 = "http://"
                      L5_2 = L5_2(L6_2, L7_2)
                      if L5_2 then
                        L4_2 = true
                      else
                        L5_2 = string
                        L5_2 = L5_2.find
                        L6_2 = L3_2
                        L7_2 = "www."
                        L5_2 = L5_2(L6_2, L7_2)
                        if L5_2 then
                          L4_2 = true
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          if L4_2 then
            L5_2 = string
            L5_2 = L5_2.find
            L6_2 = L3_2
            L7_2 = "youtube.com"
            L5_2 = L5_2(L6_2, L7_2)
            if not L5_2 then
              L5_2 = string
              L5_2 = L5_2.find
              L6_2 = L3_2
              L7_2 = "youtu.be"
              L5_2 = L5_2(L6_2, L7_2)
              if not L5_2 then
                L5_2 = TriggerServerEvent
                L6_2 = "rtx_themepark:Global:ThemeParkControlMusicPlay"
                L7_2 = attractioncontrolledid
                L8_2 = L3_2
                L5_2(L6_2, L7_2, L8_2)
              else
                L5_2 = SoundUrlCheck
                L6_2 = L3_2
                L5_2 = L5_2(L6_2)
                if true == L5_2 then
                  L6_2 = TriggerServerEvent
                  L7_2 = "rtx_themepark:Global:ThemeParkControlMusicPlay"
                  L8_2 = attractioncontrolledid
                  L9_2 = L3_2
                  L6_2(L7_2, L8_2, L9_2)
                else
                  L6_2 = Notify
                  L7_2 = Language
                  L8_2 = Config
                  L8_2 = L8_2.Language
                  L7_2 = L7_2[L8_2]
                  L7_2 = L7_2.youtubeblock
                  L6_2(L7_2)
                end
              end
          else
            L5_2 = Notify
            L6_2 = Language
            L7_2 = Config
            L7_2 = L7_2.Language
            L6_2 = L6_2[L7_2]
            L6_2 = L6_2.notsupported
            L5_2(L6_2)
          end
        end
      end
    end
    ::lbl_236::
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "volumechange"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
    L2_2 = inattractioncontrolmenu
    if true == L2_2 then
      L2_2 = attractioncontrolledid
      if nil ~= L2_2 then
        L2_2 = controlmachines
        L3_2 = attractioncontrolledid
        L2_2 = L2_2[L3_2]
        L3_2 = L2_2.musicdisabled
        if false == L3_2 then
          L3_2 = tonumber
          L4_2 = A0_2.volumedata
          L3_2 = L3_2(L4_2)
          if L3_2 >= 0 and L3_2 <= 100 then
            L4_2 = TriggerServerEvent
            L5_2 = "rtx_themepark:Global:ThemeParkControlMusicVolume"
            L6_2 = attractioncontrolledid
            L7_2 = L3_2
            L4_2(L5_2, L6_2, L7_2)
          end
        end
      end
    end
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "stopmusic"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2
    L2_2 = inattractioncontrolmenu
    if true == L2_2 then
      L2_2 = attractioncontrolledid
      if nil ~= L2_2 then
        L2_2 = controlmachines
        L3_2 = attractioncontrolledid
        L2_2 = L2_2[L3_2]
        L3_2 = L2_2.musicdisabled
        if false == L3_2 then
          L3_2 = SendNUIMessage
          L4_2 = {}
          L4_2.message = "updateattractionmusiclabel"
          L4_2.musiclabel = ""
          L3_2(L4_2)
          L3_2 = TriggerServerEvent
          L4_2 = "rtx_themepark:Global:ThemeParkControlMusicStop"
          L5_2 = attractioncontrolledid
          L3_2(L4_2, L5_2)
        end
      end
    end
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNUICallback
  L8_1 = "startattraction"
  function L9_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2
    L2_2 = inattractioncontrolmenu
    if true == L2_2 then
      L2_2 = attractioncontrolledid
      if nil ~= L2_2 then
        L2_2 = controlmachines
        L3_2 = attractioncontrolledid
        L2_2 = L2_2[L3_2]
        L3_2 = L2_2.turndisabled
        if false == L3_2 then
          L3_2 = TriggerServerEvent
          L4_2 = "rtx_themepark:Global:StartAttractionPlayer"
          L5_2 = attractioncontrolledid
          L6_2 = L2_2.attractionid
          L3_2(L4_2, L5_2, L6_2)
        end
      end
    end
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNetEvent
  L8_1 = "rtx_themepark:Global:ThemeParkControlSmokeHandlerClient"
  L7_1(L8_1)
  L7_1 = AddEventHandler
  L8_1 = "rtx_themepark:Global:ThemeParkControlSmokeHandlerClient"
  function L9_1(A0_2, A1_2)
    local L2_2
    if nil ~= A0_2 then
      L2_2 = controlmachines
      L2_2 = L2_2[A0_2]
      L2_2.smokeactivated = A1_2
    end
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNetEvent
  L8_1 = "rtx_themepark:Global:ThemeParkControlSmokeColorClient"
  L7_1(L8_1)
  L7_1 = AddEventHandler
  L8_1 = "rtx_themepark:Global:ThemeParkControlSmokeColorClient"
  function L9_1(A0_2, A1_2)
    local L2_2
    if nil ~= A0_2 then
      L2_2 = controlmachines
      L2_2 = L2_2[A0_2]
      L2_2.smokecolor = A1_2
    end
  end
  L7_1(L8_1, L9_1)
  L7_1 = RegisterNetEvent
  L8_1 = "rtx_themepark:Global:ThemeParkOpenControlMenuClient"
  L7_1(L8_1)
  L7_1 = AddEventHandler
  L8_1 = "rtx_themepark:Global:ThemeParkOpenControlMenuClient"
  function L9_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2
    L1_2 = iteminhand
    if false == L1_2 then
      L1_2 = inattractioncontrolmenu
      if false == L1_2 and nil ~= A0_2 then
        inattractioncontrolmenu = true
        attractioncontrolledid = A0_2
        L1_2 = SetNuiFocus
        L2_2 = true
        L3_2 = true
        L1_2(L2_2, L3_2)
        L1_2 = controlmachines
        L1_2 = L1_2[A0_2]
        L2_2 = SendNUIMessage
        L3_2 = {}
        L3_2.message = "parkattractionshow"
        L4_2 = L1_2.label
        L3_2.attractionname = L4_2
        L4_2 = L1_2.smokecolor
        L3_2.smokecolor = L4_2
        L4_2 = L1_2.smokedisabled
        L3_2.smokedisabled = L4_2
        L4_2 = L1_2.turndisabled
        L3_2.turndisabled = L4_2
        L4_2 = L1_2.musicdisabled
        L3_2.musicdisabled = L4_2
        L4_2 = L1_2.musicvolume
        L3_2.musicvolumedata = L4_2
        L2_2(L3_2)
        L2_2 = L1_2.musichandler
        if nil ~= L2_2 then
          L2_2 = SendNUIMessage
          L3_2 = {}
          L3_2.message = "updateattractionmusiclabel"
          L4_2 = L1_2.musichandler
          L4_2 = L4_2.soundname
          L3_2.musiclabel = L4_2
          L2_2(L3_2)
        else
          L2_2 = SendNUIMessage
          L3_2 = {}
          L3_2.message = "updateattractionmusiclabel"
          L3_2.musiclabel = ""
          L2_2(L3_2)
        end
      end
    end
  end
  L7_1(L8_1, L9_1)
  L7_1 = _ENV
  L8_1 = "Citizen"
  L7_1 = L7_1[L8_1]
  L7_1 = L7_1.CreateThread
  function L8_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 1000
      L0_2(L1_2)
      L0_2 = nearbythemepark
      if L0_2 then
        L0_2 = ipairs
        L1_2 = controlmachines
        L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
        for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
          L6_2 = DoesEntityExist
          L7_2 = L5_2.handler
          L6_2 = L6_2(L7_2)
          if L6_2 then
            L6_2 = FreezeEntityPosition
            L7_2 = L5_2.handler
            L8_2 = true
            L6_2(L7_2, L8_2)
          else
            L6_2 = GetHashKey
            L7_2 = "sempre_delperropier_control"
            L6_2 = L6_2(L7_2)
            L7_2 = RequestModel
            L8_2 = L6_2
            L7_2(L8_2)
            while true do
              L7_2 = HasModelLoaded
              L8_2 = L6_2
              L7_2 = L7_2(L8_2)
              if L7_2 then
                break
              end
              L7_2 = RequestModel
              L8_2 = L6_2
              L7_2(L8_2)
              L7_2 = Citizen
              L7_2 = L7_2.Wait
              L8_2 = 5
              L7_2(L8_2)
            end
            L7_2 = CreateObjectNoOffset
            L8_2 = L6_2
            L9_2 = L5_2.coords
            L9_2 = L9_2.x
            L10_2 = L5_2.coords
            L10_2 = L10_2.y
            L11_2 = L5_2.coords
            L11_2 = L11_2.z
            L12_2 = false
            L13_2 = true
            L14_2 = true
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L5_2.handler = L7_2
            L7_2 = SetEntityRotation
            L8_2 = L5_2.handler
            L9_2 = L5_2.rotation
            L9_2 = L9_2.x
            L10_2 = L5_2.rotation
            L10_2 = L10_2.y
            L11_2 = L5_2.rotation
            L11_2 = L11_2.z
            L7_2(L8_2, L9_2, L10_2, L11_2)
            L7_2 = FreezeEntityPosition
            L8_2 = L5_2.handler
            L9_2 = true
            L7_2(L8_2, L9_2)
          end
          L6_2 = L5_2.smokedisabled
          if false == L6_2 then
            L6_2 = ipairs
            L7_2 = L5_2.smokelocations
            L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
            for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
              L12_2 = L5_2.smokeactivated
              if true == L12_2 then
                L12_2 = playercurrentcoords
                L13_2 = L11_2.coords
                L12_2 = L12_2 - L13_2
                L12_2 = #L12_2
                if not (L12_2 < 100.0) then
                  goto lbl_193
                end
                L13_2 = SetWindSpeed
                L14_2 = 0.0
                L13_2(L14_2)
                L13_2 = SetWindDirection
                L14_2 = 0.0
                L13_2(L14_2)
                L13_2 = DoesParticleFxLoopedExist
                L14_2 = L11_2.handler
                L13_2 = L13_2(L14_2)
                if L13_2 then
                  L13_2 = SetParticleFxLoopedColour
                  L14_2 = L11_2.handler
                  L15_2 = L5_2.smokecolor
                  L15_2 = L15_2.r
                  L15_2 = L15_2 / 255
                  L15_2 = L15_2 + 0.0
                  L16_2 = L5_2.smokecolor
                  L16_2 = L16_2.g
                  L16_2 = L16_2 / 255
                  L16_2 = L16_2 + 0.0
                  L17_2 = L5_2.smokecolor
                  L17_2 = L17_2.b
                  L17_2 = L17_2 / 255
                  L17_2 = L17_2 + 0.0
                  L18_2 = 0
                  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
                else
                  L13_2 = RequestNamedPtfxAsset
                  L14_2 = "scr_ar_planes"
                  L13_2(L14_2)
                  while true do
                    L13_2 = HasNamedPtfxAssetLoaded
                    L14_2 = "scr_ar_planes"
                    L13_2 = L13_2(L14_2)
                    if L13_2 then
                      break
                    end
                    L13_2 = Citizen
                    L13_2 = L13_2.Wait
                    L14_2 = 5
                    L13_2(L14_2)
                    L13_2 = RequestNamedPtfxAsset
                    L14_2 = "scr_ar_planes"
                    L13_2(L14_2)
                  end
                  L13_2 = UseParticleFxAsset
                  L14_2 = "scr_ar_planes"
                  L13_2(L14_2)
                  L13_2 = UseParticleFxAssetNextCall
                  L14_2 = "scr_ar_planes"
                  L13_2(L14_2)
                  L13_2 = StartParticleFxLoopedAtCoord
                  L14_2 = "scr_ar_trail_smoke"
                  L15_2 = L11_2.coords
                  L15_2 = L15_2.x
                  L16_2 = L11_2.coords
                  L16_2 = L16_2.y
                  L17_2 = L11_2.coords
                  L17_2 = L17_2.z
                  L18_2 = 0.0
                  L19_2 = 0.0
                  L20_2 = 0.0
                  L21_2 = L11_2.scale
                  L22_2 = false
                  L23_2 = false
                  L24_2 = false
                  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
                  L11_2.handler = L13_2
                  L13_2 = SetParticleFxLoopedColour
                  L14_2 = L11_2.handler
                  L15_2 = L5_2.smokecolor
                  L15_2 = L15_2.r
                  L15_2 = L15_2 / 255
                  L15_2 = L15_2 + 0.0
                  L16_2 = L5_2.smokecolor
                  L16_2 = L16_2.g
                  L16_2 = L16_2 / 255
                  L16_2 = L16_2 + 0.0
                  L17_2 = L5_2.smokecolor
                  L17_2 = L17_2.b
                  L17_2 = L17_2 / 255
                  L17_2 = L17_2 + 0.0
                  L18_2 = 0
                  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
                  L13_2 = SetParticleFxLoopedAlpha
                  L14_2 = L11_2.handler
                  L15_2 = 0.05
                  L13_2(L14_2, L15_2)
                end
              else
                L12_2 = DoesParticleFxLoopedExist
                L13_2 = L11_2.handler
                L12_2 = L12_2(L13_2)
                if L12_2 then
                  L12_2 = StopParticleFxLooped
                  L13_2 = L11_2.handler
                  L14_2 = 0
                  L12_2(L13_2, L14_2)
                end
              end
              ::lbl_193::
            end
          end
        end
      end
    end
  end
  L7_1(L8_1)
  L7_1 = _ENV
  L8_1 = "Citizen"
  L7_1 = L7_1[L8_1]
  L7_1 = L7_1.CreateThread
  function L8_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = true
      L1_2 = false
      L2_2 = -1
      L3_2 = nil
      L4_2 = nearbythemepark
      if L4_2 then
        L4_2 = ipairs
        L5_2 = controlmachines
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          L10_2 = playercurrentcoords
          L11_2 = L9_2.coords
          L10_2 = L10_2 - L11_2
          L10_2 = #L10_2
          if L10_2 < 20.0 then
            L11_2 = Config
            L11_2 = L11_2.ThemeParkControlMachineSettings
            L11_2 = L11_2.usedistance
            if L10_2 < L11_2 and (-1 == L2_2 or L2_2 > L10_2) then
              L2_2 = L10_2
              L1_2 = true
              L3_2 = L8_2
            end
          end
        end
      end
      if L1_2 then
        attractioncontrolid = L3_2
        L4_2 = usingattraction
        if false == L4_2 then
          L4_2 = inattractioncontrolmenu
          if false == L4_2 then
            L0_2 = false
            L4_2 = Config
            L4_2 = L4_2.Target
            if false == L4_2 then
              L4_2 = controlmachines
              L5_2 = attractioncontrolid
              L4_2 = L4_2[L5_2]
              L5_2 = Config
              L5_2 = L5_2.ThemeParkInteractionSystem
              if 1 == L5_2 then
                L5_2 = SendNUIMessage
                L6_2 = {}
                L6_2.message = "infonotifyshow"
                L7_2 = Language
                L8_2 = Config
                L8_2 = L8_2.Language
                L7_2 = L7_2[L8_2]
                L7_2 = L7_2.pressforcontrolthemeparkinteract
                L6_2.infonotifytext = L7_2
                L5_2(L6_2)
              else
                L5_2 = Config
                L5_2 = L5_2.ThemeParkInteractionSystem
                if 2 == L5_2 then
                  L5_2 = DrawText3D
                  L6_2 = L4_2.coords
                  L6_2 = L6_2.x
                  L7_2 = L4_2.coords
                  L7_2 = L7_2.y
                  L8_2 = L4_2.coords
                  L8_2 = L8_2.z
                  L8_2 = L8_2 + 1.0
                  L9_2 = Language
                  L10_2 = Config
                  L10_2 = L10_2.Language
                  L9_2 = L9_2[L10_2]
                  L9_2 = L9_2.pressforcontrolthemepark
                  L5_2(L6_2, L7_2, L8_2, L9_2)
                else
                  L5_2 = Config
                  L5_2 = L5_2.ThemeParkInteractionSystem
                  if 3 == L5_2 then
                    L5_2 = ShowGtaClassicInteraction
                    L6_2 = Language
                    L7_2 = Config
                    L7_2 = L7_2.Language
                    L6_2 = L6_2[L7_2]
                    L6_2 = L6_2.pressforcontrolthemeparkinteractclassic
                    L5_2(L6_2)
                  end
                end
              end
            end
        end
        else
          L4_2 = Config
          L4_2 = L4_2.ThemeParkInteractionSystem
          if 1 == L4_2 then
            L4_2 = attractioncontrolid
            if nil ~= L4_2 then
              L4_2 = SendNUIMessage
              L5_2 = {}
              L5_2.message = "hide"
              L4_2(L5_2)
            end
          end
        end
      else
        L4_2 = Config
        L4_2 = L4_2.ThemeParkInteractionSystem
        if 1 == L4_2 then
          L4_2 = attractioncontrolid
          if nil ~= L4_2 then
            L4_2 = SendNUIMessage
            L5_2 = {}
            L5_2.message = "hide"
            L4_2(L5_2)
          end
        end
        attractioncontrolid = nil
      end
      if L0_2 then
        L4_2 = Citizen
        L4_2 = L4_2.Wait
        L5_2 = 1000
        L4_2(L5_2)
      end
    end
  end
  L7_1(L8_1)
  L7_1 = _ENV
  L8_1 = "Config"
  L7_1 = L7_1[L8_1]
  L8_1 = "Target"
  L7_1 = L7_1[L8_1]
  L8_1 = true
  if L7_1 == L8_1 then
    L7_1 = RegisterNetEvent
    L8_1 = "rtx_themepark:Global:ControlAttractionTarget"
    L7_1(L8_1)
    L7_1 = AddEventHandler
    L8_1 = "rtx_themepark:Global:ControlAttractionTarget"
    function L9_1()
      local L0_2, L1_2, L2_2
      L0_2 = iteminhand
      if false == L0_2 then
        L0_2 = inattractioncontrolmenu
        if false == L0_2 then
          L0_2 = attractioncontrolid
          if nil ~= L0_2 then
            L0_2 = TriggerServerEvent
            L1_2 = "rtx_themepark:Global:ThemeParkOpenControlMenu"
            L2_2 = attractioncontrolid
            L0_2(L1_2, L2_2)
          end
        end
      end
    end
    L7_1(L8_1, L9_1)
  else
    L7_1 = RegisterCommand
    L8_1 = "opencontrolmenu"
    function L9_1()
      local L0_2, L1_2, L2_2
      L0_2 = iteminhand
      if false == L0_2 then
        L0_2 = inattractioncontrolmenu
        if false == L0_2 then
          L0_2 = attractioncontrolid
          if nil ~= L0_2 then
            L0_2 = TriggerServerEvent
            L1_2 = "rtx_themepark:Global:ThemeParkOpenControlMenu"
            L2_2 = attractioncontrolid
            L0_2(L1_2, L2_2)
          end
        end
      end
    end
    L7_1(L8_1, L9_1)
    L7_1 = RegisterKeyMapping
    L8_1 = "opencontrolmenu"
    L9_1 = _ENV
    L10_1 = "Language"
    L9_1 = L9_1[L10_1]
    L10_1 = _ENV
    L11_1 = "Config"
    L10_1 = L10_1[L11_1]
    L11_1 = "Language"
    L10_1 = L10_1[L11_1]
    L9_1 = L9_1[L10_1]
    L10_1 = "controlattraction"
    L9_1 = L9_1[L10_1]
    L10_1 = "keyboard"
    L11_1 = _ENV
    L12_1 = "Config"
    L11_1 = L11_1[L12_1]
    L12_1 = "ThemeParkControlMachineSettings"
    L11_1 = L11_1[L12_1]
    L11_1 = L11_1.usekey
    L7_1(L8_1, L9_1, L10_1, L11_1)
  end
end
L7_1 = _ENV
L8_1 = "Config"
L7_1 = L7_1[L8_1]
L8_1 = "ThemeParkPass"
L7_1 = L7_1[L8_1]
if L7_1 then
  L7_1 = RegisterNetEvent
  L8_1 = "rtx_themepark:Global:ThemeParkPassActivate"
  L7_1(L8_1)
  L7_1 = AddEventHandler
  L8_1 = "rtx_themepark:Global:ThemeParkPassActivate"
  function L9_1()
    local L0_2, L1_2
    L0_2 = true
    L0_1 = L0_2
    L0_2 = Config
    L0_2 = L0_2.ThemeParkPassTime
    L0_2 = L0_2 * 60
    L1_1 = L0_2
  end
  L7_1(L8_1, L9_1)
  L7_1 = _ENV
  L8_1 = "Citizen"
  L7_1 = L7_1[L8_1]
  L7_1 = L7_1.CreateThread
  function L8_1()
    local L0_2, L1_2, L2_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = L0_1
      if true == L0_2 then
        L0_2 = nearbythemepark
        if L0_2 then
          L0_2 = Citizen
          L0_2 = L0_2.Wait
          L1_2 = 1000
          L0_2(L1_2)
          L0_2 = L1_1
          if L0_2 >= 1 then
            L0_2 = L1_1
            L0_2 = L0_2 - 1
            L1_1 = L0_2
            L0_2 = tickets
            L0_2.gforce = true
            L0_2 = tickets
            L0_2.topscan = true
            L0_2 = tickets
            L0_2.vortex = true
            L0_2 = tickets
            L0_2.detonator = true
            L0_2 = tickets
            L0_2.boat = true
            L0_2 = tickets
            L0_2.ferris = true
            L0_2 = tickets
            L0_2.rollercoaster = true
            L0_2 = tickets
            L0_2.prater = true
            L0_2 = tickets
            L0_2.brakedance = true
            L0_2 = tickets
            L0_2.slingshot = true
            L0_2 = tickets
            L0_2.carousel = true
            L0_2 = tickets
            L0_2.extasy = true
            L0_2 = tickets
            L0_2.spinride = true
            L0_2 = tickets
            L0_2.hauntedhouse = true
            L0_2 = tickets
            L0_2.rollercoaster2 = true
            L0_2 = tickets
            L0_2.cannon = true
          else
            L0_2 = 0
            L1_1 = L0_2
            L0_2 = false
            L0_1 = L0_2
            L0_2 = Notify
            L1_2 = Language
            L2_2 = Config
            L2_2 = L2_2.Language
            L1_2 = L1_2[L2_2]
            L1_2 = L1_2.themeparkpassexpired
            L0_2(L1_2)
            L0_2 = tickets
            L0_2.gforce = false
            L0_2 = tickets
            L0_2.topscan = false
            L0_2 = tickets
            L0_2.vortex = false
            L0_2 = tickets
            L0_2.detonator = false
            L0_2 = tickets
            L0_2.boat = false
            L0_2 = tickets
            L0_2.ferris = false
            L0_2 = tickets
            L0_2.rollercoaster = false
            L0_2 = tickets
            L0_2.prater = false
            L0_2 = tickets
            L0_2.brakedance = false
            L0_2 = tickets
            L0_2.slingshot = false
            L0_2 = tickets
            L0_2.carousel = false
            L0_2 = tickets
            L0_2.extasy = false
            L0_2 = tickets
            L0_2.spinride = false
            L0_2 = tickets
            L0_2.hauntedhouse = false
            L0_2 = tickets
            L0_2.rollercoaster2 = false
            L0_2 = tickets
            L0_2.cannon = false
          end
      end
      else
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 1500
        L0_2(L1_2)
      end
    end
  end
  L7_1(L8_1)
end
L7_1 = _ENV
L8_1 = "Config"
L7_1 = L7_1[L8_1]
L7_1 = L7_1.ThemeParkDisableTicketSystem
if L7_1 then
  L7_1 = _ENV
  L8_1 = "Citizen"
  L7_1 = L7_1[L8_1]
  L7_1 = L7_1.CreateThread
  function L8_1()
    local L0_2, L1_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = nearbythemepark
      if L0_2 then
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 1000
        L0_2(L1_2)
        L0_2 = tickets
        L0_2.gforce = true
        L0_2 = tickets
        L0_2.topscan = true
        L0_2 = tickets
        L0_2.vortex = true
        L0_2 = tickets
        L0_2.detonator = true
        L0_2 = tickets
        L0_2.boat = true
        L0_2 = tickets
        L0_2.ferris = true
        L0_2 = tickets
        L0_2.rollercoaster = true
        L0_2 = tickets
        L0_2.prater = true
        L0_2 = tickets
        L0_2.brakedance = true
        L0_2 = tickets
        L0_2.slingshot = true
        L0_2 = tickets
        L0_2.carousel = true
        L0_2 = tickets
        L0_2.extasy = true
        L0_2 = tickets
        L0_2.spinride = true
        L0_2 = tickets
        L0_2.hauntedhouse = true
        L0_2 = tickets
        L0_2.rollercoaster2 = true
        L0_2 = tickets
        L0_2.cannon = true
      else
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 1500
        L0_2(L1_2)
      end
    end
  end
  L7_1(L8_1)
end
end
