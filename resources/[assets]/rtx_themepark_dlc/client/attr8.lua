local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = IsDuplicityVersion
L0_1 = L0_1()
if L0_1 then
  L0_1 = GetPlayerPositionInRealTime75
  L0_1()
end
L0_1 = {}
L0_1.cartid = nil
L0_1.seatid = nil
L0_1.platformid = nil
L1_1 = nil
L2_1 = nil
L3_1 = false
L4_1 = false
L5_1 = false
L6_1 = 0
L7_1 = {}
L7_1.started = false
L7_1.stageid = 0
L7_1.getnew = false
L8_1 = {}
L9_1 = {}
L9_1.object = "ind_prop_dlc_roller_car"
L9_1.handler = nil
L10_1 = vector3
L11_1 = -1643.5240478516
L12_1 = -1124.6810302734
L13_1 = 17.432600021362
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L10_1 = vector3
L11_1 = -0.98019218444824
L12_1 = -2.5906699011102E-4
L13_1 = 140.0203704834
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.rotation = L10_1
L10_1 = {}
L11_1 = {}
L12_1 = vector3
L13_1 = -1644.35
L14_1 = -1123.54
L15_1 = 18.33
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.coords = L12_1
L11_1.seatid1 = 1
L11_1.seatid2 = 2
L12_1 = {}
L13_1 = vector3
L14_1 = -1644.97
L15_1 = -1124.29
L16_1 = 18.33
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.coords = L13_1
L12_1.seatid1 = 3
L12_1.seatid2 = 4
L10_1[1] = L11_1
L10_1[2] = L12_1
L9_1.platforms = L10_1
L10_1 = {}
L11_1 = {}
L11_1.taken = false
L11_1.takenplayerid = nil
L11_1.seattype = 1
L11_1.seatcategory = "one"
L11_1.seatcategoryoffset = -1.017
L12_1 = vector3
L13_1 = -0.231
L14_1 = -0.038
L15_1 = 0.914
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.seatoffsets = L12_1
L12_1 = vector3
L13_1 = -1641.83
L14_1 = -1125.54
L15_1 = 17.33
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.seatend = L12_1
L12_1 = {}
L12_1.taken = false
L12_1.takenplayerid = nil
L12_1.seattype = 1
L12_1.seatcategory = "two"
L12_1.seatcategoryoffset = -1.017
L13_1 = vector3
L14_1 = 0.297
L15_1 = -0.038
L16_1 = 0.914
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.seatoffsets = L13_1
L13_1 = vector3
L14_1 = -1641.83
L15_1 = -1125.54
L16_1 = 17.33
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.seatend = L13_1
L13_1 = {}
L13_1.taken = false
L13_1.takenplayerid = nil
L13_1.seattype = 1
L13_1.seatcategory = "one"
L13_1.seatcategoryoffset = 0.0
L14_1 = vector3
L15_1 = -0.183
L16_1 = 0.964
L17_1 = 0.914
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.seatoffsets = L14_1
L14_1 = vector3
L15_1 = -1642.59
L16_1 = -1126.17
L17_1 = 17.33
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.seatend = L14_1
L14_1 = {}
L14_1.taken = false
L14_1.takenplayerid = nil
L14_1.seattype = 1
L14_1.seatcategory = "two"
L14_1.seatcategoryoffset = 0.0
L15_1 = vector3
L16_1 = 0.297
L17_1 = 0.964
L18_1 = 0.914
L15_1 = L15_1(L16_1, L17_1, L18_1)
L14_1.seatoffsets = L15_1
L15_1 = vector3
L16_1 = -1642.59
L17_1 = -1126.17
L18_1 = 17.33
L15_1 = L15_1(L16_1, L17_1, L18_1)
L14_1.seatend = L15_1
L10_1[1] = L11_1
L10_1[2] = L12_1
L10_1[3] = L13_1
L10_1[4] = L14_1
L9_1.players = L10_1
L8_1[1] = L9_1
L9_1 = {}
L9_1.object = "ind_prop_dlc_roller_car_02"
L9_1.handler = nil
L10_1 = vector3
L11_1 = -1645.1635742188
L12_1 = -1126.6341552734
L13_1 = 17.431180953979
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L10_1 = vector3
L11_1 = -0.98019218444824
L12_1 = -2.5906699011102E-4
L13_1 = 140.0203704834
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.rotation = L10_1
L10_1 = {}
L11_1 = {}
L12_1 = vector3
L13_1 = -1645.92
L14_1 = -1125.47
L15_1 = 18.33
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.coords = L12_1
L11_1.seatid1 = 1
L11_1.seatid2 = 2
L12_1 = {}
L13_1 = vector3
L14_1 = -1646.54
L15_1 = -1126.25
L16_1 = 18.33
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.coords = L13_1
L12_1.seatid1 = 3
L12_1.seatid2 = 4
L10_1[1] = L11_1
L10_1[2] = L12_1
L9_1.platforms = L10_1
L10_1 = {}
L11_1 = {}
L11_1.taken = false
L11_1.takenplayerid = nil
L11_1.seattype = 1
L11_1.seatcategory = "one"
L11_1.seatcategoryoffset = -1.017
L12_1 = vector3
L13_1 = -0.2
L14_1 = -0.034
L15_1 = 0.914
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.seatoffsets = L12_1
L12_1 = vector3
L13_1 = -1643.42
L14_1 = -1127.49
L15_1 = 17.33
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.seatend = L12_1
L12_1 = {}
L12_1.taken = false
L12_1.takenplayerid = nil
L12_1.seattype = 1
L12_1.seatcategory = "two"
L12_1.seatcategoryoffset = -1.017
L13_1 = vector3
L14_1 = 0.284
L15_1 = -0.034
L16_1 = 0.914
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.seatoffsets = L13_1
L13_1 = vector3
L14_1 = -1643.42
L15_1 = -1127.49
L16_1 = 17.33
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.seatend = L13_1
L13_1 = {}
L13_1.taken = false
L13_1.takenplayerid = nil
L13_1.seattype = 1
L13_1.seatcategory = "one"
L13_1.seatcategoryoffset = 0.0
L14_1 = vector3
L15_1 = -0.184
L16_1 = 0.96
L17_1 = 0.914
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.seatoffsets = L14_1
L14_1 = vector3
L15_1 = -1643.99
L16_1 = -1128.23
L17_1 = 17.33
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.seatend = L14_1
L14_1 = {}
L14_1.taken = false
L14_1.takenplayerid = nil
L14_1.seattype = 1
L14_1.seatcategory = "two"
L14_1.seatcategoryoffset = 0.0
L15_1 = vector3
L16_1 = 0.284
L17_1 = 0.974
L18_1 = 0.914
L15_1 = L15_1(L16_1, L17_1, L18_1)
L14_1.seatoffsets = L15_1
L15_1 = vector3
L16_1 = -1643.99
L17_1 = -1128.23
L18_1 = 17.33
L15_1 = L15_1(L16_1, L17_1, L18_1)
L14_1.seatend = L15_1
L10_1[1] = L11_1
L10_1[2] = L12_1
L10_1[3] = L13_1
L10_1[4] = L14_1
L9_1.players = L10_1
L8_1[2] = L9_1
L9_1 = {}
L9_1.object = "ind_prop_dlc_roller_car_02"
L9_1.handler = nil
L10_1 = vector3
L11_1 = -1646.8031005859
L12_1 = -1128.5871582031
L13_1 = 17.429763793945
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L10_1 = vector3
L11_1 = -0.98019218444824
L12_1 = -2.5906699011102E-4
L13_1 = 140.0203704834
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.rotation = L10_1
L10_1 = {}
L11_1 = {}
L12_1 = vector3
L13_1 = -1647.56
L14_1 = -1127.49
L15_1 = 18.33
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.coords = L12_1
L11_1.seatid1 = 1
L11_1.seatid2 = 2
L12_1 = {}
L13_1 = vector3
L14_1 = -1648.21
L15_1 = -1128.17
L16_1 = 18.33
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.coords = L13_1
L12_1.seatid1 = 3
L12_1.seatid2 = 4
L10_1[1] = L11_1
L10_1[2] = L12_1
L9_1.platforms = L10_1
L10_1 = {}
L11_1 = {}
L11_1.taken = false
L11_1.takenplayerid = nil
L11_1.seattype = 1
L11_1.seatcategory = "one"
L11_1.seatcategoryoffset = -1.017
L12_1 = vector3
L13_1 = -0.2
L14_1 = -0.034
L15_1 = 0.914
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.seatoffsets = L12_1
L12_1 = vector3
L13_1 = -1644.97
L14_1 = -1129.39
L15_1 = 17.33
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.seatend = L12_1
L12_1 = {}
L12_1.taken = false
L12_1.takenplayerid = nil
L12_1.seattype = 1
L12_1.seatcategory = "two"
L12_1.seatcategoryoffset = -1.017
L13_1 = vector3
L14_1 = 0.284
L15_1 = -0.034
L16_1 = 0.914
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.seatoffsets = L13_1
L13_1 = vector3
L14_1 = -1644.97
L15_1 = -1129.39
L16_1 = 17.33
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.seatend = L13_1
L13_1 = {}
L13_1.taken = false
L13_1.takenplayerid = nil
L13_1.seattype = 1
L13_1.seatcategory = "one"
L13_1.seatcategoryoffset = 0.0
L14_1 = vector3
L15_1 = -0.184
L16_1 = 0.96
L17_1 = 0.914
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.seatoffsets = L14_1
L14_1 = vector3
L15_1 = -1645.64
L16_1 = -1130.11
L17_1 = 17.33
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.seatend = L14_1
L14_1 = {}
L14_1.taken = false
L14_1.takenplayerid = nil
L14_1.seattype = 1
L14_1.seatcategory = "two"
L14_1.seatcategoryoffset = 0.0
L15_1 = vector3
L16_1 = 0.284
L17_1 = 0.974
L18_1 = 0.914
L15_1 = L15_1(L16_1, L17_1, L18_1)
L14_1.seatoffsets = L15_1
L15_1 = vector3
L16_1 = -1645.64
L17_1 = -1130.11
L18_1 = 17.33
L15_1 = L15_1(L16_1, L17_1, L18_1)
L14_1.seatend = L15_1
L10_1[1] = L11_1
L10_1[2] = L12_1
L10_1[3] = L13_1
L10_1[4] = L14_1
L9_1.players = L10_1
L8_1[3] = L9_1
L9_1 = {}
L9_1.object = "ind_prop_dlc_roller_car_02"
L9_1.handler = nil
L10_1 = vector3
L11_1 = -1648.4425048828
L12_1 = -1130.5402832031
L13_1 = 17.428344726563
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.coords = L10_1
L10_1 = vector3
L11_1 = -0.98019218444824
L12_1 = -2.5906699011102E-4
L13_1 = 140.0203704834
L10_1 = L10_1(L11_1, L12_1, L13_1)
L9_1.rotation = L10_1
L10_1 = {}
L11_1 = {}
L12_1 = vector3
L13_1 = -1649.26
L14_1 = -1129.44
L15_1 = 18.33
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.coords = L12_1
L11_1.seatid1 = 1
L11_1.seatid2 = 2
L12_1 = {}
L13_1 = vector3
L14_1 = -1649.83
L15_1 = -1130.31
L16_1 = 18.33
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.coords = L13_1
L12_1.seatid1 = 3
L12_1.seatid2 = 4
L10_1[1] = L11_1
L10_1[2] = L12_1
L9_1.platforms = L10_1
L10_1 = {}
L11_1 = {}
L11_1.taken = false
L11_1.takenplayerid = nil
L11_1.seattype = 1
L11_1.seatcategory = "one"
L11_1.seatcategoryoffset = -1.017
L12_1 = vector3
L13_1 = -0.2
L14_1 = -0.034
L15_1 = 0.914
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.seatoffsets = L12_1
L12_1 = vector3
L13_1 = -1646.63
L14_1 = -1131.22
L15_1 = 17.33
L12_1 = L12_1(L13_1, L14_1, L15_1)
L11_1.seatend = L12_1
L12_1 = {}
L12_1.taken = false
L12_1.takenplayerid = nil
L12_1.seattype = 1
L12_1.seatcategory = "two"
L12_1.seatcategoryoffset = -1.017
L13_1 = vector3
L14_1 = 0.284
L15_1 = -0.034
L16_1 = 0.914
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.seatoffsets = L13_1
L13_1 = vector3
L14_1 = -1646.63
L15_1 = -1131.22
L16_1 = 17.33
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.seatend = L13_1
L13_1 = {}
L13_1.taken = false
L13_1.takenplayerid = nil
L13_1.seattype = 1
L13_1.seatcategory = "one"
L13_1.seatcategoryoffset = 0.0
L14_1 = vector3
L15_1 = -0.184
L16_1 = 0.96
L17_1 = 0.914
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.seatoffsets = L14_1
L14_1 = vector3
L15_1 = -1647.39
L16_1 = -1132.05
L17_1 = 17.33
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.seatend = L14_1
L14_1 = {}
L14_1.taken = false
L14_1.takenplayerid = nil
L14_1.seattype = 1
L14_1.seatcategory = "two"
L14_1.seatcategoryoffset = 0.0
L15_1 = vector3
L16_1 = 0.284
L17_1 = 0.974
L18_1 = 0.914
L15_1 = L15_1(L16_1, L17_1, L18_1)
L14_1.seatoffsets = L15_1
L15_1 = vector3
L16_1 = -1647.39
L17_1 = -1132.05
L18_1 = 17.33
L15_1 = L15_1(L16_1, L17_1, L18_1)
L14_1.seatend = L15_1
L10_1[1] = L11_1
L10_1[2] = L12_1
L10_1[3] = L13_1
L10_1[4] = L14_1
L9_1.players = L10_1
L8_1[4] = L9_1
L7_1.carts = L8_1
rollercoasterhandler = L7_1
L7_1 = RegisterNetEvent
L8_1 = "rtx_themepark:Rollercoaster:SynchronizeStarted"
L7_1(L8_1)
L7_1 = AddEventHandler
L8_1 = "rtx_themepark:Rollercoaster:SynchronizeStarted"
function L9_1(A0_2)
  local L1_2
  L1_2 = rollercoasterhandler
  L1_2.started = A0_2
  if true == A0_2 then
    L1_2 = false
    L4_1 = L1_2
  end
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "rtx_themepark:Rollercoaster:SynchronizeSeat"
L7_1(L8_1)
L7_1 = AddEventHandler
L8_1 = "rtx_themepark:Rollercoaster:SynchronizeSeat"
function L9_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L5_2 = rollercoasterhandler
  L5_2 = L5_2.carts
  L5_2 = L5_2[A0_2]
  L6_2 = rollercoasterhandler
  L6_2 = L6_2.carts
  L6_2 = L6_2[A0_2]
  L6_2 = L6_2.players
  L6_2 = L6_2[A1_2]
  L6_2.taken = A2_2
  if false == A2_2 then
    if nil ~= A3_2 then
      L7_2 = GetPlayerFromServerId
      L8_2 = A3_2
      L7_2 = L7_2(L8_2)
      if -1 ~= L7_2 then
        L8_2 = GetPlayerPed
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        L9_2 = DoesEntityExist
        L10_2 = L8_2
        L9_2 = L9_2(L10_2)
        if L9_2 then
          L9_2 = DetachEntity
          L10_2 = L8_2
          L9_2(L10_2)
          L9_2 = ClearPedTasks
          L10_2 = L8_2
          L9_2(L10_2)
          L9_2 = FreezeEntityPosition
          L10_2 = L8_2
          L11_2 = false
          L9_2(L10_2, L11_2)
        end
      end
    end
  else
    L7_2 = GetPlayerFromServerId
    L8_2 = A3_2
    L7_2 = L7_2(L8_2)
    if -1 ~= L7_2 then
      L8_2 = GetPlayerPed
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      L9_2 = DoesEntityExist
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        L9_2 = FreezeEntityPosition
        L10_2 = L8_2
        L11_2 = true
        L9_2(L10_2, L11_2)
        L9_2 = NetworkAllowLocalEntityAttachment
        L10_2 = L8_2
        L11_2 = true
        L9_2(L10_2, L11_2)
        L9_2 = AttachEntityToEntity
        L10_2 = L8_2
        L11_2 = L5_2.handler
        L12_2 = 0
        L13_2 = L6_2.seatoffsets
        L13_2 = L13_2.x
        L14_2 = L6_2.seatoffsets
        L14_2 = L14_2.y
        L15_2 = L6_2.seatoffsets
        L15_2 = L15_2.z
        L16_2 = 0.0
        L17_2 = 0.0
        L18_2 = -180.0
        L19_2 = false
        L20_2 = false
        L21_2 = true
        L22_2 = false
        L23_2 = 2
        L24_2 = true
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
        L9_2 = "anim@mp_rollarcoaster"
        L10_2 = "safety_bar_grip_move_a_player_"
        L11_2 = L6_2.seatcategory
        L12_2 = ""
        L10_2 = L10_2 .. L11_2 .. L12_2
        if 2 == A4_2 then
          L11_2 = "hands_up_idle_a_player_"
          L12_2 = L6_2.seatcategory
          L13_2 = ""
          L11_2 = L11_2 .. L12_2 .. L13_2
          L10_2 = L11_2
        end
        while true do
          L11_2 = HasAnimDictLoaded
          L12_2 = L9_2
          L11_2 = L11_2(L12_2)
          if L11_2 then
            break
          end
          L11_2 = RequestAnimDict
          L12_2 = L9_2
          L11_2(L12_2)
          L11_2 = Citizen
          L11_2 = L11_2.Wait
          L12_2 = 5
          L11_2(L12_2)
        end
        L11_2 = TaskPlayAnim
        L12_2 = L8_2
        L13_2 = L9_2
        L14_2 = L10_2
        L15_2 = 8.0
        L16_2 = 8.0
        L17_2 = -1
        L18_2 = 1
        L19_2 = 0
        L20_2 = 0
        L21_2 = 0
        L22_2 = 0
        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      end
    end
  end
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "rtx_themepark:Rollercoaster:AttractionEnded"
L7_1(L8_1)
L7_1 = AddEventHandler
L8_1 = "rtx_themepark:Rollercoaster:AttractionEnded"
function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = 1
  L1_2 = rollercoasterpaths
  L2_2 = true
  L4_1 = L2_2
  L2_2 = DoesEntityExist
  L3_2 = rollercoasterhandler
  L3_2 = L3_2.carts
  L3_2 = L3_2[1]
  L3_2 = L3_2.handler
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = SetEntityCoordsNoOffset
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L3_2 = L3_2[1]
    L3_2 = L3_2.handler
    L4_2 = L1_2[L0_2]
    L4_2 = L4_2[1]
    L4_2 = L4_2.coords
    L4_2 = L4_2.x
    L5_2 = L1_2[L0_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2.coords
    L5_2 = L5_2.y
    L6_2 = L1_2[L0_2]
    L6_2 = L6_2[1]
    L6_2 = L6_2.coords
    L6_2 = L6_2.z
    L7_2 = true
    L8_2 = false
    L9_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L2_2 = SetEntityQuaternion
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L3_2 = L3_2[1]
    L3_2 = L3_2.handler
    L4_2 = L1_2[L0_2]
    L4_2 = L4_2[1]
    L4_2 = L4_2.r1objectscoords1x
    L5_2 = L1_2[L0_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2.r1objectscoords1y
    L6_2 = L1_2[L0_2]
    L6_2 = L6_2[1]
    L6_2 = L6_2.r1objectscoords1z
    L7_2 = L1_2[L0_2]
    L7_2 = L7_2[1]
    L7_2 = L7_2.r1objectscoords1w
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
  L2_2 = DoesEntityExist
  L3_2 = rollercoasterhandler
  L3_2 = L3_2.carts
  L3_2 = L3_2[2]
  L3_2 = L3_2.handler
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = SetEntityCoordsNoOffset
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L3_2 = L3_2[2]
    L3_2 = L3_2.handler
    L4_2 = L1_2[L0_2]
    L4_2 = L4_2[2]
    L4_2 = L4_2.coords
    L4_2 = L4_2.x
    L5_2 = L1_2[L0_2]
    L5_2 = L5_2[2]
    L5_2 = L5_2.coords
    L5_2 = L5_2.y
    L6_2 = L1_2[L0_2]
    L6_2 = L6_2[2]
    L6_2 = L6_2.coords
    L6_2 = L6_2.z
    L7_2 = true
    L8_2 = false
    L9_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L2_2 = SetEntityQuaternion
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L3_2 = L3_2[2]
    L3_2 = L3_2.handler
    L4_2 = L1_2[L0_2]
    L4_2 = L4_2[2]
    L4_2 = L4_2.r2objectscoords1x
    L5_2 = L1_2[L0_2]
    L5_2 = L5_2[2]
    L5_2 = L5_2.r2objectscoords1y
    L6_2 = L1_2[L0_2]
    L6_2 = L6_2[2]
    L6_2 = L6_2.r2objectscoords1z
    L7_2 = L1_2[L0_2]
    L7_2 = L7_2[2]
    L7_2 = L7_2.r2objectscoords1w
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
  L2_2 = DoesEntityExist
  L3_2 = rollercoasterhandler
  L3_2 = L3_2.carts
  L3_2 = L3_2[3]
  L3_2 = L3_2.handler
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = SetEntityCoordsNoOffset
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L3_2 = L3_2[3]
    L3_2 = L3_2.handler
    L4_2 = L1_2[L0_2]
    L4_2 = L4_2[3]
    L4_2 = L4_2.coords
    L4_2 = L4_2.x
    L5_2 = L1_2[L0_2]
    L5_2 = L5_2[3]
    L5_2 = L5_2.coords
    L5_2 = L5_2.y
    L6_2 = L1_2[L0_2]
    L6_2 = L6_2[3]
    L6_2 = L6_2.coords
    L6_2 = L6_2.z
    L7_2 = true
    L8_2 = false
    L9_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L2_2 = SetEntityQuaternion
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L3_2 = L3_2[3]
    L3_2 = L3_2.handler
    L4_2 = L1_2[L0_2]
    L4_2 = L4_2[3]
    L4_2 = L4_2.r3objectscoords1x
    L5_2 = L1_2[L0_2]
    L5_2 = L5_2[3]
    L5_2 = L5_2.r3objectscoords1y
    L6_2 = L1_2[L0_2]
    L6_2 = L6_2[3]
    L6_2 = L6_2.r3objectscoords1z
    L7_2 = L1_2[L0_2]
    L7_2 = L7_2[3]
    L7_2 = L7_2.r3objectscoords1w
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
  L2_2 = DoesEntityExist
  L3_2 = rollercoasterhandler
  L3_2 = L3_2.carts
  L3_2 = L3_2[4]
  L3_2 = L3_2.handler
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = SetEntityCoordsNoOffset
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L3_2 = L3_2[4]
    L3_2 = L3_2.handler
    L4_2 = L1_2[L0_2]
    L4_2 = L4_2[4]
    L4_2 = L4_2.coords
    L4_2 = L4_2.x
    L5_2 = L1_2[L0_2]
    L5_2 = L5_2[4]
    L5_2 = L5_2.coords
    L5_2 = L5_2.y
    L6_2 = L1_2[L0_2]
    L6_2 = L6_2[4]
    L6_2 = L6_2.coords
    L6_2 = L6_2.z
    L7_2 = true
    L8_2 = false
    L9_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L2_2 = SetEntityQuaternion
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L3_2 = L3_2[4]
    L3_2 = L3_2.handler
    L4_2 = L1_2[L0_2]
    L4_2 = L4_2[4]
    L4_2 = L4_2.r4objectscoords1x
    L5_2 = L1_2[L0_2]
    L5_2 = L5_2[4]
    L5_2 = L5_2.r4objectscoords1y
    L6_2 = L1_2[L0_2]
    L6_2 = L6_2[4]
    L6_2 = L6_2.r4objectscoords1z
    L7_2 = L1_2[L0_2]
    L7_2 = L7_2[4]
    L7_2 = L7_2.r4objectscoords1w
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
  L2_2 = Config
  L2_2 = L2_2.AttractionsSettings
  L2_2 = L2_2.rollercoaster
  L2_2 = L2_2.soundeffect
  if true == L2_2 then
    L2_2 = StopStream
    L2_2()
  end
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "rtx_themepark:Rollercoaster:StartAttraction"
L7_1(L8_1)
L7_1 = AddEventHandler
L8_1 = "rtx_themepark:Rollercoaster:StartAttraction"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = nearbythemepark
  if true == L2_2 then
    L2_2 = Config
    L2_2 = L2_2.AttractionsSettings
    L2_2 = L2_2.rollercoaster
    L2_2 = L2_2.soundeffect
    if true == L2_2 then
      L2_2 = L1_1
      if nil ~= L2_2 then
        L2_2 = L2_1
        if nil ~= L2_2 then
          L2_2 = LoadStreamWithStartOffset
          L3_2 = "Player_Ride"
          L4_2 = 0
          L5_2 = "DLC_IND_ROLLERCOASTER_SOUNDS"
          L2_2(L3_2, L4_2, L5_2)
          L2_2 = PlayStreamFromPed
          L3_2 = PlayerPedId
          L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L3_2()
          L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      end
      else
        L2_2 = LoadStreamWithStartOffset
        L3_2 = "Ambient_Ride"
        L4_2 = 0
        L5_2 = "DLC_IND_ROLLERCOASTER_SOUNDS"
        L2_2(L3_2, L4_2, L5_2)
        L2_2 = PlayStreamFromObject
        L3_2 = rollercoasterhandler
        L3_2 = L3_2.carts
        L3_2 = L3_2[1]
        L3_2 = L3_2.handler
        L2_2(L3_2)
      end
    end
    L2_2 = A1_2
    L3_2 = rollercoasterpaths
    L3_2 = #L3_2
    if L2_2 > L3_2 then
      L3_2 = rollercoasterpaths
      L2_2 = #L3_2
      L3_2 = Config
      L3_2 = L3_2.AttractionsSettings
      L3_2 = L3_2.rollercoaster
      L3_2 = L3_2.soundeffect
      if true == L3_2 then
        L3_2 = StopStream
        L3_2()
      end
    end
    rollercoastercalculateid = A0_2
    L3_2 = rollercoastercalculateid
    L4_2 = rollercoasterpaths
    L4_2 = #L4_2
    if L3_2 > L4_2 then
      L3_2 = rollercoasterpaths
      L3_2 = #L3_2
      rollercoastercalculateid = L3_2
    end
    L3_2 = rollercoasterpaths
    L4_2 = rollercoasterhandler
    L4_2.getnew = true
    L4_2 = rollercoasterhandler
    L5_2 = rollercoastercalculateid
    L4_2.stageid = L5_2
    L4_2 = SetEntityCoordsNoOffset
    L5_2 = rollercoasterhandler
    L5_2 = L5_2.carts
    L5_2 = L5_2[1]
    L5_2 = L5_2.handler
    L6_2 = rollercoasterhandler
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2[1]
    L6_2 = L6_2.coords
    L6_2 = L6_2.x
    L7_2 = rollercoasterhandler
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2[1]
    L7_2 = L7_2.coords
    L7_2 = L7_2.y
    L8_2 = rollercoasterhandler
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2[1]
    L8_2 = L8_2.coords
    L8_2 = L8_2.z
    L9_2 = true
    L10_2 = false
    L11_2 = false
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L4_2 = SetEntityQuaternion
    L5_2 = rollercoasterhandler
    L5_2 = L5_2.carts
    L5_2 = L5_2[1]
    L5_2 = L5_2.handler
    L6_2 = rollercoasterhandler
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2[1]
    L6_2 = L6_2.r1objectscoords1x
    L7_2 = rollercoasterhandler
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2[1]
    L7_2 = L7_2.r1objectscoords1y
    L8_2 = rollercoasterhandler
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2[1]
    L8_2 = L8_2.r1objectscoords1z
    L9_2 = rollercoasterhandler
    L9_2 = L9_2.stageid
    L9_2 = L3_2[L9_2]
    L9_2 = L9_2[1]
    L9_2 = L9_2.r1objectscoords1w
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = SetEntityCoordsNoOffset
    L5_2 = rollercoasterhandler
    L5_2 = L5_2.carts
    L5_2 = L5_2[2]
    L5_2 = L5_2.handler
    L6_2 = rollercoasterhandler
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2[2]
    L6_2 = L6_2.coords
    L6_2 = L6_2.x
    L7_2 = rollercoasterhandler
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2[2]
    L7_2 = L7_2.coords
    L7_2 = L7_2.y
    L8_2 = rollercoasterhandler
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2[2]
    L8_2 = L8_2.coords
    L8_2 = L8_2.z
    L9_2 = true
    L10_2 = false
    L11_2 = false
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L4_2 = SetEntityQuaternion
    L5_2 = rollercoasterhandler
    L5_2 = L5_2.carts
    L5_2 = L5_2[2]
    L5_2 = L5_2.handler
    L6_2 = rollercoasterhandler
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2[2]
    L6_2 = L6_2.r2objectscoords1x
    L7_2 = rollercoasterhandler
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2[2]
    L7_2 = L7_2.r2objectscoords1y
    L8_2 = rollercoasterhandler
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2[2]
    L8_2 = L8_2.r2objectscoords1z
    L9_2 = rollercoasterhandler
    L9_2 = L9_2.stageid
    L9_2 = L3_2[L9_2]
    L9_2 = L9_2[2]
    L9_2 = L9_2.r2objectscoords1w
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = SetEntityCoordsNoOffset
    L5_2 = rollercoasterhandler
    L5_2 = L5_2.carts
    L5_2 = L5_2[3]
    L5_2 = L5_2.handler
    L6_2 = rollercoasterhandler
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2[3]
    L6_2 = L6_2.coords
    L6_2 = L6_2.x
    L7_2 = rollercoasterhandler
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2[3]
    L7_2 = L7_2.coords
    L7_2 = L7_2.y
    L8_2 = rollercoasterhandler
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2[3]
    L8_2 = L8_2.coords
    L8_2 = L8_2.z
    L9_2 = true
    L10_2 = false
    L11_2 = false
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L4_2 = SetEntityQuaternion
    L5_2 = rollercoasterhandler
    L5_2 = L5_2.carts
    L5_2 = L5_2[3]
    L5_2 = L5_2.handler
    L6_2 = rollercoasterhandler
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2[3]
    L6_2 = L6_2.r3objectscoords1x
    L7_2 = rollercoasterhandler
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2[3]
    L7_2 = L7_2.r3objectscoords1y
    L8_2 = rollercoasterhandler
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2[3]
    L8_2 = L8_2.r3objectscoords1z
    L9_2 = rollercoasterhandler
    L9_2 = L9_2.stageid
    L9_2 = L3_2[L9_2]
    L9_2 = L9_2[3]
    L9_2 = L9_2.r3objectscoords1w
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = SetEntityCoordsNoOffset
    L5_2 = rollercoasterhandler
    L5_2 = L5_2.carts
    L5_2 = L5_2[4]
    L5_2 = L5_2.handler
    L6_2 = rollercoasterhandler
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2[4]
    L6_2 = L6_2.coords
    L6_2 = L6_2.x
    L7_2 = rollercoasterhandler
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2[4]
    L7_2 = L7_2.coords
    L7_2 = L7_2.y
    L8_2 = rollercoasterhandler
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2[4]
    L8_2 = L8_2.coords
    L8_2 = L8_2.z
    L9_2 = true
    L10_2 = false
    L11_2 = false
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L4_2 = SetEntityQuaternion
    L5_2 = rollercoasterhandler
    L5_2 = L5_2.carts
    L5_2 = L5_2[4]
    L5_2 = L5_2.handler
    L6_2 = rollercoasterhandler
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2[4]
    L6_2 = L6_2.r4objectscoords1x
    L7_2 = rollercoasterhandler
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2[4]
    L7_2 = L7_2.r4objectscoords1y
    L8_2 = rollercoasterhandler
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2[4]
    L8_2 = L8_2.r4objectscoords1z
    L9_2 = rollercoasterhandler
    L9_2 = L9_2.stageid
    L9_2 = L3_2[L9_2]
    L9_2 = L9_2[4]
    L9_2 = L9_2.r4objectscoords1w
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = Citizen
    L4_2 = L4_2.Wait
    L5_2 = 1
    L4_2(L5_2)
    L4_2 = rollercoasterhandler
    L4_2.getnew = false
    L4_2 = rollercoasterpaths
    L4_2 = #L4_2
    L5_2 = 1
    L6_2 = currentfps
    if L6_2 < 80 then
      L5_2 = 0
    else
      L5_2 = 1
    end
    while true do
      L6_2 = rollercoasterhandler
      L6_2 = L6_2.getnew
      if false ~= L6_2 then
        break
      end
      L6_2 = nearbythemepark
      if true ~= L6_2 then
        break
      end
      L6_2 = L4_1
      if false ~= L6_2 then
        break
      end
      L6_2 = Citizen
      L6_2 = L6_2.Wait
      L7_2 = L5_2
      L6_2(L7_2)
      L6_2 = rollercoasterhandler
      L6_2 = L6_2.stageid
      L6_2 = L3_2[L6_2]
      L6_2 = L6_2[1]
      L6_2 = L6_2.coords
      L7_2 = L3_2[L2_2]
      L7_2 = L7_2[1]
      L7_2 = L7_2.coords
      L6_2 = L6_2 - L7_2
      L6_2 = #L6_2
      if L6_2 > 0.0 then
        L7_2 = rollercoasterhandler
        L8_2 = rollercoasterhandler
        L8_2 = L8_2.stageid
        L8_2 = L8_2 + 1
        L7_2.stageid = L8_2
        L7_2 = rollercoasterhandler
        L7_2 = L7_2.getnew
        if false == L7_2 then
          L7_2 = rollercoasterhandler
          L7_2 = L7_2.stageid
          if L7_2 == L4_2 then
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[1]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[1]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[1]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[1]
            L11_2 = L11_2.coords
            L11_2 = L11_2.z
            L12_2 = true
            L13_2 = false
            L14_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L7_2 = SetEntityQuaternion
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[1]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[1]
            L9_2 = L9_2.r1objectscoords1x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[1]
            L10_2 = L10_2.r1objectscoords1y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[1]
            L11_2 = L11_2.r1objectscoords1z
            L12_2 = rollercoasterhandler
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2[1]
            L12_2 = L12_2.r1objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[2]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[2]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[2]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[2]
            L11_2 = L11_2.coords
            L11_2 = L11_2.z
            L12_2 = true
            L13_2 = false
            L14_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L7_2 = SetEntityQuaternion
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[2]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[2]
            L9_2 = L9_2.r2objectscoords1x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[2]
            L10_2 = L10_2.r2objectscoords1y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[2]
            L11_2 = L11_2.r2objectscoords1z
            L12_2 = rollercoasterhandler
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2[2]
            L12_2 = L12_2.r2objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[3]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[3]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[3]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[3]
            L11_2 = L11_2.coords
            L11_2 = L11_2.z
            L12_2 = true
            L13_2 = false
            L14_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L7_2 = SetEntityQuaternion
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[3]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[3]
            L9_2 = L9_2.r3objectscoords1x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[3]
            L10_2 = L10_2.r3objectscoords1y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[3]
            L11_2 = L11_2.r3objectscoords1z
            L12_2 = rollercoasterhandler
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2[3]
            L12_2 = L12_2.r3objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[4]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[4]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[4]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[4]
            L11_2 = L11_2.coords
            L11_2 = L11_2.z
            L12_2 = true
            L13_2 = false
            L14_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L7_2 = SetEntityQuaternion
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[4]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[4]
            L9_2 = L9_2.r4objectscoords1x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[4]
            L10_2 = L10_2.r4objectscoords1y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[4]
            L11_2 = L11_2.r4objectscoords1z
            L12_2 = rollercoasterhandler
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2[4]
            L12_2 = L12_2.r4objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
            L7_2 = rollercoasterhandler
            L7_2.getnew = true
          else
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[1]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[1]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[1]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[1]
            L11_2 = L11_2.coords
            L11_2 = L11_2.z
            L12_2 = true
            L13_2 = false
            L14_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L7_2 = SetEntityQuaternion
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[1]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[1]
            L9_2 = L9_2.r1objectscoords1x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[1]
            L10_2 = L10_2.r1objectscoords1y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[1]
            L11_2 = L11_2.r1objectscoords1z
            L12_2 = rollercoasterhandler
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2[1]
            L12_2 = L12_2.r1objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[2]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[2]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[2]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[2]
            L11_2 = L11_2.coords
            L11_2 = L11_2.z
            L12_2 = true
            L13_2 = false
            L14_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L7_2 = SetEntityQuaternion
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[2]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[2]
            L9_2 = L9_2.r2objectscoords1x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[2]
            L10_2 = L10_2.r2objectscoords1y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[2]
            L11_2 = L11_2.r2objectscoords1z
            L12_2 = rollercoasterhandler
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2[2]
            L12_2 = L12_2.r2objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[3]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[3]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[3]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[3]
            L11_2 = L11_2.coords
            L11_2 = L11_2.z
            L12_2 = true
            L13_2 = false
            L14_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L7_2 = SetEntityQuaternion
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[3]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[3]
            L9_2 = L9_2.r3objectscoords1x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[3]
            L10_2 = L10_2.r3objectscoords1y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[3]
            L11_2 = L11_2.r3objectscoords1z
            L12_2 = rollercoasterhandler
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2[3]
            L12_2 = L12_2.r3objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[4]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[4]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[4]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[4]
            L11_2 = L11_2.coords
            L11_2 = L11_2.z
            L12_2 = true
            L13_2 = false
            L14_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L7_2 = SetEntityQuaternion
            L8_2 = rollercoasterhandler
            L8_2 = L8_2.carts
            L8_2 = L8_2[4]
            L8_2 = L8_2.handler
            L9_2 = rollercoasterhandler
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2[4]
            L9_2 = L9_2.r4objectscoords1x
            L10_2 = rollercoasterhandler
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2[4]
            L10_2 = L10_2.r4objectscoords1y
            L11_2 = rollercoasterhandler
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2[4]
            L11_2 = L11_2.r4objectscoords1z
            L12_2 = rollercoasterhandler
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2[4]
            L12_2 = L12_2.r4objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
          end
        end
      else
        L7_2 = Config
        L7_2 = L7_2.AttractionsSettings
        L7_2 = L7_2.rollercoaster
        L7_2 = L7_2.speedmodifier
        L7_2 = 8 * L7_2
        A1_2 = A1_2 + L7_2
      end
    end
  else
    L2_2 = rollercoasterhandler
    L2_2.getnew = true
  end
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "rtx_themepark:Rollercoaster:SeatData"
L7_1(L8_1)
L7_1 = AddEventHandler
L8_1 = "rtx_themepark:Rollercoaster:SeatData"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.message = "attractionhow"
  L3_2.attractionanimchange = true
  L2_2(L3_2)
  L1_1 = A0_2
  L2_1 = A1_2
  L2_2 = true
  L5_1 = L2_2
  L2_2 = Config
  L2_2 = L2_2.ThemeParkFallSettings
  L2_2 = L2_2.fallchancecheck
  L6_1 = L2_2
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "rtx_themepark:Rollercoaster:SeatExit"
L7_1(L8_1)
L7_1 = AddEventHandler
L8_1 = "rtx_themepark:Rollercoaster:SeatExit"
function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = rollercoasterhandler
  L0_2 = L0_2.carts
  L1_2 = L1_1
  L0_2 = L0_2[L1_2]
  L1_2 = rollercoasterhandler
  L1_2 = L1_2.carts
  L2_2 = L1_1
  L1_2 = L1_2[L2_2]
  L1_2 = L1_2.players
  L2_2 = L2_1
  L1_2 = L1_2[L2_2]
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = DetachEntity
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = SetEntityCoordsNoOffset
  L4_2 = L2_2
  L5_2 = L1_2.seatend
  L5_2 = L5_2.x
  L6_2 = L1_2.seatend
  L6_2 = L6_2.y
  L7_2 = L1_2.seatend
  L7_2 = L7_2.z
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = SetEntityHeading
  L4_2 = L2_2
  L5_2 = 315.0
  L3_2(L4_2, L5_2)
  L3_2 = FreezeEntityPosition
  L4_2 = L2_2
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = ClearPedTasks
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.message = "hideattraction"
  L3_2(L4_2)
  L3_2 = nil
  L1_1 = L3_2
  L3_2 = nil
  L2_1 = L3_2
  L3_2 = Config
  L3_2 = L3_2.AttractionsSettings
  L3_2 = L3_2.rollercoaster
  L3_2 = L3_2.soundeffect
  if true == L3_2 then
    L3_2 = StopStream
    L3_2()
  end
  L3_2 = false
  L5_1 = L3_2
end
L7_1(L8_1, L9_1)
L7_1 = Config
L7_1 = L7_1.ThemeParkAttractionFallChance
if L7_1 then
  L7_1 = Config
  L7_1 = L7_1.ThemeParkFallSettings
  L7_1 = L7_1.attractions
  L7_1 = L7_1.rollercoaster
  if L7_1 then
    L7_1 = RegisterNetEvent
    L8_1 = "rtx_themepark:Rollercoaster:SeatThrowClient"
    L7_1(L8_1)
    L7_1 = AddEventHandler
    L8_1 = "rtx_themepark:Rollercoaster:SeatThrowClient"
    function L9_1()
      local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
      L0_2 = L1_1
      if nil ~= L0_2 then
        L0_2 = L2_1
        if nil ~= L0_2 then
          L0_2 = PlayerPedId
          L0_2 = L0_2()
          L1_2 = DetachEntity
          L2_2 = L0_2
          L1_2(L2_2)
          L1_2 = FreezeEntityPosition
          L2_2 = L0_2
          L3_2 = false
          L1_2(L2_2, L3_2)
          L1_2 = ClearPedTasks
          L2_2 = L0_2
          L1_2(L2_2)
          L1_2 = SendNUIMessage
          L2_2 = {}
          L2_2.message = "hideattraction"
          L1_2(L2_2)
          L1_2 = nil
          L1_1 = L1_2
          L1_2 = nil
          L2_1 = L1_2
          usingattraction = false
          L1_2 = GetEntityForwardVector
          L2_2 = L0_2
          L1_2 = L1_2(L2_2)
          L2_2 = math
          L2_2 = L2_2.random
          L2_2 = L2_2()
          L3_2 = 5.0
          L3_2 = L3_2 - 5.0
          L2_2 = L2_2 * L3_2
          L2_2 = 5.0 + L2_2
          L3_2 = SetPedToRagdoll
          L4_2 = L0_2
          L5_2 = 2000
          L6_2 = 2000
          L7_2 = false
          L8_2 = false
          L9_2 = false
          L10_2 = false
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
          L3_2 = ApplyForceToEntity
          L4_2 = L0_2
          L5_2 = 1
          L6_2 = L1_2.x
          L6_2 = L6_2 * L2_2
          L7_2 = L1_2.y
          L7_2 = L7_2 * L2_2
          L8_2 = L1_2.z
          L8_2 = L8_2 + 5.0
          L9_2 = 0
          L10_2 = 0
          L11_2 = 0
          L12_2 = 0
          L13_2 = false
          L14_2 = true
          L15_2 = true
          L16_2 = false
          L17_2 = true
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
          L3_2 = Config
          L3_2 = L3_2.AttractionsSettings
          L3_2 = L3_2.rollercoaster
          L3_2 = L3_2.soundeffect
          if true == L3_2 then
            L3_2 = StopStream
            L3_2()
          end
          L3_2 = Notify
          L4_2 = Language
          L5_2 = Config
          L5_2 = L5_2.Language
          L4_2 = L4_2[L5_2]
          L4_2 = L4_2.themeparkfall
          L3_2(L4_2)
        end
      end
    end
    L7_1(L8_1, L9_1)
  end
end
L7_1 = Config
L7_1 = L7_1.Target
if true == L7_1 then
  L7_1 = RegisterNetEvent
  L8_1 = "rtx_themepark:Rollercoaster:SeatTarget"
  L7_1(L8_1)
  L7_1 = AddEventHandler
  L8_1 = "rtx_themepark:Rollercoaster:SeatTarget"
  function L9_1()
    local L0_2, L1_2, L2_2, L3_2
    L0_2 = rollercoasterhandler
    L0_2 = L0_2.started
    if false == L0_2 then
      L0_2 = usingattraction
      if false == L0_2 then
        L0_2 = L0_1.cartid
        if nil ~= L0_2 then
          L0_2 = L0_1.seatid
          if nil ~= L0_2 then
            L0_2 = iteminhand
            if false == L0_2 then
              L0_2 = TriggerServerEvent
              L1_2 = "rtx_themepark:Rollercoaster:SeatUse"
              L2_2 = L0_1.cartid
              L3_2 = L0_1.seatid
              L0_2(L1_2, L2_2, L3_2)
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
  end
  L7_1(L8_1, L9_1)
end
L7_1 = Citizen
L7_1 = L7_1.CreateThread
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1000
    L0_2(L1_2)
    L0_2 = nearbythemepark
    if true == L0_2 then
      L0_2 = ipairs
      L1_2 = rollercoasterhandler
      L1_2 = L1_2.carts
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
          L6_2 = L5_2.object
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
        end
      end
    end
  end
end
L7_1(L8_1)
L7_1 = -1
L8_1 = Citizen
L8_1 = L8_1.CreateThread
function L9_1()
  local L0_2, L1_2, L2_2, L3_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 0
    L0_2(L1_2)
    L0_2 = GlobalState
    L0_2 = L0_2["attraction8-phase"]
    if 0 ~= L0_2 then
      L0_2 = nearbythemepark
      if false ~= L0_2 then
        goto lbl_21
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
    L0_2 = rollercoasterhandler
    L0_2.getnew = true
    L0_2 = -1
    L7_1 = L0_2
    goto lbl_41
    ::lbl_21::
    L0_2 = L7_1
    if -1 ~= L0_2 then
      L0_2 = L7_1
      L1_2 = GlobalState
      L1_2 = L1_2["attraction8-synchdata"]
      if not (L0_2 < L1_2) then
        goto lbl_41
      end
    end
    L0_2 = tonumber
    L1_2 = GlobalState
    L1_2 = L1_2["attraction8-synchdata"]
    L0_2 = L0_2(L1_2)
    L7_1 = L0_2
    L0_2 = TriggerEvent
    L1_2 = "rtx_themepark:Rollercoaster:StartAttraction"
    L2_2 = GlobalState
    L2_2 = L2_2["attraction8-ridedata1"]
    L3_2 = GlobalState
    L3_2 = L3_2["attraction8-ridedata2"]
    L0_2(L1_2, L2_2, L3_2)
    ::lbl_41::
  end
end
L8_1(L9_1)
L8_1 = Config
L8_1 = L8_1.AttractionsSettings
L8_1 = L8_1.rollercoaster
L8_1 = L8_1.disable
if false == L8_1 then
  L8_1 = Citizen
  L8_1 = L8_1.CreateThread
  function L9_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = true
      L1_2 = false
      L2_2 = -1
      L3_2 = {}
      L3_2.cartid = nil
      L3_2.seatid = nil
      L3_2.platformid = nil
      L4_2 = nearbythemepark
      if true == L4_2 then
        L4_2 = tickets
        L4_2 = L4_2.rollercoaster
        if true == L4_2 then
          L4_2 = rollercoasterhandler
          L4_2 = L4_2.started
          if false == L4_2 then
            L4_2 = ipairs
            L5_2 = rollercoasterhandler
            L5_2 = L5_2.carts
            L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
            for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
              L10_2 = ipairs
              L11_2 = L9_2.platforms
              L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
              for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
                L16_2 = L9_2.players
                L17_2 = L15_2.seatid1
                L16_2 = L16_2[L17_2]
                L17_2 = L16_2.taken
                if false == L17_2 then
                  L17_2 = playercurrentcoords
                  L18_2 = L15_2.coords
                  L17_2 = L17_2 - L18_2
                  L17_2 = #L17_2
                  if L17_2 < 20.0 then
                    L18_2 = Config
                    L18_2 = L18_2.AttractionsSettings
                    L18_2 = L18_2.rollercoaster
                    L18_2 = L18_2.usedistance
                    if L17_2 < L18_2 and (-1 == L2_2 or L2_2 > L17_2) then
                      L2_2 = L17_2
                      L1_2 = true
                      L3_2.cartid = L8_2
                      L18_2 = L15_2.seatid1
                      L3_2.seatid = L18_2
                      L3_2.platformid = L14_2
                    end
                  end
                end
                L17_2 = L9_2.players
                L18_2 = L15_2.seatid2
                L17_2 = L17_2[L18_2]
                L18_2 = L17_2.taken
                if false == L18_2 then
                  L18_2 = playercurrentcoords
                  L19_2 = L15_2.coords
                  L18_2 = L18_2 - L19_2
                  L18_2 = #L18_2
                  if L18_2 < 20.0 then
                    L19_2 = Config
                    L19_2 = L19_2.AttractionsSettings
                    L19_2 = L19_2.rollercoaster
                    L19_2 = L19_2.usedistance
                    if L18_2 < L19_2 and (-1 == L2_2 or L2_2 > L18_2) then
                      L2_2 = L18_2
                      L1_2 = true
                      L3_2.cartid = L8_2
                      L19_2 = L15_2.seatid2
                      L3_2.seatid = L19_2
                      L3_2.platformid = L14_2
                    end
                  end
                end
              end
            end
          end
        end
        if L1_2 then
          L4_2 = {}
          L5_2 = L3_2.cartid
          L4_2.cartid = L5_2
          L5_2 = L3_2.seatid
          L4_2.seatid = L5_2
          L5_2 = L3_2.platformid
          L4_2.platformid = L5_2
          L0_1 = L4_2
          L4_2 = usingattraction
          if false == L4_2 then
            L0_2 = false
            L4_2 = Config
            L4_2 = L4_2.Target
            if false == L4_2 then
              L4_2 = rollercoasterhandler
              L4_2 = L4_2.carts
              L5_2 = L0_1.cartid
              L4_2 = L4_2[L5_2]
              L4_2 = L4_2.platforms
              L5_2 = L0_1.platformid
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
                L7_2 = L7_2.pressforuseseatinteract
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
                  L9_2 = Language
                  L10_2 = Config
                  L10_2 = L10_2.Language
                  L9_2 = L9_2[L10_2]
                  L9_2 = L9_2.pressforuseseat
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
                    L6_2 = L6_2.pressforuseseatinteractclassic
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
            L4_2 = L0_1.cartid
            if nil ~= L4_2 then
              L4_2 = SendNUIMessage
              L5_2 = {}
              L5_2.message = "hide"
              L4_2(L5_2)
            end
          end
          L4_2 = {}
          L4_2.cartid = nil
          L4_2.seatid = nil
          L4_2.platformid = nil
          L0_1 = L4_2
        end
      end
      if L0_2 then
        L4_2 = Citizen
        L4_2 = L4_2.Wait
        L5_2 = 1000
        L4_2(L5_2)
      end
    end
  end
  L8_1(L9_1)
end
L8_1 = Config
L8_1 = L8_1.ThemeParkAttractionFallChance
if L8_1 then
  L8_1 = Config
  L8_1 = L8_1.ThemeParkFallSettings
  L8_1 = L8_1.attractions
  L8_1 = L8_1.rollercoaster
  if L8_1 then
    L8_1 = Citizen
    L8_1 = L8_1.CreateThread
    function L9_1()
      local L0_2, L1_2, L2_2, L3_2, L4_2
      while true do
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 0
        L0_2(L1_2)
        L0_2 = nearbythemepark
        if true == L0_2 then
          L0_2 = L1_1
          if nil ~= L0_2 then
            L0_2 = L2_1
            if nil ~= L0_2 then
              L0_2 = L5_1
              if true == L0_2 then
                L0_2 = rollercoasterhandler
                L0_2 = L0_2.started
                if true == L0_2 then
                  L0_2 = L6_1
                  if L0_2 > 0 then
                    L0_2 = L6_1
                    L0_2 = L0_2 - 1
                    L6_1 = L0_2
                    L0_2 = Citizen
                    L0_2 = L0_2.Wait
                    L1_2 = 1000
                    L0_2(L1_2)
                  else
                    L0_2 = Citizen
                    L0_2 = L0_2.Wait
                    L1_2 = 1000
                    L0_2(L1_2)
                    L0_2 = math
                    L0_2 = L0_2.random
                    L1_2 = 1000
                    L0_2 = L0_2(L1_2)
                    L1_2 = Config
                    L1_2 = L1_2.ThemeParkFallSettings
                    L1_2 = L1_2.fallchance
                    if L0_2 <= L1_2 then
                      L1_2 = false
                      L5_1 = L1_2
                      L1_2 = usingattraction
                      if true == L1_2 then
                        L1_2 = L1_1
                        if nil ~= L1_2 then
                          L1_2 = L2_1
                          if nil ~= L1_2 then
                            L1_2 = TriggerServerEvent
                            L2_2 = "rtx_themepark:Rollercoaster:ThrowAttraction"
                            L3_2 = L1_1
                            L4_2 = L2_1
                            L1_2(L2_2, L3_2, L4_2)
                          end
                        end
                      end
                    else
                      L1_2 = Config
                      L1_2 = L1_2.ThemeParkFallSettings
                      L1_2 = L1_2.fallchancecheck
                      L6_1 = L1_2
                    end
                  end
              end
            end
          end
          else
            L0_2 = Citizen
            L0_2 = L0_2.Wait
            L1_2 = 1500
            L0_2(L1_2)
          end
        else
          L0_2 = Citizen
          L0_2 = L0_2.Wait
          L1_2 = 1500
          L0_2(L1_2)
        end
      end
    end
    L8_1(L9_1)
  end
end
L8_1 = Config
L8_1 = L8_1.Target
if false == L8_1 then
  L8_1 = RegisterCommand
  L9_1 = "userollercoasterseat"
  function L10_1()
    local L0_2, L1_2, L2_2, L3_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = L0_1.cartid
      if nil ~= L0_2 then
        L0_2 = L0_1.seatid
        if nil ~= L0_2 then
          L0_2 = iteminhand
          if false == L0_2 then
            L0_2 = TriggerServerEvent
            L1_2 = "rtx_themepark:Rollercoaster:SeatUse"
            L2_2 = L0_1.cartid
            L3_2 = L0_1.seatid
            L0_2(L1_2, L2_2, L3_2)
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
  L8_1(L9_1, L10_1)
  L8_1 = RegisterKeyMapping
  L9_1 = "userollercoasterseat"
  L10_1 = Language
  L11_1 = Config
  L11_1 = L11_1.Language
  L10_1 = L10_1[L11_1]
  L10_1 = L10_1.bindrollercoasterseatuse
  L11_1 = "keyboard"
  L12_1 = Config
  L12_1 = L12_1.ThemeParkSeatKey
  L8_1(L9_1, L10_1, L11_1, L12_1)
end
L8_1 = RegisterCommand
L9_1 = "changerollercoasteranim"
function L10_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = usingattraction
  if true == L0_2 then
    L0_2 = L1_1
    if nil ~= L0_2 then
      L0_2 = L2_1
      if nil ~= L0_2 then
        L0_2 = L3_1
        if false == L0_2 then
          L0_2 = true
          L3_1 = L0_2
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:Rollercoaster:SeatAnimChange"
          L2_2 = L1_1
          L3_2 = L2_1
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = Citizen
          L0_2 = L0_2.Wait
          L1_2 = Config
          L1_2 = L1_2.AttractionsSettings
          L1_2 = L1_2.rollercoaster
          L1_2 = L1_2.animcooldown
          L0_2(L1_2)
          L0_2 = false
          L3_1 = L0_2
        end
      end
    end
  end
end
L8_1(L9_1, L10_1)
L8_1 = RegisterKeyMapping
L9_1 = "changerollercoasteranim"
L10_1 = Language
L11_1 = Config
L11_1 = L11_1.Language
L10_1 = L10_1[L11_1]
L10_1 = L10_1.bindrollercoasteranimchange
L11_1 = "keyboard"
L12_1 = Config
L12_1 = L12_1.ThemeParkAnimChangeKey
L8_1(L9_1, L10_1, L11_1, L12_1)
L8_1 = RegisterCommand
L9_1 = "exitrollercoaster"
function L10_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = usingattraction
  if true == L0_2 then
    L0_2 = L1_1
    if nil ~= L0_2 then
      L0_2 = L2_1
      if nil ~= L0_2 then
        L0_2 = Config
        L0_2 = L0_2.ThemeParkDisableExit
        if false ~= L0_2 then
          L0_2 = rollercoasterhandler
          L0_2 = L0_2.started
          if false ~= L0_2 then
            goto lbl_24
          end
        end
        L0_2 = TriggerServerEvent
        L1_2 = "rtx_themepark:Rollercoaster:ExitAttraction"
        L2_2 = L1_1
        L3_2 = L2_1
        L0_2(L1_2, L2_2, L3_2)
        goto lbl_31
        ::lbl_24::
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
  ::lbl_31::
end
L8_1(L9_1, L10_1)
L8_1 = RegisterKeyMapping
L9_1 = "exitrollercoaster"
L10_1 = Language
L11_1 = Config
L11_1 = L11_1.Language
L10_1 = L10_1[L11_1]
L10_1 = L10_1.bindattractionexitkey
L11_1 = "keyboard"
L12_1 = Config
L12_1 = L12_1.ThemeParkExitKey
L8_1(L9_1, L10_1, L11_1, L12_1)
