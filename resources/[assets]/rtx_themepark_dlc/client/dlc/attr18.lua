local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = IsDuplicityVersion
L0_1 = L0_1()
if L0_1 then
  L0_1 = GetPlayerPositionInRealTime86
  L0_1()
end
L0_1 = nil
L1_1 = vector3
L2_1 = -1648.38
L3_1 = -1195.84
L4_1 = 14.2
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = nil
L3_1 = 1
L4_1 = RegisterNetEvent
L5_1 = "rtx_themepark:Cannon:PrepareBoom"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "rtx_themepark:Cannon:PrepareBoom"
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = GlobalState
  L0_2 = L0_2["attraction18-phase"]
  if 1 == L0_2 then
    L0_2 = GlobalState
    L0_2 = L0_2["attraction18-playerid"]
    L1_2 = GetPlayerServerId
    L2_2 = PlayerId
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L2_2()
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
    if L0_2 == L1_2 then
      L0_2 = PlayerPedId
      L0_2 = L0_2()
      L1_2 = vector3
      L2_2 = -1647.68
      L3_2 = -1195.15
      L4_2 = 15.1
      L1_2 = L1_2(L2_2, L3_2, L4_2)
      L2_2 = GetFollowPedCamViewMode
      L2_2 = L2_2()
      L3_1 = L2_2
      L2_2 = SetEntityCoordsNoOffset
      L3_2 = L0_2
      L4_2 = L1_2.x
      L5_2 = L1_2.y
      L6_2 = L1_2.z
      L2_2(L3_2, L4_2, L5_2, L6_2)
      boomactivated = true
      L2_2 = GetHashKey
      L3_2 = "prop_golf_ball"
      L2_2 = L2_2(L3_2)
      L3_2 = RequestModel
      L4_2 = L2_2
      L3_2(L4_2)
      while true do
        L3_2 = HasModelLoaded
        L4_2 = L2_2
        L3_2 = L3_2(L4_2)
        if L3_2 then
          break
        end
        L3_2 = RequestModel
        L4_2 = L2_2
        L3_2(L4_2)
        L3_2 = Citizen
        L3_2 = L3_2.Wait
        L4_2 = 5
        L3_2(L4_2)
      end
      L3_2 = DoesEntityExist
      L4_2 = L0_1
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L3_2 = DeleteEntity
        L4_2 = L0_1
        L3_2(L4_2)
      end
      L3_2 = CreateObjectNoOffset
      L4_2 = L2_2
      L5_2 = L1_2.x
      L6_2 = L1_2.y
      L7_2 = L1_2.z
      L8_2 = true
      L9_2 = true
      L10_2 = true
      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      L0_1 = L3_2
      L3_2 = SetEntityProofs
      L4_2 = L0_1
      L5_2 = true
      L6_2 = true
      L7_2 = true
      L8_2 = true
      L9_2 = true
      L10_2 = true
      L11_2 = true
      L12_2 = true
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L3_2 = SetEntityRotation
      L4_2 = L0_1
      L5_2 = 0.0
      L6_2 = 0.0
      L7_2 = 140.0
      L3_2(L4_2, L5_2, L6_2, L7_2)
      L3_2 = NetworkAllowLocalEntityAttachment
      L4_2 = L0_1
      L5_2 = true
      L3_2(L4_2, L5_2)
      L3_2 = FreezeEntityPosition
      L4_2 = L0_1
      L5_2 = true
      L3_2(L4_2, L5_2)
      L3_2 = SetEntityVisible
      L4_2 = L0_1
      L5_2 = false
      L3_2(L4_2, L5_2)
      L3_2 = SetEntityHeading
      L4_2 = L0_1
      L5_2 = 142.0
      L3_2(L4_2, L5_2)
      L3_2 = AttachEntityToEntity
      L4_2 = PlayerPedId
      L4_2 = L4_2()
      L5_2 = L0_1
      L6_2 = 0
      L7_2 = -0.025
      L8_2 = -1.0
      L9_2 = 0.35
      L10_2 = 20.0
      L11_2 = 0.0
      L12_2 = 0.0
      L13_2 = false
      L14_2 = false
      L15_2 = true
      L16_2 = true
      L17_2 = 2
      L18_2 = true
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
      L3_2 = "rtx_djn_themepark_canon_char"
      L4_2 = "rtx_djn_themepark_canon_char_anim"
      while true do
        L5_2 = HasAnimDictLoaded
        L6_2 = L3_2
        L5_2 = L5_2(L6_2)
        if L5_2 then
          break
        end
        L5_2 = RequestAnimDict
        L6_2 = L3_2
        L5_2(L6_2)
        L5_2 = Citizen
        L5_2 = L5_2.Wait
        L6_2 = 5
        L5_2(L6_2)
      end
      L5_2 = TaskPlayAnim
      L6_2 = L0_2
      L7_2 = L3_2
      L8_2 = L4_2
      L9_2 = 8.0
      L10_2 = 8.0
      L11_2 = -1
      L12_2 = 1
      L13_2 = 0
      L14_2 = 0
      L15_2 = 0
      L16_2 = 0
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L5_2 = SetFollowPedCamViewMode
      L6_2 = 4
      L5_2(L6_2)
    end
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "rtx_themepark:Cannon:StartBoom"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "rtx_themepark:Cannon:StartBoom"
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2
  L0_2 = GlobalState
  L0_2 = L0_2["attraction18-phase"]
  if 1 == L0_2 then
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = vector3
    L2_2 = -1647.68
    L3_2 = -1195.15
    L4_2 = 15.1
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    L2_2 = Config
    L2_2 = L2_2.AttractionsSettings
    L2_2 = L2_2.cannon
    L2_2 = L2_2.disableexplosion
    if false == L2_2 then
      L2_2 = AddExplosion
      L3_2 = L1_2.x
      L4_2 = L1_2.y
      L5_2 = L1_2.z
      L6_2 = 5
      L7_2 = 0.0
      L8_2 = true
      L9_2 = true
      L10_2 = 0.0
      L11_2 = false
      L12_2 = false
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    end
    L2_2 = HasNamedPtfxAssetLoaded
    L3_2 = "scr_indep_fireworks"
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = RequestNamedPtfxAsset
      L3_2 = "scr_indep_fireworks"
      L2_2(L3_2)
      while true do
        L2_2 = HasNamedPtfxAssetLoaded
        L3_2 = "scr_indep_fireworks"
        L2_2 = L2_2(L3_2)
        if L2_2 then
          break
        end
        L2_2 = Wait
        L3_2 = 10
        L2_2(L3_2)
      end
    end
    L2_2 = UseParticleFxAssetNextCall
    L3_2 = "scr_indep_fireworks"
    L2_2(L3_2)
    L2_2 = SetParticleFxNonLoopedColour
    L3_2 = 0.0
    L4_2 = 0.0
    L5_2 = 0.0
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = StartNetworkedParticleFxNonLoopedAtCoord
    L3_2 = "scr_indep_firework_burst_spawn"
    L4_2 = L1_2
    L5_2 = 0.0
    L6_2 = 0.0
    L7_2 = 0.0
    L8_2 = 0.5
    L9_2 = false
    L10_2 = false
    L11_2 = false
    L12_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L2_2 = RemoveNamedPtfxAsset
    L3_2 = "scr_indep_fireworks"
    L2_2(L3_2)
    L2_2 = GlobalState
    L2_2 = L2_2["attraction18-playerid"]
    L3_2 = GetPlayerServerId
    L4_2 = PlayerId
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2 = L4_2()
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2)
    if L2_2 == L3_2 then
      L2_2 = SetFollowPedCamViewMode
      L3_2 = 4
      L2_2(L3_2)
      L2_2 = FreezeEntityPosition
      L3_2 = L0_1
      L4_2 = false
      L2_2(L3_2, L4_2)
      L2_2 = SetEntityVisible
      L3_2 = L0_2
      L4_2 = true
      L2_2(L3_2, L4_2)
      L2_2 = SetEntityDynamic
      L3_2 = L0_1
      L4_2 = true
      L2_2(L3_2, L4_2)
      L2_2 = SetEntityProofs
      L3_2 = L0_1
      L4_2 = true
      L5_2 = true
      L6_2 = true
      L7_2 = true
      L8_2 = true
      L9_2 = true
      L10_2 = true
      L11_2 = true
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      L2_2 = -1738.98
      L3_2 = -1300.77
      L4_2 = 60.6
      L5_2 = table
      L5_2 = L5_2.unpack
      L6_2 = L1_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      L8_2 = 800.0
      L9_2 = L2_2 - L5_2
      L10_2 = L3_2 - L6_2
      L11_2 = L4_2 - L7_2
      L12_2 = math
      L12_2 = L12_2.sqrt
      L13_2 = L9_2 ^ 2
      L14_2 = L10_2 ^ 2
      L13_2 = L13_2 + L14_2
      L14_2 = L11_2 ^ 2
      L13_2 = L13_2 + L14_2
      L12_2 = L12_2(L13_2)
      L13_2 = L9_2 / L12_2
      L14_2 = L10_2 / L12_2
      L15_2 = L11_2 / L12_2
      L16_2 = L13_2 * L8_2
      L17_2 = L14_2 * L8_2
      L18_2 = L15_2 * L8_2
      L19_2 = ApplyForceToEntity
      L20_2 = L0_1
      L21_2 = 1
      L22_2 = L16_2
      L23_2 = L17_2
      L24_2 = L18_2
      L25_2 = 0.0
      L26_2 = 0.0
      L27_2 = 0.0
      L28_2 = 0
      L29_2 = 0
      L30_2 = true
      L31_2 = true
      L32_2 = true
      L33_2 = true
      L34_2 = true
      L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2)
      L19_2 = Citizen
      L19_2 = L19_2.CreateThread
      function L20_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3
        while true do
          L0_3 = Citizen
          L0_3 = L0_3.Wait
          L1_3 = 0
          L0_3(L1_3)
          L0_3 = SetFollowPedCamViewMode
          L1_3 = L3_1
          L0_3(L1_3)
          L0_3 = SetEntityRotation
          L1_3 = L0_1
          L2_3 = 0.0
          L3_3 = 0.0
          L4_3 = 140.0
          L0_3(L1_3, L2_3, L3_3, L4_3)
          L0_3 = IsEntityInWater
          L1_3 = L0_1
          L0_3 = L0_3(L1_3)
          if L0_3 then
            L0_3 = DetachEntity
            L1_3 = L0_2
            L0_3(L1_3)
            L0_3 = DeleteEntity
            L1_3 = L0_1
            L0_3(L1_3)
            L0_3 = FreezeEntityPosition
            L1_3 = L0_2
            L2_3 = false
            L0_3(L1_3, L2_3)
            L0_3 = ClearPedTasks
            L1_3 = L0_2
            L0_3(L1_3)
            break
          end
        end
      end
      L19_2(L20_2)
    end
  end
end
L4_1(L5_1, L6_1)
L4_1 = Config
L4_1 = L4_1.Target
if true == L4_1 then
  L4_1 = RegisterNetEvent
  L5_1 = "rtx_themepark:Cannon:SeatUseTarget"
  L4_1(L5_1)
  L4_1 = AddEventHandler
  L5_1 = "rtx_themepark:Cannon:SeatUseTarget"
  function L6_1()
    local L0_2, L1_2, L2_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = L2_1
      if nil ~= L0_2 then
        L0_2 = iteminhand
        if false == L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:Cannon:SeatUse"
          L0_2(L1_2)
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
  L4_1(L5_1, L6_1)
end
L4_1 = Config
L4_1 = L4_1.AttractionsSettings
L4_1 = L4_1.cannon
L4_1 = L4_1.disable
if false == L4_1 then
  L4_1 = Citizen
  L4_1 = L4_1.CreateThread
  function L5_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
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
      L4_2 = GlobalState
      L4_2 = L4_2["attraction18-phase"]
      if 0 == L4_2 then
        L4_2 = usingattraction
        if false == L4_2 then
          L4_2 = nearbythemepark
          if true == L4_2 then
            L4_2 = tickets
            L4_2 = L4_2.cannon
            if true == L4_2 then
              L4_2 = L1_1
              L4_2 = L2_2 - L4_2
              L4_2 = #L4_2
              if L4_2 < 20.0 then
                L5_2 = Config
                L5_2 = L5_2.AttractionsSettings
                L5_2 = L5_2.cannon
                L5_2 = L5_2.usedistance
                if L4_2 < L5_2 then
                  L3_2 = true
                end
              end
            end
          end
        end
      end
      if L3_2 then
        L4_2 = 1
        L2_1 = L4_2
        L4_2 = false
        L5_2 = usingattraction
        if false == L5_2 then
          L0_2 = false
          L5_2 = Config
          L5_2 = L5_2.Target
          if false == L5_2 then
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
              L4_2 = true
            else
              L5_2 = Config
              L5_2 = L5_2.ThemeParkInteractionSystem
              if 2 == L5_2 then
                L5_2 = DrawText3D
                L6_2 = L1_1.x
                L7_2 = L1_1.y
                L8_2 = L1_1.z
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
          L4_2 = L2_1
          if nil ~= L4_2 then
            L4_2 = SendNUIMessage
            L5_2 = {}
            L5_2.message = "hide"
            L4_2(L5_2)
          end
        end
        L4_2 = nil
        L2_1 = L4_2
      end
      if L0_2 then
        L4_2 = Citizen
        L4_2 = L4_2.Wait
        L5_2 = 1000
        L4_2(L5_2)
      end
    end
  end
  L4_1(L5_1)
end
L4_1 = Config
L4_1 = L4_1.Target
if false == L4_1 then
  L4_1 = RegisterCommand
  L5_1 = "usecannonseat"
  function L6_1()
    local L0_2, L1_2, L2_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = L2_1
      if nil ~= L0_2 then
        L0_2 = iteminhand
        if false == L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:Cannon:SeatUse"
          L0_2(L1_2)
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
  L4_1(L5_1, L6_1)
  L4_1 = RegisterKeyMapping
  L5_1 = "usecannonseat"
  L6_1 = Language
  L7_1 = Config
  L7_1 = L7_1.Language
  L6_1 = L6_1[L7_1]
  L6_1 = L6_1.bindrollercoasterseatuse
  L7_1 = "keyboard"
  L8_1 = Config
  L8_1 = L8_1.ThemeParkSeatKey
  L4_1(L5_1, L6_1, L7_1, L8_1)
end
