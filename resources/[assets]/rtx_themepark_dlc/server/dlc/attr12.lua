local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L0_1.started = false
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
slingshothandler = L0_1
L0_1 = GlobalState
L0_1["attraction12-phase"] = 0
L0_1 = GlobalState
L0_1["attraction12-ridedata1"] = 0.0
L0_1 = GlobalState
L0_1["attraction12-ridedata2"] = 0.0
L0_1 = GlobalState
L0_1["attraction12-speeddata1"] = 2.0
L0_1 = GlobalState
L0_1["attraction12-speeddata2"] = 2.0
L0_1 = GlobalState
L0_1["attraction12-rideway"] = 0.0
L0_1 = GlobalState
L0_1["attraction12-synchdata"] = 1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = slingshothandler
  L0_2.started = true
  L0_2 = true
  L1_2 = ipairs
  L2_2 = slingshothandler
  L2_2 = L2_2.seats
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.taken
    if true == L7_2 then
      L7_2 = TriggerClientEvent
      L8_2 = "rtx_themepark:SlingShot:SynchronizeSeat"
      L9_2 = -1
      L10_2 = L5_2
      L11_2 = true
      L12_2 = L6_2.takenplayerid
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    end
  end
  L1_2 = Citizen
  L1_2 = L1_2.Wait
  L2_2 = 1500
  L1_2(L2_2)
  L1_2 = TriggerClientEvent
  L2_2 = "rtx_themepark:Global:MusicStartAttraction"
  L3_2 = -1
  L4_2 = "slingshot"
  L5_2 = math
  L5_2 = L5_2.random
  L6_2 = 1
  L7_2 = Config
  L7_2 = L7_2.AttractionsMusic
  L7_2 = L7_2.slingshot
  L7_2 = L7_2.playlist
  L7_2 = #L7_2
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L5_2(L6_2, L7_2)
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L1_2 = GlobalState
  L1_2["attraction12-phase"] = 1
  L1_2 = GlobalState
  L1_2["attraction12-ridedata1"] = 0.0
  L1_2 = GlobalState
  L1_2["attraction12-ridedata2"] = 0.0
  L1_2 = GlobalState
  L1_2["attraction12-speeddata1"] = 2.0
  L1_2 = GlobalState
  L1_2["attraction12-speeddata2"] = 2.0
  L1_2 = GlobalState
  L1_2["attraction12-rideway"] = 1
  L1_2 = GlobalState
  L1_2["attraction12-synchdata"] = 1
  L1_2 = 0
  L2_2 = Config
  L2_2 = L2_2.AttractionsSettings
  L2_2 = L2_2.slingshot
  L2_2 = L2_2.maxrounds
  L3_2 = true
  L4_2 = 0.0
  L5_2 = 0.0
  L6_2 = 0
  while L0_2 do
    L7_2 = Config
    L7_2 = L7_2.AttractionsSettings
    L7_2 = L7_2.slingshot
    L7_2 = L7_2.maxrounds
    if not (L6_2 <= L7_2) then
      break
    end
    L7_2 = Citizen
    L7_2 = L7_2.Wait
    L8_2 = 20
    L7_2(L8_2)
    L7_2 = GlobalState
    L7_2 = L7_2["attraction12-rideway"]
    if 1 == L7_2 then
      L7_2 = GlobalState
      L7_2 = L7_2["attraction12-ridedata1"]
      if L7_2 < 50.0 then
        L7_2 = GlobalState
        L8_2 = GlobalState
        L8_2 = L8_2["attraction12-ridedata1"]
        L8_2 = L8_2 + 2.0
        L7_2["attraction12-ridedata1"] = L8_2
      else
        L7_2 = GlobalState
        L7_2["attraction12-rideway"] = 2
        L6_2 = L6_2 + 1
      end
    else
      L7_2 = GlobalState
      L7_2 = L7_2["attraction12-ridedata1"]
      if L7_2 > 5.0 then
        L7_2 = GlobalState
        L8_2 = GlobalState
        L8_2 = L8_2["attraction12-ridedata1"]
        L8_2 = L8_2 - 2.0
        L7_2["attraction12-ridedata1"] = L8_2
      else
        L7_2 = GlobalState
        L7_2["attraction12-rideway"] = 1
      end
    end
    L7_2 = GlobalState
    L7_2 = L7_2["attraction12-ridedata2"]
    L8_2 = 360.0
    if L7_2 > L8_2 then
      L7_2 = GlobalState
      L7_2 = L7_2["attraction12-ridedata2"]
      L7_2 = L7_2 - 360.0
      L8_2 = GlobalState
      L9_2 = 0.0 + L7_2
      L9_2 = L9_2 + 2.0
      L8_2["attraction12-ridedata2"] = L9_2
    else
      L7_2 = GlobalState
      L8_2 = GlobalState
      L8_2 = L8_2["attraction12-ridedata2"]
      L8_2 = L8_2 + 2.0
      L7_2["attraction12-ridedata2"] = L8_2
    end
    L7_2 = GlobalState
    L8_2 = GlobalState
    L8_2 = L8_2["attraction12-synchdata"]
    L8_2 = L8_2 + 1
    L7_2["attraction12-synchdata"] = L8_2
  end
  L7_2 = GlobalState
  L7_2["attraction12-phase"] = 2
  L7_2 = GlobalState
  L7_2["attraction12-rideway"] = 2
  L7_2 = GlobalState
  L8_2 = Config
  L8_2 = L8_2.AttractionsSettings
  L8_2 = L8_2.slingshot
  L8_2 = L8_2.speedmodifier
  L8_2 = 2.0 * L8_2
  L7_2["attraction12-speeddata2"] = L8_2
  while L0_2 do
    L7_2 = Citizen
    L7_2 = L7_2.Wait
    L8_2 = 20
    L7_2(L8_2)
    L7_2 = GlobalState
    L7_2 = L7_2["attraction12-ridedata1"]
    if L7_2 > 0.0 then
      L7_2 = GlobalState
      L7_2 = L7_2["attraction12-ridedata1"]
      if L7_2 < 1.0 then
        L7_2 = GlobalState
        L8_2 = GlobalState
        L8_2 = L8_2["attraction12-ridedata1"]
        L9_2 = Config
        L9_2 = L9_2.AttractionsSettings
        L9_2 = L9_2.slingshot
        L9_2 = L9_2.speedmodifier
        L9_2 = 0.01 * L9_2
        L8_2 = L8_2 - L9_2
        L7_2["attraction12-ridedata1"] = L8_2
        L7_2 = GlobalState
        L8_2 = Config
        L8_2 = L8_2.AttractionsSettings
        L8_2 = L8_2.slingshot
        L8_2 = L8_2.speedmodifier
        L8_2 = 0.01 * L8_2
        L7_2["attraction12-speeddata1"] = L8_2
      else
        L7_2 = GlobalState
        L7_2 = L7_2["attraction12-ridedata1"]
        if L7_2 < 2.0 then
          L7_2 = GlobalState
          L8_2 = GlobalState
          L8_2 = L8_2["attraction12-ridedata1"]
          L9_2 = Config
          L9_2 = L9_2.AttractionsSettings
          L9_2 = L9_2.slingshot
          L9_2 = L9_2.speedmodifier
          L9_2 = 0.05 * L9_2
          L8_2 = L8_2 - L9_2
          L7_2["attraction12-ridedata1"] = L8_2
          L7_2 = GlobalState
          L8_2 = Config
          L8_2 = L8_2.AttractionsSettings
          L8_2 = L8_2.slingshot
          L8_2 = L8_2.speedmodifier
          L8_2 = 0.05 * L8_2
          L7_2["attraction12-speeddata1"] = L8_2
        else
          L7_2 = GlobalState
          L7_2 = L7_2["attraction12-ridedata1"]
          if L7_2 < 3.0 then
            L7_2 = GlobalState
            L8_2 = GlobalState
            L8_2 = L8_2["attraction12-ridedata1"]
            L9_2 = Config
            L9_2 = L9_2.AttractionsSettings
            L9_2 = L9_2.slingshot
            L9_2 = L9_2.speedmodifier
            L9_2 = 0.1 * L9_2
            L8_2 = L8_2 - L9_2
            L7_2["attraction12-ridedata1"] = L8_2
            L7_2 = GlobalState
            L8_2 = Config
            L8_2 = L8_2.AttractionsSettings
            L8_2 = L8_2.slingshot
            L8_2 = L8_2.speedmodifier
            L8_2 = 0.1 * L8_2
            L7_2["attraction12-speeddata1"] = L8_2
          else
            L7_2 = GlobalState
            L7_2 = L7_2["attraction12-ridedata1"]
            if L7_2 < 5.0 then
              L7_2 = GlobalState
              L8_2 = GlobalState
              L8_2 = L8_2["attraction12-ridedata1"]
              L9_2 = Config
              L9_2 = L9_2.AttractionsSettings
              L9_2 = L9_2.slingshot
              L9_2 = L9_2.speedmodifier
              L9_2 = 0.25 * L9_2
              L8_2 = L8_2 - L9_2
              L7_2["attraction12-ridedata1"] = L8_2
              L7_2 = GlobalState
              L8_2 = Config
              L8_2 = L8_2.AttractionsSettings
              L8_2 = L8_2.slingshot
              L8_2 = L8_2.speedmodifier
              L8_2 = 0.25 * L8_2
              L7_2["attraction12-speeddata1"] = L8_2
            else
              L7_2 = GlobalState
              L7_2 = L7_2["attraction12-ridedata1"]
              if L7_2 < 10.0 then
                L7_2 = GlobalState
                L8_2 = GlobalState
                L8_2 = L8_2["attraction12-ridedata1"]
                L9_2 = Config
                L9_2 = L9_2.AttractionsSettings
                L9_2 = L9_2.slingshot
                L9_2 = L9_2.speedmodifier
                L9_2 = 0.5 * L9_2
                L8_2 = L8_2 - L9_2
                L7_2["attraction12-ridedata1"] = L8_2
                L7_2 = GlobalState
                L8_2 = Config
                L8_2 = L8_2.AttractionsSettings
                L8_2 = L8_2.slingshot
                L8_2 = L8_2.speedmodifier
                L8_2 = 0.5 * L8_2
                L7_2["attraction12-speeddata1"] = L8_2
              else
                L7_2 = GlobalState
                L7_2 = L7_2["attraction12-ridedata1"]
                if L7_2 < 15.0 then
                  L7_2 = GlobalState
                  L8_2 = GlobalState
                  L8_2 = L8_2["attraction12-ridedata1"]
                  L9_2 = Config
                  L9_2 = L9_2.AttractionsSettings
                  L9_2 = L9_2.slingshot
                  L9_2 = L9_2.speedmodifier
                  L9_2 = 0.75 * L9_2
                  L8_2 = L8_2 - L9_2
                  L7_2["attraction12-ridedata1"] = L8_2
                  L7_2 = GlobalState
                  L8_2 = Config
                  L8_2 = L8_2.AttractionsSettings
                  L8_2 = L8_2.slingshot
                  L8_2 = L8_2.speedmodifier
                  L8_2 = 0.75 * L8_2
                  L7_2["attraction12-speeddata1"] = L8_2
                else
                  L7_2 = GlobalState
                  L7_2 = L7_2["attraction12-ridedata1"]
                  if L7_2 < 20.0 then
                    L7_2 = GlobalState
                    L8_2 = GlobalState
                    L8_2 = L8_2["attraction12-ridedata1"]
                    L9_2 = Config
                    L9_2 = L9_2.AttractionsSettings
                    L9_2 = L9_2.slingshot
                    L9_2 = L9_2.speedmodifier
                    L9_2 = 1.0 * L9_2
                    L8_2 = L8_2 - L9_2
                    L7_2["attraction12-ridedata1"] = L8_2
                    L7_2 = GlobalState
                    L8_2 = Config
                    L8_2 = L8_2.AttractionsSettings
                    L8_2 = L8_2.slingshot
                    L8_2 = L8_2.speedmodifier
                    L8_2 = 1.0 * L8_2
                    L7_2["attraction12-speeddata1"] = L8_2
                  else
                    L7_2 = GlobalState
                    L7_2 = L7_2["attraction12-ridedata1"]
                    if L7_2 < 35.0 then
                      L7_2 = GlobalState
                      L8_2 = GlobalState
                      L8_2 = L8_2["attraction12-ridedata1"]
                      L9_2 = Config
                      L9_2 = L9_2.AttractionsSettings
                      L9_2 = L9_2.slingshot
                      L9_2 = L9_2.speedmodifier
                      L9_2 = 1.25 * L9_2
                      L8_2 = L8_2 - L9_2
                      L7_2["attraction12-ridedata1"] = L8_2
                      L7_2 = GlobalState
                      L8_2 = Config
                      L8_2 = L8_2.AttractionsSettings
                      L8_2 = L8_2.slingshot
                      L8_2 = L8_2.speedmodifier
                      L8_2 = 1.25 * L8_2
                      L7_2["attraction12-speeddata1"] = L8_2
                    else
                      L7_2 = GlobalState
                      L7_2 = L7_2["attraction12-ridedata1"]
                      if L7_2 < 40.0 then
                        L7_2 = GlobalState
                        L8_2 = GlobalState
                        L8_2 = L8_2["attraction12-ridedata1"]
                        L9_2 = Config
                        L9_2 = L9_2.AttractionsSettings
                        L9_2 = L9_2.slingshot
                        L9_2 = L9_2.speedmodifier
                        L9_2 = 1.5 * L9_2
                        L8_2 = L8_2 - L9_2
                        L7_2["attraction12-ridedata1"] = L8_2
                        L7_2 = GlobalState
                        L8_2 = Config
                        L8_2 = L8_2.AttractionsSettings
                        L8_2 = L8_2.slingshot
                        L8_2 = L8_2.speedmodifier
                        L8_2 = 1.5 * L8_2
                        L7_2["attraction12-speeddata1"] = L8_2
                      else
                        L7_2 = GlobalState
                        L8_2 = GlobalState
                        L8_2 = L8_2["attraction12-ridedata1"]
                        L9_2 = Config
                        L9_2 = L9_2.AttractionsSettings
                        L9_2 = L9_2.slingshot
                        L9_2 = L9_2.speedmodifier
                        L9_2 = 1.75 * L9_2
                        L8_2 = L8_2 - L9_2
                        L7_2["attraction12-ridedata1"] = L8_2
                        L7_2 = GlobalState
                        L8_2 = Config
                        L8_2 = L8_2.AttractionsSettings
                        L8_2 = L8_2.slingshot
                        L8_2 = L8_2.speedmodifier
                        L8_2 = 1.75 * L8_2
                        L7_2["attraction12-speeddata1"] = L8_2
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      L7_2 = GlobalState
      L7_2 = L7_2["attraction12-ridedata2"]
      L8_2 = 360.0
      if L7_2 < L8_2 then
        L7_2 = GlobalState
        L7_2 = L7_2["attraction12-ridedata2"]
        L8_2 = 0.25
        if L7_2 > L8_2 then
          L7_2 = GlobalState
          L8_2 = GlobalState
          L8_2 = L8_2["attraction12-ridedata2"]
          L9_2 = Config
          L9_2 = L9_2.AttractionsSettings
          L9_2 = L9_2.slingshot
          L9_2 = L9_2.speedmodifier
          L9_2 = 2.0 * L9_2
          L8_2 = L8_2 + L9_2
          L7_2["attraction12-ridedata2"] = L8_2
      end
      else
        L7_2 = GlobalState
        L7_2["attraction12-ridedata2"] = 0.0
        L7_2 = GlobalState
        L7_2["attraction12-rideway"] = 1
      end
    else
      L7_2 = GlobalState
      L7_2["attraction12-ridedata1"] = 0.0
      L7_2 = GlobalState
      L7_2 = L7_2["attraction12-rideway"]
      if 1 == L7_2 then
        L7_2 = GlobalState
        L7_2 = L7_2["attraction12-ridedata1"]
        if L7_2 <= 0.0 then
          L0_2 = false
        end
      end
    end
    L7_2 = GlobalState
    L8_2 = GlobalState
    L8_2 = L8_2["attraction12-synchdata"]
    L8_2 = L8_2 + 1
    L7_2["attraction12-synchdata"] = L8_2
  end
  L7_2 = TriggerClientEvent
  L8_2 = "rtx_themepark:Global:MusicStopAttraction"
  L9_2 = -1
  L10_2 = "slingshot"
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = GlobalState
  L7_2["attraction12-phase"] = 0
  L7_2 = ipairs
  L8_2 = slingshothandler
  L8_2 = L8_2.seats
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = L12_2.taken
    if true == L13_2 then
      L12_2.taken = false
      L13_2 = TriggerClientEvent
      L14_2 = "rtx_themepark:SlingShot:SynchronizeSeat"
      L15_2 = -1
      L16_2 = L11_2
      L17_2 = false
      L18_2 = L12_2.takenplayerid
      L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
      L13_2 = TriggerClientEvent
      L14_2 = "rtx_themepark:SlingShot:SeatExit"
      L15_2 = L12_2.takenplayerid
      L16_2 = true
      L13_2(L14_2, L15_2, L16_2)
      L13_2 = TriggerClientEvent
      L14_2 = "rtx_themepark:Global:AttractionUsing"
      L15_2 = L12_2.takenplayerid
      L16_2 = false
      L13_2(L14_2, L15_2, L16_2)
      L13_2 = TriggerClientEvent
      L14_2 = "rtx_themepark:Global:TicketHandler"
      L15_2 = L12_2.takenplayerid
      L16_2 = 12
      L17_2 = false
      L13_2(L14_2, L15_2, L16_2, L17_2)
      L12_2.takenplayerid = nil
    end
  end
  L7_2 = TriggerClientEvent
  L8_2 = "rtx_themepark:SlingShot:AttractionFinish"
  L9_2 = -1
  L7_2(L8_2, L9_2)
  L7_2 = slingshothandler
  L7_2.started = false
  L7_2 = slingshothandler
  L7_2.started = false
end
StartAttraction12 = L0_1
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:SlingShot:SeatUse"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:SlingShot:SeatUse"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = source
  L2_2 = themeparkattractionsopenstatus
  L2_2 = L2_2[13]
  if true == L2_2 then
    L2_2 = themeparkdisabled
    if false == L2_2 and nil ~= A0_2 then
      L2_2 = GlobalState
      L2_2 = L2_2["attraction12-phase"]
      if 0 == L2_2 then
        L2_2 = slingshothandler
        L2_2 = L2_2.seats
        L2_2 = L2_2[A0_2]
        L3_2 = L2_2.taken
        if false == L3_2 then
          L2_2.taken = true
          L2_2.takenplayerid = L1_2
          L3_2 = TriggerClientEvent
          L4_2 = "rtx_themepark:SlingShot:SynchronizeSeat"
          L5_2 = -1
          L6_2 = A0_2
          L7_2 = true
          L8_2 = L2_2.takenplayerid
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
          L3_2 = TriggerClientEvent
          L4_2 = "rtx_themepark:SlingShot:SeatData"
          L5_2 = L1_2
          L6_2 = A0_2
          L3_2(L4_2, L5_2, L6_2)
          L3_2 = TriggerClientEvent
          L4_2 = "rtx_themepark:Global:AttractionUsing"
          L5_2 = L1_2
          L6_2 = true
          L3_2(L4_2, L5_2, L6_2)
          L3_2 = slingshothandler
          L3_2 = L3_2.started
          if false == L3_2 then
            L3_2 = Config
            L3_2 = L3_2.ThemeParkControlAttractions
            if false == L3_2 then
              L3_2 = Wait
              L4_2 = Config
              L4_2 = L4_2.AttractionsSettings
              L4_2 = L4_2.slingshot
              L4_2 = L4_2.waitforplayers
              L3_2(L4_2)
              L3_2 = slingshothandler
              L3_2 = L3_2.started
              if false == L3_2 then
                L3_2 = slingshothandler
                L3_2.started = true
                L3_2 = StartAttraction12
                L3_2()
              end
            end
          end
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:SlingShot:ExitAttraction"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:SlingShot:ExitAttraction"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = source
  if nil ~= A0_2 then
    L2_2 = slingshothandler
    L2_2 = L2_2.seats
    L2_2 = L2_2[A0_2]
    L3_2 = L2_2.taken
    if true == L3_2 then
      L3_2 = L2_2.takenplayerid
      if L3_2 == L1_2 then
        L3_2 = Config
        L3_2 = L3_2.ThemeParkDisableExit
        if false ~= L3_2 then
          L3_2 = GlobalState
          L3_2 = L3_2["attraction12-phase"]
          if 0 ~= L3_2 then
            goto lbl_41
          end
        end
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:SlingShot:SynchronizeSeat"
        L5_2 = -1
        L6_2 = A0_2
        L7_2 = false
        L8_2 = L2_2.takenplayerid
        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:SlingShot:SeatExit"
        L5_2 = L2_2.takenplayerid
        L6_2 = false
        L3_2(L4_2, L5_2, L6_2)
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:Global:AttractionUsing"
        L5_2 = L2_2.takenplayerid
        L6_2 = false
        L3_2(L4_2, L5_2, L6_2)
        L2_2.taken = false
        L2_2.takenplayerid = nil
        goto lbl_50
        ::lbl_41::
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:Notify"
        L5_2 = L1_2
        L6_2 = Language
        L7_2 = Config
        L7_2 = L7_2.Language
        L6_2 = L6_2[L7_2]
        L6_2 = L6_2.inprogress
        L3_2(L4_2, L5_2, L6_2)
      end
    end
  end
  ::lbl_50::
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:SlingShot:Resynch"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:SlingShot:Resynch"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L0_2 = source
  L1_2 = ipairs
  L2_2 = slingshothandler
  L2_2 = L2_2.seats
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = ipairs
    L8_2 = L6_2.seats
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = TriggerClientEvent
      L14_2 = "rtx_themepark:SlingShot:SynchronizeSeat"
      L15_2 = L0_2
      L16_2 = L5_2
      L17_2 = L11_2
      L18_2 = L12_2.taken
      L19_2 = L12_2.takenplayerid
      L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    end
  end
  L1_2 = slingshothandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:SlingShot:ResynchClient"
    L3_2 = L0_2
    L1_2(L2_2, L3_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:SlingShot:Start"
function L2_1()
  local L0_2, L1_2
  L0_2 = slingshothandler
  L0_2 = L0_2.started
  if false == L0_2 then
    L0_2 = slingshothandler
    L0_2.started = true
    L0_2 = StartAttraction12
    L0_2()
  end
end
L0_1(L1_1, L2_1)
