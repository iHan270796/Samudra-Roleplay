local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
attractionlockdown = false
ESX = nil
QBCore = nil
L0_1 = {}
playsersinthemepark = L0_1
L0_1 = {}
playerusingattraction = L0_1
themeparkdisabled = false
L0_1 = {}
L0_1.owned = false
L0_1.identifier = ""
L0_1.balance = 0
L0_1.parkid = 1
themeparkowned = L0_1
L0_1 = {}
L0_1[1] = true
L0_1[2] = true
L0_1[3] = true
L0_1[4] = true
L0_1[5] = true
L0_1[6] = true
L0_1[7] = true
L0_1[8] = true
L0_1[9] = true
L0_1[10] = true
L0_1[11] = true
L0_1[12] = true
L0_1[13] = true
L0_1[13] = true
L0_1[14] = true
L0_1[15] = true
L0_1[16] = true
L0_1[17] = true
L0_1[18] = true
L0_1[19] = true
themeparkattractionsopenstatus = L0_1
L0_1 = {}
L1_1 = {}
L2_1 = Config
L2_1 = L2_1.AttractionsSettings
L2_1 = L2_1.gforce
L2_1 = L2_1.ticketprice
L1_1.ticketprice = L2_1
L1_1.attractionid = 1
L1_1.tickettype = 1
L2_1 = Config
L2_1 = L2_1.AttractionsSettings
L2_1 = L2_1.gforce
L2_1 = L2_1.disable
L1_1.disabled = L2_1
L2_1 = {}
L3_1 = Config
L3_1 = L3_1.AttractionsSettings
L3_1 = L3_1.topscan
L3_1 = L3_1.ticketprice
L2_1.ticketprice = L3_1
L2_1.attractionid = 2
L2_1.tickettype = 2
L3_1 = Config
L3_1 = L3_1.AttractionsSettings
L3_1 = L3_1.topscan
L3_1 = L3_1.disable
L2_1.disabled = L3_1
L3_1 = {}
L4_1 = Config
L4_1 = L4_1.AttractionsSettings
L4_1 = L4_1.rollercoaster
L4_1 = L4_1.ticketprice
L3_1.ticketprice = L4_1
L3_1.attractionid = 3
L3_1.tickettype = 7
L4_1 = Config
L4_1 = L4_1.AttractionsSettings
L4_1 = L4_1.rollercoaster
L4_1 = L4_1.disable
L3_1.disabled = L4_1
L4_1 = {}
L5_1 = Config
L5_1 = L5_1.AttractionsSettings
L5_1 = L5_1.shootingrange
L5_1 = L5_1.ticketprice
L4_1.ticketprice = L5_1
L4_1.attractionid = 5
L4_1.tickettype = 8
L5_1 = Config
L5_1 = L5_1.AttractionsSettings
L5_1 = L5_1.shootingrange
L5_1 = L5_1.disable
L4_1.disabled = L5_1
L5_1 = {}
L6_1 = Config
L6_1 = L6_1.AttractionsSettings
L6_1 = L6_1.shootingrange
L6_1 = L6_1.ticketprice
L5_1.ticketprice = L6_1
L5_1.attractionid = 5
L5_1.tickettype = 8
L6_1 = Config
L6_1 = L6_1.AttractionsSettings
L6_1 = L6_1.shootingrange
L6_1 = L6_1.disable
L5_1.disabled = L6_1
L6_1 = {}
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
L8_1 = Config
L8_1 = L8_1.AttractionsSettings
L8_1 = L8_1.vortex
L8_1 = L8_1.ticketprice
L7_1.ticketprice = L8_1
L7_1.attractionid = 7
L7_1.tickettype = 3
L8_1 = Config
L8_1 = L8_1.AttractionsSettings
L8_1 = L8_1.vortex
L8_1 = L8_1.disable
L7_1.disabled = L8_1
L8_1 = {}
L9_1 = Config
L9_1 = L9_1.AttractionsSettings
L9_1 = L9_1.ferris
L9_1 = L9_1.ticketprice
L8_1.ticketprice = L9_1
L8_1.attractionid = 8
L8_1.tickettype = 6
L9_1 = Config
L9_1 = L9_1.AttractionsSettings
L9_1 = L9_1.ferris
L9_1 = L9_1.disable
L8_1.disabled = L9_1
L9_1 = {}
L10_1 = Config
L10_1 = L10_1.AttractionsSettings
L10_1 = L10_1.detonator
L10_1 = L10_1.ticketprice
L9_1.ticketprice = L10_1
L9_1.attractionid = 9
L9_1.tickettype = 4
L10_1 = Config
L10_1 = L10_1.AttractionsSettings
L10_1 = L10_1.detonator
L10_1 = L10_1.disable
L9_1.disabled = L10_1
L10_1 = {}
L11_1 = Config
L11_1 = L11_1.AttractionsSettings
L11_1 = L11_1.boat
L11_1 = L11_1.ticketprice
L10_1.ticketprice = L11_1
L10_1.attractionid = 10
L10_1.tickettype = 5
L11_1 = Config
L11_1 = L11_1.AttractionsSettings
L11_1 = L11_1.boat
L11_1 = L11_1.disable
L10_1.disabled = L11_1
L11_1 = {}
L12_1 = Config
L12_1 = L12_1.AttractionsSettings
L12_1 = L12_1.prater
L12_1 = L12_1.ticketprice
L11_1.ticketprice = L12_1
L11_1.attractionid = 11
L11_1.tickettype = 10
L12_1 = Config
L12_1 = L12_1.AttractionsSettings
L12_1 = L12_1.prater
L12_1 = L12_1.disable
L11_1.disabled = L12_1
L12_1 = {}
L13_1 = Config
L13_1 = L13_1.AttractionsSettings
L13_1 = L13_1.brakedance
L13_1 = L13_1.ticketprice
L12_1.ticketprice = L13_1
L12_1.attractionid = 12
L12_1.tickettype = 11
L13_1 = Config
L13_1 = L13_1.AttractionsSettings
L13_1 = L13_1.brakedance
L13_1 = L13_1.disable
L12_1.disabled = L13_1
L13_1 = {}
L14_1 = Config
L14_1 = L14_1.AttractionsSettings
L14_1 = L14_1.slingshot
L14_1 = L14_1.ticketprice
L13_1.ticketprice = L14_1
L13_1.attractionid = 13
L13_1.tickettype = 12
L14_1 = Config
L14_1 = L14_1.AttractionsSettings
L14_1 = L14_1.slingshot
L14_1 = L14_1.disable
L13_1.disabled = L14_1
L14_1 = {}
L15_1 = Config
L15_1 = L15_1.AttractionsSettings
L15_1 = L15_1.carousel
L15_1 = L15_1.ticketprice
L14_1.ticketprice = L15_1
L14_1.attractionid = 14
L14_1.tickettype = 13
L15_1 = Config
L15_1 = L15_1.AttractionsSettings
L15_1 = L15_1.carousel
L15_1 = L15_1.disable
L14_1.disabled = L15_1
L15_1 = {}
L16_1 = Config
L16_1 = L16_1.AttractionsSettings
L16_1 = L16_1.extasy
L16_1 = L16_1.ticketprice
L15_1.ticketprice = L16_1
L15_1.attractionid = 15
L15_1.tickettype = 14
L16_1 = Config
L16_1 = L16_1.AttractionsSettings
L16_1 = L16_1.extasy
L16_1 = L16_1.disable
L15_1.disabled = L16_1
L16_1 = {}
L17_1 = Config
L17_1 = L17_1.AttractionsSettings
L17_1 = L17_1.spinride
L17_1 = L17_1.ticketprice
L16_1.ticketprice = L17_1
L16_1.attractionid = 16
L16_1.tickettype = 15
L17_1 = Config
L17_1 = L17_1.AttractionsSettings
L17_1 = L17_1.spinride
L17_1 = L17_1.disable
L16_1.disabled = L17_1
L17_1 = {}
L18_1 = Config
L18_1 = L18_1.AttractionsSettings
L18_1 = L18_1.hauntedhouse
L18_1 = L18_1.ticketprice
L17_1.ticketprice = L18_1
L17_1.attractionid = 17
L17_1.tickettype = 16
L18_1 = Config
L18_1 = L18_1.AttractionsSettings
L18_1 = L18_1.hauntedhouse
L18_1 = L18_1.disable
L17_1.disabled = L18_1
L18_1 = {}
L19_1 = Config
L19_1 = L19_1.AttractionsSettings
L19_1 = L19_1.rollercoaster2
L19_1 = L19_1.ticketprice
L18_1.ticketprice = L19_1
L18_1.attractionid = 18
L18_1.tickettype = 17
L19_1 = Config
L19_1 = L19_1.AttractionsSettings
L19_1 = L19_1.rollercoaster2
L19_1 = L19_1.disable
L18_1.disabled = L19_1
L19_1 = {}
L20_1 = Config
L20_1 = L20_1.AttractionsSettings
L20_1 = L20_1.cannon
L20_1 = L20_1.ticketprice
L19_1.ticketprice = L20_1
L19_1.attractionid = 19
L19_1.tickettype = 18
L20_1 = Config
L20_1 = L20_1.AttractionsSettings
L20_1 = L20_1.cannon
L20_1 = L20_1.disable
L19_1.disabled = L20_1
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L0_1[6] = L6_1
L0_1[7] = L7_1
L0_1[8] = L8_1
L0_1[9] = L9_1
L0_1[10] = L10_1
L0_1[11] = L11_1
L0_1[12] = L12_1
L0_1[13] = L13_1
L0_1[14] = L14_1
L0_1[15] = L15_1
L0_1[16] = L16_1
L0_1[17] = L17_1
L0_1[18] = L18_1
L0_1[19] = L19_1
ticketmachines = L0_1
L0_1 = {}
L1_1 = {}
L2_1 = Config
L2_1 = L2_1.ThemeParkControlMachineSettings
L2_1 = L2_1.attractions
L2_1 = L2_1.vortex
L2_1 = L2_1.label
L1_1.label = L2_1
L1_1.smokeactivated = false
L2_1 = Config
L2_1 = L2_1.ThemeParkControlMachineSettings
L2_1 = L2_1.attractions
L2_1 = L2_1.vortex
L2_1 = L2_1.disablesmoke
L1_1.smokedisabled = L2_1
L1_1.turndisabled = false
L2_1 = Config
L2_1 = L2_1.ThemeParkControlMachineSettings
L2_1 = L2_1.attractions
L2_1 = L2_1.vortex
L2_1 = L2_1.disablemusic
L1_1.musicdisabled = L2_1
L1_1.music = false
L1_1.musicurl = ""
L1_1.musicvolume = 100
L2_1 = Config
L2_1 = L2_1.ThemeParkControlMachineSettings
L2_1 = L2_1.attractions
L2_1 = L2_1.vortex
L2_1 = L2_1.smokecolor
L1_1.smokecolor = L2_1
L2_1 = {}
L3_1 = Config
L3_1 = L3_1.ThemeParkControlMachineSettings
L3_1 = L3_1.attractions
L3_1 = L3_1.vortex
L3_1 = L3_1.smokelocations
L2_1[1] = L3_1
L1_1.smokelocations = L2_1
L1_1.taken = false
L1_1.takenplayerid = nil
L2_1 = {}
L3_1 = Config
L3_1 = L3_1.ThemeParkControlMachineSettings
L3_1 = L3_1.attractions
L3_1 = L3_1.bumpercars
L3_1 = L3_1.label
L2_1.label = L3_1
L2_1.smokeactivated = false
L3_1 = Config
L3_1 = L3_1.ThemeParkControlMachineSettings
L3_1 = L3_1.attractions
L3_1 = L3_1.bumpercars
L3_1 = L3_1.disablesmoke
L2_1.smokedisabled = L3_1
L2_1.turndisabled = true
L3_1 = Config
L3_1 = L3_1.ThemeParkControlMachineSettings
L3_1 = L3_1.attractions
L3_1 = L3_1.bumpercars
L3_1 = L3_1.disablemusic
L2_1.musicdisabled = L3_1
L2_1.music = false
L2_1.musicurl = ""
L2_1.musicvolume = 100
L3_1 = Config
L3_1 = L3_1.ThemeParkControlMachineSettings
L3_1 = L3_1.attractions
L3_1 = L3_1.bumpercars
L3_1 = L3_1.smokecolor
L2_1.smokecolor = L3_1
L3_1 = {}
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.bumpercars
L4_1 = L4_1.smokelocations
L3_1[1] = L4_1
L2_1.smokelocations = L3_1
L2_1.taken = false
L2_1.takenplayerid = nil
L3_1 = {}
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.boat
L4_1 = L4_1.label
L3_1.label = L4_1
L3_1.smokeactivated = false
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.boat
L4_1 = L4_1.disablesmoke
L3_1.smokedisabled = L4_1
L3_1.turndisabled = false
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.boat
L4_1 = L4_1.disablemusic
L3_1.musicdisabled = L4_1
L3_1.music = false
L3_1.musicurl = ""
L3_1.musicvolume = 100
L4_1 = Config
L4_1 = L4_1.ThemeParkControlMachineSettings
L4_1 = L4_1.attractions
L4_1 = L4_1.boat
L4_1 = L4_1.smokecolor
L3_1.smokecolor = L4_1
L3_1.taken = false
L3_1.takenplayerid = nil
L4_1 = {}
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.rollercoaster
L5_1 = L5_1.label
L4_1.label = L5_1
L4_1.smokedisabled = true
L4_1.turndisabled = false
L5_1 = Config
L5_1 = L5_1.ThemeParkControlMachineSettings
L5_1 = L5_1.attractions
L5_1 = L5_1.rollercoaster
L5_1 = L5_1.disablemusic
L4_1.musicdisabled = L5_1
L4_1.music = false
L4_1.musicurl = ""
L4_1.musicvolume = 100
L4_1.taken = false
L4_1.takenplayerid = nil
L5_1 = {}
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.detonator
L6_1 = L6_1.label
L5_1.label = L6_1
L5_1.smokedisabled = true
L5_1.turndisabled = false
L6_1 = Config
L6_1 = L6_1.ThemeParkControlMachineSettings
L6_1 = L6_1.attractions
L6_1 = L6_1.detonator
L6_1 = L6_1.disablemusic
L5_1.musicdisabled = L6_1
L5_1.music = false
L5_1.musicurl = ""
L5_1.musicvolume = 100
L5_1.taken = false
L5_1.takenplayerid = nil
L6_1 = {}
L7_1 = Config
L7_1 = L7_1.ThemeParkControlMachineSettings
L7_1 = L7_1.attractions
L7_1 = L7_1.gforce
L7_1 = L7_1.label
L6_1.label = L7_1
L6_1.smokedisabled = true
L6_1.turndisabled = false
L7_1 = Config
L7_1 = L7_1.ThemeParkControlMachineSettings
L7_1 = L7_1.attractions
L7_1 = L7_1.gforce
L7_1 = L7_1.disablemusic
L6_1.musicdisabled = L7_1
L6_1.music = false
L6_1.musicurl = ""
L6_1.musicvolume = 100
L6_1.taken = false
L6_1.takenplayerid = nil
L7_1 = {}
L8_1 = Config
L8_1 = L8_1.ThemeParkControlMachineSettings
L8_1 = L8_1.attractions
L8_1 = L8_1.topscan
L8_1 = L8_1.label
L7_1.label = L8_1
L7_1.smokedisabled = true
L7_1.turndisabled = false
L8_1 = Config
L8_1 = L8_1.ThemeParkControlMachineSettings
L8_1 = L8_1.attractions
L8_1 = L8_1.topscan
L8_1 = L8_1.disablemusic
L7_1.musicdisabled = L8_1
L7_1.music = false
L7_1.musicurl = ""
L7_1.musicvolume = 100
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = Config
L9_1 = L9_1.ThemeParkControlMachineSettings
L9_1 = L9_1.attractions
L9_1 = L9_1.ferris
L9_1 = L9_1.label
L8_1.label = L9_1
L8_1.smokedisabled = true
L8_1.turndisabled = false
L9_1 = Config
L9_1 = L9_1.ThemeParkControlMachineSettings
L9_1 = L9_1.attractions
L9_1 = L9_1.ferris
L9_1 = L9_1.disablemusic
L8_1.musicdisabled = L9_1
L8_1.music = false
L8_1.musicurl = ""
L8_1.musicvolume = 100
L8_1.taken = false
L8_1.takenplayerid = nil
L9_1 = {}
L10_1 = Config
L10_1 = L10_1.ThemeParkControlMachineSettings
L10_1 = L10_1.attractions
L10_1 = L10_1.prater
L10_1 = L10_1.label
L9_1.label = L10_1
L9_1.smokedisabled = true
L9_1.turndisabled = false
L10_1 = Config
L10_1 = L10_1.ThemeParkControlMachineSettings
L10_1 = L10_1.attractions
L10_1 = L10_1.prater
L10_1 = L10_1.disablemusic
L9_1.musicdisabled = L10_1
L9_1.music = false
L9_1.musicurl = ""
L9_1.musicvolume = 100
L9_1.taken = false
L9_1.takenplayerid = nil
L10_1 = {}
L11_1 = Config
L11_1 = L11_1.ThemeParkControlMachineSettings
L11_1 = L11_1.attractions
L11_1 = L11_1.brakedance
L11_1 = L11_1.label
L10_1.label = L11_1
L10_1.smokedisabled = true
L10_1.turndisabled = false
L11_1 = Config
L11_1 = L11_1.ThemeParkControlMachineSettings
L11_1 = L11_1.attractions
L11_1 = L11_1.brakedance
L11_1 = L11_1.disablemusic
L10_1.musicdisabled = L11_1
L10_1.music = false
L10_1.musicurl = ""
L10_1.musicvolume = 100
L10_1.taken = false
L10_1.takenplayerid = nil
L11_1 = {}
L12_1 = Config
L12_1 = L12_1.ThemeParkControlMachineSettings
L12_1 = L12_1.attractions
L12_1 = L12_1.slingshot
L12_1 = L12_1.label
L11_1.label = L12_1
L11_1.smokedisabled = true
L11_1.turndisabled = false
L12_1 = Config
L12_1 = L12_1.ThemeParkControlMachineSettings
L12_1 = L12_1.attractions
L12_1 = L12_1.slingshot
L12_1 = L12_1.disablemusic
L11_1.musicdisabled = L12_1
L11_1.music = false
L11_1.musicurl = ""
L11_1.musicvolume = 100
L11_1.taken = false
L11_1.takenplayerid = nil
L12_1 = {}
L13_1 = Config
L13_1 = L13_1.ThemeParkControlMachineSettings
L13_1 = L13_1.attractions
L13_1 = L13_1.carousel
L13_1 = L13_1.label
L12_1.label = L13_1
L12_1.smokedisabled = true
L12_1.turndisabled = false
L13_1 = Config
L13_1 = L13_1.ThemeParkControlMachineSettings
L13_1 = L13_1.attractions
L13_1 = L13_1.carousel
L13_1 = L13_1.disablemusic
L12_1.musicdisabled = L13_1
L12_1.music = false
L12_1.musicurl = ""
L12_1.musicvolume = 100
L12_1.taken = false
L12_1.takenplayerid = nil
L13_1 = {}
L14_1 = Config
L14_1 = L14_1.ThemeParkControlMachineSettings
L14_1 = L14_1.attractions
L14_1 = L14_1.extasy
L14_1 = L14_1.label
L13_1.label = L14_1
L13_1.smokedisabled = true
L13_1.turndisabled = false
L14_1 = Config
L14_1 = L14_1.ThemeParkControlMachineSettings
L14_1 = L14_1.attractions
L14_1 = L14_1.extasy
L14_1 = L14_1.disablemusic
L13_1.musicdisabled = L14_1
L13_1.music = false
L13_1.musicurl = ""
L13_1.musicvolume = 100
L13_1.taken = false
L13_1.takenplayerid = nil
L14_1 = {}
L15_1 = Config
L15_1 = L15_1.ThemeParkControlMachineSettings
L15_1 = L15_1.attractions
L15_1 = L15_1.spinride
L15_1 = L15_1.label
L14_1.label = L15_1
L14_1.smokedisabled = true
L14_1.turndisabled = false
L15_1 = Config
L15_1 = L15_1.ThemeParkControlMachineSettings
L15_1 = L15_1.attractions
L15_1 = L15_1.spinride
L15_1 = L15_1.disablemusic
L14_1.musicdisabled = L15_1
L14_1.music = false
L14_1.musicurl = ""
L14_1.musicvolume = 100
L14_1.taken = false
L14_1.takenplayerid = nil
L15_1 = {}
L16_1 = Config
L16_1 = L16_1.ThemeParkControlMachineSettings
L16_1 = L16_1.attractions
L16_1 = L16_1.hauntedhouse
L16_1 = L16_1.label
L15_1.label = L16_1
L15_1.smokedisabled = true
L15_1.turndisabled = false
L15_1.musicdisabled = true
L15_1.music = false
L15_1.musicurl = ""
L15_1.musicvolume = 100
L15_1.taken = false
L15_1.takenplayerid = nil
L16_1 = {}
L17_1 = Config
L17_1 = L17_1.ThemeParkControlMachineSettings
L17_1 = L17_1.attractions
L17_1 = L17_1.rollercoaster2
L17_1 = L17_1.label
L16_1.label = L17_1
L16_1.smokedisabled = true
L16_1.turndisabled = false
L17_1 = Config
L17_1 = L17_1.ThemeParkControlMachineSettings
L17_1 = L17_1.attractions
L17_1 = L17_1.rollercoaster2
L17_1 = L17_1.disablemusic
L16_1.musicdisabled = L17_1
L16_1.music = false
L16_1.musicurl = ""
L16_1.musicvolume = 100
L16_1.taken = false
L16_1.takenplayerid = nil
L17_1 = {}
L18_1 = Config
L18_1 = L18_1.ThemeParkControlMachineSettings
L18_1 = L18_1.attractions
L18_1 = L18_1.cannon
L18_1 = L18_1.label
L17_1.label = L18_1
L17_1.smokedisabled = true
L17_1.turndisabled = false
L17_1.musicdisabled = true
L17_1.music = false
L17_1.musicurl = ""
L17_1.musicvolume = 100
L17_1.taken = false
L17_1.takenplayerid = nil
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L0_1[6] = L6_1
L0_1[7] = L7_1
L0_1[8] = L8_1
L0_1[9] = L9_1
L0_1[10] = L10_1
L0_1[11] = L11_1
L0_1[12] = L12_1
L0_1[13] = L13_1
L0_1[14] = L14_1
L0_1[15] = L15_1
L0_1[16] = L16_1
L0_1[17] = L17_1
controlmachines = L0_1
L0_1 = {}
playersiteminhand = L0_1
function L0_1(A0_2, ...)
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
LanguageFile2 = L0_1
function L0_1(A0_2, ...)
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
LanguageFile = L0_1
function L0_1(A0_2, A1_2)
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
round = L0_1
L0_1 = Config
L0_1 = L0_1.Framework
if "esx" == L0_1 then
  L0_1 = Config
  L0_1 = L0_1.ESXFramework
  L0_1 = L0_1.newversion
  if true == L0_1 then
    L0_1 = exports
    L1_1 = Config
    L1_1 = L1_1.ESXFramework
    L1_1 = L1_1.resourcename
    L0_1 = L0_1[L1_1]
    L1_1 = L0_1
    L0_1 = L0_1.getSharedObject
    L0_1 = L0_1(L1_1)
    ESX = L0_1
  else
    L0_1 = TriggerEvent
    L1_1 = Config
    L1_1 = L1_1.ESXFramework
    L1_1 = L1_1.getsharedobject
    function L2_1(A0_2)
      local L1_2
      ESX = A0_2
    end
    L0_1(L1_1, L2_1)
  end
end
L0_1 = Config
L0_1 = L0_1.Framework
if "qbcore" == L0_1 then
  L0_1 = exports
  L1_1 = Config
  L1_1 = L1_1.QBCoreFrameworkResourceName
  L0_1 = L0_1[L1_1]
  L1_1 = L0_1
  L0_1 = L0_1.GetCoreObject
  L0_1 = L0_1(L1_1)
  QBCore = L0_1
end
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Global:ParkSynchronize"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Global:ParkSynchronize"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = source
  L1_2 = Config
  L1_2 = L1_2.ThemeParkCanBeOwned
  if L1_2 then
    L1_2 = Config
    L1_2 = L1_2.ThemeParkOwnedSettings
    L1_2 = L1_2.enablepermissionsystem
    if false == L1_2 then
      L1_2 = GetPlayerIdentifierRTX
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      L2_2 = TriggerClientEvent
      L3_2 = "rtx_themepark:Global:ParkOwned"
      L4_2 = L0_2
      L5_2 = themeparkowned
      L5_2 = L5_2.owned
      L2_2(L3_2, L4_2, L5_2)
      L2_2 = themeparkowned
      L2_2 = L2_2.owned
      if true == L2_2 then
        L2_2 = themeparkowned
        L2_2 = L2_2.identifier
        if L2_2 == L1_2 then
          L2_2 = TriggerClientEvent
          L3_2 = "rtx_themepark:Global:ParkOwn"
          L4_2 = L0_2
          L5_2 = true
          L2_2(L3_2, L4_2, L5_2)
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Global:ParkResync"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Global:ParkResync"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L0_2 = source
  L1_2 = gforcehandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:GForce:SynchronizeStarted"
    L3_2 = L0_2
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:GForce:SeatDown"
    L3_2 = -1
    L4_2 = gforcehandler
    L4_2 = L4_2.seatdown
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = ipairs
    L2_2 = gforcehandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = TriggerClientEvent
      L8_2 = "rtx_themepark:GForce:SynchronizeCageClientResync"
      L9_2 = L0_2
      L10_2 = L5_2
      L11_2 = L6_2.cageclosed
      L7_2(L8_2, L9_2, L10_2, L11_2)
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:GForce:SynchronizeSeat"
          L15_2 = L0_2
          L16_2 = L5_2
          L17_2 = L11_2
          L18_2 = true
          L19_2 = L12_2.takenplayerid
          L20_2 = L12_2.seattype
          L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        end
      end
    end
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:GForce:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = gforcehandler
    L4_2 = L4_2.currentrotation
    L5_2 = gforcehandler
    L5_2 = L5_2.stagespeed
    L6_2 = gforcehandler
    L6_2 = L6_2.stage
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  else
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:GForce:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = gforcehandler
    L4_2 = L4_2.currentrotation
    L5_2 = gforcehandler
    L5_2 = L5_2.stagespeed
    L6_2 = gforcehandler
    L6_2 = L6_2.stage
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  end
  L1_2 = topscanhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:TopScan:SynchronizeStarted"
    L3_2 = L0_2
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = ipairs
    L2_2 = topscanhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:TopScan:SynchronizeSeat"
          L15_2 = L0_2
          L16_2 = L5_2
          L17_2 = L11_2
          L18_2 = true
          L19_2 = L12_2.takenplayerid
          L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        end
      end
    end
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:TopScan:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = {}
    L5_2 = topscanhandler
    L5_2 = L5_2.currentrotation
    L4_2.rot1 = L5_2
    L5_2 = topscanhandler
    L5_2 = L5_2.currentrotation2
    L4_2.rot2 = L5_2
    L5_2 = topscanhandler
    L5_2 = L5_2.currentrotation3
    L4_2.rot3 = L5_2
    L5_2 = topscanhandler
    L5_2 = L5_2.currentrotation4
    L4_2.rot4 = L5_2
    L5_2 = topscanhandler
    L5_2 = L5_2.stagespeed
    L6_2 = topscanhandler
    L6_2 = L6_2.stage
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  else
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:TopScan:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = {}
    L5_2 = topscanhandler
    L5_2 = L5_2.currentrotation
    L4_2.rot1 = L5_2
    L5_2 = topscanhandler
    L5_2 = L5_2.currentrotation2
    L4_2.rot2 = L5_2
    L5_2 = topscanhandler
    L5_2 = L5_2.currentrotation3
    L4_2.rot3 = L5_2
    L5_2 = topscanhandler
    L5_2 = L5_2.currentrotation4
    L4_2.rot4 = L5_2
    L5_2 = topscanhandler
    L5_2 = L5_2.stagespeed
    L6_2 = topscanhandler
    L6_2 = L6_2.stage
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  end
  L1_2 = vortexhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Vortex:SynchronizeStarted"
    L3_2 = L0_2
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Vortex:SynchronizeCageClientResync"
    L3_2 = L0_2
    L4_2 = vortexhandler
    L4_2 = L4_2.cageclosed
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = ipairs
    L2_2 = vortexhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = TriggerClientEvent
        L8_2 = "rtx_themepark:Vortex:SynchronizeSeat"
        L9_2 = L0_2
        L10_2 = L5_2
        L11_2 = true
        L12_2 = L6_2.takenplayerid
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      end
    end
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Vortex:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = vortexhandler
    L4_2 = L4_2.currentrotation
    L5_2 = vortexhandler
    L5_2 = L5_2.currentrotation2
    L6_2 = vortexhandler
    L6_2 = L6_2.stagespeed
    L7_2 = vortexhandler
    L7_2 = L7_2.stagespeed2
    L8_2 = vortexhandler
    L8_2 = L8_2.stage
    L9_2 = vortexhandler
    L9_2 = L9_2.stagedirection
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  else
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Vortex:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = vortexhandler
    L4_2 = L4_2.currentrotation
    L5_2 = vortexhandler
    L5_2 = L5_2.currentrotation2
    L6_2 = vortexhandler
    L6_2 = L6_2.stagespeed
    L7_2 = vortexhandler
    L7_2 = L7_2.stagespeed2
    L8_2 = vortexhandler
    L8_2 = L8_2.stage
    L9_2 = vortexhandler
    L9_2 = L9_2.stagedirection
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  end
  L1_2 = detonatorhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Detonator:SynchronizeStarted"
    L3_2 = L0_2
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Detonator:SynchronizeCageClientResync"
    L3_2 = L0_2
    L4_2 = detonatorhandler
    L4_2 = L4_2.cageclosed
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = ipairs
    L2_2 = detonatorhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = TriggerClientEvent
        L8_2 = "rtx_themepark:Detonator:SynchronizeSeat"
        L9_2 = L0_2
        L10_2 = L5_2
        L11_2 = true
        L12_2 = L6_2.takenplayerid
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      end
    end
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Detonator:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = detonatorhandler
    L4_2 = L4_2.currentheight
    L5_2 = detonatorhandler
    L5_2 = L5_2.stagespeed
    L6_2 = detonatorhandler
    L6_2 = L6_2.stage
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  else
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Detonator:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = detonatorhandler
    L4_2 = L4_2.currentheight
    L5_2 = detonatorhandler
    L5_2 = L5_2.stagespeed
    L6_2 = detonatorhandler
    L6_2 = L6_2.stage
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  end
  L1_2 = boathandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Boat:SynchronizeStarted"
    L3_2 = L0_2
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Boat:SynchronizeCageClientResync"
    L3_2 = L0_2
    L4_2 = boathandler
    L4_2 = L4_2.cageclosed
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = ipairs
    L2_2 = boathandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = TriggerClientEvent
        L8_2 = "rtx_themepark:Boat:SynchronizeSeat"
        L9_2 = L0_2
        L10_2 = L5_2
        L11_2 = true
        L12_2 = L6_2.takenplayerid
        L13_2 = L6_2.seattype
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      end
    end
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Boat:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = boathandler
    L4_2 = L4_2.currentrotation
    L5_2 = boathandler
    L5_2 = L5_2.stagespeed
    L6_2 = boathandler
    L6_2 = L6_2.stage
    L7_2 = boathandler
    L7_2 = L7_2.stagedirection
    L8_2 = false
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  else
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Boat:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = boathandler
    L4_2 = L4_2.currentrotation
    L5_2 = boathandler
    L5_2 = L5_2.stagespeed
    L6_2 = boathandler
    L6_2 = L6_2.stage
    L7_2 = boathandler
    L7_2 = L7_2.stagedirection
    L8_2 = false
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L1_2 = ferrishandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Ferris:SynchronizeStarted"
    L3_2 = L0_2
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = ipairs
    L2_2 = ferrishandler
    L2_2 = L2_2.cabins
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.players
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:Ferris:SynchronizeSeat"
          L15_2 = L0_2
          L16_2 = L5_2
          L17_2 = L11_2
          L18_2 = true
          L19_2 = L12_2.takenplayerid
          L20_2 = L12_2.seattype
          L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        end
      end
    end
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Ferris:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = ferrishandler
    L4_2 = L4_2.currentrotation
    L5_2 = ferrishandler
    L5_2 = L5_2.stagespeed
    L6_2 = true
    L7_2 = 0.0
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  else
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Ferris:SynchronizeMovement"
    L3_2 = L0_2
    L4_2 = ferrishandler
    L4_2 = L4_2.currentrotation
    L5_2 = ferrishandler
    L5_2 = L5_2.stagespeed
    L6_2 = true
    L7_2 = 0.0
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  end
  L1_2 = rollercoasterhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Rollercoaster:SynchronizeStarted"
    L3_2 = L0_2
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = ipairs
    L2_2 = rollercoasterhandler
    L2_2 = L2_2.carts
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.players
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:Rollercoaster:SynchronizeSeat"
          L15_2 = L0_2
          L16_2 = L5_2
          L17_2 = L11_2
          L18_2 = true
          L19_2 = L12_2.takenplayerid
          L20_2 = L12_2.seattype
          L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        end
      end
    end
  else
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Rollercoaster:AttractionEnded"
    L3_2 = L0_2
    L1_2(L2_2, L3_2)
  end
  L1_2 = praterhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = praterhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:Prater:SynchronizeSeat"
          L15_2 = L0_2
          L16_2 = L5_2
          L17_2 = L11_2
          L18_2 = true
          L19_2 = L12_2.takenplayerid
          L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:Global:AttractionUsing"
          L15_2 = L12_2.takenplayerid
          L16_2 = true
          L13_2(L14_2, L15_2, L16_2)
        end
      end
    end
  end
  L1_2 = brakedancehandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = brakedancehandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.cabins
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = ipairs
        L14_2 = L12_2.seats
        L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
        for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
          L19_2 = L18_2.taken
          if true == L19_2 then
            L19_2 = TriggerClientEvent
            L20_2 = "rtx_themepark:BrakeDance:SynchronizeSeat"
            L21_2 = L0_2
            L22_2 = L5_2
            L23_2 = L11_2
            L24_2 = L17_2
            L25_2 = true
            L26_2 = L18_2.takenplayerid
            L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
            L19_2 = TriggerClientEvent
            L20_2 = "rtx_themepark:Global:AttractionUsing"
            L21_2 = L18_2.takenplayerid
            L22_2 = true
            L19_2(L20_2, L21_2, L22_2)
          end
        end
      end
    end
  end
  L1_2 = slingshothandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = slingshothandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = TriggerClientEvent
        L8_2 = "rtx_themepark:SlingShot:SynchronizeSeat"
        L9_2 = L0_2
        L10_2 = L5_2
        L11_2 = true
        L12_2 = L6_2.takenplayerid
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      end
    end
  end
  L1_2 = carouselhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = carouselhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:Carousel:SynchronizeSeat"
          L15_2 = L0_2
          L16_2 = L5_2
          L17_2 = true
          L18_2 = L12_2.takenplayerid
          L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:Global:AttractionUsing"
          L15_2 = L12_2.takenplayerid
          L16_2 = true
          L13_2(L14_2, L15_2, L16_2)
        end
      end
    end
  end
  L1_2 = extasyhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = extasyhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.cabins
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = ipairs
        L14_2 = L12_2.seats
        L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
        for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
          L19_2 = L18_2.taken
          if true == L19_2 then
            L19_2 = TriggerClientEvent
            L20_2 = "rtx_themepark:Extasy:SynchronizeSeat"
            L21_2 = L0_2
            L22_2 = L5_2
            L23_2 = L11_2
            L24_2 = L17_2
            L25_2 = true
            L26_2 = L18_2.takenplayerid
            L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
            L19_2 = TriggerClientEvent
            L20_2 = "rtx_themepark:Global:AttractionUsing"
            L21_2 = L18_2.takenplayerid
            L22_2 = true
            L19_2(L20_2, L21_2, L22_2)
          end
        end
      end
    end
  end
  L1_2 = spinridehandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = spinridehandler
    L2_2 = L2_2.cabins
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:SpinRide:SynchronizeSeat"
          L15_2 = L0_2
          L16_2 = L5_2
          L17_2 = L11_2
          L18_2 = true
          L19_2 = L12_2.takenplayerid
          L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:Global:AttractionUsing"
          L15_2 = L12_2.takenplayerid
          L16_2 = true
          L13_2(L14_2, L15_2, L16_2)
        end
      end
    end
  end
  L1_2 = hauntedhousehandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = hauntedhousehandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = TriggerClientEvent
        L8_2 = "rtx_themepark:HauntedHouse:SynchronizeSeat"
        L9_2 = L0_2
        L10_2 = L5_2
        L11_2 = true
        L12_2 = L6_2.takenplayerid
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      end
    end
  end
  L1_2 = rollercoasterhandler2
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = rollercoasterhandler2
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = TriggerClientEvent
        L8_2 = "rtx_themepark:Rollercoaster2:SynchronizeSeat"
        L9_2 = L0_2
        L10_2 = L5_2
        L11_2 = true
        L12_2 = L6_2.takenplayerid
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      end
    end
  end
  L1_2 = bumperhandler
  L1_2 = L1_2.currentplayers
  if L1_2 > 0 then
    L1_2 = pairs
    L2_2 = bumperhandler
    L2_2 = L2_2.bumperplayers
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = TriggerClientEvent
      L8_2 = "rtx_themepark:Bumper:SynchronizeBumper"
      L9_2 = L0_2
      L10_2 = L5_2
      L11_2 = L6_2.vehiclenetwork
      L12_2 = L6_2.seattaken
      L13_2 = L6_2.seattakenid
      L14_2 = L6_2.bumpercolor
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    end
  end
  L1_2 = Config
  L1_2 = L1_2.ThemeParkControlAttractions
  if L1_2 then
    L1_2 = ipairs
    L2_2 = controlmachines
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.smokedisabled
      if false == L7_2 then
        L7_2 = TriggerClientEvent
        L8_2 = "rtx_themepark:Global:ThemeParkControlSmokeHandlerClient"
        L9_2 = L0_2
        L10_2 = L5_2
        L11_2 = L6_2.smokeactivated
        L7_2(L8_2, L9_2, L10_2, L11_2)
        L7_2 = TriggerClientEvent
        L8_2 = "rtx_themepark:Global:ThemeParkControlSmokeColorClient"
        L9_2 = L0_2
        L10_2 = L5_2
        L11_2 = L6_2.smokecolor
        L7_2(L8_2, L9_2, L10_2, L11_2)
      end
      L7_2 = L6_2.music
      if true == L7_2 then
        L7_2 = TriggerClientEvent
        L8_2 = "rtx_themepark:Music:ThemeParkControlMusicPlayClient"
        L9_2 = L0_2
        L10_2 = L5_2
        L11_2 = L6_2.musicurl
        L12_2 = L6_2.musicvolume
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      end
      L7_2 = TriggerClientEvent
      L8_2 = "rtx_themepark:Music:ThemeParkControlMusicVolume"
      L9_2 = L0_2
      L10_2 = L5_2
      L11_2 = L6_2.musicvolume
      L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = Config
L0_1 = L0_1.ThemeParkCanBeOwned
if L0_1 then
  function L0_1()
    local L0_2, L1_2, L2_2, L3_2
    L0_2 = MySQL
    L0_2 = L0_2.Async
    L0_2 = L0_2.fetchAll
    L1_2 = "SELECT * FROM owned_themepark"
    L2_2 = {}
    function L3_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
      L1_3 = ipairs
      L2_3 = A0_3
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
      for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
        if 1 == L5_3 then
          L7_3 = themeparkowned
          L7_3.owned = true
          L7_3 = themeparkowned
          L8_3 = L6_3.identifier
          L7_3.identifier = L8_3
          L7_3 = themeparkowned
          L8_3 = L6_3.balance
          L7_3.balance = L8_3
          L7_3 = themeparkowned
          L8_3 = L6_3.id
          L7_3.parkid = L8_3
        end
      end
      L1_3 = Config
      L1_3 = L1_3.ThemeParkOwnedSettings
      L1_3 = L1_3.enablepermissionsystem
      if true == L1_3 then
        L1_3 = themeparkowned
        L1_3 = L1_3.owned
        if false == L1_3 then
          L1_3 = MySQL
          L1_3 = L1_3.Async
          L1_3 = L1_3.execute
          L2_3 = "INSERT INTO owned_themepark (identifier, balance) VALUES (@identifier,@balance)"
          L3_3 = {}
          L3_3["@identifier"] = ""
          L3_3["@balance"] = 0
          function L4_3(A0_4)
            local L1_4
            L1_4 = themeparkowned
            L1_4.owned = true
          end
          L1_3(L2_3, L3_3, L4_3)
        end
      end
    end
    L0_2(L1_2, L2_2, L3_2)
  end
  ThemeParkCheckOwned = L0_1
  function L0_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2
    L1_2 = MySQL
    L1_2 = L1_2.Sync
    L1_2 = L1_2.execute
    L2_2 = "UPDATE owned_themepark SET identifier = @identifier WHERE id = @id"
    L3_2 = {}
    L4_2 = themeparkowned
    L4_2 = L4_2.parkid
    L3_2["@id"] = L4_2
    L3_2["@identifier"] = A0_2
    L1_2(L2_2, L3_2)
  end
  UpdateParkOwner = L0_1
  function L0_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2
    L1_2 = MySQL
    L1_2 = L1_2.Sync
    L1_2 = L1_2.execute
    L2_2 = "UPDATE owned_themepark SET balance = @balance WHERE id = @id"
    L3_2 = {}
    L4_2 = themeparkowned
    L4_2 = L4_2.parkid
    L3_2["@id"] = L4_2
    L3_2["@balance"] = A0_2
    L1_2(L2_2, L3_2)
  end
  UpdateParkMoney = L0_1
  function L0_1()
    local L0_2, L1_2, L2_2, L3_2
    L0_2 = MySQL
    L0_2 = L0_2.Async
    L0_2 = L0_2.execute
    L1_2 = "DELETE FROM owned_themepark WHERE id = @id"
    L2_2 = {}
    L3_2 = themeparkowned
    L3_2 = L3_2.parkid
    L2_2["@id"] = L3_2
    function L3_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3
      L1_3 = themeparkowned
      L1_3.owned = false
      L1_3 = TriggerClientEvent
      L2_3 = "rtx_themepark:Global:ParkOwned"
      L3_3 = -1
      L4_3 = false
      L1_3(L2_3, L3_3, L4_3)
      L1_3 = TriggerClientEvent
      L2_3 = "rtx_themepark:Global:ParkOwn"
      L3_3 = -1
      L4_3 = false
      L1_3(L2_3, L3_3, L4_3)
    end
    L0_2(L1_2, L2_2, L3_2)
  end
  RemoveParkOwnership = L0_1
  function L0_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2
    L2_2 = MySQL
    L2_2 = L2_2.Async
    L2_2 = L2_2.execute
    L3_2 = "INSERT INTO owned_themepark (identifier, balance) VALUES (@identifier,@balance)"
    L4_2 = {}
    L4_2["@identifier"] = A1_2
    L4_2["@balance"] = 0
    function L5_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3
      L1_3 = MySQL
      L1_3 = L1_3.Async
      L1_3 = L1_3.fetchAll
      L2_3 = "SELECT * FROM owned_themepark"
      L3_3 = {}
      function L4_3(A0_4)
        local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4
        L1_4 = ipairs
        L2_4 = A0_4
        L1_4, L2_4, L3_4, L4_4 = L1_4(L2_4)
        for L5_4, L6_4 in L1_4, L2_4, L3_4, L4_4 do
          if 1 == L5_4 then
            L7_4 = themeparkowned
            L7_4.owned = true
            L7_4 = themeparkowned
            L8_4 = L6_4.identifier
            L7_4.identifier = L8_4
            L7_4 = themeparkowned
            L8_4 = L6_4.balance
            L7_4.balance = L8_4
            L7_4 = themeparkowned
            L8_4 = L6_4.id
            L7_4.parkid = L8_4
          end
        end
        L1_4 = TriggerClientEvent
        L2_4 = "rtx_themepark:Global:ParkOwned"
        L3_4 = -1
        L4_4 = true
        L1_4(L2_4, L3_4, L4_4)
        L1_4 = TriggerClientEvent
        L2_4 = "rtx_themepark:Global:ParkOwn"
        L3_4 = A0_2
        L4_4 = true
        L1_4(L2_4, L3_4, L4_4)
      end
      L1_3(L2_3, L3_3, L4_3)
    end
    L2_2(L3_2, L4_2, L5_2)
  end
  BuyThemePark = L0_1
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:OpenThemeParkManagmentMenu"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:OpenThemeParkManagmentMenu"
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
    L0_2 = source
    L1_2 = themeparkowned
    L1_2 = L1_2.owned
    if true ~= L1_2 then
      L1_2 = Config
      L1_2 = L1_2.ThemeParkOwnedSettings
      L1_2 = L1_2.enablepermissionsystem
      if true ~= L1_2 then
        goto lbl_41
      end
    end
    L1_2 = Config
    L1_2 = L1_2.ThemeParkOwnedSettings
    L1_2 = L1_2.enablepermissionsystem
    if true == L1_2 then
      L1_2 = GetPlayerPermissionsManagment
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L2_2 = TriggerClientEvent
        L3_2 = "rtx_themepark:Global:OpenThemeParkManagmentMenuClient"
        L4_2 = L0_2
        L5_2 = themeparkowned
        L5_2 = L5_2.balance
        L2_2(L3_2, L4_2, L5_2)
      end
    else
      L1_2 = GetPlayerIdentifierRTX
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      L2_2 = themeparkowned
      L2_2 = L2_2.identifier
      if L2_2 == L1_2 then
        L2_2 = TriggerClientEvent
        L3_2 = "rtx_themepark:Global:OpenThemeParkManagmentMenuClient"
        L4_2 = L0_2
        L5_2 = themeparkowned
        L5_2 = L5_2.balance
        L2_2(L3_2, L4_2, L5_2)
      end
    end
    ::lbl_41::
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:OpenThemeParkManagmentMenuAttractions"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:OpenThemeParkManagmentMenuAttractions"
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
    L0_2 = source
    L1_2 = themeparkowned
    L1_2 = L1_2.owned
    if true ~= L1_2 then
      L1_2 = Config
      L1_2 = L1_2.ThemeParkOwnedSettings
      L1_2 = L1_2.enablepermissionsystem
      if true ~= L1_2 then
        goto lbl_39
      end
    end
    L1_2 = Config
    L1_2 = L1_2.ThemeParkOwnedSettings
    L1_2 = L1_2.enablepermissionsystem
    if true == L1_2 then
      L1_2 = GetPlayerPermissionsManagment
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L2_2 = TriggerClientEvent
        L3_2 = "rtx_themepark:Global:OpenThemeParkManagmentMenuAttractionsClient"
        L4_2 = L0_2
        L5_2 = themeparkattractionsopenstatus
        L2_2(L3_2, L4_2, L5_2)
      end
    else
      L1_2 = GetPlayerIdentifierRTX
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      L2_2 = themeparkowned
      L2_2 = L2_2.identifier
      if L2_2 == L1_2 then
        L2_2 = TriggerClientEvent
        L3_2 = "rtx_themepark:Global:OpenThemeParkManagmentMenuAttractionsClient"
        L4_2 = L0_2
        L5_2 = themeparkattractionsopenstatus
        L2_2(L3_2, L4_2, L5_2)
      end
    end
    ::lbl_39::
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:UpdateAttractionStatus"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:UpdateAttractionStatus"
  function L2_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2
    L2_2 = source
    L3_2 = themeparkowned
    L3_2 = L3_2.owned
    if true ~= L3_2 then
      L3_2 = Config
      L3_2 = L3_2.ThemeParkOwnedSettings
      L3_2 = L3_2.enablepermissionsystem
      if true ~= L3_2 then
        goto lbl_37
      end
    end
    L3_2 = Config
    L3_2 = L3_2.ThemeParkOwnedSettings
    L3_2 = L3_2.enablepermissionsystem
    if true == L3_2 then
      L3_2 = GetPlayerPermissionsManagment
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      if L3_2 and nil ~= A0_2 then
        L4_2 = themeparkattractionsopenstatus
        L4_2[A0_2] = A1_2
      end
    else
      L3_2 = GetPlayerIdentifierRTX
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = themeparkowned
      L4_2 = L4_2.identifier
      if L4_2 == L3_2 and nil ~= A0_2 then
        L4_2 = themeparkattractionsopenstatus
        L4_2[A0_2] = A1_2
      end
    end
    ::lbl_37::
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:BuyThemePark"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:BuyThemePark"
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L0_2 = source
    L1_2 = themeparkowned
    L1_2 = L1_2.owned
    if false == L1_2 then
      L1_2 = Config
      L1_2 = L1_2.ThemeParkOwnedSettings
      L1_2 = L1_2.enablepermissionsystem
      if false == L1_2 then
        L1_2 = GetMoneyRTX
        L2_2 = L0_2
        L1_2 = L1_2(L2_2)
        L2_2 = Config
        L2_2 = L2_2.ThemeParkOwnedSettings
        L2_2 = L2_2.themeparkprice
        if L1_2 >= L2_2 then
          L2_2 = themeparkowned
          L2_2.owned = true
          L2_2 = RemoveMoneyRTX
          L3_2 = L0_2
          L4_2 = Config
          L4_2 = L4_2.ThemeParkOwnedSettings
          L4_2 = L4_2.themeparkprice
          L2_2(L3_2, L4_2)
          L2_2 = GetPlayerIdentifierRTX
          L3_2 = L0_2
          L2_2 = L2_2(L3_2)
          L3_2 = themeparkowned
          L3_2.identifier = L2_2
          L3_2 = TriggerClientEvent
          L4_2 = "rtx_themepark:Notify"
          L5_2 = L0_2
          L6_2 = LanguageFile
          L7_2 = "youboughtthemepark"
          L8_2 = Config
          L8_2 = L8_2.ThemeParkOwnedSettings
          L8_2 = L8_2.themeparkprice
          L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
          L3_2 = BuyThemePark
          L4_2 = L0_2
          L5_2 = L2_2
          L3_2(L4_2, L5_2)
        else
          L2_2 = TriggerClientEvent
          L3_2 = "rtx_themepark:Notify"
          L4_2 = L0_2
          L5_2 = Language
          L6_2 = Config
          L6_2 = L6_2.Language
          L5_2 = L5_2[L6_2]
          L5_2 = L5_2.nomoneyenoughthemeparkbuy
          L2_2(L3_2, L4_2, L5_2)
        end
      end
    end
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:ThemeParkManagmentWithdraw"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:ThemeParkManagmentWithdraw"
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
    L0_2 = source
    L1_2 = themeparkowned
    L1_2 = L1_2.owned
    if true ~= L1_2 then
      L1_2 = Config
      L1_2 = L1_2.ThemeParkOwnedSettings
      L1_2 = L1_2.enablepermissionsystem
      if true ~= L1_2 then
        goto lbl_109
      end
    end
    L1_2 = Config
    L1_2 = L1_2.ThemeParkOwnedSettings
    L1_2 = L1_2.enablepermissionsystem
    if true == L1_2 then
      L1_2 = GetPlayerPermissionsManagment
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L2_2 = themeparkowned
        L2_2 = L2_2.balance
        if L2_2 > 0 then
          L2_2 = TriggerClientEvent
          L3_2 = "rtx_themepark:Notify"
          L4_2 = L0_2
          L5_2 = LanguageFile
          L6_2 = "youwithdrawthemepark"
          L7_2 = themeparkowned
          L7_2 = L7_2.balance
          L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
          L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
          L2_2 = AddMoneyRTX
          L3_2 = L0_2
          L4_2 = themeparkowned
          L4_2 = L4_2.balance
          L2_2(L3_2, L4_2)
          L2_2 = themeparkowned
          L2_2.balance = 0
          L2_2 = UpdateParkMoney
          L3_2 = themeparkowned
          L3_2 = L3_2.balance
          L2_2(L3_2)
          L2_2 = TriggerClientEvent
          L3_2 = "rtx_themepark:Global:ManagmentMenuUpdate"
          L4_2 = L0_2
          L5_2 = themeparkowned
          L5_2 = L5_2.balance
          L2_2(L3_2, L4_2, L5_2)
        else
          L2_2 = TriggerClientEvent
          L3_2 = "rtx_themepark:Notify"
          L4_2 = L0_2
          L5_2 = Language
          L6_2 = Config
          L6_2 = L6_2.Language
          L5_2 = L5_2[L6_2]
          L5_2 = L5_2.nomoneywithdrawthemepark
          L2_2(L3_2, L4_2, L5_2)
        end
      end
    else
      L1_2 = GetPlayerIdentifierRTX
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      L2_2 = themeparkowned
      L2_2 = L2_2.identifier
      if L2_2 == L1_2 then
        L2_2 = themeparkowned
        L2_2 = L2_2.balance
        if L2_2 > 0 then
          L2_2 = TriggerClientEvent
          L3_2 = "rtx_themepark:Notify"
          L4_2 = L0_2
          L5_2 = LanguageFile
          L6_2 = "youwithdrawthemepark"
          L7_2 = themeparkowned
          L7_2 = L7_2.balance
          L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
          L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
          L2_2 = AddMoneyRTX
          L3_2 = L0_2
          L4_2 = themeparkowned
          L4_2 = L4_2.balance
          L2_2(L3_2, L4_2)
          L2_2 = themeparkowned
          L2_2.balance = 0
          L2_2 = UpdateParkMoney
          L3_2 = themeparkowned
          L3_2 = L3_2.balance
          L2_2(L3_2)
          L2_2 = TriggerClientEvent
          L3_2 = "rtx_themepark:Global:ManagmentMenuUpdate"
          L4_2 = L0_2
          L5_2 = themeparkowned
          L5_2 = L5_2.balance
          L2_2(L3_2, L4_2, L5_2)
        else
          L2_2 = TriggerClientEvent
          L3_2 = "rtx_themepark:Notify"
          L4_2 = L0_2
          L5_2 = Language
          L6_2 = Config
          L6_2 = L6_2.Language
          L5_2 = L5_2[L6_2]
          L5_2 = L5_2.nomoneywithdrawthemepark
          L2_2(L3_2, L4_2, L5_2)
        end
      end
    end
    ::lbl_109::
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:SellThemePark"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:SellThemePark"
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L0_2 = source
    L1_2 = Config
    L1_2 = L1_2.ThemeParkOwnedSettings
    L1_2 = L1_2.disablesell
    if false == L1_2 then
      L1_2 = Config
      L1_2 = L1_2.ThemeParkOwnedSettings
      L1_2 = L1_2.enablepermissionsystem
      if false == L1_2 then
        L1_2 = themeparkowned
        L1_2 = L1_2.owned
        if true == L1_2 then
          L1_2 = GetPlayerIdentifierRTX
          L2_2 = L0_2
          L1_2 = L1_2(L2_2)
          L2_2 = themeparkowned
          L2_2 = L2_2.identifier
          if L2_2 == L1_2 then
            L2_2 = round
            L3_2 = Config
            L3_2 = L3_2.ThemeParkOwnedSettings
            L3_2 = L3_2.themeparkprice
            L4_2 = Config
            L4_2 = L4_2.ThemeParkOwnedSettings
            L4_2 = L4_2.sellmultipler
            L3_2 = L3_2 * L4_2
            L4_2 = 0
            L2_2 = L2_2(L3_2, L4_2)
            L3_2 = themeparkowned
            L3_2.owned = false
            L3_2 = themeparkowned
            L3_2.identifier = ""
            L3_2 = TriggerClientEvent
            L4_2 = "rtx_gym:Notify"
            L5_2 = L0_2
            L6_2 = LanguageFile
            L7_2 = "yousoldthemepark"
            L8_2 = L2_2
            L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
            L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
            L3_2 = AddMoneyRTX
            L4_2 = L0_2
            L5_2 = L2_2
            L3_2(L4_2, L5_2)
            L3_2 = TriggerClientEvent
            L4_2 = "rtx_themepark:Global:ParkOwn"
            L5_2 = L0_2
            L6_2 = false
            L3_2(L4_2, L5_2, L6_2)
            L3_2 = TriggerClientEvent
            L4_2 = "rtx_themepark:Global:ParkOwned"
            L5_2 = -1
            L6_2 = false
            L3_2(L4_2, L5_2, L6_2)
            L3_2 = RemoveParkOwnership
            L3_2()
          end
        end
      end
    end
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:TransferThemePark"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:TransferThemePark"
  function L2_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L1_2 = source
    L2_2 = Config
    L2_2 = L2_2.ThemeParkOwnedSettings
    L2_2 = L2_2.disabletransfer
    if false == L2_2 then
      L2_2 = Config
      L2_2 = L2_2.ThemeParkOwnedSettings
      L2_2 = L2_2.enablepermissionsystem
      if false == L2_2 then
        L2_2 = themeparkowned
        L2_2 = L2_2.owned
        if true == L2_2 then
          L2_2 = GetPlayerIdentifierRTX
          L3_2 = L1_2
          L2_2 = L2_2(L3_2)
          L3_2 = themeparkowned
          L3_2 = L3_2.identifier
          if L3_2 == L2_2 then
            L3_2 = GetPlayerIdentifierRTX
            L4_2 = A0_2
            L3_2 = L3_2(L4_2)
            L4_2 = themeparkowned
            L4_2.identifier = L3_2
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_gym:Notify"
            L6_2 = L1_2
            L7_2 = Language
            L8_2 = Config
            L8_2 = L8_2.Language
            L7_2 = L7_2[L8_2]
            L7_2 = L7_2.youtransferthemepark
            L4_2(L5_2, L6_2, L7_2)
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_gym:Notify"
            L6_2 = A0_2
            L7_2 = Language
            L8_2 = Config
            L8_2 = L8_2.Language
            L7_2 = L7_2[L8_2]
            L7_2 = L7_2.themeparkransferredto
            L4_2(L5_2, L6_2, L7_2)
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Global:ParkOwn"
            L6_2 = L1_2
            L7_2 = false
            L4_2(L5_2, L6_2, L7_2)
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Global:ParkOwn"
            L6_2 = A0_2
            L7_2 = true
            L4_2(L5_2, L6_2, L7_2)
            L4_2 = UpdateParkOwner
            L5_2 = L3_2
            L4_2(L5_2)
          end
        end
      end
    end
  end
  L0_1(L1_1, L2_1)
  L0_1 = Citizen
  L0_1 = L0_1.CreateThread
  function L1_1()
    local L0_2, L1_2
    L0_2 = ThemeParkCheckOwned
    L0_2()
  end
  L0_1(L1_1)
end
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Global:OpenTicketMachineMenu"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Global:OpenTicketMachineMenu"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  if nil ~= A0_2 then
    L2_2 = ticketmachines
    L2_2 = L2_2[A0_2]
    L3_2 = L2_2.disabled
    if false == L3_2 then
      L3_2 = themeparkdisabled
      if false == L3_2 then
        L3_2 = themeparkattractionsopenstatus
        L4_2 = L2_2.attractionid
        L3_2 = L3_2[L4_2]
        if true == L3_2 then
          L3_2 = TriggerClientEvent
          L4_2 = "rtx_themepark:Global:OpenTicketMachineMenuClient"
          L5_2 = L1_2
          L6_2 = A0_2
          L3_2(L4_2, L5_2, L6_2)
        else
          L3_2 = TriggerClientEvent
          L4_2 = "rtx_themepark:Notify"
          L5_2 = L1_2
          L6_2 = Language
          L7_2 = Config
          L7_2 = L7_2.Language
          L6_2 = L6_2[L7_2]
          L6_2 = L6_2.attractionclosed
          L3_2(L4_2, L5_2, L6_2)
        end
    end
    else
      L3_2 = TriggerClientEvent
      L4_2 = "rtx_themepark:Notify"
      L5_2 = L1_2
      L6_2 = Language
      L7_2 = Config
      L7_2 = L7_2.Language
      L6_2 = L6_2[L7_2]
      L6_2 = L6_2.attractionclosed
      L3_2(L4_2, L5_2, L6_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Global:ThemeParkBuyTicket"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Global:ThemeParkBuyTicket"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = source
  if nil ~= A0_2 then
    L2_2 = ticketmachines
    L2_2 = L2_2[A0_2]
    L3_2 = L2_2.disabled
    if false == L3_2 then
      L3_2 = themeparkdisabled
      if false == L3_2 then
        L3_2 = themeparkattractionsopenstatus
        L4_2 = L2_2.attractionid
        L3_2 = L3_2[L4_2]
        if true == L3_2 then
          L3_2 = GetMoneyRTX
          L4_2 = L1_2
          L3_2 = L3_2(L4_2)
          L4_2 = L2_2.ticketprice
          if L3_2 >= L4_2 then
            L4_2 = RemoveMoneyRTX
            L5_2 = L1_2
            L6_2 = L2_2.ticketprice
            L4_2(L5_2, L6_2)
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Notify"
            L6_2 = L1_2
            L7_2 = LanguageFile
            L8_2 = "ticketthemeparkbought"
            L9_2 = L2_2.ticketprice
            L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
            L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Global:TicketHandler"
            L6_2 = L1_2
            L7_2 = L2_2.tickettype
            L8_2 = true
            L4_2(L5_2, L6_2, L7_2, L8_2)
            L4_2 = Config
            L4_2 = L4_2.ThemeParkCanBeOwned
            if L4_2 then
              L4_2 = round
              L5_2 = L2_2.ticketprice
              L6_2 = Config
              L6_2 = L6_2.ThemeParkOwnedSettings
              L6_2 = L6_2.ticketmultipler
              L5_2 = L5_2 * L6_2
              L6_2 = 0
              L4_2 = L4_2(L5_2, L6_2)
              L5_2 = themeparkowned
              L6_2 = themeparkowned
              L6_2 = L6_2.balance
              L6_2 = L6_2 + L4_2
              L5_2.balance = L6_2
              L5_2 = UpdateParkMoney
              L6_2 = themeparkowned
              L6_2 = L6_2.balance
              L5_2(L6_2)
            end
          else
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Notify"
            L6_2 = L1_2
            L7_2 = LanguageFile
            L8_2 = "nomoneyenoughthemeparkattraction"
            L9_2 = L2_2.ticketprice
            L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
            L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
          end
        else
          L3_2 = TriggerClientEvent
          L4_2 = "rtx_themepark:Notify"
          L5_2 = L1_2
          L6_2 = Language
          L7_2 = Config
          L7_2 = L7_2.Language
          L6_2 = L6_2[L7_2]
          L6_2 = L6_2.attractionclosed
          L3_2(L4_2, L5_2, L6_2)
        end
    end
    else
      L3_2 = TriggerClientEvent
      L4_2 = "rtx_themepark:Notify"
      L5_2 = L1_2
      L6_2 = Language
      L7_2 = Config
      L7_2 = L7_2.Language
      L6_2 = L6_2[L7_2]
      L6_2 = L6_2.attractionclosed
      L3_2(L4_2, L5_2, L6_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Global:GiveItemInHand"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Global:GiveItemInHand"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = source
  L4_2 = playersiteminhand
  L4_2 = L4_2[L3_2]
  if nil ~= L4_2 then
    L4_2 = playerusingattraction
    L4_2 = L4_2[A0_2]
    if nil == L4_2 then
      L4_2 = playersiteminhand
      L4_2 = L4_2[A0_2]
      if nil == L4_2 then
        L4_2 = playersiteminhand
        L4_2[L3_2] = nil
        L4_2 = playersiteminhand
        L4_2[A0_2] = true
        L4_2 = TriggerClientEvent
        L5_2 = "rtx_themepark:Global:GiveHandItem"
        L6_2 = -1
        L7_2 = A0_2
        L8_2 = A1_2
        L9_2 = A2_2
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
        L4_2 = TriggerClientEvent
        L5_2 = "rtx_themepark:Global:InHandItem"
        L6_2 = A0_2
        L7_2 = A1_2
        L8_2 = A2_2
        L4_2(L5_2, L6_2, L7_2, L8_2)
        L4_2 = TriggerClientEvent
        L5_2 = "rtx_themepark:Global:RemoveHandItem"
        L6_2 = -1
        L7_2 = L3_2
        L4_2(L5_2, L6_2, L7_2)
        L4_2 = TriggerClientEvent
        L5_2 = "rtx_themepark:Global:InHandItemRemoveInterface"
        L6_2 = L3_2
        L4_2(L5_2, L6_2)
      else
        L4_2 = TriggerClientEvent
        L5_2 = "rtx_themepark:Notify"
        L6_2 = L3_2
        L7_2 = Language
        L8_2 = Config
        L8_2 = L8_2.Language
        L7_2 = L7_2[L8_2]
        L7_2 = L7_2.thisplayerhaveitem
        L4_2(L5_2, L6_2, L7_2)
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Global:RemoveItemInHand"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Global:RemoveItemInHand"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = source
  L3_2 = playersiteminhand
  L3_2 = L3_2[L2_2]
  if nil ~= L3_2 then
    L3_2 = playersiteminhand
    L3_2[L2_2] = nil
    L3_2 = TriggerClientEvent
    L4_2 = "rtx_themepark:Global:InHandItemRemoveInterface"
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
    L3_2 = TriggerClientEvent
    L4_2 = "rtx_themepark:Global:RemoveHandItemThrow"
    L5_2 = -1
    L6_2 = L2_2
    L7_2 = A0_2
    L8_2 = A1_2
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Global:BuyItemToHand"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Global:BuyItemToHand"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = source
  if nil ~= A0_2 then
    L2_2 = playersiteminhand
    L2_2 = L2_2[L1_2]
    if nil == L2_2 then
      L2_2 = Config
      L2_2 = L2_2.Stands
      L2_2 = L2_2[A0_2]
      L3_2 = GetMoneyRTX
      L4_2 = L1_2
      L3_2 = L3_2(L4_2)
      L4_2 = L2_2.itemprice
      if L3_2 >= L4_2 then
        L4_2 = RemoveMoneyRTX
        L5_2 = L1_2
        L6_2 = L2_2.itemprice
        L4_2(L5_2, L6_2)
        L4_2 = TriggerClientEvent
        L5_2 = "rtx_themepark:Notify"
        L6_2 = L1_2
        L7_2 = LanguageFile
        L8_2 = "itemthemeparkbought"
        L9_2 = L2_2.itemprice
        L10_2 = L2_2.standtype
        L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2, L10_2)
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
        L4_2 = playersiteminhand
        L4_2[L1_2] = true
        L4_2 = math
        L4_2 = L4_2.random
        L5_2 = 1
        L6_2 = 4
        L4_2 = L4_2(L5_2, L6_2)
        L5_2 = TriggerClientEvent
        L6_2 = "rtx_themepark:Global:GiveHandItem"
        L7_2 = -1
        L8_2 = L1_2
        L9_2 = L2_2.standtype
        L10_2 = L4_2
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
        L5_2 = TriggerClientEvent
        L6_2 = "rtx_themepark:Global:InHandItem"
        L7_2 = L1_2
        L8_2 = L2_2.standtype
        L9_2 = L4_2
        L5_2(L6_2, L7_2, L8_2, L9_2)
        L5_2 = Config
        L5_2 = L5_2.ThemeParkCanBeOwned
        if L5_2 then
          L5_2 = round
          L6_2 = L2_2.itemprice
          L7_2 = Config
          L7_2 = L7_2.ThemeParkOwnedSettings
          L7_2 = L7_2.itemmultipler
          L6_2 = L6_2 * L7_2
          L7_2 = 0
          L5_2 = L5_2(L6_2, L7_2)
          L6_2 = themeparkowned
          L7_2 = themeparkowned
          L7_2 = L7_2.balance
          L7_2 = L7_2 + L5_2
          L6_2.balance = L7_2
          L6_2 = UpdateParkMoney
          L7_2 = themeparkowned
          L7_2 = L7_2.balance
          L6_2(L7_2)
        end
        L5_2 = L2_2.standtype
        if "hotdog" == L5_2 then
          L5_2 = Citizen
          L5_2 = L5_2.Wait
          L6_2 = 5000
          L5_2(L6_2)
          L5_2 = TriggerClientEvent
          L6_2 = "rtx_themepark:Global:InHandItemRemoveInterface"
          L7_2 = L1_2
          L5_2(L6_2, L7_2)
          L5_2 = TriggerClientEvent
          L6_2 = "rtx_themepark:Global:RemoveHandItem"
          L7_2 = -1
          L8_2 = L1_2
          L5_2(L6_2, L7_2, L8_2)
          L5_2 = playersiteminhand
          L5_2[L1_2] = nil
        else
          L5_2 = L2_2.standtype
          if "juice" == L5_2 then
            L5_2 = Citizen
            L5_2 = L5_2.Wait
            L6_2 = 7000
            L5_2(L6_2)
            L5_2 = TriggerClientEvent
            L6_2 = "rtx_themepark:Global:InHandItemRemoveInterface"
            L7_2 = L1_2
            L5_2(L6_2, L7_2)
            L5_2 = TriggerClientEvent
            L6_2 = "rtx_themepark:Global:RemoveHandItem"
            L7_2 = -1
            L8_2 = L1_2
            L5_2(L6_2, L7_2, L8_2)
            L5_2 = playersiteminhand
            L5_2[L1_2] = nil
          else
            L5_2 = L2_2.standtype
            if "burger" == L5_2 then
              L5_2 = Citizen
              L5_2 = L5_2.Wait
              L6_2 = 5000
              L5_2(L6_2)
              L5_2 = TriggerClientEvent
              L6_2 = "rtx_themepark:Global:InHandItemRemoveInterface"
              L7_2 = L1_2
              L5_2(L6_2, L7_2)
              L5_2 = TriggerClientEvent
              L6_2 = "rtx_themepark:Global:RemoveHandItem"
              L7_2 = -1
              L8_2 = L1_2
              L5_2(L6_2, L7_2, L8_2)
              L5_2 = playersiteminhand
              L5_2[L1_2] = nil
            end
          end
        end
      else
        L4_2 = TriggerClientEvent
        L5_2 = "rtx_themepark:Notify"
        L6_2 = L1_2
        L7_2 = LanguageFile
        L8_2 = "nomoneyenoughthemeparkitem"
        L9_2 = L2_2.itemprice
        L10_2 = L2_2.standtype
        L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2, L10_2)
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      end
    else
      L2_2 = TriggerClientEvent
      L3_2 = "rtx_themepark:Notify"
      L4_2 = L1_2
      L5_2 = Language
      L6_2 = Config
      L6_2 = L6_2.Language
      L5_2 = L5_2[L6_2]
      L5_2 = L5_2.youhaveitemalready
      L2_2(L3_2, L4_2, L5_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = Config
L0_1 = L0_1.ThemeParkControlAttractions
if L0_1 then
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:StartAttractionPlayer"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:StartAttractionPlayer"
  function L2_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
    L2_2 = source
    if nil ~= A0_2 then
      L3_2 = controlmachines
      L3_2 = L3_2[A0_2]
      L4_2 = L3_2.taken
      if true == L4_2 then
        L4_2 = L3_2.takenplayerid
        if L4_2 == L2_2 then
          if 1 == A1_2 then
            L4_2 = gforcehandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = gforcehandler
              L4_2.started = true
              L4_2 = pairs
              L5_2 = playsersinthemepark
              L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
              for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
                L10_2 = TriggerClientEvent
                L11_2 = "rtx_themepark:GForce:SynchronizeStarted"
                L12_2 = L9_2
                L13_2 = true
                L10_2(L11_2, L12_2, L13_2)
              end
              L4_2 = StartGForce
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 2 == A1_2 then
            L4_2 = topscanhandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = topscanhandler
              L4_2.started = true
              L4_2 = pairs
              L5_2 = playsersinthemepark
              L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
              for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
                L10_2 = TriggerClientEvent
                L11_2 = "rtx_themepark:TopScan:SynchronizeStarted"
                L12_2 = L9_2
                L13_2 = true
                L10_2(L11_2, L12_2, L13_2)
              end
              L4_2 = StartTopScan
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 3 == A1_2 then
            L4_2 = vortexhandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = vortexhandler
              L4_2.started = true
              L4_2 = pairs
              L5_2 = playsersinthemepark
              L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
              for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
                L10_2 = TriggerClientEvent
                L11_2 = "rtx_themepark:Vortex:SynchronizeStarted"
                L12_2 = L9_2
                L13_2 = true
                L10_2(L11_2, L12_2, L13_2)
              end
              L4_2 = StartVortex
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 4 == A1_2 then
            L4_2 = detonatorhandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = detonatorhandler
              L4_2.started = true
              L4_2 = pairs
              L5_2 = playsersinthemepark
              L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
              for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
                L10_2 = TriggerClientEvent
                L11_2 = "rtx_themepark:Detonator:SynchronizeStarted"
                L12_2 = L9_2
                L13_2 = true
                L10_2(L11_2, L12_2, L13_2)
              end
              L4_2 = StartDetonator
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 5 == A1_2 then
            L4_2 = boathandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = boathandler
              L4_2.started = true
              L4_2 = pairs
              L5_2 = playsersinthemepark
              L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
              for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
                L10_2 = TriggerClientEvent
                L11_2 = "rtx_themepark:Boat:SynchronizeStarted"
                L12_2 = L9_2
                L13_2 = true
                L10_2(L11_2, L12_2, L13_2)
              end
              L4_2 = StartBoat
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 7 == A1_2 then
            L4_2 = ferrishandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = ferrishandler
              L4_2.started = true
              L4_2 = pairs
              L5_2 = playsersinthemepark
              L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
              for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
                L10_2 = TriggerClientEvent
                L11_2 = "rtx_themepark:Ferris:SynchronizeStarted"
                L12_2 = L9_2
                L13_2 = true
                L10_2(L11_2, L12_2, L13_2)
              end
              L4_2 = StartFerris
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 8 == A1_2 then
            L4_2 = rollercoasterhandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = rollercoasterhandler
              L4_2.started = true
              L4_2 = pairs
              L5_2 = playsersinthemepark
              L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
              for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
                L10_2 = TriggerClientEvent
                L11_2 = "rtx_themepark:Rollercoaster:SynchronizeStarted"
                L12_2 = L9_2
                L13_2 = true
                L10_2(L11_2, L12_2, L13_2)
              end
              L4_2 = StartRollercoaster
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 9 == A1_2 then
            L4_2 = praterhandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = praterhandler
              L4_2.started = true
              L4_2 = StartAttraction10
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 10 == A1_2 then
            L4_2 = brakedancehandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = brakedancehandler
              L4_2.started = true
              L4_2 = StartAttraction11
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 11 == A1_2 then
            L4_2 = slingshothandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = slingshothandler
              L4_2.started = true
              L4_2 = StartAttraction12
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 12 == A1_2 then
            L4_2 = carouselhandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = carouselhandler
              L4_2.started = true
              L4_2 = StartAttraction13
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 13 == A1_2 then
            L4_2 = extasyhandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = extasyhandler
              L4_2.started = true
              L4_2 = StartAttraction14
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 14 == A1_2 then
            L4_2 = spinridehandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = spinridehandler
              L4_2.started = true
              L4_2 = StartAttraction15
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 15 == A1_2 then
            L4_2 = hauntedhousehandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = hauntedhousehandler
              L4_2.started = true
              L4_2 = StartHauntedHouse
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 16 == A1_2 then
            L4_2 = rollercoasterhandler2
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = rollercoasterhandler2
              L4_2.started = true
              L4_2 = StartRollercoaster2
              L4_2()
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          elseif 17 == A1_2 then
            L4_2 = cannonhandler
            L4_2 = L4_2.started
            if false == L4_2 then
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = LanguageFile
              L8_2 = "youstartedattraction"
              L9_2 = L3_2.label
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              L4_2 = cannonhandler
              L4_2.started = true
              L4_2 = StartCannon
              L5_2 = GlobalState
              L5_2 = L5_2["attraction18-playerid"]
              L4_2(L5_2)
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L2_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.attractioninprogress
              L4_2(L5_2, L6_2, L7_2)
            end
          end
        end
      end
    end
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:ThemeParkOpenControlMenu"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:ThemeParkOpenControlMenu"
  function L2_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L1_2 = source
    if nil ~= A0_2 then
      L2_2 = controlmachines
      L2_2 = L2_2[A0_2]
      L3_2 = L2_2.taken
      if false == L3_2 then
        L3_2 = GetPlayerPermissionsControlAttraction
        L4_2 = L1_2
        L3_2 = L3_2(L4_2)
        if L3_2 then
          L2_2.taken = true
          L2_2.takenplayerid = L1_2
          L4_2 = TriggerClientEvent
          L5_2 = "rtx_themepark:Global:ThemeParkOpenControlMenuClient"
          L6_2 = L1_2
          L7_2 = A0_2
          L4_2(L5_2, L6_2, L7_2)
        else
          L4_2 = TriggerClientEvent
          L5_2 = "rtx_themepark:Notify"
          L6_2 = L1_2
          L7_2 = Language
          L8_2 = Config
          L8_2 = L8_2.Language
          L7_2 = L7_2[L8_2]
          L7_2 = L7_2.nopermission
          L4_2(L5_2, L6_2, L7_2)
        end
      else
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:Notify"
        L5_2 = L1_2
        L6_2 = Language
        L7_2 = Config
        L7_2 = L7_2.Language
        L6_2 = L6_2[L7_2]
        L6_2 = L6_2.attractioncontrolled
        L3_2(L4_2, L5_2, L6_2)
      end
    end
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:ThemeParkOpenControlMenuClose"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:ThemeParkOpenControlMenuClose"
  function L2_1(A0_2)
    local L1_2, L2_2, L3_2
    L1_2 = source
    if nil ~= A0_2 then
      L2_2 = controlmachines
      L2_2 = L2_2[A0_2]
      L3_2 = L2_2.taken
      if true == L3_2 then
        L3_2 = L2_2.takenplayerid
        if L3_2 == L1_2 then
          L2_2.taken = false
          L2_2.takenplayerid = nil
        end
      end
    end
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:ThemeParkControlSmokeHandler"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:ThemeParkControlSmokeHandler"
  function L2_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L2_2 = source
    if nil ~= A0_2 then
      L3_2 = controlmachines
      L3_2 = L3_2[A0_2]
      L4_2 = L3_2.taken
      if true == L4_2 then
        L4_2 = L3_2.takenplayerid
        if L4_2 == L2_2 then
          L4_2 = L3_2.smokedisabled
          if false == L4_2 then
            L3_2.smokeactivated = A1_2
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Global:ThemeParkControlSmokeHandlerClient"
            L6_2 = -1
            L7_2 = A0_2
            L8_2 = A1_2
            L4_2(L5_2, L6_2, L7_2, L8_2)
          end
        end
      end
    end
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:ThemeParkControlSmokeColor"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:ThemeParkControlSmokeColor"
  function L2_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L2_2 = source
    if nil ~= A0_2 then
      L3_2 = controlmachines
      L3_2 = L3_2[A0_2]
      L4_2 = L3_2.taken
      if true == L4_2 then
        L4_2 = L3_2.takenplayerid
        if L4_2 == L2_2 then
          L4_2 = L3_2.smokedisabled
          if false == L4_2 then
            L3_2.smokecolor = A1_2
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Global:ThemeParkControlSmokeColorClient"
            L6_2 = -1
            L7_2 = A0_2
            L8_2 = A1_2
            L4_2(L5_2, L6_2, L7_2, L8_2)
          end
        end
      end
    end
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:ThemeParkControlMusicPlay"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:ThemeParkControlMusicPlay"
  function L2_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
    L2_2 = source
    if nil ~= A0_2 then
      L3_2 = controlmachines
      L3_2 = L3_2[A0_2]
      L4_2 = L3_2.taken
      if true == L4_2 then
        L4_2 = L3_2.takenplayerid
        if L4_2 == L2_2 then
          L4_2 = L3_2.musicdisabled
          if false == L4_2 then
            L3_2.music = true
            L3_2.musicurl = A1_2
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Music:ThemeParkControlMusicPlayClient"
            L6_2 = -1
            L7_2 = A0_2
            L8_2 = A1_2
            L9_2 = L3_2.musicvolume
            L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
          end
        end
      end
    end
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:ThemeParkControlMusicVolume"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:ThemeParkControlMusicVolume"
  function L2_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L2_2 = source
    if nil ~= A0_2 then
      L3_2 = controlmachines
      L3_2 = L3_2[A0_2]
      L4_2 = L3_2.taken
      if true == L4_2 then
        L4_2 = L3_2.takenplayerid
        if L4_2 == L2_2 then
          L4_2 = L3_2.musicdisabled
          if false == L4_2 and A1_2 >= 0 and A1_2 <= 100 then
            L3_2.musicvolume = A1_2
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Music:ThemeParkControlMusicVolume"
            L6_2 = -1
            L7_2 = A0_2
            L8_2 = A1_2
            L4_2(L5_2, L6_2, L7_2, L8_2)
          end
        end
      end
    end
  end
  L0_1(L1_1, L2_1)
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Global:ThemeParkControlMusicStop"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Global:ThemeParkControlMusicStop"
  function L2_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
    L1_2 = source
    if nil ~= A0_2 then
      L2_2 = controlmachines
      L2_2 = L2_2[A0_2]
      L3_2 = L2_2.taken
      if true == L3_2 then
        L3_2 = L2_2.takenplayerid
        if L3_2 == L1_2 then
          L3_2 = L2_2.musicdisabled
          if false == L3_2 then
            L2_2.music = false
            L2_2.musicurl = ""
            L3_2 = TriggerClientEvent
            L4_2 = "rtx_themepark:Music:ThemeParkControlMusicStopClient"
            L5_2 = -1
            L6_2 = A0_2
            L3_2(L4_2, L5_2, L6_2)
          end
        end
      end
    end
  end
  L0_1(L1_1, L2_1)
end
L0_1 = AddEventHandler
L1_1 = "playerDropped"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L0_2 = source
  L1_2 = playersiteminhand
  L1_2 = L1_2[L0_2]
  if nil ~= L1_2 then
    L1_2 = playersiteminhand
    L1_2[L0_2] = nil
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Global:RemoveHandItem"
    L3_2 = -1
    L4_2 = L0_2
    L1_2(L2_2, L3_2, L4_2)
  end
  L1_2 = bumperhandler
  L1_2 = L1_2.bumperplayers
  L1_2 = L1_2[L0_2]
  if nil ~= L1_2 then
    L1_2 = bumperhandler
    L2_2 = bumperhandler
    L2_2 = L2_2.currentplayers
    L2_2 = L2_2 - 1
    L1_2.currentplayers = L2_2
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Bumper:BumperEndClient"
    L3_2 = -1
    L4_2 = L0_2
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Global:ObjectDelete"
    L3_2 = -1
    L4_2 = bumperhandler
    L4_2 = L4_2.bumperplayers
    L4_2 = L4_2[L0_2]
    L4_2 = L4_2.vehiclenetwork
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = bumperhandler
    L1_2 = L1_2.bumperplayers
    L1_2[L0_2] = nil
  end
  L1_2 = gforcehandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = gforcehandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = L12_2.takenplayerid
          if L13_2 == L0_2 then
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:GForce:SynchronizeSeat"
            L15_2 = -1
            L16_2 = L5_2
            L17_2 = L11_2
            L18_2 = false
            L19_2 = L12_2.takenplayerid
            L20_2 = L12_2.seattype
            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            L12_2.taken = false
            L12_2.takenplayerid = nil
          end
        end
      end
    end
  end
  L1_2 = topscanhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = topscanhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = L12_2.takenplayerid
          if L13_2 == L0_2 then
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:TopScan:SynchronizeSeat"
            L15_2 = -1
            L16_2 = L5_2
            L17_2 = L11_2
            L18_2 = false
            L19_2 = L12_2.takenplayerid
            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
            L12_2.taken = false
            L12_2.takenplayerid = nil
          end
        end
      end
    end
  end
  L1_2 = vortexhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = vortexhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = L6_2.takenplayerid
        if L7_2 == L0_2 then
          L7_2 = TriggerClientEvent
          L8_2 = "rtx_themepark:Vortex:SynchronizeSeat"
          L9_2 = -1
          L10_2 = L5_2
          L11_2 = false
          L12_2 = L6_2.takenplayerid
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
          L6_2.taken = false
          L6_2.takenplayerid = nil
        end
      end
    end
  end
  L1_2 = detonatorhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = detonatorhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = L6_2.takenplayerid
        if L7_2 == L0_2 then
          L7_2 = TriggerClientEvent
          L8_2 = "rtx_themepark:Detonator:SynchronizeSeat"
          L9_2 = -1
          L10_2 = L5_2
          L11_2 = false
          L12_2 = L6_2.takenplayerid
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
          L6_2.taken = false
          L6_2.takenplayerid = nil
        end
      end
    end
  end
  L1_2 = boathandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = boathandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = L6_2.takenplayerid
        if L7_2 == L0_2 then
          L7_2 = TriggerClientEvent
          L8_2 = "rtx_themepark:Boat:SynchronizeSeat"
          L9_2 = -1
          L10_2 = L5_2
          L11_2 = false
          L12_2 = L6_2.takenplayerid
          L13_2 = L6_2.seattype
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
          L6_2.taken = false
          L6_2.takenplayerid = nil
        end
      end
    end
  end
  L1_2 = ferrishandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = ferrishandler
    L2_2 = L2_2.cabins
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.players
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = L12_2.takenplayerid
          if L13_2 == L0_2 then
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:Ferris:SynchronizeSeat"
            L15_2 = -1
            L16_2 = L5_2
            L17_2 = L11_2
            L18_2 = true
            L19_2 = L12_2.takenplayerid
            L20_2 = L12_2.seattype
            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            L12_2.taken = false
            L12_2.takenplayerid = nil
          end
        end
      end
    end
  end
  L1_2 = rollercoasterhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = rollercoasterhandler
    L2_2 = L2_2.carts
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.players
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = L12_2.takenplayerid
          if L13_2 == L0_2 then
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:Rollercoaster:SynchronizeSeat"
            L15_2 = -1
            L16_2 = L5_2
            L17_2 = L11_2
            L18_2 = false
            L19_2 = L12_2.takenplayerid
            L20_2 = L12_2.seattype
            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            L12_2.taken = false
            L12_2.takenplayerid = nil
          end
        end
      end
    end
  end
  L1_2 = praterhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = praterhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = L12_2.takenplayerid
          if L13_2 == L0_2 then
            L12_2.taken = false
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:Prater:SynchronizeSeat"
            L15_2 = -1
            L16_2 = L5_2
            L17_2 = L11_2
            L18_2 = false
            L19_2 = L12_2.takenplayerid
            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:Prater:SeatExit"
            L15_2 = L12_2.takenplayerid
            L16_2 = true
            L13_2(L14_2, L15_2, L16_2)
            L12_2.takenplayerid = nil
          end
        end
      end
    end
  end
  L1_2 = praterhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = praterhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = L12_2.takenplayerid
          if L13_2 == L0_2 then
            L12_2.taken = false
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:Prater:SynchronizeSeat"
            L15_2 = -1
            L16_2 = L5_2
            L17_2 = L11_2
            L18_2 = false
            L19_2 = L12_2.takenplayerid
            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:Prater:SeatExit"
            L15_2 = L12_2.takenplayerid
            L16_2 = true
            L13_2(L14_2, L15_2, L16_2)
            L12_2.takenplayerid = nil
          end
        end
      end
    end
  end
  L1_2 = brakedancehandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = brakedancehandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.cabins
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = ipairs
        L14_2 = L12_2.seats
        L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
        for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
          L19_2 = L18_2.taken
          if true == L19_2 then
            L19_2 = L18_2.takenplayerid
            if L19_2 == L0_2 then
              L18_2.taken = false
              L19_2 = TriggerClientEvent
              L20_2 = "rtx_themepark:BrakeDance:SynchronizeSeat"
              L21_2 = -1
              L22_2 = L5_2
              L23_2 = L11_2
              L24_2 = L17_2
              L25_2 = false
              L26_2 = L18_2.takenplayerid
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
              L19_2 = TriggerClientEvent
              L20_2 = "rtx_themepark:BrakeDance:SeatExit"
              L21_2 = L18_2.takenplayerid
              L22_2 = true
              L19_2(L20_2, L21_2, L22_2)
              L18_2.takenplayerid = nil
            end
          end
        end
      end
    end
  end
  L1_2 = slingshothandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = slingshothandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = L6_2.takenplayerid
        if L7_2 == L0_2 then
          L6_2.taken = false
          L7_2 = TriggerClientEvent
          L8_2 = "rtx_themepark:SlingShot:SynchronizeSeat"
          L9_2 = -1
          L10_2 = L5_2
          L11_2 = false
          L12_2 = L6_2.takenplayerid
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
          L7_2 = TriggerClientEvent
          L8_2 = "rtx_themepark:SlingShot:SeatExit"
          L9_2 = L6_2.takenplayerid
          L10_2 = true
          L7_2(L8_2, L9_2, L10_2)
          L6_2.takenplayerid = nil
        end
      end
    end
  end
  L1_2 = carouselhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = carouselhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = L12_2.takenplayerid
          if L13_2 == L0_2 then
            L12_2.taken = false
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:Carousel:SynchronizeSeat"
            L15_2 = -1
            L16_2 = L5_2
            L17_2 = false
            L18_2 = L12_2.takenplayerid
            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:Carousel:SeatExit"
            L15_2 = L12_2.takenplayerid
            L16_2 = true
            L13_2(L14_2, L15_2, L16_2)
            L12_2.takenplayerid = nil
          end
        end
      end
    end
  end
  L1_2 = extasyhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = extasyhandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.cabins
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = ipairs
        L14_2 = L12_2.seats
        L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
        for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
          L19_2 = L18_2.taken
          if true == L19_2 then
            L19_2 = L18_2.takenplayerid
            if L19_2 == L0_2 then
              L18_2.taken = false
              L19_2 = TriggerClientEvent
              L20_2 = "rtx_themepark:Extasy:SynchronizeSeat"
              L21_2 = -1
              L22_2 = L5_2
              L23_2 = L11_2
              L24_2 = L17_2
              L25_2 = false
              L26_2 = L18_2.takenplayerid
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
              L19_2 = TriggerClientEvent
              L20_2 = "rtx_themepark:Extasy:SeatExit"
              L21_2 = L18_2.takenplayerid
              L22_2 = true
              L19_2(L20_2, L21_2, L22_2)
              L18_2.takenplayerid = nil
            end
          end
        end
      end
    end
  end
  L1_2 = spinridehandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = spinridehandler
    L2_2 = L2_2.cabins
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = ipairs
      L8_2 = L6_2.seats
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.taken
        if true == L13_2 then
          L13_2 = L12_2.takenplayerid
          if L13_2 == L0_2 then
            L12_2.taken = false
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:SpinRide:SynchronizeSeat"
            L15_2 = -1
            L16_2 = L5_2
            L17_2 = L11_2
            L18_2 = false
            L19_2 = L12_2.takenplayerid
            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
            L13_2 = TriggerClientEvent
            L14_2 = "rtx_themepark:SpinRide:SeatExit"
            L15_2 = L12_2.takenplayerid
            L16_2 = true
            L13_2(L14_2, L15_2, L16_2)
            L12_2.takenplayerid = nil
          end
        end
      end
    end
  end
  L1_2 = hauntedhousehandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = hauntedhousehandler
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = L6_2.takenplayerid
        if L7_2 == L0_2 then
          L6_2.taken = false
          L7_2 = TriggerClientEvent
          L8_2 = "rtx_themepark:HauntedHouse:SynchronizeSeat"
          L9_2 = -1
          L10_2 = L5_2
          L11_2 = false
          L12_2 = L6_2.takenplayerid
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
          L7_2 = TriggerClientEvent
          L8_2 = "rtx_themepark:HauntedHouse:SeatExit"
          L9_2 = L6_2.takenplayerid
          L10_2 = true
          L11_2 = true
          L7_2(L8_2, L9_2, L10_2, L11_2)
          L6_2.takenplayerid = nil
        end
      end
    end
  end
  L1_2 = rollercoasterhandler2
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = ipairs
    L2_2 = rollercoasterhandler2
    L2_2 = L2_2.seats
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = L6_2.takenplayerid
        if L7_2 == L0_2 then
          L6_2.taken = false
          L7_2 = TriggerClientEvent
          L8_2 = "rtx_themepark:Rollercoaster2:SynchronizeSeat"
          L9_2 = -1
          L10_2 = L5_2
          L11_2 = false
          L12_2 = L6_2.takenplayerid
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
          L7_2 = TriggerClientEvent
          L8_2 = "rtx_themepark:Rollercoaster2:SeatExit"
          L9_2 = L6_2.takenplayerid
          L10_2 = true
          L11_2 = true
          L7_2(L8_2, L9_2, L10_2, L11_2)
          L7_2 = TriggerClientEvent
          L8_2 = "rtx_themepark:Global:AttractionUsing"
          L9_2 = L6_2.takenplayerid
          L10_2 = false
          L7_2(L8_2, L9_2, L10_2)
          L6_2.takenplayerid = nil
          L6_2.seattype = 1
        end
      end
    end
  end
  L1_2 = Config
  L1_2 = L1_2.ThemeParkControlAttractions
  if L1_2 then
    L1_2 = ipairs
    L2_2 = controlmachines
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.taken
      if true == L7_2 then
        L7_2 = L6_2.takenplayerid
        if L7_2 == L0_2 then
          L6_2.taken = false
          L6_2.takenplayerid = nil
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
function L0_1()
  local L0_2, L1_2
  L0_2 = print
  L1_2 = "[RTX THEME PARK DLC] - Thank you for choosing us - Discord: https://discord.gg/P6KdaDpgAk Store: https://rtx.tebex.io"
  L0_2(L1_2)
end
authorized = L0_1
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2
  L0_2 = authorized
  L0_2()
end
L0_1(L1_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Global:NearbyThemeParkHandler"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Global:NearbyThemeParkHandler"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = source
  if true == A0_2 then
    L2_2 = playsersinthemepark
    L2_2 = L2_2[L1_2]
    if nil == L2_2 then
      L2_2 = playsersinthemepark
      L2_2[L1_2] = L1_2
    end
  elseif false == A0_2 then
    L2_2 = playsersinthemepark
    L2_2 = L2_2[L1_2]
    if nil ~= L2_2 then
      L2_2 = playsersinthemepark
      L2_2[L1_2] = nil
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Global:UsingAttractionPlayer"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Global:UsingAttractionPlayer"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = source
  if true == A0_2 then
    L2_2 = playerusingattraction
    L2_2 = L2_2[L1_2]
    if nil == L2_2 then
      L2_2 = playerusingattraction
      L2_2[L1_2] = true
    end
  elseif false == A0_2 then
    L2_2 = playerusingattraction
    L2_2 = L2_2[L1_2]
    if nil ~= L2_2 then
      L2_2 = playerusingattraction
      L2_2[L1_2] = nil
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Global:StartAttractionGlobal"
function L2_1(A0_2)
  local L1_2, L2_2
  if 1 == A0_2 then
    L1_2 = TriggerEvent
    L2_2 = "rtx_themepark:Prater:Start"
    L1_2(L2_2)
  elseif 2 == A0_2 then
    L1_2 = TriggerEvent
    L2_2 = "rtx_themepark:BrakeDance:Start"
    L1_2(L2_2)
  elseif 3 == A0_2 then
    L1_2 = TriggerEvent
    L2_2 = "rtx_themepark:SlingShot:Start"
    L1_2(L2_2)
  elseif 4 == A0_2 then
    L1_2 = TriggerEvent
    L2_2 = "rtx_themepark:Carousel:Start"
    L1_2(L2_2)
  elseif 5 == A0_2 then
    L1_2 = TriggerEvent
    L2_2 = "rtx_themepark:Extasy:Start"
    L1_2(L2_2)
  elseif 6 == A0_2 then
    L1_2 = TriggerEvent
    L2_2 = "rtx_themepark:SpinRide:Start"
    L1_2(L2_2)
  elseif 7 == A0_2 then
    L1_2 = TriggerEvent
    L2_2 = "rtx_themepark:HauntedHouse:Start"
    L1_2(L2_2)
  elseif 8 == A0_2 then
    L1_2 = TriggerEvent
    L2_2 = "rtx_themepark:Rollercoaster2:Start"
    L1_2(L2_2)
  end
end
L0_1(L1_1, L2_1)
