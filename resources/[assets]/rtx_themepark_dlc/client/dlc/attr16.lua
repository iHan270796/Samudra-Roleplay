local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = IsDuplicityVersion
L0_1 = L0_1()
if L0_1 then
  L0_1 = GetPlayerPositionInRealTime84
  L0_1()
end
L0_1 = {}
L0_1.seatid = nil
L1_1 = nil
L2_1 = false
L3_1 = nil
L4_1 = nil
L5_1 = {}
L5_1.started = false
L5_1.stageid = 0
L5_1.soundid = nil
L5_1.getnew = false
L6_1 = {}
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 0.267
L11_1 = -0.385
L12_1 = 0.393
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 0.0
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[1] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -0.267
L11_1 = -0.383
L12_1 = 0.393
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 0.0
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[2] = L7_1
L5_1.seats = L6_1
L6_1 = {}
L7_1 = {}
L7_1.timetoclose = 7000
L8_1 = {}
L9_1 = {}
L9_1.modelname = "sempre_delperropier_hauntedhouse_door_1"
L10_1 = vec3
L11_1 = -1595.446
L12_1 = -1133.105
L13_1 = 15.62105
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = -40.0
L9_1.rotationopen = 50.0
L9_1.rotationclose = -40.0
L9_1.opendirection = "plus"
L9_1.closedirection = "minus"
L8_1[1] = L9_1
L7_1.doors = L8_1
L6_1[1] = L7_1
L7_1 = {}
L7_1.timetoclose = 7000
L8_1 = {}
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1591.035
L12_1 = -1133.809
L13_1 = 14.45344
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = 50.0
L9_1.rotationopen = -40.0
L9_1.rotationclose = 50.0
L9_1.opendirection = "minus"
L9_1.closedirection = "plus"
L8_1[1] = L9_1
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1589.525
L12_1 = -1132.081
L13_1 = 14.45344
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = -130.0
L9_1.rotationopen = -40.0
L9_1.rotationclose = -130.0
L9_1.opendirection = "plus"
L9_1.closedirection = "minus"
L8_1[2] = L9_1
L7_1.doors = L8_1
L6_1[2] = L7_1
L7_1 = {}
L7_1.timetoclose = 10000
L8_1 = {}
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1584.477
L12_1 = -1141.442
L13_1 = 14.46686
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = -40.0
L9_1.rotationopen = -130.0
L9_1.rotationclose = -40.0
L9_1.opendirection = "minus"
L9_1.closedirection = "plus"
L8_1[1] = L9_1
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1582.745
L12_1 = -1142.952
L13_1 = 14.46686
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = 140.0
L9_1.rotationopen = 230.0
L9_1.rotationclose = 140.0
L9_1.opendirection = "plus"
L9_1.closedirection = "minus"
L8_1[2] = L9_1
L7_1.doors = L8_1
L6_1[3] = L7_1
L7_1 = {}
L7_1.timetoclose = 9000
L8_1 = {}
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1594.941
L12_1 = -1144.432
L13_1 = 14.4662
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = 50.0
L9_1.rotationopen = -35.0
L9_1.rotationclose = 50.0
L9_1.opendirection = "minus"
L9_1.closedirection = "plus"
L8_1[1] = L9_1
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1593.431
L12_1 = -1142.705
L13_1 = 14.4662
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = -130.0
L9_1.rotationopen = -40.0
L9_1.rotationclose = -130.0
L9_1.opendirection = "plus"
L9_1.closedirection = "minus"
L8_1[2] = L9_1
L7_1.doors = L8_1
L6_1[4] = L7_1
L7_1 = {}
L7_1.timetoclose = 7000
L8_1 = {}
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1591.417
L12_1 = -1151.091
L13_1 = 14.4638
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = -130.0
L9_1.rotationopen = -208.0
L9_1.rotationclose = -130.0
L9_1.opendirection = "minus"
L9_1.closedirection = "plus"
L8_1[1] = L9_1
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1592.927
L12_1 = -1152.82
L13_1 = 14.4638
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = 50.0
L9_1.rotationopen = 128.0
L9_1.rotationclose = 50.0
L9_1.opendirection = "plus"
L9_1.closedirection = "minus"
L8_1[2] = L9_1
L7_1.doors = L8_1
L6_1[5] = L7_1
L7_1 = {}
L7_1.timetoclose = 7000
L8_1 = {}
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1598.204
L12_1 = -1157.28
L13_1 = 14.46584
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = -130.0
L9_1.rotationopen = -220.0
L9_1.rotationclose = -130.0
L9_1.opendirection = "minus"
L9_1.closedirection = "plus"
L8_1[1] = L9_1
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1599.715
L12_1 = -1159.008
L13_1 = 14.46584
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = 50.0
L9_1.rotationopen = 140.0
L9_1.rotationclose = 50.0
L9_1.opendirection = "plus"
L9_1.closedirection = "minus"
L8_1[2] = L9_1
L7_1.doors = L8_1
L6_1[6] = L7_1
L7_1 = {}
L7_1.timetoclose = 7000
L8_1 = {}
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1605.709
L12_1 = -1150.401
L13_1 = 14.46248
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = 140.0
L9_1.rotationopen = 50.0
L9_1.rotationclose = 140.0
L9_1.opendirection = "minus"
L9_1.closedirection = "plus"
L8_1[1] = L9_1
L9_1 = {}
L9_1.modelname = "kt1_11_mp_door"
L10_1 = vec3
L11_1 = -1607.439
L12_1 = -1148.889
L13_1 = 14.46248
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = -40.0
L9_1.rotationopen = 50.0
L9_1.rotationclose = -40.0
L9_1.opendirection = "plus"
L9_1.closedirection = "minus"
L8_1[2] = L9_1
L7_1.doors = L8_1
L6_1[7] = L7_1
L7_1 = {}
L7_1.timetoclose = 15000
L8_1 = {}
L9_1 = {}
L9_1.modelname = "sempre_delperropier_hauntedhouse_door_2"
L10_1 = vec3
L11_1 = -1606.594
L12_1 = -1146.472
L13_1 = 15.54623
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L9_1.doordata = -40.0
L9_1.rotationopen = 50.0
L9_1.rotationclose = -40.0
L9_1.opendirection = "plus"
L9_1.closedirection = "minus"
L8_1[1] = L9_1
L7_1.doors = L8_1
L6_1[8] = L7_1
L5_1.doors = L6_1
L6_1 = {}
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1598.583
L10_1 = -1156.526
L11_1 = 14.80261
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[1] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1598.905
L10_1 = -1156.256
L11_1 = 15.40605
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[2] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1599.402
L10_1 = -1155.839
L11_1 = 14.6188
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[3] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1600.359
L10_1 = -1155.036
L11_1 = 15.16715
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[4] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1600.654
L10_1 = -1154.788
L11_1 = 14.69813
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[5] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1601.028
L10_1 = -1154.475
L11_1 = 15.41584
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[6] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1602.05
L10_1 = -1153.617
L11_1 = 14.69387
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[7] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1602.398
L10_1 = -1153.325
L11_1 = 15.49224
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[8] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1600.784
L10_1 = -1159.223
L11_1 = 14.93583
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[9] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1601.19
L10_1 = -1158.883
L11_1 = 15.50001
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[10] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1601.541
L10_1 = -1158.588
L11_1 = 15.01326
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[11] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1604.241
L10_1 = -1156.323
L11_1 = 15.01326
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[12] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1604.637
L10_1 = -1155.99
L11_1 = 15.58541
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[13] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1604.977
L10_1 = -1155.705
L11_1 = 14.7827
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[14] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1605.97
L10_1 = -1154.871
L11_1 = 14.71727
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[15] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1606.349
L10_1 = -1154.553
L11_1 = 15.51946
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[16] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1606.734
L10_1 = -1154.231
L11_1 = 14.96471
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[17] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1609.433
L10_1 = -1151.966
L11_1 = 14.96471
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[18] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1609.807
L10_1 = -1151.651
L11_1 = 15.61062
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[19] = L7_1
L7_1 = {}
L7_1.handler = nil
L8_1 = vec3
L9_1 = -1610.154
L10_1 = -1151.361
L11_1 = 14.5873
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.coords = L8_1
L8_1 = vec3
L9_1 = 0.0
L10_1 = 0.0
L11_1 = 50.0
L8_1 = L8_1(L9_1, L10_1, L11_1)
L7_1.rotation = L8_1
L6_1[20] = L7_1
L5_1.cross = L6_1
L6_1 = {}
L6_1.seathandler = nil
L6_1.anabellehandler = nil
L5_1.anabelle = L6_1
hauntedhousehandler = L5_1
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:SynchronizeStarted"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:SynchronizeStarted"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = hauntedhousehandler
  L1_2.started = A0_2
  if true == A0_2 then
    L1_2 = false
    L2_1 = L1_2
    L1_2 = L1_1
    if nil ~= L1_2 then
      L1_2 = SendNUIMessage
      L2_2 = {}
      L2_2.message = "hideattraction"
      L1_2(L2_2)
    end
    L1_2 = Config
    L1_2 = L1_2.AttractionsSettings
    L1_2 = L1_2.hauntedhouse
    L1_2 = L1_2.sound
    if true == L1_2 then
      L1_2 = RequestScriptAudioBank
      L2_2 = "CABLE_CAR"
      L3_2 = false
      L4_2 = -1
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = RequestScriptAudioBank
      L2_2 = "CABLE_CAR_SOUNDS"
      L3_2 = false
      L4_2 = -1
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = LoadStream
      L2_2 = "CABLE_CAR"
      L3_2 = "CABLE_CAR_SOUNDS"
      L1_2(L2_2, L3_2)
      L1_2 = LoadStream
      L2_2 = "CABLE_CAR_SOUNDS"
      L3_2 = "CABLE_CAR"
      L1_2(L2_2, L3_2)
      L1_2 = hauntedhousehandler
      L2_2 = GetSoundId
      L2_2 = L2_2()
      L1_2.soundid = L2_2
      L1_2 = PlaySoundFromEntity
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.soundid
      L3_2 = "Running"
      L4_2 = L3_1
      L5_2 = "CABLE_CAR_SOUNDS"
      L6_2 = 0
      L7_2 = 0
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
    end
  else
    L1_2 = Config
    L1_2 = L1_2.AttractionsSettings
    L1_2 = L1_2.hauntedhouse
    L1_2 = L1_2.sound
    if true == L1_2 then
      L1_2 = StopSound
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.soundid
      L1_2(L2_2)
    end
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:SynchronizeSeat"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:SynchronizeSeat"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L3_2 = hauntedhousehandler
  L3_2 = L3_2.seats
  L3_2 = L3_2[A0_2]
  L3_2.taken = A1_2
  if false == A1_2 then
    if nil ~= A2_2 then
      L4_2 = GetPlayerFromServerId
      L5_2 = A2_2
      L4_2 = L4_2(L5_2)
      if -1 ~= L4_2 then
        L5_2 = GetPlayerPed
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L6_2 = DoesEntityExist
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        if L6_2 then
          L6_2 = DetachEntity
          L7_2 = L5_2
          L6_2(L7_2)
          L6_2 = FreezeEntityPosition
          L7_2 = L5_2
          L8_2 = false
          L6_2(L7_2, L8_2)
          L6_2 = ClearPedTasks
          L7_2 = L5_2
          L6_2(L7_2)
        end
      end
    end
  else
    L4_2 = GetPlayerFromServerId
    L5_2 = A2_2
    L4_2 = L4_2(L5_2)
    if -1 ~= L4_2 then
      L5_2 = GetPlayerPed
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L6_2 = DoesEntityExist
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L6_2 = FreezeEntityPosition
        L7_2 = L5_2
        L8_2 = true
        L6_2(L7_2, L8_2)
        L6_2 = NetworkAllowLocalEntityAttachment
        L7_2 = L5_2
        L8_2 = true
        L6_2(L7_2, L8_2)
        L6_2 = AttachEntityToEntity
        L7_2 = L5_2
        L8_2 = L3_1
        L9_2 = 0
        L10_2 = L3_2.offsets
        L10_2 = L10_2.coords
        L10_2 = L10_2.x
        L11_2 = L3_2.offsets
        L11_2 = L11_2.coords
        L11_2 = L11_2.y
        L12_2 = L3_2.offsets
        L12_2 = L12_2.coords
        L12_2 = L12_2.z
        L13_2 = L3_2.offsets
        L13_2 = L13_2.rotation
        L13_2 = L13_2.x
        L14_2 = L3_2.offsets
        L14_2 = L14_2.rotation
        L14_2 = L14_2.y
        L15_2 = L3_2.offsets
        L15_2 = L15_2.rotation
        L15_2 = L15_2.z
        L16_2 = false
        L17_2 = false
        L18_2 = false
        L19_2 = false
        L20_2 = 2
        L21_2 = true
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
        L6_2 = "amb@prop_human_seat_chair_mp@female@proper@base"
        L7_2 = "base"
        while true do
          L8_2 = HasAnimDictLoaded
          L9_2 = L6_2
          L8_2 = L8_2(L9_2)
          if L8_2 then
            break
          end
          L8_2 = RequestAnimDict
          L9_2 = L6_2
          L8_2(L9_2)
          L8_2 = Citizen
          L8_2 = L8_2.Wait
          L9_2 = 5
          L8_2(L9_2)
        end
        L8_2 = TaskPlayAnim
        L9_2 = L5_2
        L10_2 = L6_2
        L11_2 = L7_2
        L12_2 = 8.0
        L13_2 = 8.0
        L14_2 = -1
        L15_2 = 1
        L16_2 = 0
        L17_2 = 0
        L18_2 = 0
        L19_2 = 0
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      end
    end
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:AttractionEnded"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:AttractionEnded"
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = 1
  L1_2 = hauntedhousepaths
  L2_2 = true
  L2_1 = L2_2
  L2_2 = SetEntityCoordsNoOffset
  L3_2 = L4_1
  L4_2 = L1_2[L0_2]
  L4_2 = L4_2.coords
  L4_2 = L4_2.x
  L5_2 = L1_2[L0_2]
  L5_2 = L5_2.coords
  L5_2 = L5_2.y
  L6_2 = L1_2[L0_2]
  L6_2 = L6_2.coords
  L6_2 = L6_2.z
  L7_2 = true
  L8_2 = false
  L9_2 = false
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L2_2 = SetEntityQuaternion
  L3_2 = L4_1
  L4_2 = L1_2[L0_2]
  L4_2 = L4_2.objectscoords1x
  L5_2 = L1_2[L0_2]
  L5_2 = L5_2.objectscoords1y
  L6_2 = L1_2[L0_2]
  L6_2 = L6_2.objectscoords1z
  L7_2 = L1_2[L0_2]
  L7_2 = L7_2.objectscoords1w
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:SynchronizeMovement"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:SynchronizeMovement"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = nearbythemepark
  if true == L2_2 then
    L2_2 = A1_2
    L3_2 = hauntedhousepaths
    L3_2 = #L3_2
    if L2_2 > L3_2 then
      L3_2 = hauntedhousepaths
      L2_2 = #L3_2
    end
    hauntedhousecalculateid = A0_2
    L3_2 = hauntedhousecalculateid
    L4_2 = hauntedhousepaths
    L4_2 = #L4_2
    if L3_2 > L4_2 then
      L3_2 = hauntedhousepaths
      L3_2 = #L3_2
      hauntedhousecalculateid = L3_2
    end
    L3_2 = hauntedhousepaths
    L4_2 = hauntedhousehandler
    L4_2.getnew = true
    L4_2 = hauntedhousehandler
    L5_2 = hauntedhousecalculateid
    L4_2.stageid = L5_2
    L4_2 = SetEntityCoordsNoOffset
    L5_2 = L4_1
    L6_2 = hauntedhousehandler
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2.coords
    L6_2 = L6_2.x
    L7_2 = hauntedhousehandler
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2.coords
    L7_2 = L7_2.y
    L8_2 = hauntedhousehandler
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2.coords
    L8_2 = L8_2.z
    L9_2 = true
    L10_2 = false
    L11_2 = false
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L4_2 = SetEntityQuaternion
    L5_2 = L4_1
    L6_2 = hauntedhousehandler
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2.objectscoords1x
    L7_2 = hauntedhousehandler
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2.objectscoords1y
    L8_2 = hauntedhousehandler
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2.objectscoords1z
    L9_2 = hauntedhousehandler
    L9_2 = L9_2.stageid
    L9_2 = L3_2[L9_2]
    L9_2 = L9_2.objectscoords1w
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = Citizen
    L4_2 = L4_2.Wait
    L5_2 = 1
    L4_2(L5_2)
    L4_2 = hauntedhousehandler
    L4_2.getnew = false
    L4_2 = hauntedhousepaths
    L4_2 = #L4_2
    L5_2 = 1
    L6_2 = currentfps
    if L6_2 < 80 then
      L5_2 = 0
    else
      L5_2 = 1
    end
    while true do
      L6_2 = hauntedhousehandler
      L6_2 = L6_2.getnew
      if false ~= L6_2 then
        break
      end
      L6_2 = nearbythemepark
      if true ~= L6_2 then
        break
      end
      L6_2 = L2_1
      if false ~= L6_2 then
        break
      end
      L6_2 = Citizen
      L6_2 = L6_2.Wait
      L7_2 = L5_2
      L6_2(L7_2)
      L6_2 = hauntedhousehandler
      L6_2 = L6_2.stageid
      L6_2 = L3_2[L6_2]
      L6_2 = L6_2.coords
      L7_2 = L3_2[L2_2]
      L7_2 = L7_2.coords
      L6_2 = L6_2 - L7_2
      L6_2 = #L6_2
      if L6_2 > 0.0 then
        L7_2 = hauntedhousehandler
        L8_2 = hauntedhousehandler
        L8_2 = L8_2.stageid
        L8_2 = L8_2 + 1
        L7_2.stageid = L8_2
        L7_2 = hauntedhousehandler
        L7_2 = L7_2.getnew
        if false == L7_2 then
          L7_2 = hauntedhousehandler
          L7_2 = L7_2.stageid
          if L7_2 == L4_2 then
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = L4_1
            L9_2 = hauntedhousehandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = hauntedhousehandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = hauntedhousehandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2.coords
            L11_2 = L11_2.z
            L12_2 = true
            L13_2 = false
            L14_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L7_2 = SetEntityQuaternion
            L8_2 = L4_1
            L9_2 = hauntedhousehandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2.objectscoords1x
            L10_2 = hauntedhousehandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2.objectscoords1y
            L11_2 = hauntedhousehandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2.objectscoords1z
            L12_2 = hauntedhousehandler
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2.objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
            L7_2 = hauntedhousehandler
            L7_2.getnew = true
          else
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = L4_1
            L9_2 = hauntedhousehandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = hauntedhousehandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = hauntedhousehandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2.coords
            L11_2 = L11_2.z
            L12_2 = true
            L13_2 = false
            L14_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L7_2 = SetEntityQuaternion
            L8_2 = L4_1
            L9_2 = hauntedhousehandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2.objectscoords1x
            L10_2 = hauntedhousehandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2.objectscoords1y
            L11_2 = hauntedhousehandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2.objectscoords1z
            L12_2 = hauntedhousehandler
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2.objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
          end
        end
      else
        L7_2 = Config
        L7_2 = L7_2.AttractionsSettings
        L7_2 = L7_2.hauntedhouse
        L7_2 = L7_2.speedmodifier
        L7_2 = 8 * L7_2
        A1_2 = A1_2 + L7_2
      end
    end
  else
    L2_2 = hauntedhousehandler
    L2_2.getnew = true
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:SeatData"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:SeatData"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.message = "attractionhow"
  L2_2.attractionanimchange = false
  L1_2(L2_2)
  L1_1 = A0_2
  L1_2 = SetEntityCompletelyDisableCollision
  L2_2 = L4_1
  L3_2 = false
  L4_2 = false
  L1_2(L2_2, L3_2, L4_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:SeatExit"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:SeatExit"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = DetachEntity
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = FreezeEntityPosition
  L3_2 = L1_2
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = ClearPedTasks
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.message = "hideattraction"
  L2_2(L3_2)
  L2_2 = nil
  L1_1 = L2_2
  L2_2 = SetEntityCompletelyDisableCollision
  L3_2 = L4_1
  L4_2 = true
  L5_2 = true
  L2_2(L3_2, L4_2, L5_2)
  if true == A0_2 then
    L2_2 = SetEntityCoordsNoOffset
    L3_2 = L1_2
    L4_2 = -1601.06
    L5_2 = -1140.08
    L6_2 = 13.28
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = Config
L5_1 = L5_1.Target
if true == L5_1 then
  L5_1 = RegisterNetEvent
  L6_1 = "rtx_themepark:HauntedHouse:SeatUseTarget"
  L5_1(L6_1)
  L5_1 = AddEventHandler
  L6_1 = "rtx_themepark:HauntedHouse:SeatUseTarget"
  function L7_1()
    local L0_2, L1_2, L2_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = L0_1.seatid
      if nil ~= L0_2 then
        L0_2 = iteminhand
        if false == L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:HauntedHouse:SeatUse"
          L2_2 = L0_1.seatid
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
  L5_1(L6_1, L7_1)
end
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:CloseAllDoors"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:CloseAllDoors"
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = ipairs
  L1_2 = hauntedhousehandler
  L1_2 = L1_2.doors
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = ipairs
    L7_2 = L5_2.doors
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
      L12_2 = SetEntityRotation
      L13_2 = doorobject
      L14_2 = 0.0
      L15_2 = 0.0
      L16_2 = L11_2.rotationclose
      L12_2(L13_2, L14_2, L15_2, L16_2)
    end
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:OpenDoor"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:OpenDoor"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = hauntedhousehandler
  L1_2 = L1_2.doors
  L1_2 = L1_2[A0_2]
  L2_2 = true
  L3_2 = ipairs
  L4_2 = L1_2.doors
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.rotationclose
    L8_2.doordata = L9_2
  end
  while L2_2 do
    L3_2 = Citizen
    L3_2 = L3_2.Wait
    L4_2 = 20
    L3_2(L4_2)
    L2_2 = false
    L3_2 = ipairs
    L4_2 = L1_2.doors
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.opendirection
      if "plus" == L9_2 then
        L9_2 = L8_2.doordata
        L10_2 = L8_2.rotationopen
        if L9_2 < L10_2 then
          L9_2 = L8_2.doordata
          L9_2 = L9_2 + 0.5
          L8_2.doordata = L9_2
          L2_2 = true
        end
      else
        L9_2 = L8_2.opendirection
        if "minus" == L9_2 then
          L9_2 = L8_2.doordata
          L10_2 = L8_2.rotationopen
          if L9_2 > L10_2 then
            L9_2 = L8_2.doordata
            L9_2 = L9_2 - 0.5
            L8_2.doordata = L9_2
            L2_2 = true
          end
        end
      end
      L9_2 = GetClosestObjectOfType
      L10_2 = L8_2.coords
      L11_2 = 2.0
      L12_2 = GetHashKey
      L13_2 = L8_2.modelname
      L12_2 = L12_2(L13_2)
      L13_2 = false
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
      L10_2 = DoesEntityExist
      L11_2 = L9_2
      L10_2 = L10_2(L11_2)
      if L10_2 then
        L10_2 = FreezeEntityPosition
        L11_2 = L9_2
        L12_2 = true
        L10_2(L11_2, L12_2)
        L10_2 = SetEntityRotation
        L11_2 = L9_2
        L12_2 = 0.0
        L13_2 = 0.0
        L14_2 = L8_2.doordata
        L10_2(L11_2, L12_2, L13_2, L14_2)
      end
    end
  end
  L3_2 = Citizen
  L3_2 = L3_2.Wait
  L4_2 = L1_2.timetoclose
  L3_2(L4_2)
  L3_2 = true
  L4_2 = ipairs
  L5_2 = L1_2.doors
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.rotationopen
    L9_2.doordata = L10_2
  end
  while L3_2 do
    L4_2 = Citizen
    L4_2 = L4_2.Wait
    L5_2 = 20
    L4_2(L5_2)
    L3_2 = false
    L4_2 = ipairs
    L5_2 = L1_2.doors
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = L9_2.closedirection
      if "plus" == L10_2 then
        L10_2 = L9_2.doordata
        L11_2 = L9_2.rotationclose
        if L10_2 < L11_2 then
          L10_2 = L9_2.doordata
          L10_2 = L10_2 + 0.5
          L9_2.doordata = L10_2
          L3_2 = true
        end
      else
        L10_2 = L9_2.closedirection
        if "minus" == L10_2 then
          L10_2 = L9_2.doordata
          L11_2 = L9_2.rotationclose
          if L10_2 > L11_2 then
            L10_2 = L9_2.doordata
            L10_2 = L10_2 - 0.5
            L9_2.doordata = L10_2
            L3_2 = true
          end
        end
      end
      L10_2 = GetClosestObjectOfType
      L11_2 = L9_2.coords
      L12_2 = 2.0
      L13_2 = GetHashKey
      L14_2 = L9_2.modelname
      L13_2 = L13_2(L14_2)
      L14_2 = false
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      L11_2 = DoesEntityExist
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      if L11_2 then
        L11_2 = FreezeEntityPosition
        L12_2 = L10_2
        L13_2 = true
        L11_2(L12_2, L13_2)
        L11_2 = SetEntityRotation
        L12_2 = L10_2
        L13_2 = 0.0
        L14_2 = 0.0
        L15_2 = L9_2.doordata
        L11_2(L12_2, L13_2, L14_2, L15_2)
      end
    end
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:ValakCross"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:ValakCross"
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = 0.0
  while true do
    L1_2 = 180.0
    if not (L0_2 < L1_2) then
      break
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = 20
    L1_2(L2_2)
    L0_2 = L0_2 + 1.0
    L1_2 = ipairs
    L2_2 = hauntedhousehandler
    L2_2 = L2_2.cross
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = DoesEntityExist
      L8_2 = L6_2.handler
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L7_2 = SetEntityRotation
        L8_2 = L6_2.handler
        L9_2 = L0_2
        L10_2 = L6_2.rotation
        L10_2 = L10_2.y
        L11_2 = L6_2.rotation
        L11_2 = L11_2.z
        L7_2(L8_2, L9_2, L10_2, L11_2)
      end
    end
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:ValakJumpScare"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:ValakJumpScare"
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L0_2 = DoesEntityExist
  L1_2 = L3_1
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = nil
    L1_2 = GetHashKey
    L2_2 = "sempre_delperropier_hauntedhouse_valak"
    L1_2 = L1_2(L2_2)
    L2_2 = RequestModel
    L3_2 = L1_2
    L2_2(L3_2)
    while true do
      L2_2 = HasModelLoaded
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      if L2_2 then
        break
      end
      L2_2 = RequestModel
      L3_2 = L1_2
      L2_2(L3_2)
      L2_2 = Citizen
      L2_2 = L2_2.Wait
      L3_2 = 5
      L2_2(L3_2)
    end
    L2_2 = TriggerEvent
    L3_2 = "rtx_themepark:HauntedHouse:PlaySound"
    L4_2 = "sounds/jumpscarefinal.mp3"
    L5_2 = 1.0
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = 500
    L2_2(L3_2)
    L2_2 = CreateObjectNoOffset
    L3_2 = L1_2
    L4_2 = -1539.94543
    L5_2 = -1121.96252
    L6_2 = 14.4689074
    L7_2 = false
    L8_2 = true
    L9_2 = true
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L0_2 = L2_2
    L2_2 = SetEntityRotation
    L3_2 = L0_2
    L4_2 = 0.0
    L5_2 = 0.0
    L6_2 = 0.0
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = NetworkAllowLocalEntityAttachment
    L3_2 = L0_2
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = FreezeEntityPosition
    L3_2 = L0_2
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = SetEntityMotionBlur
    L3_2 = L0_2
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = CreateCam
    L3_2 = "DEFAULT_SCRIPTED_CAMERA"
    L4_2 = true
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = AttachCamToEntity
    L4_2 = L2_2
    L5_2 = L3_1
    L6_2 = 0.0
    L7_2 = 0.0
    L8_2 = 1.0
    L9_2 = true
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L3_2 = SetCamActive
    L4_2 = L2_2
    L5_2 = true
    L3_2(L4_2, L5_2)
    L3_2 = RenderScriptCams
    L4_2 = true
    L5_2 = false
    L6_2 = 0
    L7_2 = true
    L8_2 = true
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = PointCamAtEntity
    L4_2 = L2_2
    L5_2 = L0_2
    L6_2 = 0.0
    L7_2 = 0.0
    L8_2 = 1.0
    L9_2 = true
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L3_2 = 4.0
    L4_2 = false
    while true do
      L5_2 = 0.5
      if not (L3_2 > L5_2) then
        break
      end
      L5_2 = Citizen
      L5_2 = L5_2.Wait
      L6_2 = 20
      L5_2(L6_2)
      if L3_2 > 3.0 then
        L3_2 = L3_2 - 0.01
      else
        L3_2 = L3_2 - 0.25
        if false == L4_2 then
          L4_2 = true
          L5_2 = TriggerEvent
          L6_2 = "rtx_themepark:HauntedHouse:PlaySound"
          L7_2 = "sounds/jumpscarefinal2.mp3"
          L8_2 = 1.0
          L5_2(L6_2, L7_2, L8_2)
        end
      end
      L5_2 = AttachEntityToEntity
      L6_2 = L0_2
      L7_2 = L3_1
      L8_2 = 0
      L9_2 = 0.0
      L10_2 = L3_2
      L11_2 = 0.6
      L12_2 = 0.0
      L13_2 = 0.0
      L14_2 = 180.0
      L15_2 = false
      L16_2 = false
      L17_2 = false
      L18_2 = false
      L19_2 = 5
      L20_2 = true
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    end
    L5_2 = Citizen
    L5_2 = L5_2.Wait
    L6_2 = 1000
    L5_2(L6_2)
    L5_2 = DoesEntityExist
    L6_2 = L0_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = DeleteEntity
      L6_2 = L0_2
      L5_2(L6_2)
    end
    L5_2 = DoesCamExist
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = DestroyCam
      L6_2 = L2_2
      L7_2 = false
      L5_2(L6_2, L7_2)
    end
    L2_2 = false
    L5_2 = RenderScriptCams
    L6_2 = false
    L7_2 = 0
    L8_2 = 0
    L9_2 = true
    L10_2 = false
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:AnabelleHide"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:AnabelleHide"
function L7_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetEntityVisible
  L1_2 = hauntedhousehandler
  L1_2 = L1_2.anabelle
  L1_2 = L1_2.anabellehandler
  L2_2 = false
  L0_2(L1_2, L2_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:HauntedHouse:Anabelle"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:HauntedHouse:Anabelle"
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = SetEntityVisible
  L1_2 = hauntedhousehandler
  L1_2 = L1_2.anabelle
  L1_2 = L1_2.anabellehandler
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = AttachEntityToEntity
  L1_2 = hauntedhousehandler
  L1_2 = L1_2.anabelle
  L1_2 = L1_2.anabellehandler
  L2_2 = L3_1
  L3_2 = 0
  L4_2 = -0.2
  L5_2 = 0.3
  L6_2 = 0.8
  L7_2 = 0.0
  L8_2 = 0.0
  L9_2 = 150.0
  L10_2 = false
  L11_2 = false
  L12_2 = false
  L13_2 = false
  L14_2 = 5
  L15_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L0_2 = CreateCam
  L1_2 = "DEFAULT_SCRIPTED_CAMERA"
  L2_2 = true
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = TriggerEvent
  L2_2 = "rtx_themepark:HauntedHouse:PlaySound"
  L3_2 = "sounds/jumpscare.mp3"
  L4_2 = 1.0
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = AttachCamToEntity
  L2_2 = L0_2
  L3_2 = L3_1
  L4_2 = 0.0
  L5_2 = 0.0
  L6_2 = 1.0
  L7_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  L1_2 = SetCamActive
  L2_2 = L0_2
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = RenderScriptCams
  L2_2 = true
  L3_2 = false
  L4_2 = 0
  L5_2 = true
  L6_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = AttachEntityToEntity
  L2_2 = hauntedhousehandler
  L2_2 = L2_2.anabelle
  L2_2 = L2_2.anabellehandler
  L3_2 = L3_1
  L4_2 = 0
  L5_2 = -0.2
  L6_2 = 0.3
  L7_2 = 0.8
  L8_2 = 0.0
  L9_2 = 0.0
  L10_2 = 150.0
  L11_2 = false
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L15_2 = 5
  L16_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  L1_2 = L1_2 + 4000
  L2_2 = true
  while L2_2 do
    L3_2 = GetGameTimer
    L3_2 = L3_2()
    if L1_2 < L3_2 then
      L2_2 = false
    end
    L4_2 = Citizen
    L4_2 = L4_2.Wait
    L5_2 = 5
    L4_2(L5_2)
    L4_2 = GetEntityRotation
    L5_2 = L3_1
    L6_2 = 2
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = vector3
    L6_2 = -10.0
    L7_2 = 0.0
    L8_2 = 20.0
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L4_2 = L4_2 + L5_2
    L5_2 = SetCamRot
    L6_2 = L0_2
    L7_2 = L4_2
    L8_2 = 2
    L5_2(L6_2, L7_2, L8_2)
  end
  L3_2 = DoesEntityExist
  L4_2 = valak
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = DeleteEntity
    L4_2 = valak
    L3_2(L4_2)
  end
  L3_2 = DoesCamExist
  L4_2 = L0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = DestroyCam
    L4_2 = L0_2
    L5_2 = false
    L3_2(L4_2, L5_2)
  end
  L0_2 = nil
  L3_2 = RenderScriptCams
  L4_2 = false
  L5_2 = 0
  L6_2 = 0
  L7_2 = true
  L8_2 = false
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = AttachEntityToEntity
  L4_2 = hauntedhousehandler
  L4_2 = L4_2.anabelle
  L4_2 = L4_2.anabellehandler
  L5_2 = hauntedhousehandler
  L5_2 = L5_2.anabelle
  L5_2 = L5_2.seathandler
  L6_2 = 0
  L7_2 = 0.0
  L8_2 = 1.0
  L9_2 = -0.021
  L10_2 = -100.0
  L11_2 = 0.0
  L12_2 = 0.0
  L13_2 = false
  L14_2 = false
  L15_2 = false
  L16_2 = false
  L17_2 = 5
  L18_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
end
L5_1(L6_1, L7_1)
L5_1 = Citizen
L5_1 = L5_1.CreateThread
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
    L0_2 = nearbythemepark
    if true ~= L0_2 then
      L0_2 = nearbythemepark
      if false ~= L0_2 then
        goto lbl_397
      end
    end
    L0_2 = DoesEntityExist
    L1_2 = L4_1
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = GetHashKey
      L1_2 = "sempre_delperropier_hauntedhouse_vozik"
      L0_2 = L0_2(L1_2)
      L1_2 = RequestModel
      L2_2 = L0_2
      L1_2(L2_2)
      while true do
        L1_2 = HasModelLoaded
        L2_2 = L0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          break
        end
        L1_2 = RequestModel
        L2_2 = L0_2
        L1_2(L2_2)
        L1_2 = Citizen
        L1_2 = L1_2.Wait
        L2_2 = 5
        L1_2(L2_2)
      end
      L1_2 = CreateObjectNoOffset
      L2_2 = L0_2
      L3_2 = -1599.8597412109
      L4_2 = -1140.8292236328
      L5_2 = 13.68274307251
      L6_2 = false
      L7_2 = true
      L8_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
      L4_1 = L1_2
      L1_2 = SetEntityRotation
      L2_2 = L4_1
      L3_2 = 0.0
      L4_2 = 0.0
      L5_2 = 0.0
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = SetEntityQuaternion
      L2_2 = L4_1
      L3_2 = 2.5277130771428E-4
      L4_2 = 7.8270520316437E-4
      L5_2 = -0.33799600601196
      L6_2 = 0.94114714860916
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
      L1_2 = NetworkAllowLocalEntityAttachment
      L2_2 = L4_1
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = FreezeEntityPosition
      L2_2 = L4_1
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = SetEntityVisible
      L2_2 = L4_1
      L3_2 = false
      L1_2(L2_2, L3_2)
      L1_2 = SetEntityMotionBlur
      L2_2 = L4_1
      L3_2 = false
      L1_2(L2_2, L3_2)
    end
    L0_2 = DoesEntityExist
    L1_2 = L3_1
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = GetHashKey
      L1_2 = "sempre_delperropier_hauntedhouse_vozik"
      L0_2 = L0_2(L1_2)
      L1_2 = RequestModel
      L2_2 = L0_2
      L1_2(L2_2)
      while true do
        L1_2 = HasModelLoaded
        L2_2 = L0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          break
        end
        L1_2 = RequestModel
        L2_2 = L0_2
        L1_2(L2_2)
        L1_2 = Citizen
        L1_2 = L1_2.Wait
        L2_2 = 5
        L1_2(L2_2)
      end
      L1_2 = CreateObjectNoOffset
      L2_2 = L0_2
      L3_2 = -1599.8597412109
      L4_2 = -1140.8292236328
      L5_2 = 13.68274307251
      L6_2 = false
      L7_2 = true
      L8_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
      L3_1 = L1_2
      L1_2 = SetEntityRotation
      L2_2 = L3_1
      L3_2 = 0.0
      L4_2 = 0.0
      L5_2 = 0.0
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = SetEntityQuaternion
      L2_2 = L3_1
      L3_2 = 2.5277130771428E-4
      L4_2 = 7.8270520316437E-4
      L5_2 = -0.33799600601196
      L6_2 = 0.94114714860916
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
      L1_2 = NetworkAllowLocalEntityAttachment
      L2_2 = L3_1
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = FreezeEntityPosition
      L2_2 = L3_1
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = SetEntityMotionBlur
      L2_2 = L3_1
      L3_2 = false
      L1_2(L2_2, L3_2)
      L1_2 = AttachEntityToEntity
      L2_2 = L3_1
      L3_2 = L4_1
      L4_2 = 0
      L5_2 = 0.0
      L6_2 = 0.0
      L7_2 = -0.2
      L8_2 = 0.0
      L9_2 = 0.0
      L10_2 = 0.0
      L11_2 = false
      L12_2 = false
      L13_2 = false
      L14_2 = false
      L15_2 = 5
      L16_2 = true
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    end
    L0_2 = DoesEntityExist
    L1_2 = hauntedhousehandler
    L1_2 = L1_2.anabelle
    L1_2 = L1_2.seathandler
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = GetHashKey
      L1_2 = "djn_swing_chair_try"
      L0_2 = L0_2(L1_2)
      L1_2 = RequestModel
      L2_2 = L0_2
      L1_2(L2_2)
      while true do
        L1_2 = HasModelLoaded
        L2_2 = L0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          break
        end
        L1_2 = RequestModel
        L2_2 = L0_2
        L1_2(L2_2)
        L1_2 = Citizen
        L1_2 = L1_2.Wait
        L2_2 = 5
        L1_2(L2_2)
      end
      L1_2 = hauntedhousehandler
      L1_2 = L1_2.anabelle
      L2_2 = CreateObjectNoOffset
      L3_2 = L0_2
      L4_2 = -1593.151
      L5_2 = -1156.345
      L6_2 = 13.28468
      L7_2 = false
      L8_2 = true
      L9_2 = true
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
      L1_2.seathandler = L2_2
      L1_2 = SetEntityRotation
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.anabelle
      L2_2 = L2_2.seathandler
      L3_2 = 0.0
      L4_2 = 0.0
      L5_2 = 30.0
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = NetworkAllowLocalEntityAttachment
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.anabelle
      L2_2 = L2_2.seathandler
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = FreezeEntityPosition
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.anabelle
      L2_2 = L2_2.seathandler
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = SetEntityMotionBlur
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.anabelle
      L2_2 = L2_2.seathandler
      L3_2 = false
      L1_2(L2_2, L3_2)
      L1_2 = "clip@djn_swing_chair_try"
      while true do
        L2_2 = HasAnimDictLoaded
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        if L2_2 then
          break
        end
        L2_2 = RequestAnimDict
        L3_2 = L1_2
        L2_2(L3_2)
        L2_2 = Citizen
        L2_2 = L2_2.Wait
        L3_2 = 5
        L2_2(L3_2)
      end
      L2_2 = PlayEntityAnim
      L3_2 = hauntedhousehandler
      L3_2 = L3_2.anabelle
      L3_2 = L3_2.seathandler
      L4_2 = "djn_swing_chair_try"
      L5_2 = L1_2
      L6_2 = 8.0
      L7_2 = true
      L8_2 = 1
      L9_2 = 0
      L10_2 = 0
      L11_2 = 0
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    end
    L0_2 = DoesEntityExist
    L1_2 = hauntedhousehandler
    L1_2 = L1_2.anabelle
    L1_2 = L1_2.anabellehandler
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = GetHashKey
      L1_2 = "sempre_delperropier_hauntedhouse_annabelle"
      L0_2 = L0_2(L1_2)
      L1_2 = RequestModel
      L2_2 = L0_2
      L1_2(L2_2)
      while true do
        L1_2 = HasModelLoaded
        L2_2 = L0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          break
        end
        L1_2 = RequestModel
        L2_2 = L0_2
        L1_2(L2_2)
        L1_2 = Citizen
        L1_2 = L1_2.Wait
        L2_2 = 5
        L1_2(L2_2)
      end
      L1_2 = hauntedhousehandler
      L1_2 = L1_2.anabelle
      L2_2 = CreateObjectNoOffset
      L3_2 = L0_2
      L4_2 = -1593.151
      L5_2 = -1156.345
      L6_2 = 13.28468
      L7_2 = false
      L8_2 = true
      L9_2 = true
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
      L1_2.anabellehandler = L2_2
      L1_2 = SetEntityRotation
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.anabelle
      L2_2 = L2_2.anabellehandler
      L3_2 = 0.0
      L4_2 = 0.0
      L5_2 = 0.0
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = NetworkAllowLocalEntityAttachment
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.anabelle
      L2_2 = L2_2.anabellehandler
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = FreezeEntityPosition
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.anabelle
      L2_2 = L2_2.anabellehandler
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = SetEntityMotionBlur
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.anabelle
      L2_2 = L2_2.anabellehandler
      L3_2 = false
      L1_2(L2_2, L3_2)
      L1_2 = AttachEntityToEntity
      L2_2 = hauntedhousehandler
      L2_2 = L2_2.anabelle
      L2_2 = L2_2.anabellehandler
      L3_2 = hauntedhousehandler
      L3_2 = L3_2.anabelle
      L3_2 = L3_2.seathandler
      L4_2 = 0
      L5_2 = 0.0
      L6_2 = 1.0
      L7_2 = -0.021
      L8_2 = -100.0
      L9_2 = 0.0
      L10_2 = 0.0
      L11_2 = false
      L12_2 = false
      L13_2 = false
      L14_2 = false
      L15_2 = 5
      L16_2 = true
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    end
    L0_2 = ipairs
    L1_2 = hauntedhousehandler
    L1_2 = L1_2.cross
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = DoesEntityExist
      L7_2 = L5_2.handler
      L6_2 = L6_2(L7_2)
      if L6_2 then
      else
        L6_2 = GetHashKey
        L7_2 = "sempre_delperropier_hauntedhouse_valak_cross"
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
        L7_2 = NetworkAllowLocalEntityAttachment
        L8_2 = L5_2.handler
        L9_2 = true
        L7_2(L8_2, L9_2)
        L7_2 = FreezeEntityPosition
        L8_2 = L5_2.handler
        L9_2 = true
        L7_2(L8_2, L9_2)
        L7_2 = SetEntityMotionBlur
        L8_2 = L5_2.handler
        L9_2 = false
        L7_2(L8_2, L9_2)
      end
    end
    ::lbl_397::
  end
end
L5_1(L6_1)
L5_1 = -1
L6_1 = Citizen
L6_1 = L6_1.CreateThread
function L7_1()
  local L0_2, L1_2, L2_2, L3_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 20
    L0_2(L1_2)
    L0_2 = GlobalState
    L0_2 = L0_2["attraction16-phase"]
    if 0 ~= L0_2 then
      L0_2 = nearbythemepark
      if false ~= L0_2 then
        goto lbl_21
      end
    end
    L0_2 = hauntedhousehandler
    L0_2.getnew = true
    L0_2 = -1
    L5_1 = L0_2
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
    goto lbl_47
    ::lbl_21::
    L0_2 = L5_1
    if -1 ~= L0_2 then
      L0_2 = L5_1
      L1_2 = GlobalState
      L1_2 = L1_2["attraction16-synchdata"]
      if not (L0_2 < L1_2) then
        goto lbl_41
      end
    end
    L0_2 = tonumber
    L1_2 = GlobalState
    L1_2 = L1_2["attraction16-synchdata"]
    L0_2 = L0_2(L1_2)
    L5_1 = L0_2
    L0_2 = TriggerEvent
    L1_2 = "rtx_themepark:HauntedHouse:SynchronizeMovement"
    L2_2 = GlobalState
    L2_2 = L2_2["attraction16-ridedata1"]
    L3_2 = GlobalState
    L3_2 = L3_2["attraction16-ridedata2"]
    L0_2(L1_2, L2_2, L3_2)
    ::lbl_41::
    L0_2 = L1_1
    if nil ~= L0_2 then
      L0_2 = SetFollowPedCamViewMode
      L1_2 = 4
      L0_2(L1_2)
    end
    ::lbl_47::
  end
end
L6_1(L7_1)
L6_1 = Config
L6_1 = L6_1.AttractionsSettings
L6_1 = L6_1.hauntedhouse
L6_1 = L6_1.disable
if false == L6_1 then
  L6_1 = Citizen
  L6_1 = L6_1.CreateThread
  function L7_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = true
      L1_2 = PlayerPedId
      L1_2 = L1_2()
      L2_2 = GetEntityCoords
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L3_2 = false
      L4_2 = -1
      L5_2 = {}
      L5_2.seatid = nil
      L6_2 = GlobalState
      L6_2 = L6_2["attraction16-phase"]
      if 0 == L6_2 then
        L6_2 = usingattraction
        if false == L6_2 then
          L6_2 = nearbythemepark
          if true == L6_2 then
            L6_2 = tickets
            L6_2 = L6_2.hauntedhouse
            if true == L6_2 then
              L6_2 = ipairs
              L7_2 = hauntedhousehandler
              L7_2 = L7_2.seats
              L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
              for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
                L12_2 = L11_2.taken
                if false == L12_2 then
                  L12_2 = GetOffsetFromEntityInWorldCoords
                  L13_2 = L3_1
                  L14_2 = L11_2.offsets
                  L14_2 = L14_2.coords
                  L14_2 = L14_2.x
                  L15_2 = L11_2.offsets
                  L15_2 = L15_2.coords
                  L15_2 = L15_2.y
                  L16_2 = L11_2.offsets
                  L16_2 = L16_2.coords
                  L16_2 = L16_2.z
                  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
                  L13_2 = L2_2 - L12_2
                  L13_2 = #L13_2
                  if L13_2 < 20.0 then
                    L14_2 = Config
                    L14_2 = L14_2.AttractionsSettings
                    L14_2 = L14_2.hauntedhouse
                    L14_2 = L14_2.usedistance
                    if L13_2 < L14_2 and (-1 == L4_2 or L4_2 > L13_2) then
                      L4_2 = L13_2
                      L3_2 = true
                      L5_2.seatid = L10_2
                    end
                  end
                end
              end
            end
          end
        end
      end
      if L3_2 then
        L6_2 = {}
        L7_2 = L5_2.seatid
        L6_2.seatid = L7_2
        L0_1 = L6_2
        L6_2 = false
        L7_2 = usingattraction
        if false == L7_2 then
          L0_2 = false
          L7_2 = Config
          L7_2 = L7_2.Target
          if false == L7_2 then
            L7_2 = hauntedhousehandler
            L7_2 = L7_2.seats
            L8_2 = L0_1.seatid
            L7_2 = L7_2[L8_2]
            L8_2 = Config
            L8_2 = L8_2.ThemeParkInteractionSystem
            if 1 == L8_2 then
              L8_2 = SendNUIMessage
              L9_2 = {}
              L9_2.message = "infonotifyshow"
              L10_2 = Language
              L11_2 = Config
              L11_2 = L11_2.Language
              L10_2 = L10_2[L11_2]
              L10_2 = L10_2.pressforuseseatinteract
              L9_2.infonotifytext = L10_2
              L8_2(L9_2)
              L6_2 = true
            else
              L8_2 = Config
              L8_2 = L8_2.ThemeParkInteractionSystem
              if 2 == L8_2 then
                L8_2 = GetOffsetFromEntityInWorldCoords
                L9_2 = seatobjecthandler
                L9_2 = L9_2.handler
                L10_2 = L7_2.offsets
                L10_2 = L10_2.coords
                L10_2 = L10_2.x
                L11_2 = L7_2.offsets
                L11_2 = L11_2.coords
                L11_2 = L11_2.y
                L12_2 = L7_2.offsets
                L12_2 = L12_2.coords
                L12_2 = L12_2.z
                L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
                L9_2 = DrawText3D
                L10_2 = L8_2.x
                L11_2 = L8_2.y
                L12_2 = L8_2.z
                L13_2 = Language
                L14_2 = Config
                L14_2 = L14_2.Language
                L13_2 = L13_2[L14_2]
                L13_2 = L13_2.pressforuseseat
                L9_2(L10_2, L11_2, L12_2, L13_2)
              else
                L8_2 = Config
                L8_2 = L8_2.ThemeParkInteractionSystem
                if 3 == L8_2 then
                  L8_2 = ShowGtaClassicInteraction
                  L9_2 = Language
                  L10_2 = Config
                  L10_2 = L10_2.Language
                  L9_2 = L9_2[L10_2]
                  L9_2 = L9_2.pressforuseseatinteractclassic
                  L8_2(L9_2)
                end
              end
            end
          end
        end
      else
        L6_2 = Config
        L6_2 = L6_2.ThemeParkInteractionSystem
        if 1 == L6_2 then
          L6_2 = L0_1.seatid
          if nil ~= L6_2 then
            L6_2 = SendNUIMessage
            L7_2 = {}
            L7_2.message = "hide"
            L6_2(L7_2)
          end
        end
        L6_2 = {}
        L6_2.seatid = nil
        L0_1 = L6_2
      end
      if L0_2 then
        L6_2 = Citizen
        L6_2 = L6_2.Wait
        L7_2 = 1000
        L6_2(L7_2)
      end
    end
  end
  L6_1(L7_1)
end
L6_1 = {}
L7_1 = {}
L7_1.soundfile = "sounds/zombie.mp3"
L7_1.soundvolume = 0.3
L6_1.zombie = L7_1
L7_1 = {}
L7_1.soundfile = "sounds/marnice.mp3"
L7_1.soundvolume = 0.5
L6_1.marnice = L7_1
L7_1 = {}
L7_1.soundfile = "sounds/vrazdirna.mp3"
L7_1.soundvolume = 0.5
L6_1.elekreslo = L7_1
L7_1 = {}
L7_1.soundfile = "sounds/ritual.mp3"
L7_1.soundvolume = 0.5
L6_1.pennywise = L7_1
L7_1 = {}
L7_1.soundfile = "sounds/jeskyne.mp3"
L7_1.soundvolume = 0.5
L6_1.detskypokoj = L7_1
L7_1 = {}
L7_1.soundfile = "sounds/valak.mp3"
L7_1.soundvolume = 0.2
L6_1.valak = L7_1
L7_1 = false
L8_1 = ""
L9_1 = Citizen
L9_1 = L9_1.CreateThread
function L10_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
    L0_2 = GlobalState
    L0_2 = L0_2["attraction16-phase"]
    if 0 == L0_2 then
      L0_2 = L7_1
      if true == L0_2 then
        L0_2 = ""
        L8_1 = L0_2
        L0_2 = false
        L7_1 = L0_2
        L0_2 = SendNUIMessage
        L1_2 = {}
        L1_2.message = "stopsoundhaunted"
        L0_2(L1_2)
      end
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 500
      L0_2(L1_2)
    else
      L0_2 = PlayerPedId
      L0_2 = L0_2()
      L1_2 = GetInteriorFromEntity
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      L2_2 = GetRoomKeyFromEntity
      L3_2 = L0_2
      L2_2 = L2_2(L3_2)
      L3_2 = GetInteriorRoomIndexByHash
      L4_2 = L1_2
      L5_2 = L2_2
      L3_2 = L3_2(L4_2, L5_2)
      if -1 ~= L3_2 then
        L4_2 = GetInteriorRoomName
        L5_2 = L1_2
        L6_2 = L3_2
        L4_2 = L4_2(L5_2, L6_2)
        L5_2 = L6_1
        L5_2 = L5_2[L4_2]
        if L5_2 then
          L5_2 = L8_1
          if L5_2 == L4_2 then
            L5_2 = L7_1
            if false == L5_2 then
              L5_2 = L6_1
              L5_2 = L5_2[L4_2]
              L6_2 = SendNUIMessage
              L7_2 = {}
              L7_2.message = "playsoundhaunted"
              L8_2 = L5_2.soundvolume
              L7_2.soundvolume = L8_2
              L8_2 = L5_2.soundfile
              L7_2.soundsrc = L8_2
              L6_2(L7_2)
            end
          else
            L8_1 = L4_2
            L5_2 = true
            L7_1 = L5_2
            L5_2 = L6_1
            L5_2 = L5_2[L4_2]
            L6_2 = SendNUIMessage
            L7_2 = {}
            L7_2.message = "playsoundhaunted"
            L8_2 = L5_2.soundvolume
            L7_2.soundvolume = L8_2
            L8_2 = L5_2.soundfile
            L7_2.soundsrc = L8_2
            L6_2(L7_2)
          end
        else
          L5_2 = ""
          L8_1 = L5_2
          L5_2 = L7_1
          if true == L5_2 then
            L5_2 = ""
            L8_1 = L5_2
            L5_2 = false
            L7_1 = L5_2
            L5_2 = SendNUIMessage
            L6_2 = {}
            L6_2.message = "stopsoundhaunted"
            L5_2(L6_2)
          end
        end
      else
        L4_2 = L7_1
        if true == L4_2 then
          L4_2 = ""
          L8_1 = L4_2
          L4_2 = false
          L7_1 = L4_2
          L4_2 = SendNUIMessage
          L5_2 = {}
          L5_2.message = "stopsoundhaunted"
          L4_2(L5_2)
        end
      end
    end
  end
end
L9_1(L10_1)
L9_1 = RegisterNetEvent
L10_1 = "rtx_themepark:HauntedHouse:PlaySound"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "rtx_themepark:HauntedHouse:PlaySound"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.message = "playsound2haunted"
  L3_2.soundvolume = A1_2
  L3_2.soundsrc = A0_2
  L2_2(L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = Config
L9_1 = L9_1.Target
if false == L9_1 then
  L9_1 = RegisterCommand
  L10_1 = "usehauntedhouseseat"
  function L11_1()
    local L0_2, L1_2, L2_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = L0_1.seatid
      if nil ~= L0_2 then
        L0_2 = iteminhand
        if false == L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:HauntedHouse:SeatUse"
          L2_2 = L0_1.seatid
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
  L9_1(L10_1, L11_1)
  L9_1 = RegisterKeyMapping
  L10_1 = "usehauntedhouseseat"
  L11_1 = Language
  L12_1 = Config
  L12_1 = L12_1.Language
  L11_1 = L11_1[L12_1]
  L11_1 = L11_1.bindrollercoasterseatuse
  L12_1 = "keyboard"
  L13_1 = Config
  L13_1 = L13_1.ThemeParkSeatKey
  L9_1(L10_1, L11_1, L12_1, L13_1)
end
L9_1 = RegisterCommand
L10_1 = "exithauntedhouse"
function L11_1()
  local L0_2, L1_2, L2_2
  L0_2 = usingattraction
  if true == L0_2 then
    L0_2 = L1_1
    if nil ~= L0_2 then
      L0_2 = GlobalState
      L0_2 = L0_2["attraction16-phase"]
      if 0 == L0_2 then
        L0_2 = TriggerServerEvent
        L1_2 = "rtx_themepark:HauntedHouse:ExitAttraction"
        L2_2 = L1_1
        L0_2(L1_2, L2_2)
      else
        L0_2 = Notify
        L1_2 = Language
        L2_2 = Config
        L2_2 = L2_2.Language
        L1_2 = L1_2[L2_2]
        L1_2 = L1_2.inprogress
        L0_2(L1_2)
      end
    end
  end
end
L9_1(L10_1, L11_1)
L9_1 = RegisterKeyMapping
L10_1 = "exithauntedhouse"
L11_1 = Language
L12_1 = Config
L12_1 = L12_1.Language
L11_1 = L11_1[L12_1]
L11_1 = L11_1.bindattractionexitkey
L12_1 = "keyboard"
L13_1 = Config
L13_1 = L13_1.ThemeParkExitKey
L9_1(L10_1, L11_1, L12_1, L13_1)
