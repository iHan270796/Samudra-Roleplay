local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = IsDuplicityVersion
L0_1 = L0_1()
if L0_1 then
  L0_1 = GetPlayerPositionInRealTime85
  L0_1()
end
L0_1 = {}
L0_1.seatid = nil
L1_1 = nil
L2_1 = false
L3_1 = nil
L4_1 = nil
L5_1 = false
L6_1 = nil
L7_1 = nil
L8_1 = false
L9_1 = {}
L9_1.started = false
L9_1.stageid = 0
L9_1.soundid = nil
L9_1.getnew = false
L10_1 = {}
L11_1 = {}
L11_1.taken = false
L11_1.takenplayerid = nil
L11_1.seattype = 1
L11_1.seatcategory = "one"
L12_1 = {}
L13_1 = vec3
L14_1 = -0.28
L15_1 = -0.213
L16_1 = 0.905
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.coords = L13_1
L13_1 = vec3
L14_1 = 0.0
L15_1 = 0.0
L16_1 = 0.0
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.rotation = L13_1
L11_1.offsets = L12_1
L10_1[1] = L11_1
L11_1 = {}
L11_1.taken = false
L11_1.takenplayerid = nil
L11_1.seattype = 1
L11_1.seatcategory = "two"
L12_1 = {}
L13_1 = vec3
L14_1 = 0.28
L15_1 = -0.213
L16_1 = 0.905
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.coords = L13_1
L13_1 = vec3
L14_1 = 0.0
L15_1 = 0.0
L16_1 = 0.0
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.rotation = L13_1
L11_1.offsets = L12_1
L10_1[2] = L11_1
L11_1 = {}
L11_1.taken = false
L11_1.takenplayerid = nil
L11_1.seattype = 1
L11_1.seatcategory = "one"
L12_1 = {}
L13_1 = vec3
L14_1 = -0.28
L15_1 = -1.228
L16_1 = 0.905
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.coords = L13_1
L13_1 = vec3
L14_1 = 0.0
L15_1 = 0.0
L16_1 = 0.0
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.rotation = L13_1
L11_1.offsets = L12_1
L10_1[3] = L11_1
L11_1 = {}
L11_1.taken = false
L11_1.takenplayerid = nil
L11_1.seattype = 1
L11_1.seatcategory = "two"
L12_1 = {}
L13_1 = vec3
L14_1 = 0.28
L15_1 = -1.228
L16_1 = 0.905
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.coords = L13_1
L13_1 = vec3
L14_1 = 0.0
L15_1 = 0.0
L16_1 = 0.0
L13_1 = L13_1(L14_1, L15_1, L16_1)
L12_1.rotation = L13_1
L11_1.offsets = L12_1
L10_1[4] = L11_1
L9_1.seats = L10_1
rollercoasterhandler2 = L9_1
L9_1 = RegisterNetEvent
L10_1 = "rtx_themepark:Rollercoaster2:SynchronizeStarted"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "rtx_themepark:Rollercoaster2:SynchronizeStarted"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = rollercoasterhandler2
  L1_2.started = A0_2
  if true == A0_2 then
    L1_2 = false
    L2_1 = L1_2
    L1_2 = Config
    L1_2 = L1_2.AttractionsSettings
    L1_2 = L1_2.rollercoaster2
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
      L1_2 = rollercoasterhandler2
      L2_2 = GetSoundId
      L2_2 = L2_2()
      L1_2.soundid = L2_2
      L1_2 = PlaySoundFromEntity
      L2_2 = rollercoasterhandler2
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
    L1_2 = L1_2.rollercoaster2
    L1_2 = L1_2.sound
    if true == L1_2 then
      L1_2 = StopSound
      L2_2 = rollercoasterhandler2
      L2_2 = L2_2.soundid
      L1_2(L2_2)
    end
  end
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "rtx_themepark:Rollercoaster2:SynchronizeSeat"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "rtx_themepark:Rollercoaster2:SynchronizeSeat"
function L11_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L4_2 = rollercoasterhandler2
  L4_2 = L4_2.seats
  L4_2 = L4_2[A0_2]
  L4_2.taken = A1_2
  if false == A1_2 then
    if nil ~= A2_2 then
      L5_2 = GetPlayerFromServerId
      L6_2 = A2_2
      L5_2 = L5_2(L6_2)
      if -1 ~= L5_2 then
        L6_2 = GetPlayerPed
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        L7_2 = DoesEntityExist
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L7_2 = DetachEntity
          L8_2 = L6_2
          L7_2(L8_2)
          L7_2 = ClearPedTasks
          L8_2 = L6_2
          L7_2(L8_2)
          L7_2 = FreezeEntityPosition
          L8_2 = L6_2
          L9_2 = false
          L7_2(L8_2, L9_2)
        end
      end
    end
  else
    L5_2 = GetPlayerFromServerId
    L6_2 = A2_2
    L5_2 = L5_2(L6_2)
    if -1 ~= L5_2 then
      L6_2 = GetPlayerPed
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      L7_2 = print
      L8_2 = L4_2.offsets
      L8_2 = L8_2.coords
      L8_2 = L8_2.x
      L9_2 = L4_2.offsets
      L9_2 = L9_2.coords
      L9_2 = L9_2.y
      L10_2 = L4_2.offsets
      L10_2 = L10_2.coords
      L10_2 = L10_2.z
      L7_2(L8_2, L9_2, L10_2)
      L7_2 = DoesEntityExist
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L7_2 = FreezeEntityPosition
        L8_2 = L6_2
        L9_2 = true
        L7_2(L8_2, L9_2)
        L7_2 = NetworkAllowLocalEntityAttachment
        L8_2 = L6_2
        L9_2 = true
        L7_2(L8_2, L9_2)
        L7_2 = AttachEntityToEntity
        L8_2 = L6_2
        L9_2 = L3_1
        L10_2 = 0
        L11_2 = L4_2.offsets
        L11_2 = L11_2.coords
        L11_2 = L11_2.x
        L12_2 = L4_2.offsets
        L12_2 = L12_2.coords
        L12_2 = L12_2.y
        L13_2 = L4_2.offsets
        L13_2 = L13_2.coords
        L13_2 = L13_2.z
        L14_2 = L4_2.offsets
        L14_2 = L14_2.rotation
        L14_2 = L14_2.x
        L15_2 = L4_2.offsets
        L15_2 = L15_2.rotation
        L15_2 = L15_2.y
        L16_2 = L4_2.offsets
        L16_2 = L16_2.rotation
        L16_2 = L16_2.z
        L17_2 = false
        L18_2 = false
        L19_2 = false
        L20_2 = false
        L21_2 = 2
        L22_2 = true
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L7_2 = "anim@mp_rollarcoaster"
        L8_2 = "safety_bar_grip_move_a_player_"
        L9_2 = L4_2.seatcategory
        L10_2 = ""
        L8_2 = L8_2 .. L9_2 .. L10_2
        if 2 == A3_2 then
          L9_2 = "hands_up_idle_a_player_"
          L10_2 = L4_2.seatcategory
          L11_2 = ""
          L9_2 = L9_2 .. L10_2 .. L11_2
          L8_2 = L9_2
        end
        while true do
          L9_2 = HasAnimDictLoaded
          L10_2 = L7_2
          L9_2 = L9_2(L10_2)
          if L9_2 then
            break
          end
          L9_2 = RequestAnimDict
          L10_2 = L7_2
          L9_2(L10_2)
          L9_2 = Citizen
          L9_2 = L9_2.Wait
          L10_2 = 5
          L9_2(L10_2)
        end
        L9_2 = TaskPlayAnim
        L10_2 = L6_2
        L11_2 = L7_2
        L12_2 = L8_2
        L13_2 = 8.0
        L14_2 = 8.0
        L15_2 = -1
        L16_2 = 1
        L17_2 = 0
        L18_2 = 0
        L19_2 = 0
        L20_2 = 0
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      end
    end
  end
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "rtx_themepark:Rollercoaster2:AttractionEnded"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "rtx_themepark:Rollercoaster2:AttractionEnded"
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = 1
  L1_2 = rollercoaster2paths
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
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "rtx_themepark:Rollercoaster2:SynchronizeMovement"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "rtx_themepark:Rollercoaster2:SynchronizeMovement"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = nearbythemepark
  if true == L2_2 then
    L2_2 = A1_2
    L3_2 = rollercoaster2paths
    L3_2 = #L3_2
    if L2_2 > L3_2 then
      L3_2 = rollercoaster2paths
      L2_2 = #L3_2
    end
    rollercoaster2calculateid = A0_2
    L3_2 = rollercoaster2calculateid
    L4_2 = rollercoaster2paths
    L4_2 = #L4_2
    if L3_2 > L4_2 then
      L3_2 = rollercoaster2paths
      L3_2 = #L3_2
      rollercoaster2calculateid = L3_2
    end
    L3_2 = rollercoaster2paths
    L4_2 = rollercoasterhandler2
    L4_2.getnew = true
    L4_2 = rollercoasterhandler2
    L5_2 = rollercoaster2calculateid
    L4_2.stageid = L5_2
    L4_2 = SetEntityCoordsNoOffset
    L5_2 = L4_1
    L6_2 = rollercoasterhandler2
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2.coords
    L6_2 = L6_2.x
    L7_2 = rollercoasterhandler2
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2.coords
    L7_2 = L7_2.y
    L8_2 = rollercoasterhandler2
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
    L6_2 = rollercoasterhandler2
    L6_2 = L6_2.stageid
    L6_2 = L3_2[L6_2]
    L6_2 = L6_2.objectscoords1x
    L7_2 = rollercoasterhandler2
    L7_2 = L7_2.stageid
    L7_2 = L3_2[L7_2]
    L7_2 = L7_2.objectscoords1y
    L8_2 = rollercoasterhandler2
    L8_2 = L8_2.stageid
    L8_2 = L3_2[L8_2]
    L8_2 = L8_2.objectscoords1z
    L9_2 = rollercoasterhandler2
    L9_2 = L9_2.stageid
    L9_2 = L3_2[L9_2]
    L9_2 = L9_2.objectscoords1w
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = Citizen
    L4_2 = L4_2.Wait
    L5_2 = 1
    L4_2(L5_2)
    L4_2 = rollercoasterhandler2
    L4_2.getnew = false
    L4_2 = rollercoaster2paths
    L4_2 = #L4_2
    L5_2 = 1
    L6_2 = currentfps
    if L6_2 < 80 then
      L5_2 = 0
    else
      L5_2 = 1
    end
    while true do
      L6_2 = rollercoasterhandler2
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
      L6_2 = rollercoasterhandler2
      L6_2 = L6_2.stageid
      L6_2 = L3_2[L6_2]
      L6_2 = L6_2.coords
      L7_2 = L3_2[L2_2]
      L7_2 = L7_2.coords
      L6_2 = L6_2 - L7_2
      L6_2 = #L6_2
      if L6_2 > 0.0 then
        L7_2 = rollercoasterhandler2
        L8_2 = rollercoasterhandler2
        L8_2 = L8_2.stageid
        L8_2 = L8_2 + 1
        L7_2.stageid = L8_2
        L7_2 = rollercoasterhandler2
        L7_2 = L7_2.getnew
        if false == L7_2 then
          L7_2 = rollercoasterhandler2
          L7_2 = L7_2.stageid
          if L7_2 == L4_2 then
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = L4_1
            L9_2 = rollercoasterhandler2
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = rollercoasterhandler2
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = rollercoasterhandler2
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
            L9_2 = rollercoasterhandler2
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2.objectscoords1x
            L10_2 = rollercoasterhandler2
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2.objectscoords1y
            L11_2 = rollercoasterhandler2
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2.objectscoords1z
            L12_2 = rollercoasterhandler2
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2.objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
            L7_2 = rollercoasterhandler2
            L7_2.getnew = true
          else
            L7_2 = SetEntityCoordsNoOffset
            L8_2 = L4_1
            L9_2 = rollercoasterhandler2
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2.coords
            L9_2 = L9_2.x
            L10_2 = rollercoasterhandler2
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2.coords
            L10_2 = L10_2.y
            L11_2 = rollercoasterhandler2
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
            L9_2 = rollercoasterhandler2
            L9_2 = L9_2.stageid
            L9_2 = L3_2[L9_2]
            L9_2 = L9_2.objectscoords1x
            L10_2 = rollercoasterhandler2
            L10_2 = L10_2.stageid
            L10_2 = L3_2[L10_2]
            L10_2 = L10_2.objectscoords1y
            L11_2 = rollercoasterhandler2
            L11_2 = L11_2.stageid
            L11_2 = L3_2[L11_2]
            L11_2 = L11_2.objectscoords1z
            L12_2 = rollercoasterhandler2
            L12_2 = L12_2.stageid
            L12_2 = L3_2[L12_2]
            L12_2 = L12_2.objectscoords1w
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
          end
        end
      else
        L7_2 = Config
        L7_2 = L7_2.AttractionsSettings
        L7_2 = L7_2.rollercoaster2
        L7_2 = L7_2.speedmodifier
        L7_2 = 8 * L7_2
        A1_2 = A1_2 + L7_2
      end
    end
  else
    L2_2 = rollercoasterhandler2
    L2_2.getnew = true
  end
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "rtx_themepark:Rollercoaster2:SeatData"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "rtx_themepark:Rollercoaster2:SeatData"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.message = "attractionhow"
  L2_2.attractionanimchange = true
  L2_2.rollercoastercamchange = true
  L1_2(L2_2)
  L1_1 = A0_2
  L1_2 = SetEntityCompletelyDisableCollision
  L2_2 = L4_1
  L3_2 = false
  L4_2 = false
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = true
  L8_1 = L1_2
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "rtx_themepark:Rollercoaster2:SeatExit"
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "rtx_themepark:Rollercoaster2:SeatExit"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
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
  L2_2 = GlobalState
  L2_2 = L2_2["attraction17-phase"]
  if 0 == L2_2 then
  else
    L2_2 = SetEntityCoordsNoOffset
    L3_2 = L1_2
    L4_2 = -1631.4513
    L5_2 = -1194.3196
    L6_2 = 14.1111
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = SetEntityHeading
    L3_2 = L1_2
    L4_2 = 0.0
    L2_2(L3_2, L4_2)
  end
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.message = "hideattraction"
  L2_2(L3_2)
  currentseatid = nil
  L2_2 = SetEntityCompletelyDisableCollision
  L3_2 = L4_1
  L4_2 = true
  L5_2 = true
  L2_2(L3_2, L4_2, L5_2)
  if true == A0_2 then
    L2_2 = SetEntityCoordsNoOffset
    L3_2 = L1_2
    L4_2 = -1629.79
    L5_2 = -1192.59
    L6_2 = 14.0
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  L2_2 = DoesCamExist
  L3_2 = L6_1
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = DestroyCam
    L3_2 = L6_1
    L4_2 = false
    L2_2(L3_2, L4_2)
  end
  L2_2 = DoesEntityExist
  L3_2 = L7_1
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = DeleteEntity
    L3_2 = L7_1
    L2_2(L3_2)
  end
  L2_2 = RenderScriptCams
  L3_2 = false
  L4_2 = 0
  L5_2 = 0
  L6_2 = true
  L7_2 = false
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = false
  L5_1 = L2_2
  L2_2 = false
  L8_1 = L2_2
end
L9_1(L10_1, L11_1)
L9_1 = Config
L9_1 = L9_1.Target
if true == L9_1 then
  L9_1 = RegisterNetEvent
  L10_1 = "rtx_themepark:Rollercoaster2:SeatUseTarget"
  L9_1(L10_1)
  L9_1 = AddEventHandler
  L10_1 = "rtx_themepark:Rollercoaster2:SeatUseTarget"
  function L11_1()
    local L0_2, L1_2, L2_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = L0_1.seatid
      if nil ~= L0_2 then
        L0_2 = iteminhand
        if false == L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:Rollercoaster2:SeatUse"
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
end
L9_1 = Citizen
L9_1 = L9_1.CreateThread
function L10_1()
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
        goto lbl_152
      end
    end
    L0_2 = DoesEntityExist
    L1_2 = L4_1
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = GetHashKey
      L1_2 = "sempre_delperropier_rollercoaster_vozik"
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
      L3_2 = -1628.0427246094
      L4_2 = -1194.2862548828
      L5_2 = 13.053557395935
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
      L3_2 = -0.0013869871618226
      L4_2 = -4.342730389908E-4
      L5_2 = 0.9387509226799
      L6_2 = 0.34459361433983
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
      L1_2 = "sempre_delperropier_rollercoaster_vozik"
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
      L3_2 = -1628.0427246094
      L4_2 = -1194.2862548828
      L5_2 = 13.053557395935
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
      L3_2 = -0.0013869871618226
      L4_2 = -4.342730389908E-4
      L5_2 = 0.9387509226799
      L6_2 = 0.34459361433983
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
      L7_2 = 0.2
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
    ::lbl_152::
  end
end
L9_1(L10_1)
L9_1 = -1
L10_1 = Citizen
L10_1 = L10_1.CreateThread
function L11_1()
  local L0_2, L1_2, L2_2, L3_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 0
    L0_2(L1_2)
    L0_2 = GlobalState
    L0_2 = L0_2["attraction17-phase"]
    if 0 ~= L0_2 then
      L0_2 = nearbythemepark
      if false ~= L0_2 then
        goto lbl_21
      end
    end
    L0_2 = rollercoasterhandler2
    L0_2.getnew = true
    L0_2 = -1
    L9_1 = L0_2
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
    goto lbl_41
    ::lbl_21::
    L0_2 = L9_1
    if -1 ~= L0_2 then
      L0_2 = L9_1
      L1_2 = GlobalState
      L1_2 = L1_2["attraction17-synchdata"]
      if not (L0_2 < L1_2) then
        goto lbl_41
      end
    end
    L0_2 = tonumber
    L1_2 = GlobalState
    L1_2 = L1_2["attraction17-synchdata"]
    L0_2 = L0_2(L1_2)
    L9_1 = L0_2
    L0_2 = TriggerEvent
    L1_2 = "rtx_themepark:Rollercoaster2:SynchronizeMovement"
    L2_2 = GlobalState
    L2_2 = L2_2["attraction17-ridedata1"]
    L3_2 = GlobalState
    L3_2 = L3_2["attraction17-ridedata2"]
    L0_2(L1_2, L2_2, L3_2)
    ::lbl_41::
  end
end
L10_1(L11_1)
L10_1 = Config
L10_1 = L10_1.AttractionsSettings
L10_1 = L10_1.rollercoaster2
L10_1 = L10_1.disable
if false == L10_1 then
  L10_1 = Citizen
  L10_1 = L10_1.CreateThread
  function L11_1()
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
      L6_2 = L6_2["attraction17-phase"]
      if 0 == L6_2 then
        L6_2 = usingattraction
        if false == L6_2 then
          L6_2 = nearbythemepark
          if true == L6_2 then
            L6_2 = tickets
            L6_2 = L6_2.rollercoaster2
            if true == L6_2 then
              L6_2 = ipairs
              L7_2 = rollercoasterhandler2
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
                    L14_2 = L14_2.rollercoaster2
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
            L7_2 = rollercoasterhandler2
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
                L9_2 = L3_1
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
  L10_1(L11_1)
end
L10_1 = Config
L10_1 = L10_1.Target
if false == L10_1 then
  L10_1 = RegisterCommand
  L11_1 = "userollercoaster2seat"
  function L12_1()
    local L0_2, L1_2, L2_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = L0_1.seatid
      if nil ~= L0_2 then
        L0_2 = iteminhand
        if false == L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:Rollercoaster2:SeatUse"
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
  L10_1(L11_1, L12_1)
  L10_1 = RegisterKeyMapping
  L11_1 = "userollercoaster2seat"
  L12_1 = Language
  L13_1 = Config
  L13_1 = L13_1.Language
  L12_1 = L12_1[L13_1]
  L12_1 = L12_1.bindrollercoasterseatuse
  L13_1 = "keyboard"
  L14_1 = Config
  L14_1 = L14_1.ThemeParkSeatKey
  L10_1(L11_1, L12_1, L13_1, L14_1)
end
L10_1 = false
L11_1 = RegisterCommand
L12_1 = "changerollercoaster2anim"
function L13_1()
  local L0_2, L1_2, L2_2
  L0_2 = usingattraction
  if true == L0_2 then
    L0_2 = L1_1
    if nil ~= L0_2 then
      L0_2 = L10_1
      if false == L0_2 then
        L0_2 = true
        L10_1 = L0_2
        L0_2 = TriggerServerEvent
        L1_2 = "rtx_themepark:Rollercoaster2:SeatAnimChange"
        L2_2 = L1_1
        L0_2(L1_2, L2_2)
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = Config
        L1_2 = L1_2.AttractionsSettings
        L1_2 = L1_2.rollercoaster
        L1_2 = L1_2.animcooldown
        L0_2(L1_2)
        L0_2 = false
        L10_1 = L0_2
      end
    end
  end
end
L11_1(L12_1, L13_1)
L11_1 = RegisterKeyMapping
L12_1 = "changerollercoaster2anim"
L13_1 = Language
L14_1 = Config
L14_1 = L14_1.Language
L13_1 = L13_1[L14_1]
L13_1 = L13_1.bindrollercoasteranimchange
L14_1 = "keyboard"
L15_1 = Config
L15_1 = L15_1.ThemeParkAnimChangeKey
L11_1(L12_1, L13_1, L14_1, L15_1)
L11_1 = RegisterCommand
L12_1 = "exitrollercoaster2"
function L13_1()
  local L0_2, L1_2, L2_2
  L0_2 = usingattraction
  if true == L0_2 then
    L0_2 = L1_1
    if nil ~= L0_2 then
      L0_2 = Config
      L0_2 = L0_2.ThemeParkDisableExit
      if false ~= L0_2 then
        L0_2 = rollercoasterhandler2
        L0_2 = L0_2.started
        if false ~= L0_2 then
          goto lbl_20
        end
      end
      L0_2 = TriggerServerEvent
      L1_2 = "rtx_themepark:Rollercoaster2:ExitAttraction"
      L2_2 = L1_1
      L0_2(L1_2, L2_2)
      goto lbl_27
      ::lbl_20::
      L0_2 = Notify
      L1_2 = Language
      L2_2 = Config
      L2_2 = L2_2.Language
      L1_2 = L1_2[L2_2]
      L1_2 = L1_2.inprogress
      L0_2(L1_2)
    end
  end
  ::lbl_27::
end
L11_1(L12_1, L13_1)
L11_1 = RegisterKeyMapping
L12_1 = "exitrollercoaster2"
L13_1 = Language
L14_1 = Config
L14_1 = L14_1.Language
L13_1 = L13_1[L14_1]
L13_1 = L13_1.bindattractionexitkey
L14_1 = "keyboard"
L15_1 = Config
L15_1 = L15_1.ThemeParkExitKey
L11_1(L12_1, L13_1, L14_1, L15_1)
L11_1 = RegisterCommand
L12_1 = "changecamerarollercoaster"
function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L2_2 = usingattraction
  if true == L2_2 then
    L2_2 = L8_1
    if true == L2_2 then
      L2_2 = L1_1
      if nil ~= L2_2 then
        L2_2 = L5_1
        if false == L2_2 then
          L2_2 = true
          L5_1 = L2_2
          L2_2 = DoesCamExist
          L3_2 = L6_1
          L2_2 = L2_2(L3_2)
          if L2_2 then
            L2_2 = DestroyCam
            L3_2 = L6_1
            L4_2 = false
            L2_2(L3_2, L4_2)
          end
          L2_2 = DoesEntityExist
          L3_2 = L7_1
          L2_2 = L2_2(L3_2)
          if L2_2 then
            L2_2 = DeleteEntity
            L3_2 = L7_1
            L2_2(L3_2)
          end
          L2_2 = CreateCam
          L3_2 = "DEFAULT_SCRIPTED_CAMERA"
          L4_2 = true
          L2_2 = L2_2(L3_2, L4_2)
          L6_1 = L2_2
          L2_2 = PlayerPedId
          L2_2 = L2_2()
          L3_2 = rollercoasterhandler2
          L3_2 = L3_2.seats
          L4_2 = L1_1
          L3_2 = L3_2[L4_2]
          L4_2 = GetEntityCoords
          L5_2 = L2_2
          L4_2 = L4_2(L5_2)
          L5_2 = GetHashKey
          L6_2 = "blazer"
          L5_2 = L5_2(L6_2)
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
          L6_2 = CreateVehicle
          L7_2 = L5_2
          L8_2 = L4_2
          L9_2 = 0.0
          L10_2 = false
          L11_2 = false
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
          L7_1 = L6_2
          L6_2 = FreezeEntityPosition
          L7_2 = L7_1
          L8_2 = true
          L6_2(L7_2, L8_2)
          L6_2 = SetEntityInvincible
          L7_2 = L7_1
          L8_2 = true
          L6_2(L7_2, L8_2)
          L6_2 = FreezeEntityPosition
          L7_2 = L7_1
          L8_2 = true
          L6_2(L7_2, L8_2)
          L6_2 = NetworkAllowLocalEntityAttachment
          L7_2 = L7_1
          L8_2 = true
          L6_2(L7_2, L8_2)
          L6_2 = SetEntityMotionBlur
          L7_2 = L7_1
          L8_2 = false
          L6_2(L7_2, L8_2)
          L6_2 = SetEntityVisible
          L7_2 = L7_1
          L8_2 = false
          L6_2(L7_2, L8_2)
          L6_2 = AttachEntityToEntity
          L7_2 = L7_1
          L8_2 = L3_1
          L9_2 = 0
          L10_2 = 0.0
          L11_2 = L3_2.offsets
          L11_2 = L11_2.coords
          L11_2 = L11_2.y
          L12_2 = L3_2.offsets
          L12_2 = L12_2.coords
          L12_2 = L12_2.z
          L12_2 = L12_2 + 0.2
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
          L20_2 = 5
          L21_2 = true
          L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
          L6_2 = AttachCamToVehicleBone
          L7_2 = L6_1
          L8_2 = L7_1
          L9_2 = 0
          L10_2 = true
          L11_2 = 0.0
          L12_2 = 0.0
          L13_2 = 0.0
          L14_2 = 0.0
          L15_2 = 0.0
          L16_2 = 0.0
          L17_2 = true
          L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
          L6_2 = SetCamActive
          L7_2 = L6_1
          L8_2 = true
          L6_2(L7_2, L8_2)
          L6_2 = RenderScriptCams
          L7_2 = true
          L8_2 = 0
          L9_2 = 0
          L10_2 = true
          L11_2 = false
          L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
        else
          L2_2 = DoesCamExist
          L3_2 = L6_1
          L2_2 = L2_2(L3_2)
          if L2_2 then
            L2_2 = DestroyCam
            L3_2 = L6_1
            L4_2 = false
            L2_2(L3_2, L4_2)
          end
          L2_2 = DoesEntityExist
          L3_2 = L7_1
          L2_2 = L2_2(L3_2)
          if L2_2 then
            L2_2 = DeleteEntity
            L3_2 = L7_1
            L2_2(L3_2)
          end
          L2_2 = false
          L5_1 = L2_2
          L2_2 = RenderScriptCams
          L3_2 = false
          L4_2 = 0
          L5_2 = 0
          L6_2 = true
          L7_2 = false
          L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
        end
      end
    end
  end
end
L11_1(L12_1, L13_1)
L11_1 = RegisterKeyMapping
L12_1 = "changecamerarollercoaster"
L13_1 = Language
L14_1 = Config
L14_1 = L14_1.Language
L13_1 = L13_1[L14_1]
L13_1 = L13_1.attractioncamera
L14_1 = "keyboard"
L15_1 = Config
L15_1 = L15_1.AttractionsSettings
L15_1 = L15_1.brakedance
L15_1 = L15_1.changecamera
L11_1(L12_1, L13_1, L14_1, L15_1)
