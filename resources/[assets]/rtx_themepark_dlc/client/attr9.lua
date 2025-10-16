local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = IsDuplicityVersion
L0_1 = L0_1()
if L0_1 then
  L0_1 = GetPlayerPositionInRealTime76
  L0_1()
end
L0_1 = {}
L1_1 = 0
L2_1 = 0
L3_1 = nil
L4_1 = {}
L4_1.screen1 = nil
L4_1.screen2 = nil
L5_1 = false
L6_1 = true
L7_1 = false
L8_1 = 0
L9_1 = nil
L10_1 = nil
L11_1 = {}
L12_1 = {}
L13_1 = {}
L14_1 = vector3
L15_1 = -1674.04
L16_1 = -1137.58
L17_1 = 13.5
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.coords = L14_1
L13_1.heading = 187.0
L13_1.taken = false
L14_1 = vector3
L15_1 = -1673.80933
L16_1 = -1140.61292
L17_1 = 14.0093746
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.screencoords = L14_1
L14_1 = vector3
L15_1 = 0.0
L16_1 = 0.0
L17_1 = -85.0
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.screenrotation = L14_1
L12_1[1] = L13_1
L13_1 = {}
L14_1 = vector3
L15_1 = -1640.65
L16_1 = -1099.73
L17_1 = 13.5
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.coords = L14_1
L13_1.heading = 319.0
L13_1.taken = false
L14_1 = vector3
L15_1 = -1638.60571
L16_1 = -1097.55676
L17_1 = 14.04349
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.screencoords = L14_1
L14_1 = vector3
L15_1 = 0.0
L16_1 = 0.0
L17_1 = 49.4
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.screenrotation = L14_1
L12_1[2] = L13_1
L13_1 = {}
L14_1 = vector3
L15_1 = -1593.67
L16_1 = -1095.86
L17_1 = 13.5
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.coords = L14_1
L13_1.heading = 230.0
L13_1.taken = false
L14_1 = vector3
L15_1 = -1591.2832
L16_1 = -1098.0968
L17_1 = 14.0477915
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.screencoords = L14_1
L14_1 = vector3
L15_1 = 0.0
L16_1 = 0.0
L17_1 = -40.0
L14_1 = L14_1(L15_1, L16_1, L17_1)
L13_1.screenrotation = L14_1
L12_1[3] = L13_1
L11_1.shooters = L12_1
shooterhandler = L11_1
L11_1 = RegisterNetEvent
L12_1 = "rtx_themepark:Shooter:Started"
L11_1(L12_1)
L11_1 = AddEventHandler
L12_1 = "rtx_themepark:Shooter:Started"
function L13_1(A0_2)
  local L1_2
end
L11_1(L12_1, L13_1)
L11_1 = RegisterNetEvent
L12_1 = "rtx_themepark:Shooter:SynchronizeShooter"
L11_1(L12_1)
L11_1 = AddEventHandler
L12_1 = "rtx_themepark:Shooter:SynchronizeShooter"
function L13_1(A0_2, A1_2)
  local L2_2
  L2_2 = shooterhandler
  L2_2 = L2_2.shooters
  L2_2 = L2_2[A0_2]
  L2_2.taken = A1_2
end
L11_1(L12_1, L13_1)
L11_1 = RegisterNetEvent
L12_1 = "rtx_themepark:Shooter:StartClient"
L11_1(L12_1)
L11_1 = AddEventHandler
L12_1 = "rtx_themepark:Shooter:StartClient"
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = shooterhandler
  L1_2 = L1_2.shooters
  L1_2 = L1_2[A0_2]
  L2_2 = L5_1
  if false == L2_2 then
    L9_1 = A0_2
    L2_2 = true
    L5_1 = L2_2
    L2_2 = Config
    L2_2 = L2_2.OxInventory
    if L2_2 then
      L2_2 = exports
      L2_2 = L2_2.ox_inventory
      L3_2 = L2_2
      L2_2 = L2_2.weaponWheel
      L4_2 = true
      L2_2(L3_2, L4_2)
    end
    L2_2 = TriggerEvent
    L3_2 = "rtx_themepark:Shooter:Started"
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = GetEntityCoords
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = GetFollowPedCamViewMode
    L4_2 = L4_2()
    L5_2 = FreezeEntityPosition
    L6_2 = L2_2
    L7_2 = true
    L5_2(L6_2, L7_2)
    L5_2 = SetEntityCoordsNoOffset
    L6_2 = L2_2
    L7_2 = L1_2.coords
    L7_2 = L7_2.x
    L8_2 = L1_2.coords
    L8_2 = L8_2.y
    L9_2 = L1_2.coords
    L9_2 = L9_2.z
    L10_2 = true
    L11_2 = false
    L12_2 = false
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L5_2 = SetEntityHeading
    L6_2 = L2_2
    L7_2 = L1_2.heading
    L5_2(L6_2, L7_2)
    L5_2 = GetHashKey
    L6_2 = "sempre_delperropier_bus_blue_screen"
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
    L6_2 = CreateObjectNoOffset
    L7_2 = L5_2
    L8_2 = L1_2.screencoords
    L8_2 = L8_2.x
    L9_2 = L1_2.screencoords
    L9_2 = L9_2.y
    L10_2 = L1_2.screencoords
    L10_2 = L10_2.z
    L11_2 = true
    L12_2 = true
    L13_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L3_1 = L6_2
    L6_2 = SetEntityRotation
    L7_2 = L3_1
    L8_2 = L1_2.screenrotation
    L8_2 = L8_2.x
    L9_2 = L1_2.screenrotation
    L9_2 = L9_2.y
    L10_2 = L1_2.screenrotation
    L10_2 = L10_2.z
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = NetworkAllowLocalEntityAttachment
    L7_2 = L3_1
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = FreezeEntityPosition
    L7_2 = L3_1
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = SetEntityVisible
    L7_2 = L3_1
    L8_2 = false
    L6_2(L7_2, L8_2)
    L6_2 = SetEntityInvincible
    L7_2 = L3_1
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = GetHashKey
    L7_2 = "sempre_delperropier_bus_blue_screen"
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
    L9_2 = L1_2.screencoords
    L9_2 = L9_2.x
    L10_2 = L1_2.screencoords
    L10_2 = L10_2.y
    L11_2 = L1_2.screencoords
    L11_2 = L11_2.z
    L12_2 = true
    L13_2 = true
    L14_2 = true
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L4_1.screen1 = L7_2
    L7_2 = SetEntityRotation
    L8_2 = L4_1.screen1
    L9_2 = L1_2.screenrotation
    L9_2 = L9_2.x
    L10_2 = L1_2.screenrotation
    L10_2 = L10_2.y
    L11_2 = L1_2.screenrotation
    L11_2 = L11_2.z
    L7_2(L8_2, L9_2, L10_2, L11_2)
    L7_2 = NetworkAllowLocalEntityAttachment
    L8_2 = L4_1.screen1
    L9_2 = true
    L7_2(L8_2, L9_2)
    L7_2 = FreezeEntityPosition
    L8_2 = L4_1.screen1
    L9_2 = true
    L7_2(L8_2, L9_2)
    L7_2 = SetEntityInvincible
    L8_2 = L4_1.screen1
    L9_2 = true
    L7_2(L8_2, L9_2)
    L7_2 = GetHashKey
    L8_2 = "sempre_delperropier_bus_red_screen"
    L7_2 = L7_2(L8_2)
    L8_2 = RequestModel
    L9_2 = L7_2
    L8_2(L9_2)
    while true do
      L8_2 = HasModelLoaded
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      if L8_2 then
        break
      end
      L8_2 = RequestModel
      L9_2 = L7_2
      L8_2(L9_2)
      L8_2 = Citizen
      L8_2 = L8_2.Wait
      L9_2 = 5
      L8_2(L9_2)
    end
    L8_2 = CreateObjectNoOffset
    L9_2 = L7_2
    L10_2 = L1_2.screencoords
    L10_2 = L10_2.x
    L11_2 = L1_2.screencoords
    L11_2 = L11_2.y
    L12_2 = L1_2.screencoords
    L12_2 = L12_2.z
    L13_2 = true
    L14_2 = true
    L15_2 = true
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L4_1.screen2 = L8_2
    L8_2 = SetEntityRotation
    L9_2 = L4_1.screen2
    L10_2 = L1_2.screenrotation
    L10_2 = L10_2.x
    L11_2 = L1_2.screenrotation
    L11_2 = L11_2.y
    L12_2 = L1_2.screenrotation
    L12_2 = L12_2.z
    L8_2(L9_2, L10_2, L11_2, L12_2)
    L8_2 = NetworkAllowLocalEntityAttachment
    L9_2 = L4_1.screen2
    L10_2 = true
    L8_2(L9_2, L10_2)
    L8_2 = FreezeEntityPosition
    L9_2 = L4_1.screen2
    L10_2 = true
    L8_2(L9_2, L10_2)
    L8_2 = SetEntityVisible
    L9_2 = L4_1.screen2
    L10_2 = false
    L8_2(L9_2, L10_2)
    L8_2 = SetEntityInvincible
    L9_2 = L4_1.screen2
    L10_2 = true
    L8_2(L9_2, L10_2)
    L8_2 = 0
    L1_1 = L8_2
    L8_2 = 0
    L2_1 = L8_2
    L8_2 = Config
    L8_2 = L8_2.AttractionsSettings
    L8_2 = L8_2.shootingrange
    L8_2 = L8_2.timetoshoot
    L8_1 = L8_2
    L8_2 = true
    L7_1 = L8_2
    L8_2 = SetFollowPedCamViewMode
    L9_2 = 4
    L8_2(L9_2)
    L8_2 = GiveWeaponToPed
    L9_2 = L2_2
    L10_2 = GetHashKey
    L11_2 = Config
    L11_2 = L11_2.AttractionsSettings
    L11_2 = L11_2.shootingrange
    L11_2 = L11_2.shootingrangeweapon
    L10_2 = L10_2(L11_2)
    L11_2 = 5
    L12_2 = false
    L13_2 = true
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    L8_2 = SendNUIMessage
    L9_2 = {}
    L9_2.message = "shootershow"
    L10_2 = L1_1
    L9_2.shootsdata = L10_2
    L10_2 = L2_1
    L9_2.missdata = L10_2
    L10_2 = L8_1
    L9_2.timedata = L10_2
    L8_2(L9_2)
    L8_2 = 1
    L9_2 = Config
    L9_2 = L9_2.AttractionsSettings
    L9_2 = L9_2.shootingrange
    L9_2 = L9_2.maxtargets
    L10_2 = 1
    for L11_2 = L8_2, L9_2, L10_2 do
      L12_2 = SpawnNewTarget
      L12_2()
    end
    while true do
      L8_2 = L7_1
      if not L8_2 then
        break
      end
      L8_2 = L2_1
      L9_2 = Config
      L9_2 = L9_2.AttractionsSettings
      L9_2 = L9_2.shootingrange
      L9_2 = L9_2.maxmistakes
      if not (L8_2 < L9_2) then
        break
      end
      L8_2 = GetEntityHeading
      L9_2 = L2_2
      L8_2 = L8_2(L9_2)
      L9_2 = L1_2.heading
      L9_2 = L9_2 + 0.1
      if not (L8_2 > L9_2) then
        L9_2 = L1_2.heading
        L9_2 = L9_2 - 0.1
        if not (L8_2 < L9_2) then
          goto lbl_291
        end
      end
      L9_2 = SetEntityHeading
      L10_2 = L2_2
      L11_2 = L1_2.heading
      L9_2(L10_2, L11_2)
      ::lbl_291::
      L9_2 = Citizen
      L9_2 = L9_2.Wait
      L10_2 = 0
      L9_2(L10_2)
      L9_2 = SetFollowPedCamViewMode
      L10_2 = 4
      L9_2(L10_2)
      L9_2 = SetControlNormal
      L10_2 = 0
      L11_2 = 25
      L12_2 = 1.0
      L9_2(L10_2, L11_2, L12_2)
      L9_2 = SetAmmoInClip
      L10_2 = L2_2
      L11_2 = GetHashKey
      L12_2 = Config
      L12_2 = L12_2.AttractionsSettings
      L12_2 = L12_2.shootingrange
      L12_2 = L12_2.shootingrangeweapon
      L11_2 = L11_2(L12_2)
      L12_2 = 1
      L9_2(L10_2, L11_2, L12_2)
      L9_2 = SetCurrentPedWeapon
      L10_2 = L2_2
      L11_2 = GetHashKey
      L12_2 = Config
      L12_2 = L12_2.AttractionsSettings
      L12_2 = L12_2.shootingrange
      L12_2 = L12_2.shootingrangeweapon
      L11_2 = L11_2(L12_2)
      L12_2 = true
      L9_2(L10_2, L11_2, L12_2)
    end
    L8_2 = SetFollowPedCamViewMode
    L9_2 = L4_2
    L8_2(L9_2)
    L8_2 = RemoveWeaponFromPed
    L9_2 = L2_2
    L10_2 = GetHashKey
    L11_2 = Config
    L11_2 = L11_2.AttractionsSettings
    L11_2 = L11_2.shootingrange
    L11_2 = L11_2.shootingrangeweapon
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2(L11_2)
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L8_2 = SetCurrentPedWeapon
    L9_2 = L2_2
    L10_2 = GetHashKey
    L11_2 = "WEAPON_UNARMED"
    L10_2 = L10_2(L11_2)
    L11_2 = true
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = ipairs
    L9_2 = L0_1
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = DoesEntityExist
      L15_2 = L13_2.handler
      L14_2 = L14_2(L15_2)
      if L14_2 then
        L14_2 = DeleteEntity
        L15_2 = L13_2.handler
        L14_2(L15_2)
      end
    end
    L8_2 = DoesEntityExist
    L9_2 = L3_1
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = DeleteEntity
      L9_2 = L3_1
      L8_2(L9_2)
    end
    L8_2 = DoesEntityExist
    L9_2 = L4_1.screen1
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = DeleteEntity
      L9_2 = L4_1.screen1
      L8_2(L9_2)
    end
    L8_2 = DoesEntityExist
    L9_2 = L4_1.screen2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = DeleteEntity
      L9_2 = L4_1.screen2
      L8_2(L9_2)
    end
    L8_2 = SendNUIMessage
    L9_2 = {}
    L9_2.message = "shooterendshow"
    L10_2 = L1_1
    L9_2.shootsdata = L10_2
    L10_2 = L2_1
    L9_2.missdata = L10_2
    L8_2(L9_2)
    L8_2 = TriggerServerEvent
    L9_2 = "rtx_themepark:Shooter:End"
    L10_2 = L9_1
    L11_2 = L1_1
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = {}
    L0_1 = L8_2
    L8_2 = 0
    L1_1 = L8_2
    L8_2 = 0
    L2_1 = L8_2
    L8_2 = nil
    L3_1 = L8_2
    L8_2 = {}
    L8_2.screen1 = nil
    L8_2.screen2 = nil
    L4_1 = L8_2
    L8_2 = false
    L7_1 = L8_2
    L8_2 = 0
    L8_1 = L8_2
    L8_2 = true
    L6_1 = L8_2
    L8_2 = FreezeEntityPosition
    L9_2 = L2_2
    L10_2 = false
    L8_2(L9_2, L10_2)
    L8_2 = Config
    L8_2 = L8_2.OxInventory
    if L8_2 then
      L8_2 = exports
      L8_2 = L8_2.ox_inventory
      L9_2 = L8_2
      L8_2 = L8_2.weaponWheel
      L10_2 = false
      L8_2(L9_2, L10_2)
    end
    L8_2 = TriggerEvent
    L9_2 = "rtx_themepark:Shooter:Started"
    L10_2 = false
    L8_2(L9_2, L10_2)
    L8_2 = Citizen
    L8_2 = L8_2.Wait
    L9_2 = 2500
    L8_2(L9_2)
    L8_2 = false
    L5_1 = L8_2
    L8_2 = nil
    L9_1 = L8_2
  end
end
L11_1(L12_1, L13_1)
L11_1 = Config
L11_1 = L11_1.Target
if true == L11_1 then
  L11_1 = RegisterNetEvent
  L12_1 = "rtx_themepark:Shooter:UseShooter"
  L11_1(L12_1)
  L11_1 = AddEventHandler
  L12_1 = "rtx_themepark:Shooter:UseShooter"
  function L13_1()
    local L0_2, L1_2, L2_2
    L0_2 = tickets
    if L0_2 ~= nil then
      L0_2 = L0_2.shootingrange
    else
      L0_2 = false
    end
    if true == L0_2 then
      L0_2 = L5_1
      if false == L0_2 then
        L0_2 = usingattraction
        if false == L0_2 then
          L0_2 = L10_1
          if nil ~= L0_2 then
            L0_2 = iteminhand
            if false == L0_2 then
              L0_2 = TriggerServerEvent
              L1_2 = "rtx_themepark:Shooter:Start"
              L2_2 = L10_1
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
  end
  L11_1(L12_1, L13_1)
end
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = 0.0
  L1_2 = 0.0
  L2_2 = math
  L2_2 = L2_2.random
  L3_2 = 1
  L4_2 = 2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = ""
  if 2 == L2_2 then
    L3_2 = "-"
  end
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = 1
  L6_2 = 2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = ""
  if 2 == L4_2 then
    L5_2 = "-"
  end
  L6_2 = math
  L6_2 = L6_2.random
  L7_2 = 14
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2 / 10
  L7_2 = math
  L7_2 = L7_2.random
  L8_2 = 7
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2 / 10
  L8_2 = tonumber
  L9_2 = ""
  L10_2 = L3_2
  L11_2 = ""
  L12_2 = L6_2
  L13_2 = ""
  L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L8_2 = L8_2(L9_2)
  L6_2 = L8_2
  L8_2 = tonumber
  L9_2 = ""
  L10_2 = L5_2
  L11_2 = ""
  L12_2 = L7_2
  L13_2 = ""
  L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L8_2 = L8_2(L9_2)
  L7_2 = L8_2
  L8_2 = L6_2
  L9_2 = L7_2
  return L8_2, L9_2
end
GenerateOffsetShoot = L11_1
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L0_2 = shooterhandler
  L0_2 = L0_2.shooters
  L1_2 = L9_1
  L0_2 = L0_2[L1_2]
  L1_2 = GetHashKey
  L2_2 = "sempre_delperropier_bus_target"
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
  L2_2 = CreateObjectNoOffset
  L3_2 = L1_2
  L4_2 = L0_2.screencoords
  L4_2 = L4_2.x
  L5_2 = L0_2.screencoords
  L5_2 = L5_2.y
  L6_2 = L0_2.screencoords
  L6_2 = L6_2.z
  L7_2 = true
  L8_2 = true
  L9_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L3_2 = NetworkAllowLocalEntityAttachment
  L4_2 = L2_2
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = FreezeEntityPosition
  L4_2 = L2_2
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = GenerateOffsetShoot
  L3_2, L4_2 = L3_2()
  L5_2 = AttachEntityToEntity
  L6_2 = L2_2
  L7_2 = L3_1
  L8_2 = 0
  L9_2 = 0.0
  L10_2 = L3_2
  L11_2 = L4_2
  L12_2 = 0.0
  L13_2 = 0.0
  L14_2 = 0.0
  L15_2 = false
  L16_2 = false
  L17_2 = true
  L18_2 = false
  L19_2 = 2
  L20_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L5_2 = SetEntityVisible
  L6_2 = L2_2
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = GenerateOffsetShoot
  L5_2, L6_2 = L5_2()
  L7_2 = table
  L7_2 = L7_2.insert
  L8_2 = L0_1
  L9_2 = {}
  L9_2.handler = L2_2
  L10_2 = {}
  L10_2.offset1 = L3_2
  L10_2.offset2 = L4_2
  L9_2.oldoffsets = L10_2
  L10_2 = {}
  L10_2.offset1 = L5_2
  L10_2.offset2 = L6_2
  L9_2.destinationoffsets = L10_2
  L7_2(L8_2, L9_2)
end
SpawnNewTarget = L11_1
L11_1 = Config
L11_1 = L11_1.AttractionsSettings
L11_1 = L11_1.shootingrange
L11_1 = L11_1.disable
if false == L11_1 then
  L11_1 = Citizen
  L11_1 = L11_1.CreateThread
  function L12_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = L7_1
      if true == L0_2 then
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 20
        L0_2(L1_2)
        L0_2 = GetHashKey
        L1_2 = Config
        L1_2 = L1_2.AttractionsSettings
        L1_2 = L1_2.shootingrange
        L1_2 = L1_2.shootingrangeweapon
        L0_2 = L0_2(L1_2)
        L1_2 = Config
        L1_2 = L1_2.AttractionsSettings
        L1_2 = L1_2.shootingrange
        L1_2 = L1_2.defaultspeed
        L2_2 = L1_1
        if L2_2 > 1 then
          L2_2 = L1_1
          L3_2 = Config
          L3_2 = L3_2.AttractionsSettings
          L3_2 = L3_2.shootingrange
          L3_2 = L3_2.maxpeektargets
          L2_2 = L2_2 / L3_2
          L2_2 = L2_2 * 100.0
          L3_2 = Config
          L3_2 = L3_2.AttractionsSettings
          L3_2 = L3_2.shootingrange
          L3_2 = L3_2.maxspeed
          L4_2 = Config
          L4_2 = L4_2.AttractionsSettings
          L4_2 = L4_2.shootingrange
          L4_2 = L4_2.defaultspeed
          L3_2 = L3_2 - L4_2
          L3_2 = L2_2 * L3_2
          L3_2 = L3_2 / 100
          L4_2 = Config
          L4_2 = L4_2.AttractionsSettings
          L4_2 = L4_2.shootingrange
          L4_2 = L4_2.defaultspeed
          L1_2 = L3_2 + L4_2
        end
        L2_2 = L1_1
        L3_2 = Config
        L3_2 = L3_2.AttractionsSettings
        L3_2 = L3_2.shootingrange
        L3_2 = L3_2.maxpeektargets
        if L2_2 > L3_2 then
          L2_2 = Config
          L2_2 = L2_2.AttractionsSettings
          L2_2 = L2_2.shootingrange
          L1_2 = L2_2.maxspeed
        end
        L2_2 = ipairs
        L3_2 = L0_1
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
        for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
          L8_2 = DoesEntityExist
          L9_2 = L7_2.handler
          L8_2 = L8_2(L9_2)
          if L8_2 then
            L8_2 = true
            L9_2 = L7_2.destinationoffsets
            L9_2 = L9_2.offset1
            if L9_2 > 0.0 then
              L9_2 = L7_2.oldoffsets
              L9_2 = L9_2.offset1
              L10_2 = L7_2.destinationoffsets
              L10_2 = L10_2.offset1
              if L9_2 < L10_2 then
                L9_2 = L7_2.oldoffsets
                L10_2 = L7_2.oldoffsets
                L10_2 = L10_2.offset1
                L10_2 = L10_2 + L1_2
                L9_2.offset1 = L10_2
                L8_2 = false
              end
            else
              L9_2 = L7_2.oldoffsets
              L9_2 = L9_2.offset1
              L10_2 = L7_2.destinationoffsets
              L10_2 = L10_2.offset1
              if L9_2 > L10_2 then
                L9_2 = L7_2.oldoffsets
                L10_2 = L7_2.oldoffsets
                L10_2 = L10_2.offset1
                L10_2 = L10_2 - L1_2
                L9_2.offset1 = L10_2
                L8_2 = false
              end
            end
            L9_2 = L7_2.destinationoffsets
            L9_2 = L9_2.offset2
            if L9_2 > 0.0 then
              L9_2 = L7_2.oldoffsets
              L9_2 = L9_2.offset2
              L10_2 = L7_2.destinationoffsets
              L10_2 = L10_2.offset2
              if L9_2 < L10_2 then
                L9_2 = L7_2.oldoffsets
                L10_2 = L7_2.oldoffsets
                L10_2 = L10_2.offset2
                L10_2 = L10_2 + L1_2
                L9_2.offset2 = L10_2
                L8_2 = false
              end
            else
              L9_2 = L7_2.oldoffsets
              L9_2 = L9_2.offset2
              L10_2 = L7_2.destinationoffsets
              L10_2 = L10_2.offset2
              if L9_2 > L10_2 then
                L9_2 = L7_2.oldoffsets
                L10_2 = L7_2.oldoffsets
                L10_2 = L10_2.offset2
                L10_2 = L10_2 - L1_2
                L9_2.offset2 = L10_2
                L8_2 = false
              end
            end
            if true == L8_2 then
              L9_2 = GenerateOffsetShoot
              L9_2, L10_2 = L9_2()
              L11_2 = L7_2.destinationoffsets
              L11_2.offset1 = L9_2
              L11_2 = L7_2.destinationoffsets
              L11_2.offset2 = L10_2
            end
            L9_2 = AttachEntityToEntity
            L10_2 = L7_2.handler
            L11_2 = L3_1
            L12_2 = 0
            L13_2 = 0.0
            L14_2 = L7_2.oldoffsets
            L14_2 = L14_2.offset1
            L15_2 = L7_2.oldoffsets
            L15_2 = L15_2.offset2
            L16_2 = 0.0
            L17_2 = 0.0
            L18_2 = 0.0
            L19_2 = false
            L20_2 = false
            L21_2 = true
            L22_2 = false
            L23_2 = 2
            L24_2 = true
            L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
            L9_2 = HasEntityBeenDamagedByWeapon
            L10_2 = L7_2.handler
            L11_2 = L0_2
            L9_2 = L9_2(L10_2, L11_2)
            if L9_2 then
              L9_2 = DeleteEntity
              L10_2 = L7_2.handler
              L9_2(L10_2)
              L9_2 = table
              L9_2 = L9_2.remove
              L10_2 = L0_1
              L11_2 = L6_2
              L9_2(L10_2, L11_2)
              L9_2 = L6_1
              if true == L9_2 then
                L9_2 = L1_1
                L9_2 = L9_2 + 1
                L1_1 = L9_2
                L9_2 = Config
                L9_2 = L9_2.AttractionsSettings
                L9_2 = L9_2.shootingrange
                L9_2 = L9_2.timetoshoot
                L8_1 = L9_2
                L9_2 = SendNUIMessage
                L10_2 = {}
                L10_2.message = "shootershow"
                L11_2 = L1_1
                L10_2.shootsdata = L11_2
                L11_2 = L2_1
                L10_2.missdata = L11_2
                L11_2 = L8_1
                L10_2.timedata = L11_2
                L9_2(L10_2)
                L9_2 = SendNUIMessage
                L10_2 = {}
                L10_2.message = "shooterhit"
                L10_2.hittext = "hit"
                L9_2(L10_2)
              else
                L9_2 = L2_1
                L9_2 = L9_2 + 1
                L2_1 = L9_2
                L9_2 = SendNUIMessage
                L10_2 = {}
                L10_2.message = "shootershow"
                L11_2 = L1_1
                L10_2.shootsdata = L11_2
                L11_2 = L2_1
                L10_2.missdata = L11_2
                L11_2 = L8_1
                L10_2.timedata = L11_2
                L9_2(L10_2)
                L9_2 = SendNUIMessage
                L10_2 = {}
                L10_2.message = "shooterhit"
                L10_2.hittext = "miss"
                L9_2(L10_2)
              end
              L9_2 = SpawnNewTarget
              L9_2()
            end
          end
        end
      else
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 1000
        L0_2(L1_2)
      end
    end
  end
  L11_1(L12_1)
  L11_1 = Citizen
  L11_1 = L11_1.CreateThread
  function L12_1()
    local L0_2, L1_2, L2_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 2500
      L0_2(L1_2)
      L0_2 = L7_1
      if true == L0_2 then
        L0_2 = L6_1
        if true == L0_2 then
          L0_2 = false
          L6_1 = L0_2
          L0_2 = SetEntityVisible
          L1_2 = L4_1.screen1
          L2_2 = false
          L0_2(L1_2, L2_2)
          L0_2 = SetEntityVisible
          L1_2 = L4_1.screen2
          L2_2 = true
          L0_2(L1_2, L2_2)
        else
          L0_2 = true
          L6_1 = L0_2
          L0_2 = SetEntityVisible
          L1_2 = L4_1.screen1
          L2_2 = true
          L0_2(L1_2, L2_2)
          L0_2 = SetEntityVisible
          L1_2 = L4_1.screen2
          L2_2 = false
          L0_2(L1_2, L2_2)
        end
        L0_2 = L6_1
        if true == L0_2 then
          L0_2 = math
          L0_2 = L0_2.random
          L1_2 = 2000
          L2_2 = 5000
          L0_2 = L0_2(L1_2, L2_2)
          L1_2 = Citizen
          L1_2 = L1_2.Wait
          L2_2 = L0_2
          L1_2(L2_2)
        end
      end
    end
  end
  L11_1(L12_1)
  L11_1 = Citizen
  L11_1 = L11_1.CreateThread
  function L12_1()
    local L0_2, L1_2, L2_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 1000
      L0_2(L1_2)
      L0_2 = L7_1
      if true == L0_2 then
        L0_2 = L6_1
        if true == L0_2 then
          L0_2 = L8_1
          if L0_2 > 1 then
            L0_2 = L8_1
            L0_2 = L0_2 - 1
            L8_1 = L0_2
          else
            L0_2 = false
            L7_1 = L0_2
          end
          L0_2 = SendNUIMessage
          L1_2 = {}
          L1_2.message = "shootershow"
          L2_2 = L1_1
          L1_2.shootsdata = L2_2
          L2_2 = L2_1
          L1_2.missdata = L2_2
          L2_2 = L8_1
          L1_2.timedata = L2_2
          L0_2(L1_2)
        end
      end
    end
  end
  L11_1(L12_1)
  L11_1 = Citizen
  L11_1 = L11_1.CreateThread
  function L12_1()
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
      L4_2 = tickets
      if L4_2 ~= nil then
        L4_2 = L4_2.shootingrange
      else
        L4_2 = false
      end
      if true == L4_2 then
        L4_2 = L5_1
        if false == L4_2 then
          L4_2 = ipairs
          L5_2 = shooterhandler
          L5_2 = L5_2.shooters
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
            L10_2 = L9_2.taken
            if false == L10_2 then
              L10_2 = playercurrentcoords
              L11_2 = L9_2.coords
              L10_2 = L10_2 - L11_2
              L10_2 = #L10_2
              if L10_2 < 20.0 then
                L11_2 = Config
                L11_2 = L11_2.AttractionsSettings
                L11_2 = L11_2.shootingrange
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
      end
      if L1_2 then
        L10_1 = L3_2
        L4_2 = usingattraction
        if false == L4_2 then
          L0_2 = false
          L4_2 = Config
          L4_2 = L4_2.Target
          if false == L4_2 then
            L4_2 = shooterhandler
            L4_2 = L4_2.shooters
            L5_2 = L10_1
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
              L7_2 = L7_2.pressforuseshootingrangeinteract
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
                L9_2 = L9_2.pressforuseshootingrange
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
                  L6_2 = L6_2.pressforuseshootingrangeinteractclassic
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
          L4_2 = L10_1
          if nil ~= L4_2 then
            L4_2 = SendNUIMessage
            L5_2 = {}
            L5_2.message = "hide"
            L4_2(L5_2)
          end
        end
        L4_2 = nil
        L10_1 = L4_2
      end
      if L0_2 then
        L4_2 = Citizen
        L4_2 = L4_2.Wait
        L5_2 = 1000
        L4_2(L5_2)
      end
    end
  end
  L11_1(L12_1)
end
L11_1 = Config
L11_1 = L11_1.Target
if false == L11_1 then
  L11_1 = RegisterCommand
  L12_1 = "useshootingrange"
  function L13_1()
    local L0_2, L1_2, L2_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = L10_1
      if nil ~= L0_2 then
        L0_2 = iteminhand
        if false == L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:Shooter:Start"
          L2_2 = L10_1
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
  L11_1(L12_1, L13_1)
  L11_1 = RegisterKeyMapping
  L12_1 = "useshootingrange"
  L13_1 = Language
  L14_1 = Config
  L14_1 = L14_1.Language
  L13_1 = L13_1[L14_1]
  L13_1 = L13_1.playshootingrange
  L14_1 = "keyboard"
  L15_1 = Config
  L15_1 = L15_1.AttractionsSettings
  L15_1 = L15_1.shootingrange
  L15_1 = L15_1.shootingrangeusekey
  L11_1(L12_1, L13_1, L14_1, L15_1)
end
