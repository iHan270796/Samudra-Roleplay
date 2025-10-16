local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = IsDuplicityVersion
L0_1 = L0_1()
if L0_1 then
  L0_1 = GetPlayerPositionInRealTime80
  L0_1()
end
L0_1 = {}
L0_1.ropeobjecthandler1 = nil
L0_1.ropeobjecthandler2 = nil
L0_1.ropehandler1 = nil
L0_1.ropehandler2 = nil
L0_1.getnew = false
L0_1.ridedata1 = 0.0
L0_1.ridedata2 = 0.0
L0_1.rideway = 1
L1_1 = {}
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L3_1 = {}
L4_1 = vec3
L5_1 = 0.33
L6_1 = -0.011
L7_1 = -0.432
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1.coords = L4_1
L4_1 = vec3
L5_1 = 0.0
L6_1 = 0.0
L7_1 = 180.0
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1.rotation = L4_1
L2_1.offsets = L3_1
L1_1[1] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L3_1 = {}
L4_1 = vec3
L5_1 = -0.284
L6_1 = -0.011
L7_1 = -0.432
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1.coords = L4_1
L4_1 = vec3
L5_1 = 0.0
L6_1 = 0.0
L7_1 = 180.0
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1.rotation = L4_1
L2_1.offsets = L3_1
L1_1[2] = L2_1
L0_1.seats = L1_1
L1_1 = nil
L2_1 = nil
L3_1 = {}
L3_1.seatid = nil
L4_1 = nil
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:SlingShot:SynchronizeMovement"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:SlingShot:SynchronizeMovement"
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L6_2 = nearbythemepark
  if true == L6_2 then
    if 15 == A5_2 or 16 == A5_2 then
      L0_1.getnew = true
      L6_2 = heightdata
      L0_1.heightdata = L6_2
      L6_2 = rotationdata
      L0_1.currentrotation = L6_2
      L6_2 = rotationdata2
      L0_1.currentrotation2 = L6_2
      L6_2 = SetEntityCoordsNoOffset
      L7_2 = L1_1
      L8_2 = -1611.79
      L9_2 = -1106.84
      L10_2 = heightdata
      L10_2 = 20.5 + L10_2
      L6_2(L7_2, L8_2, L9_2, L10_2)
      L6_2 = SetEntityRotation
      L7_2 = L1_1
      L8_2 = 0.0
      L9_2 = 0.0
      L10_2 = rotationdata
      L6_2(L7_2, L8_2, L9_2, L10_2)
      L6_2 = ipairs
      L7_2 = seats
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
      for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
        L12_2 = DoesEntityExist
        L13_2 = L11_2.handler
        L12_2 = L12_2(L13_2)
        if L12_2 then
          L12_2 = AttachEntityToEntity
          L13_2 = L11_2.handler
          L14_2 = L1_1
          L15_2 = 0
          L16_2 = L11_2.coords
          L16_2 = L16_2.x
          L17_2 = L11_2.coords
          L17_2 = L17_2.y
          L18_2 = L11_2.coords
          L18_2 = L18_2.z
          L19_2 = rotationdata2
          L20_2 = L11_2.rotation
          L20_2 = L20_2.y
          L21_2 = L11_2.rotation
          L21_2 = L21_2.z
          L22_2 = false
          L23_2 = false
          L24_2 = false
          L25_2 = false
          L26_2 = 2
          L27_2 = true
          L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
        end
      end
    else
      L0_1.getnew = true
      L6_2 = SetEntityRotation
      L7_2 = L1_1
      L8_2 = A1_2
      L9_2 = 0.0
      L10_2 = -40.0
      L6_2(L7_2, L8_2, L9_2, L10_2)
      L6_2 = SetEntityCoordsNoOffset
      L7_2 = L1_1
      L8_2 = -1582.431
      L9_2 = -1084.60083
      L10_2 = 14.0 + A0_2
      L6_2(L7_2, L8_2, L9_2, L10_2)
      L0_1.ridedata1 = A0_2
      L0_1.ridedata2 = A1_2
      L0_1.rideway = A2_2
      L6_2 = Citizen
      L6_2 = L6_2.Wait
      L7_2 = 1
      L6_2(L7_2)
      L0_1.getnew = false
      L6_2 = A3_2 * 0.1
      L7_2 = A4_2 * 0.1
      L8_2 = 1
      L9_2 = currentfps
      if L9_2 < 70 then
        L6_2 = A3_2 * 0.25
        L7_2 = A4_2 * 0.25
        L8_2 = 0
      else
        L9_2 = currentfps
        if L9_2 < 110 then
          L6_2 = A3_2 * 0.15
          L7_2 = A4_2 * 0.15
          L8_2 = 0
        end
      end
      while true do
        L9_2 = L0_1.getnew
        if false ~= L9_2 then
          break
        end
        L9_2 = Citizen
        L9_2 = L9_2.Wait
        L10_2 = L8_2
        L9_2(L10_2)
        if 1 == A5_2 then
          L9_2 = L0_1.rideway
          if 1 == L9_2 then
            L9_2 = L0_1.ridedata1
            if L9_2 < 50.0 then
              L9_2 = L0_1.ridedata1
              L9_2 = L9_2 + L6_2
              L0_1.ridedata1 = L9_2
            else
              L0_1.rideway = 2
            end
          else
            L9_2 = L0_1.ridedata1
            if L9_2 > 5.0 then
              L9_2 = L0_1.ridedata1
              L9_2 = L9_2 - L6_2
              L0_1.ridedata1 = L9_2
            else
              L0_1.rideway = 1
            end
          end
          L9_2 = L0_1.ridedata2
          L10_2 = 360.0
          if L9_2 > L10_2 then
            L9_2 = L0_1.ridedata2
            L9_2 = L9_2 - 360.0
            L10_2 = 0.0 + L9_2
            A1_2 = L10_2 + L7_2
          else
            L9_2 = L0_1.ridedata2
            L9_2 = L9_2 + L7_2
            L0_1.ridedata2 = L9_2
          end
        elseif 2 == A5_2 then
          L9_2 = L0_1.ridedata1
          if L9_2 > 0.0 then
            L9_2 = L0_1.ridedata1
            if L9_2 < 1.0 then
              L9_2 = L0_1.ridedata1
              L9_2 = L9_2 - L6_2
              L0_1.ridedata1 = L9_2
            else
              L9_2 = L0_1.ridedata1
              if L9_2 < 2.0 then
                L9_2 = L0_1.ridedata1
                L9_2 = L9_2 - L6_2
                L0_1.ridedata1 = L9_2
              else
                L9_2 = L0_1.ridedata1
                if L9_2 < 3.0 then
                  L9_2 = L0_1.ridedata1
                  L9_2 = L9_2 - L6_2
                  L0_1.ridedata1 = L9_2
                else
                  L9_2 = L0_1.ridedata1
                  if L9_2 < 5.0 then
                    L9_2 = L0_1.ridedata1
                    L9_2 = L9_2 - L6_2
                    L0_1.ridedata1 = L9_2
                  else
                    L9_2 = L0_1.ridedata1
                    if L9_2 < 10.0 then
                      L9_2 = L0_1.ridedata1
                      L9_2 = L9_2 - L6_2
                      L0_1.ridedata1 = L9_2
                    else
                      L9_2 = L0_1.ridedata1
                      if L9_2 < 15.0 then
                        L9_2 = L0_1.ridedata1
                        L9_2 = L9_2 - L6_2
                        L0_1.ridedata1 = L9_2
                      else
                        L9_2 = L0_1.ridedata1
                        if L9_2 < 20.0 then
                          L9_2 = L0_1.ridedata1
                          L9_2 = L9_2 - L6_2
                          L0_1.ridedata1 = L9_2
                        else
                          L9_2 = L0_1.ridedata1
                          if L9_2 < 35.0 then
                            L9_2 = L0_1.ridedata1
                            L9_2 = L9_2 - L6_2
                            L0_1.ridedata1 = L9_2
                          else
                            L9_2 = L0_1.ridedata1
                            if L9_2 < 40.0 then
                              L9_2 = L0_1.ridedata1
                              L9_2 = L9_2 - L6_2
                              L0_1.ridedata1 = L9_2
                            else
                              L9_2 = L0_1.ridedata1
                              L9_2 = L9_2 - L6_2
                              L0_1.ridedata1 = L9_2
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          L9_2 = L0_1.rideway
          if 2 == L9_2 then
            L9_2 = L0_1.ridedata2
            L10_2 = 360.0
            if L9_2 < L10_2 then
              L9_2 = L0_1.ridedata2
              L10_2 = 0.25
              if L9_2 > L10_2 then
                L9_2 = L0_1.ridedata2
                L9_2 = L9_2 + L7_2
                L0_1.ridedata2 = L9_2
            end
            else
              L0_1.ridedata2 = 0.0
              L0_1.rideway = 1
            end
          end
        end
        L9_2 = L0_1.getnew
        if false == L9_2 then
          L9_2 = SetEntityRotation
          L10_2 = L1_1
          L11_2 = L0_1.ridedata2
          L12_2 = 0.0
          L13_2 = -40.0
          L9_2(L10_2, L11_2, L12_2, L13_2)
          L9_2 = SetEntityCoordsNoOffset
          L10_2 = L1_1
          L11_2 = -1582.431
          L12_2 = -1084.60083
          L13_2 = L0_1.ridedata1
          L13_2 = 14.0 + L13_2
          L9_2(L10_2, L11_2, L12_2, L13_2)
        end
      end
    end
  else
    L0_1.getnew = true
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:SlingShot:ResynchClient"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:SlingShot:ResynchClient"
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L0_2 = ipairs
  L1_2 = seats
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = AttachEntityToEntity
    L7_2 = L5_2.handler
    L8_2 = L1_1
    L9_2 = 0
    L10_2 = L5_2.coords
    L10_2 = L10_2.x
    L11_2 = L5_2.coords
    L11_2 = L11_2.y
    L12_2 = L5_2.coords
    L12_2 = L12_2.z
    L13_2 = L5_2.rotation
    L13_2 = L13_2.x
    L14_2 = L5_2.rotation
    L14_2 = L14_2.y
    L15_2 = L5_2.rotation
    L15_2 = L15_2.z
    L16_2 = false
    L17_2 = false
    L18_2 = false
    L19_2 = false
    L20_2 = 5
    L21_2 = true
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  end
  L0_2 = SetEntityCoordsNoOffset
  L1_2 = L1_1
  L2_2 = -75.38789
  L3_2 = -818.943848
  L4_2 = GlobalState
  L4_2 = L4_2["attraction12-ridedata"]
  L0_2(L1_2, L2_2, L3_2, L4_2)
end
L5_1(L6_1, L7_1)
L5_1 = Config
L5_1 = L5_1.Target
if L5_1 then
  L5_1 = RegisterNetEvent
  L6_1 = "rtx_themepark:SlingShot:SeatTarget"
  L5_1(L6_1)
  L5_1 = AddEventHandler
  L6_1 = "rtx_themepark:SlingShot:SeatTarget"
  function L7_1()
    local L0_2, L1_2, L2_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = GlobalState
      L0_2 = L0_2["attraction12-phase"]
      if 0 == L0_2 then
        L0_2 = L3_1.seatid
        if nil ~= L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:SlingShot:SeatUse"
          L2_2 = L3_1.seatid
          L0_2(L1_2, L2_2)
        end
      end
    end
  end
  L5_1(L6_1, L7_1)
end
L5_1 = Citizen
L5_1 = L5_1.CreateThread
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
    L0_2 = nearbythemepark
    if true ~= L0_2 then
      L0_2 = nearbythemepark
      if false ~= L0_2 then
        goto lbl_368
      end
    end
    L0_2 = DoesEntityExist
    L1_2 = L1_1
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = GetHashKey
      L1_2 = "sempre_delperropier_slingshot_sedacka"
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
      L3_2 = -1582.431
      L4_2 = -1084.60083
      L5_2 = 14.0
      L6_2 = false
      L7_2 = true
      L8_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
      L1_1 = L1_2
      L1_2 = SetEntityRotation
      L2_2 = L1_1
      L3_2 = 0.0
      L4_2 = 0.0
      L5_2 = -40.0
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = NetworkAllowLocalEntityAttachment
      L2_2 = L1_1
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = FreezeEntityPosition
      L2_2 = L1_1
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = SetEntityMotionBlur
      L2_2 = L1_1
      L3_2 = false
      L1_2(L2_2, L3_2)
    end
    L0_2 = DoesEntityExist
    L1_2 = L2_1
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = GetHashKey
      L1_2 = "sempre_delperropier_slingshot_sedacka_anim"
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
      L3_2 = -1582.431
      L4_2 = -1084.60083
      L5_2 = 14.0
      L6_2 = false
      L7_2 = true
      L8_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
      L2_1 = L1_2
      L1_2 = SetEntityRotation
      L2_2 = L2_1
      L3_2 = 0.0
      L4_2 = 0.0
      L5_2 = -40.0
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = NetworkAllowLocalEntityAttachment
      L2_2 = L2_1
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = FreezeEntityPosition
      L2_2 = L2_1
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = AttachEntityToEntity
      L2_2 = L2_1
      L3_2 = L1_1
      L4_2 = 0
      L5_2 = 0.0
      L6_2 = 0.0
      L7_2 = 0.0
      L8_2 = 0.0
      L9_2 = 0.0
      L10_2 = 0.0
      L11_2 = false
      L12_2 = false
      L13_2 = true
      L14_2 = false
      L15_2 = 5
      L16_2 = true
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    end
    L0_2 = DoesEntityExist
    L1_2 = L0_1.ropeobjecthandler1
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = GetHashKey
      L1_2 = "prop_cs_burger_01"
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
      L3_2 = -1569.42
      L4_2 = -1095.51
      L5_2 = 47.91
      L6_2 = false
      L7_2 = true
      L8_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
      L0_1.ropeobjecthandler1 = L1_2
      L1_2 = SetEntityRotation
      L2_2 = L0_1.ropeobjecthandler1
      L3_2 = 0.0
      L4_2 = 0.0
      L5_2 = 0.0
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = NetworkAllowLocalEntityAttachment
      L2_2 = L0_1.ropeobjecthandler1
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = FreezeEntityPosition
      L2_2 = L0_1.ropeobjecthandler1
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = SetEntityVisible
      L2_2 = L0_1.ropeobjecthandler1
      L3_2 = false
      L1_2(L2_2, L3_2)
    end
    L0_2 = DoesEntityExist
    L1_2 = L0_1.ropeobjecthandler2
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = GetHashKey
      L1_2 = "prop_cs_burger_01"
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
      L3_2 = -1595.36
      L4_2 = -1073.83
      L5_2 = 47.91
      L6_2 = false
      L7_2 = true
      L8_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
      L0_1.ropeobjecthandler2 = L1_2
      L1_2 = SetEntityRotation
      L2_2 = L0_1.ropeobjecthandler2
      L3_2 = 0.0
      L4_2 = 0.0
      L5_2 = 0.0
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = NetworkAllowLocalEntityAttachment
      L2_2 = L0_1.ropeobjecthandler2
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = FreezeEntityPosition
      L2_2 = L0_1.ropeobjecthandler2
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = SetEntityVisible
      L2_2 = L0_1.ropeobjecthandler2
      L3_2 = false
      L1_2(L2_2, L3_2)
    end
    L0_2 = DoesRopeExist
    L1_2 = L0_1.ropehandler1
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = RopeLoadTextures
      L0_2()
      L0_2 = AddRope
      L1_2 = -1569.42
      L2_2 = -1095.51
      L3_2 = 47.91
      L4_2 = 0.0
      L5_2 = 0.0
      L6_2 = 0.0
      L7_2 = 200.0
      L8_2 = 4
      L9_2 = 200.0
      L10_2 = 0.25
      L11_2 = 0.0
      L12_2 = false
      L13_2 = false
      L14_2 = false
      L15_2 = 5.0
      L16_2 = false
      L17_2 = 0
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
      L0_1.ropehandler1 = L0_2
      L0_2 = GetOffsetFromEntityInWorldCoords
      L1_2 = L0_1.ropeobjecthandler1
      L2_2 = 0.0
      L3_2 = 0.0
      L4_2 = 0.0
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2)
      L1_2 = GetOffsetFromEntityInWorldCoords
      L2_2 = L1_1
      L3_2 = 0.8
      L4_2 = 0.0
      L5_2 = 0.0
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      L2_2 = AttachEntitiesToRope
      L3_2 = L0_1.ropehandler1
      L4_2 = L0_1.ropeobjecthandler1
      L5_2 = L1_1
      L6_2 = L0_2.x
      L7_2 = L0_2.y
      L8_2 = L0_2.z
      L9_2 = L1_2.x
      L10_2 = L1_2.y
      L11_2 = L1_2.z
      L12_2 = 1.0
      L13_2 = false
      L14_2 = false
      L15_2 = 0
      L16_2 = 0
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L2_2 = StopRopeWinding
      L3_2 = L0_1.ropehandler1
      L2_2(L3_2)
      L2_2 = StartRopeWinding
      L3_2 = L0_1.ropehandler1
      L2_2(L3_2)
      L2_2 = RopeForceLength
      L3_2 = L0_1.ropehandler1
      L4_2 = 15.0
      L2_2(L3_2, L4_2)
    end
    L0_2 = DoesRopeExist
    L1_2 = L0_1.ropehandler2
    L0_2 = L0_2(L1_2)
    if L0_2 then
    else
      L0_2 = RopeLoadTextures
      L0_2()
      L0_2 = AddRope
      L1_2 = -1595.36
      L2_2 = -1073.83
      L3_2 = 47.91
      L4_2 = 0.0
      L5_2 = 0.0
      L6_2 = 0.0
      L7_2 = 200.0
      L8_2 = 4
      L9_2 = 200.0
      L10_2 = 0.25
      L11_2 = 0.0
      L12_2 = false
      L13_2 = false
      L14_2 = false
      L15_2 = 5.0
      L16_2 = false
      L17_2 = 0
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
      L0_1.ropehandler2 = L0_2
      L0_2 = GetOffsetFromEntityInWorldCoords
      L1_2 = L0_1.ropeobjecthandler2
      L2_2 = 0.0
      L3_2 = 0.0
      L4_2 = 0.0
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2)
      L1_2 = GetOffsetFromEntityInWorldCoords
      L2_2 = L1_1
      L3_2 = -0.8
      L4_2 = 0.0
      L5_2 = 0.0
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      L2_2 = AttachEntitiesToRope
      L3_2 = L0_1.ropehandler2
      L4_2 = L0_1.ropeobjecthandler2
      L5_2 = L1_1
      L6_2 = L0_2.x
      L7_2 = L0_2.y
      L8_2 = L0_2.z
      L9_2 = L1_2.x
      L10_2 = L1_2.y
      L11_2 = L1_2.z
      L12_2 = 1.0
      L13_2 = false
      L14_2 = false
      L15_2 = 0
      L16_2 = 0
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L2_2 = StopRopeWinding
      L3_2 = L0_1.ropehandler2
      L2_2(L3_2)
      L2_2 = StartRopeWinding
      L3_2 = L0_1.ropehandler2
      L2_2(L3_2)
      L2_2 = RopeForceLength
      L3_2 = L0_1.ropehandler2
      L4_2 = 15.0
      L2_2(L3_2, L4_2)
    end
    ::lbl_368::
  end
end
L5_1(L6_1)
L5_1 = -1
L6_1 = Citizen
L6_1 = L6_1.CreateThread
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 20
    L0_2(L1_2)
    L0_2 = GlobalState
    L0_2 = L0_2["attraction12-phase"]
    if 0 ~= L0_2 then
      L0_2 = nearbythemepark
      if false ~= L0_2 then
        goto lbl_18
      end
    end
    L0_1.getnew = true
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
    goto lbl_112
    ::lbl_18::
    L0_2 = L5_1
    if -1 ~= L0_2 then
      L0_2 = L5_1
      L1_2 = GlobalState
      L1_2 = L1_2["attraction12-synchdata"]
      if not (L0_2 < L1_2) then
        goto lbl_112
      end
    end
    L0_2 = tonumber
    L1_2 = GlobalState
    L1_2 = L1_2["attraction12-synchdata"]
    L0_2 = L0_2(L1_2)
    L5_1 = L0_2
    L0_2 = TriggerEvent
    L1_2 = "rtx_themepark:SlingShot:SynchronizeMovement"
    L2_2 = GlobalState
    L2_2 = L2_2["attraction12-ridedata1"]
    L3_2 = GlobalState
    L3_2 = L3_2["attraction12-ridedata2"]
    L4_2 = GlobalState
    L4_2 = L4_2["attraction12-rideway"]
    L5_2 = GlobalState
    L5_2 = L5_2["attraction12-speeddata1"]
    L6_2 = GlobalState
    L6_2 = L6_2["attraction12-speeddata2"]
    L7_2 = GlobalState
    L7_2 = L7_2["attraction12-phase"]
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
    L0_2 = DoesRopeExist
    L1_2 = L0_1.ropehandler1
    L0_2 = L0_2(L1_2)
    if L0_2 then
      L0_2 = GetOffsetFromEntityInWorldCoords
      L1_2 = L0_1.ropeobjecthandler1
      L2_2 = 0.0
      L3_2 = 0.0
      L4_2 = 0.0
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2)
      L1_2 = GetOffsetFromEntityInWorldCoords
      L2_2 = L1_1
      L3_2 = 0.8
      L4_2 = 0.0
      L5_2 = 0.0
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      L2_2 = AttachEntitiesToRope
      L3_2 = L0_1.ropehandler1
      L4_2 = L0_1.ropeobjecthandler1
      L5_2 = L1_1
      L6_2 = L0_2.x
      L7_2 = L0_2.y
      L8_2 = L0_2.z
      L9_2 = L1_2.x
      L10_2 = L1_2.y
      L11_2 = L1_2.z
      L12_2 = 15.0
      L13_2 = false
      L14_2 = false
      L15_2 = 0
      L16_2 = 0
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    end
    L0_2 = DoesRopeExist
    L1_2 = L0_1.ropehandler2
    L0_2 = L0_2(L1_2)
    if L0_2 then
      L0_2 = GetOffsetFromEntityInWorldCoords
      L1_2 = L0_1.ropeobjecthandler2
      L2_2 = 0.0
      L3_2 = 0.0
      L4_2 = 0.0
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2)
      L1_2 = GetOffsetFromEntityInWorldCoords
      L2_2 = L1_1
      L3_2 = -0.8
      L4_2 = 0.0
      L5_2 = 0.0
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      L2_2 = AttachEntitiesToRope
      L3_2 = L0_1.ropehandler2
      L4_2 = L0_1.ropeobjecthandler2
      L5_2 = L1_1
      L6_2 = L0_2.x
      L7_2 = L0_2.y
      L8_2 = L0_2.z
      L9_2 = L1_2.x
      L10_2 = L1_2.y
      L11_2 = L1_2.z
      L12_2 = 15.0
      L13_2 = false
      L14_2 = false
      L15_2 = 0
      L16_2 = 0
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    end
    ::lbl_112::
  end
end
L6_1(L7_1)
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:SlingShot:AttractionFinish"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:SlingShot:AttractionFinish"
function L8_1()
  local L0_2, L1_2
  L0_2 = -1
  L5_1 = L0_2
end
L6_1(L7_1, L8_1)
L6_1 = Config
L6_1 = L6_1.AttractionsSettings
L6_1 = L6_1.slingshot
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
      L6_2 = L6_2["attraction12-phase"]
      if 0 == L6_2 then
        L6_2 = usingattraction
        if false == L6_2 then
          L6_2 = nearbythemepark
          if true == L6_2 then
            L6_2 = tickets
            L6_2 = L6_2.slingshot
            if true == L6_2 then
              L6_2 = ipairs
              L7_2 = L0_1.seats
              L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
              for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
                L12_2 = L11_2.taken
                if false == L12_2 then
                  L12_2 = GetOffsetFromEntityInWorldCoords
                  L13_2 = L1_1
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
                    L14_2 = L14_2.slingshot
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
        L3_1 = L6_2
        L6_2 = false
        L7_2 = usingattraction
        if false == L7_2 then
          L0_2 = false
          L7_2 = Config
          L7_2 = L7_2.Target
          if false == L7_2 then
            L7_2 = L0_1.seats
            L8_2 = L3_1.seatid
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
          L6_2 = L3_1.seatid
          if nil ~= L6_2 then
            L6_2 = SendNUIMessage
            L7_2 = {}
            L7_2.message = "hide"
            L6_2(L7_2)
          end
        end
        L6_2 = {}
        L6_2.seatid = nil
        L3_1 = L6_2
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
L6_1 = Config
L6_1 = L6_1.Target
if false == L6_1 then
  L6_1 = RegisterCommand
  L7_1 = "useslingshotseat"
  function L8_1()
    local L0_2, L1_2, L2_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = GlobalState
      L0_2 = L0_2["attraction12-phase"]
      if 0 == L0_2 then
        L0_2 = L3_1.seatid
        if nil ~= L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:SlingShot:SeatUse"
          L2_2 = L3_1.seatid
          L0_2(L1_2, L2_2)
        end
      end
    end
  end
  L6_1(L7_1, L8_1)
  L6_1 = RegisterKeyMapping
  L7_1 = "useslingshotseat"
  L8_1 = Language
  L9_1 = Config
  L9_1 = L9_1.Language
  L8_1 = L8_1[L9_1]
  L8_1 = L8_1.bindseatuse
  L9_1 = "keyboard"
  L10_1 = Config
  L10_1 = L10_1.ThemeParkSeatKey
  L6_1(L7_1, L8_1, L9_1, L10_1)
end
L6_1 = RegisterCommand
L7_1 = "exitslingshot"
function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = usingattraction
  if true == L0_2 then
    L0_2 = L4_1
    if nil ~= L0_2 then
      L0_2 = Config
      L0_2 = L0_2.ThemeParkDisableExit
      if false ~= L0_2 then
        L0_2 = GlobalState
        L0_2 = L0_2["attraction12-phase"]
        if 0 ~= L0_2 then
          goto lbl_20
        end
      end
      L0_2 = TriggerServerEvent
      L1_2 = "rtx_themepark:SlingShot:ExitAttraction"
      L2_2 = L4_1
      L0_2(L1_2, L2_2)
      goto lbl_27
      ::lbl_20::
      L0_2 = Notify
      L1_2 = Language
      L2_2 = Config
      L2_2 = L2_2.Language
      L1_2 = L1_2[L2_2]
      L1_2 = L1_2.attractioninprogress
      L0_2(L1_2)
    end
  end
  ::lbl_27::
end
L6_1(L7_1, L8_1)
L6_1 = RegisterKeyMapping
L7_1 = "exitslingshot"
L8_1 = Language
L9_1 = Config
L9_1 = L9_1.Language
L8_1 = L8_1[L9_1]
L8_1 = L8_1.leaveattraciton
L9_1 = "keyboard"
L10_1 = Config
L10_1 = L10_1.ThemeParkExitKey
L6_1(L7_1, L8_1, L9_1, L10_1)
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:SlingShot:SynchronizeSeat"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:SlingShot:SynchronizeSeat"
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L3_2 = L0_1.seats
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
        L8_2 = L1_1
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
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:SlingShot:SeatData"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:SlingShot:SeatData"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.message = "attractionhow"
  L2_2.attractionanimchange = false
  L1_2(L2_2)
  L4_1 = A0_2
  L1_2 = SetEntityCompletelyDisableCollision
  L2_2 = L1_1
  L3_2 = false
  L4_2 = false
  L1_2(L2_2, L3_2, L4_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:SlingShot:SeatExit"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:SlingShot:SeatExit"
function L8_1(A0_2)
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
  L2_2 = GlobalState
  L2_2 = L2_2["attraction12-phase"]
  if 0 == L2_2 then
  else
    L2_2 = SetEntityCoordsNoOffset
    L3_2 = L1_2
    L4_2 = -1586.5808
    L5_2 = -1088.532
    L6_2 = 13.0172
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
  L2_2 = nil
  L4_1 = L2_2
  L2_2 = SetEntityCompletelyDisableCollision
  L3_2 = L1_1
  L4_2 = true
  L5_2 = true
  L2_2(L3_2, L4_2, L5_2)
end
L6_1(L7_1, L8_1)
