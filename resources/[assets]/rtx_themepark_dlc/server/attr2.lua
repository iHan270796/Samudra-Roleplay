local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = vector3
L2_1 = -1637.82959
L3_1 = -1099.2915
L4_1 = 16.8322926
L1_1 = L1_1(L2_1, L3_1, L4_1)
L0_1.coords = L1_1
L0_1.started = false
L0_1.currentrotation = 0.0
L0_1.currentrotation2 = 0.0
L0_1.currentrotation3 = 0.0
L0_1.currentrotation4 = 0.0
L0_1.stageinprogress = false
L0_1.stage = 15
L0_1.stagecounter = 0
L0_1.stagespeed = 0.5
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[1] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[2] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[3] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[4] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[5] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[6] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[7] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[8] = L4_1
L2_1.seats = L3_1
L1_1[1] = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[1] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[2] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[3] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[4] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[5] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[6] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[7] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[8] = L4_1
L2_1.seats = L3_1
L1_1[2] = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[1] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[2] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[3] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[4] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[5] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[6] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[7] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L3_1[8] = L4_1
L2_1.seats = L3_1
L1_1[3] = L2_1
L0_1.seats = L1_1
topscanhandler = L0_1
L0_1 = GlobalState
L0_1["attraction2-phase"] = 0
L0_1 = GlobalState
L0_1["attraction2-ridedata1"] = 0.0
L0_1 = GlobalState
L0_1["attraction2-ridedata2"] = 0.0
L0_1 = GlobalState
L0_1["attraction2-ridedata3"] = 0.0
L0_1 = GlobalState
L0_1["attraction2-ridedata4"] = 0.0
L0_1 = GlobalState
L0_1["attraction2-speeddata1"] = 0.1
L0_1 = GlobalState
L0_1["attraction2-synchdata"] = 1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L0_2 = topscanhandler
  L0_2 = L0_2.started
  if true == L0_2 then
    L0_2 = topscanhandler
    L0_2.stageinprogress = true
    L0_2 = topscanhandler
    L0_2.stage = 1
    L0_2 = topscanhandler
    L0_2.stagecounter = 0
    L0_2 = topscanhandler
    L0_2.stagespeed = 0.5
    L0_2 = GlobalState
    L0_2["attraction2-phase"] = 1
    L0_2 = GlobalState
    L0_2["attraction2-ridedata1"] = 0.0
    L0_2 = GlobalState
    L0_2["attraction2-ridedata2"] = 0.0
    L0_2 = GlobalState
    L0_2["attraction2-ridedata3"] = 0.0
    L0_2 = GlobalState
    L0_2["attraction2-ridedata4"] = 0.0
    L0_2 = GlobalState
    L0_2["attraction2-speeddata1"] = 0.1
    L0_2 = 93.0
    L1_2 = Config
    L1_2 = L1_2.AttractionsSettings
    L1_2 = L1_2.topscan
    L1_2 = L1_2.normalstyle
    if false == L1_2 then
      L0_2 = 35.0
    end
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
          L13_2 = pairs
          L14_2 = playsersinthemepark
          L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
          for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
            L19_2 = TriggerClientEvent
            L20_2 = "rtx_themepark:TopScan:SynchronizeSeat"
            L21_2 = L18_2
            L22_2 = L5_2
            L23_2 = L11_2
            L24_2 = true
            L25_2 = L12_2.takenplayerid
            L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
          end
          L13_2 = TriggerClientEvent
          L14_2 = "rtx_themepark:Global:AttractionUsing"
          L15_2 = L12_2.takenplayerid
          L16_2 = true
          L13_2(L14_2, L15_2, L16_2)
        end
      end
    end
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Global:MusicStartAttraction"
    L3_2 = -1
    L4_2 = "topscan"
    L5_2 = math
    L5_2 = L5_2.random
    L6_2 = 1
    L7_2 = Config
    L7_2 = L7_2.AttractionsMusic
    L7_2 = L7_2.topscan
    L7_2 = L7_2.playlist
    L7_2 = #L7_2
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L5_2(L6_2, L7_2)
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    while true do
      L1_2 = topscanhandler
      L1_2 = L1_2.stageinprogress
      if true ~= L1_2 then
        break
      end
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 20
      L1_2(L2_2)
      L1_2 = topscanhandler
      L1_2 = L1_2.stage
      if 1 == L1_2 then
        L1_2 = topscanhandler
        L2_2 = Config
        L2_2 = L2_2.AttractionsSettings
        L2_2 = L2_2.topscan
        L2_2 = L2_2.speedmodifier
        L2_2 = 0.1 * L2_2
        L1_2.stagespeed = L2_2
        L1_2 = topscanhandler
        L1_2.stagecounter = 0
        L1_2 = topscanhandler
        L1_2 = L1_2.currentrotation
        if L0_2 < L1_2 then
          L1_2 = topscanhandler
          L1_2.stage = 2
          L1_2 = topscanhandler
          L1_2.stagecounter = 0
          L1_2 = topscanhandler
          L1_2.currentrotation = L0_2
        end
        L1_2 = topscanhandler
        L2_2 = topscanhandler
        L2_2 = L2_2.currentrotation
        L3_2 = topscanhandler
        L3_2 = L3_2.stagespeed
        L2_2 = L2_2 + L3_2
        L1_2.currentrotation = L2_2
      else
        L1_2 = topscanhandler
        L1_2 = L1_2.stage
        if 2 == L1_2 then
          L1_2 = topscanhandler
          L2_2 = Config
          L2_2 = L2_2.AttractionsSettings
          L2_2 = L2_2.topscan
          L2_2 = L2_2.speedmodifier
          L2_2 = 0.25 * L2_2
          L1_2.stagespeed = L2_2
          L1_2 = topscanhandler
          L2_2 = topscanhandler
          L2_2 = L2_2.stagecounter
          L2_2 = L2_2 + 1.0
          L1_2.stagecounter = L2_2
          L1_2 = topscanhandler
          L1_2 = L1_2.stagecounter
          L2_2 = 250.0
          if L1_2 > L2_2 then
            L1_2 = topscanhandler
            L1_2.stage = 3
            L1_2 = topscanhandler
            L1_2.stagecounter = 0
          end
          L1_2 = topscanhandler
          L2_2 = topscanhandler
          L2_2 = L2_2.currentrotation2
          L3_2 = topscanhandler
          L3_2 = L3_2.stagespeed
          L2_2 = L2_2 + L3_2
          L1_2.currentrotation2 = L2_2
          L1_2 = topscanhandler
          L2_2 = topscanhandler
          L2_2 = L2_2.currentrotation3
          L3_2 = topscanhandler
          L3_2 = L3_2.stagespeed
          L2_2 = L2_2 + L3_2
          L1_2.currentrotation3 = L2_2
          L1_2 = topscanhandler
          L2_2 = topscanhandler
          L2_2 = L2_2.currentrotation4
          L3_2 = topscanhandler
          L3_2 = L3_2.stagespeed
          L2_2 = L2_2 + L3_2
          L1_2.currentrotation4 = L2_2
        else
          L1_2 = topscanhandler
          L1_2 = L1_2.stage
          if 3 == L1_2 then
            L1_2 = topscanhandler
            L2_2 = Config
            L2_2 = L2_2.AttractionsSettings
            L2_2 = L2_2.topscan
            L2_2 = L2_2.speedmodifier
            L2_2 = 0.5 * L2_2
            L1_2.stagespeed = L2_2
            L1_2 = topscanhandler
            L2_2 = topscanhandler
            L2_2 = L2_2.stagecounter
            L2_2 = L2_2 + 1.0
            L1_2.stagecounter = L2_2
            L1_2 = topscanhandler
            L1_2 = L1_2.stagecounter
            L2_2 = 250.0
            if L1_2 > L2_2 then
              L1_2 = topscanhandler
              L1_2.stage = 4
              L1_2 = topscanhandler
              L1_2.stagecounter = 0
            end
            L1_2 = topscanhandler
            L2_2 = topscanhandler
            L2_2 = L2_2.currentrotation2
            L3_2 = topscanhandler
            L3_2 = L3_2.stagespeed
            L2_2 = L2_2 + L3_2
            L1_2.currentrotation2 = L2_2
            L1_2 = topscanhandler
            L2_2 = topscanhandler
            L2_2 = L2_2.currentrotation3
            L3_2 = topscanhandler
            L3_2 = L3_2.stagespeed
            L2_2 = L2_2 + L3_2
            L1_2.currentrotation3 = L2_2
            L1_2 = topscanhandler
            L2_2 = topscanhandler
            L2_2 = L2_2.currentrotation4
            L3_2 = topscanhandler
            L3_2 = L3_2.stagespeed
            L2_2 = L2_2 + L3_2
            L1_2.currentrotation4 = L2_2
          else
            L1_2 = topscanhandler
            L1_2 = L1_2.stage
            if 4 == L1_2 then
              L1_2 = topscanhandler
              L2_2 = Config
              L2_2 = L2_2.AttractionsSettings
              L2_2 = L2_2.topscan
              L2_2 = L2_2.speedmodifier
              L2_2 = 0.75 * L2_2
              L1_2.stagespeed = L2_2
              L1_2 = topscanhandler
              L2_2 = topscanhandler
              L2_2 = L2_2.stagecounter
              L2_2 = L2_2 + 1.0
              L1_2.stagecounter = L2_2
              L1_2 = topscanhandler
              L1_2 = L1_2.stagecounter
              L2_2 = 250.0
              if L1_2 > L2_2 then
                L1_2 = topscanhandler
                L1_2.stage = 5
                L1_2 = topscanhandler
                L1_2.stagecounter = 0
              end
              L1_2 = topscanhandler
              L2_2 = topscanhandler
              L2_2 = L2_2.currentrotation2
              L3_2 = topscanhandler
              L3_2 = L3_2.stagespeed
              L2_2 = L2_2 + L3_2
              L1_2.currentrotation2 = L2_2
              L1_2 = topscanhandler
              L2_2 = topscanhandler
              L2_2 = L2_2.currentrotation3
              L3_2 = topscanhandler
              L3_2 = L3_2.stagespeed
              L2_2 = L2_2 + L3_2
              L1_2.currentrotation3 = L2_2
              L1_2 = topscanhandler
              L2_2 = topscanhandler
              L2_2 = L2_2.currentrotation4
              L3_2 = topscanhandler
              L3_2 = L3_2.stagespeed
              L2_2 = L2_2 + L3_2
              L1_2.currentrotation4 = L2_2
            else
              L1_2 = topscanhandler
              L1_2 = L1_2.stage
              if 5 == L1_2 then
                L1_2 = topscanhandler
                L2_2 = Config
                L2_2 = L2_2.AttractionsSettings
                L2_2 = L2_2.topscan
                L2_2 = L2_2.speedmodifier
                L2_2 = 1.0 * L2_2
                L1_2.stagespeed = L2_2
                L1_2 = topscanhandler
                L2_2 = topscanhandler
                L2_2 = L2_2.stagecounter
                L2_2 = L2_2 + 1.0
                L1_2.stagecounter = L2_2
                L1_2 = topscanhandler
                L1_2 = L1_2.stagecounter
                L2_2 = 250.0
                if L1_2 > L2_2 then
                  L1_2 = topscanhandler
                  L1_2.stage = 6
                  L1_2 = topscanhandler
                  L1_2.stagecounter = 0
                end
                L1_2 = topscanhandler
                L2_2 = topscanhandler
                L2_2 = L2_2.currentrotation2
                L3_2 = topscanhandler
                L3_2 = L3_2.stagespeed
                L2_2 = L2_2 + L3_2
                L1_2.currentrotation2 = L2_2
                L1_2 = topscanhandler
                L2_2 = topscanhandler
                L2_2 = L2_2.currentrotation3
                L3_2 = topscanhandler
                L3_2 = L3_2.stagespeed
                L2_2 = L2_2 + L3_2
                L1_2.currentrotation3 = L2_2
                L1_2 = topscanhandler
                L2_2 = topscanhandler
                L2_2 = L2_2.currentrotation4
                L3_2 = topscanhandler
                L3_2 = L3_2.stagespeed
                L2_2 = L2_2 + L3_2
                L1_2.currentrotation4 = L2_2
              else
                L1_2 = topscanhandler
                L1_2 = L1_2.stage
                if 6 == L1_2 then
                  L1_2 = topscanhandler
                  L2_2 = Config
                  L2_2 = L2_2.AttractionsSettings
                  L2_2 = L2_2.topscan
                  L2_2 = L2_2.speedmodifier
                  L2_2 = 1.5 * L2_2
                  L1_2.stagespeed = L2_2
                  L1_2 = topscanhandler
                  L2_2 = topscanhandler
                  L2_2 = L2_2.stagecounter
                  L2_2 = L2_2 + 1.0
                  L1_2.stagecounter = L2_2
                  L1_2 = topscanhandler
                  L1_2 = L1_2.stagecounter
                  L2_2 = 250.0
                  if L1_2 > L2_2 then
                    L1_2 = topscanhandler
                    L1_2.stage = 7
                    L1_2 = topscanhandler
                    L1_2.stagecounter = 0
                  end
                  L1_2 = topscanhandler
                  L2_2 = topscanhandler
                  L2_2 = L2_2.currentrotation2
                  L3_2 = topscanhandler
                  L3_2 = L3_2.stagespeed
                  L2_2 = L2_2 + L3_2
                  L1_2.currentrotation2 = L2_2
                  L1_2 = topscanhandler
                  L2_2 = topscanhandler
                  L2_2 = L2_2.currentrotation3
                  L3_2 = topscanhandler
                  L3_2 = L3_2.stagespeed
                  L2_2 = L2_2 + L3_2
                  L1_2.currentrotation3 = L2_2
                  L1_2 = topscanhandler
                  L2_2 = topscanhandler
                  L2_2 = L2_2.currentrotation4
                  L3_2 = topscanhandler
                  L3_2 = L3_2.stagespeed
                  L2_2 = L2_2 + L3_2
                  L1_2.currentrotation4 = L2_2
                else
                  L1_2 = topscanhandler
                  L1_2 = L1_2.stage
                  if 7 == L1_2 then
                    L1_2 = topscanhandler
                    L2_2 = Config
                    L2_2 = L2_2.AttractionsSettings
                    L2_2 = L2_2.topscan
                    L2_2 = L2_2.speedmodifier
                    L2_2 = 2.5 * L2_2
                    L1_2.stagespeed = L2_2
                    L1_2 = topscanhandler
                    L2_2 = topscanhandler
                    L2_2 = L2_2.currentrotation2
                    L3_2 = topscanhandler
                    L3_2 = L3_2.stagespeed
                    L2_2 = L2_2 + L3_2
                    L1_2.currentrotation2 = L2_2
                    L1_2 = topscanhandler
                    L2_2 = topscanhandler
                    L2_2 = L2_2.currentrotation3
                    L3_2 = topscanhandler
                    L3_2 = L3_2.stagespeed
                    L2_2 = L2_2 + L3_2
                    L1_2.currentrotation3 = L2_2
                    L1_2 = topscanhandler
                    L2_2 = topscanhandler
                    L2_2 = L2_2.currentrotation4
                    L3_2 = topscanhandler
                    L3_2 = L3_2.stagespeed
                    L2_2 = L2_2 + L3_2
                    L1_2.currentrotation4 = L2_2
                    L1_2 = topscanhandler
                    L1_2 = L1_2.currentrotation2
                    L2_2 = 359.9
                    if L1_2 > L2_2 then
                      L1_2 = topscanhandler
                      L2_2 = topscanhandler
                      L2_2 = L2_2.stagecounter
                      L2_2 = L2_2 + 1
                      L1_2.stagecounter = L2_2
                      L1_2 = topscanhandler
                      L1_2 = L1_2.stagecounter
                      L2_2 = Config
                      L2_2 = L2_2.AttractionsSettings
                      L2_2 = L2_2.topscan
                      L2_2 = L2_2.maxrounds
                      if L1_2 > L2_2 then
                        L1_2 = topscanhandler
                        L1_2.stage = 8
                        L1_2 = topscanhandler
                        L1_2.stagecounter = 0
                      end
                    end
                  else
                    L1_2 = topscanhandler
                    L1_2 = L1_2.stage
                    if 8 == L1_2 then
                      L1_2 = topscanhandler
                      L2_2 = Config
                      L2_2 = L2_2.AttractionsSettings
                      L2_2 = L2_2.topscan
                      L2_2 = L2_2.speedmodifier
                      L2_2 = 1.5 * L2_2
                      L1_2.stagespeed = L2_2
                      L1_2 = topscanhandler
                      L2_2 = topscanhandler
                      L2_2 = L2_2.stagecounter
                      L2_2 = L2_2 + 1.0
                      L1_2.stagecounter = L2_2
                      L1_2 = topscanhandler
                      L1_2 = L1_2.stagecounter
                      if L1_2 > 100.0 then
                        L1_2 = topscanhandler
                        L1_2.stage = 9
                        L1_2 = topscanhandler
                        L1_2.stagecounter = 0
                      end
                      L1_2 = topscanhandler
                      L2_2 = topscanhandler
                      L2_2 = L2_2.currentrotation2
                      L3_2 = topscanhandler
                      L3_2 = L3_2.stagespeed
                      L2_2 = L2_2 + L3_2
                      L1_2.currentrotation2 = L2_2
                      L1_2 = topscanhandler
                      L2_2 = topscanhandler
                      L2_2 = L2_2.currentrotation3
                      L3_2 = topscanhandler
                      L3_2 = L3_2.stagespeed
                      L2_2 = L2_2 + L3_2
                      L1_2.currentrotation3 = L2_2
                      L1_2 = topscanhandler
                      L2_2 = topscanhandler
                      L2_2 = L2_2.currentrotation4
                      L3_2 = topscanhandler
                      L3_2 = L3_2.stagespeed
                      L2_2 = L2_2 + L3_2
                      L1_2.currentrotation4 = L2_2
                    else
                      L1_2 = topscanhandler
                      L1_2 = L1_2.stage
                      if 9 == L1_2 then
                        L1_2 = topscanhandler
                        L2_2 = Config
                        L2_2 = L2_2.AttractionsSettings
                        L2_2 = L2_2.topscan
                        L2_2 = L2_2.speedmodifier
                        L2_2 = 1.0 * L2_2
                        L1_2.stagespeed = L2_2
                        L1_2 = topscanhandler
                        L2_2 = topscanhandler
                        L2_2 = L2_2.stagecounter
                        L2_2 = L2_2 + 1.0
                        L1_2.stagecounter = L2_2
                        L1_2 = topscanhandler
                        L1_2 = L1_2.stagecounter
                        if L1_2 > 100.0 then
                          L1_2 = topscanhandler
                          L1_2.stage = 10
                          L1_2 = topscanhandler
                          L1_2.stagecounter = 0
                        end
                        L1_2 = topscanhandler
                        L2_2 = topscanhandler
                        L2_2 = L2_2.currentrotation2
                        L3_2 = topscanhandler
                        L3_2 = L3_2.stagespeed
                        L2_2 = L2_2 + L3_2
                        L1_2.currentrotation2 = L2_2
                        L1_2 = topscanhandler
                        L2_2 = topscanhandler
                        L2_2 = L2_2.currentrotation3
                        L3_2 = topscanhandler
                        L3_2 = L3_2.stagespeed
                        L2_2 = L2_2 + L3_2
                        L1_2.currentrotation3 = L2_2
                        L1_2 = topscanhandler
                        L2_2 = topscanhandler
                        L2_2 = L2_2.currentrotation4
                        L3_2 = topscanhandler
                        L3_2 = L3_2.stagespeed
                        L2_2 = L2_2 + L3_2
                        L1_2.currentrotation4 = L2_2
                      else
                        L1_2 = topscanhandler
                        L1_2 = L1_2.stage
                        if 10 == L1_2 then
                          L1_2 = topscanhandler
                          L2_2 = Config
                          L2_2 = L2_2.AttractionsSettings
                          L2_2 = L2_2.topscan
                          L2_2 = L2_2.speedmodifier
                          L2_2 = 0.75 * L2_2
                          L1_2.stagespeed = L2_2
                          L1_2 = topscanhandler
                          L2_2 = topscanhandler
                          L2_2 = L2_2.stagecounter
                          L2_2 = L2_2 + 1.0
                          L1_2.stagecounter = L2_2
                          L1_2 = topscanhandler
                          L1_2 = L1_2.stagecounter
                          if L1_2 > 100.0 then
                            L1_2 = topscanhandler
                            L1_2.stage = 11
                            L1_2 = topscanhandler
                            L1_2.stagecounter = 0
                          end
                          L1_2 = topscanhandler
                          L2_2 = topscanhandler
                          L2_2 = L2_2.currentrotation2
                          L3_2 = topscanhandler
                          L3_2 = L3_2.stagespeed
                          L2_2 = L2_2 + L3_2
                          L1_2.currentrotation2 = L2_2
                          L1_2 = topscanhandler
                          L2_2 = topscanhandler
                          L2_2 = L2_2.currentrotation3
                          L3_2 = topscanhandler
                          L3_2 = L3_2.stagespeed
                          L2_2 = L2_2 + L3_2
                          L1_2.currentrotation3 = L2_2
                          L1_2 = topscanhandler
                          L2_2 = topscanhandler
                          L2_2 = L2_2.currentrotation4
                          L3_2 = topscanhandler
                          L3_2 = L3_2.stagespeed
                          L2_2 = L2_2 + L3_2
                          L1_2.currentrotation4 = L2_2
                        else
                          L1_2 = topscanhandler
                          L1_2 = L1_2.stage
                          if 11 == L1_2 then
                            L1_2 = topscanhandler
                            L2_2 = Config
                            L2_2 = L2_2.AttractionsSettings
                            L2_2 = L2_2.topscan
                            L2_2 = L2_2.speedmodifier
                            L2_2 = 0.5 * L2_2
                            L1_2.stagespeed = L2_2
                            L1_2 = topscanhandler
                            L2_2 = topscanhandler
                            L2_2 = L2_2.stagecounter
                            L2_2 = L2_2 + 1.0
                            L1_2.stagecounter = L2_2
                            L1_2 = topscanhandler
                            L1_2 = L1_2.stagecounter
                            if L1_2 > 100.0 then
                              L1_2 = topscanhandler
                              L1_2.stage = 12
                              L1_2 = topscanhandler
                              L1_2.stagecounter = 0
                            end
                            L1_2 = topscanhandler
                            L2_2 = topscanhandler
                            L2_2 = L2_2.currentrotation2
                            L3_2 = topscanhandler
                            L3_2 = L3_2.stagespeed
                            L2_2 = L2_2 + L3_2
                            L1_2.currentrotation2 = L2_2
                            L1_2 = topscanhandler
                            L2_2 = topscanhandler
                            L2_2 = L2_2.currentrotation3
                            L3_2 = topscanhandler
                            L3_2 = L3_2.stagespeed
                            L2_2 = L2_2 + L3_2
                            L1_2.currentrotation3 = L2_2
                            L1_2 = topscanhandler
                            L2_2 = topscanhandler
                            L2_2 = L2_2.currentrotation4
                            L3_2 = topscanhandler
                            L3_2 = L3_2.stagespeed
                            L2_2 = L2_2 + L3_2
                            L1_2.currentrotation4 = L2_2
                          else
                            L1_2 = topscanhandler
                            L1_2 = L1_2.stage
                            if 12 == L1_2 then
                              L1_2 = topscanhandler
                              L2_2 = Config
                              L2_2 = L2_2.AttractionsSettings
                              L2_2 = L2_2.topscan
                              L2_2 = L2_2.speedmodifier
                              L2_2 = 0.25 * L2_2
                              L1_2.stagespeed = L2_2
                              L1_2 = topscanhandler
                              L2_2 = topscanhandler
                              L2_2 = L2_2.stagecounter
                              L2_2 = L2_2 + 1.0
                              L1_2.stagecounter = L2_2
                              L1_2 = topscanhandler
                              L1_2 = L1_2.stagecounter
                              if L1_2 > 100.0 then
                                L1_2 = topscanhandler
                                L1_2.stage = 13
                                L1_2 = topscanhandler
                                L1_2.stagecounter = 0
                              end
                              L1_2 = topscanhandler
                              L2_2 = topscanhandler
                              L2_2 = L2_2.currentrotation2
                              L3_2 = topscanhandler
                              L3_2 = L3_2.stagespeed
                              L2_2 = L2_2 + L3_2
                              L1_2.currentrotation2 = L2_2
                              L1_2 = topscanhandler
                              L2_2 = topscanhandler
                              L2_2 = L2_2.currentrotation3
                              L3_2 = topscanhandler
                              L3_2 = L3_2.stagespeed
                              L2_2 = L2_2 + L3_2
                              L1_2.currentrotation3 = L2_2
                              L1_2 = topscanhandler
                              L2_2 = topscanhandler
                              L2_2 = L2_2.currentrotation4
                              L3_2 = topscanhandler
                              L3_2 = L3_2.stagespeed
                              L2_2 = L2_2 + L3_2
                              L1_2.currentrotation4 = L2_2
                            else
                              L1_2 = topscanhandler
                              L1_2 = L1_2.stage
                              if 13 == L1_2 then
                                L1_2 = topscanhandler
                                L2_2 = Config
                                L2_2 = L2_2.AttractionsSettings
                                L2_2 = L2_2.topscan
                                L2_2 = L2_2.speedmodifier
                                L2_2 = 0.25 * L2_2
                                L1_2.stagespeed = L2_2
                                L1_2 = topscanhandler
                                L1_2 = L1_2.currentrotation2
                                L2_2 = 360.0
                                if L1_2 < L2_2 then
                                  L1_2 = topscanhandler
                                  L1_2 = L1_2.currentrotation
                                  L2_2 = 0.25
                                  if L1_2 > L2_2 then
                                    L1_2 = topscanhandler
                                    L2_2 = topscanhandler
                                    L2_2 = L2_2.currentrotation2
                                    L3_2 = topscanhandler
                                    L3_2 = L3_2.stagespeed
                                    L2_2 = L2_2 + L3_2
                                    L1_2.currentrotation2 = L2_2
                                    L1_2 = topscanhandler
                                    L2_2 = topscanhandler
                                    L2_2 = L2_2.currentrotation3
                                    L3_2 = topscanhandler
                                    L3_2 = L3_2.stagespeed
                                    L2_2 = L2_2 + L3_2
                                    L1_2.currentrotation3 = L2_2
                                    L1_2 = topscanhandler
                                    L2_2 = topscanhandler
                                    L2_2 = L2_2.currentrotation4
                                    L3_2 = topscanhandler
                                    L3_2 = L3_2.stagespeed
                                    L2_2 = L2_2 + L3_2
                                    L1_2.currentrotation4 = L2_2
                                end
                                else
                                  L1_2 = topscanhandler
                                  L1_2.currentrotation2 = 360.0
                                  L1_2 = topscanhandler
                                  L1_2.currentrotation3 = 360.0
                                  L1_2 = topscanhandler
                                  L1_2.currentrotation4 = 360.0
                                  L1_2 = topscanhandler
                                  L1_2.stagecounter = 0
                                  L1_2 = topscanhandler
                                  L1_2.stage = 14
                                end
                              else
                                L1_2 = topscanhandler
                                L1_2 = L1_2.stage
                                if 14 == L1_2 then
                                  L1_2 = topscanhandler
                                  L2_2 = Config
                                  L2_2 = L2_2.AttractionsSettings
                                  L2_2 = L2_2.topscan
                                  L2_2 = L2_2.speedmodifier
                                  L2_2 = 0.1 * L2_2
                                  L1_2.stagespeed = L2_2
                                  L1_2 = topscanhandler
                                  L1_2.stagecounter = 0.0
                                  L1_2 = topscanhandler
                                  L1_2 = L1_2.currentrotation
                                  L2_2 = 0.1
                                  if L1_2 < L2_2 then
                                    L1_2 = topscanhandler
                                    L1_2.stage = 15
                                    L1_2 = topscanhandler
                                    L1_2.stagecounter = 0
                                    L1_2 = topscanhandler
                                    L1_2.currentrotation = 0.0
                                  end
                                  L1_2 = topscanhandler
                                  L2_2 = topscanhandler
                                  L2_2 = L2_2.currentrotation
                                  L3_2 = topscanhandler
                                  L3_2 = L3_2.stagespeed
                                  L2_2 = L2_2 - L3_2
                                  L1_2.currentrotation = L2_2
                                else
                                  L1_2 = topscanhandler
                                  L1_2 = L1_2.stage
                                  if 15 == L1_2 then
                                    L1_2 = topscanhandler
                                    L1_2.currentrotation = 0.0
                                    L1_2 = topscanhandler
                                    L1_2.stageinprogress = false
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
                                          L12_2.taken = false
                                          L13_2 = pairs
                                          L14_2 = playsersinthemepark
                                          L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
                                          for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
                                            L19_2 = TriggerClientEvent
                                            L20_2 = "rtx_themepark:TopScan:SynchronizeSeat"
                                            L21_2 = L18_2
                                            L22_2 = L5_2
                                            L23_2 = L11_2
                                            L24_2 = false
                                            L25_2 = L12_2.takenplayerid
                                            L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
                                          end
                                          L13_2 = TriggerClientEvent
                                          L14_2 = "rtx_themepark:TopScan:SeatExit"
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
                                          L16_2 = 2
                                          L17_2 = false
                                          L13_2(L14_2, L15_2, L16_2, L17_2)
                                          L12_2.takenplayerid = nil
                                        end
                                      end
                                    end
                                    L1_2 = Citizen
                                    L1_2 = L1_2.Wait
                                    L2_2 = 5000
                                    L1_2(L2_2)
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
              end
            end
          end
        end
      end
      L1_2 = topscanhandler
      L1_2 = L1_2.stage
      if 1 ~= L1_2 then
        L1_2 = topscanhandler
        L1_2 = L1_2.stage
        if 14 == L1_2 then
        else
          L1_2 = topscanhandler
          L1_2 = L1_2.currentrotation2
          L2_2 = 360.0
          if L1_2 > L2_2 then
            L1_2 = topscanhandler
            L1_2 = L1_2.currentrotation2
            L1_2 = L1_2 - 360.0
            L2_2 = topscanhandler
            L3_2 = 0.0 + L1_2
            L2_2.currentrotation2 = L3_2
          end
          L1_2 = topscanhandler
          L1_2 = L1_2.currentrotation3
          L2_2 = 360.0
          if L1_2 > L2_2 then
            L1_2 = topscanhandler
            L1_2 = L1_2.currentrotation3
            L1_2 = L1_2 - 360.0
            L2_2 = topscanhandler
            L3_2 = 0.0 + L1_2
            L2_2.currentrotation3 = L3_2
          end
          L1_2 = topscanhandler
          L1_2 = L1_2.currentrotation4
          L2_2 = 360.0
          if L1_2 > L2_2 then
            L1_2 = topscanhandler
            L1_2 = L1_2.currentrotation4
            L1_2 = L1_2 - 360.0
            L2_2 = topscanhandler
            L3_2 = 0.0 + L1_2
            L2_2.currentrotation4 = L3_2
          end
        end
      end
      L1_2 = GlobalState
      L2_2 = topscanhandler
      L2_2 = L2_2.stage
      L1_2["attraction2-phase"] = L2_2
      L1_2 = GlobalState
      L2_2 = topscanhandler
      L2_2 = L2_2.currentrotation
      L1_2["attraction2-ridedata1"] = L2_2
      L1_2 = GlobalState
      L2_2 = topscanhandler
      L2_2 = L2_2.currentrotation2
      L1_2["attraction2-ridedata2"] = L2_2
      L1_2 = GlobalState
      L2_2 = topscanhandler
      L2_2 = L2_2.currentrotation3
      L1_2["attraction2-ridedata3"] = L2_2
      L1_2 = GlobalState
      L2_2 = topscanhandler
      L2_2 = L2_2.currentrotation4
      L1_2["attraction2-ridedata4"] = L2_2
      L1_2 = GlobalState
      L2_2 = topscanhandler
      L2_2 = L2_2.stagespeed
      L1_2["attraction2-speeddata1"] = L2_2
      L1_2 = GlobalState
      L2_2 = GlobalState
      L2_2 = L2_2["attraction2-synchdata"]
      L2_2 = L2_2 + 1
      L1_2["attraction2-synchdata"] = L2_2
    end
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Global:MusicStopAttraction"
    L3_2 = -1
    L4_2 = "topscan"
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = topscanhandler
    L1_2.currentrotation = 0.0
    L1_2 = topscanhandler
    L1_2.currentrotation2 = 0.0
    L1_2 = topscanhandler
    L1_2.currentrotation3 = 0.0
    L1_2 = topscanhandler
    L1_2.currentrotation4 = 0.0
    L1_2 = GlobalState
    L1_2["attraction2-phase"] = 0
    L1_2 = GlobalState
    L1_2["attraction2-ridedata1"] = 0.0
    L1_2 = GlobalState
    L1_2["attraction2-ridedata2"] = 0.0
    L1_2 = GlobalState
    L1_2["attraction2-ridedata3"] = 0.0
    L1_2 = GlobalState
    L1_2["attraction2-ridedata4"] = 0.0
    L1_2 = topscanhandler
    L1_2.started = false
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:TopScan:SynchronizeStarted"
    L3_2 = -1
    L4_2 = false
    L1_2(L2_2, L3_2, L4_2)
  end
end
StartTopScan = L0_1
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:TopScan:SeatUse"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:TopScan:SeatUse"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = source
  L3_2 = themeparkattractionsopenstatus
  L3_2 = L3_2[2]
  if true == L3_2 then
    L3_2 = themeparkdisabled
    if false == L3_2 then
      if nil ~= A0_2 and nil ~= A1_2 then
        L3_2 = topscanhandler
        L3_2 = L3_2.started
        if false == L3_2 then
          L3_2 = topscanhandler
          L3_2 = L3_2.seats
          L3_2 = L3_2[A0_2]
          L4_2 = L3_2.seats
          L4_2 = L4_2[A1_2]
          L5_2 = L4_2.taken
          if false == L5_2 then
            L4_2.taken = true
            L4_2.takenplayerid = L2_2
            L5_2 = pairs
            L6_2 = playsersinthemepark
            L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
            for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
              L11_2 = TriggerClientEvent
              L12_2 = "rtx_themepark:TopScan:SynchronizeSeat"
              L13_2 = L10_2
              L14_2 = A0_2
              L15_2 = A1_2
              L16_2 = true
              L17_2 = L4_2.takenplayerid
              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
            end
            L5_2 = TriggerClientEvent
            L6_2 = "rtx_themepark:TopScan:SeatData"
            L7_2 = L2_2
            L8_2 = A0_2
            L9_2 = A1_2
            L5_2(L6_2, L7_2, L8_2, L9_2)
            L5_2 = TriggerClientEvent
            L6_2 = "rtx_themepark:TopScan:DisableCollision"
            L7_2 = L2_2
            L5_2(L6_2, L7_2)
            L5_2 = TriggerClientEvent
            L6_2 = "rtx_themepark:Global:AttractionUsing"
            L7_2 = L2_2
            L8_2 = true
            L5_2(L6_2, L7_2, L8_2)
            L5_2 = Config
            L5_2 = L5_2.ThemeParkControlAttractions
            if false == L5_2 then
              L5_2 = topscanhandler
              L5_2 = L5_2.started
              if false == L5_2 then
                L5_2 = attractionlockdown
                if false == L5_2 then
                  L5_2 = Wait
                  L6_2 = Config
                  L6_2 = L6_2.AttractionsSettings
                  L6_2 = L6_2.topscan
                  L6_2 = L6_2.waitforplayers
                  L5_2(L6_2)
                  L5_2 = topscanhandler
                  L5_2 = L5_2.started
                  if false == L5_2 then
                    L5_2 = topscanhandler
                    L5_2.started = true
                    L5_2 = TriggerClientEvent
                    L6_2 = "rtx_themepark:TopScan:SynchronizeStarted"
                    L7_2 = -1
                    L8_2 = true
                    L5_2(L6_2, L7_2, L8_2)
                    L5_2 = StartTopScan
                    L5_2()
                  end
                end
              end
            end
          end
        end
      end
  end
  else
    L3_2 = TriggerClientEvent
    L4_2 = "rtx_themepark:Notify"
    L5_2 = L2_2
    L6_2 = Language
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.attractionclosed
    L3_2(L4_2, L5_2, L6_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:TopScan:ExitAttraction"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:TopScan:ExitAttraction"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = source
  if nil ~= A0_2 and nil ~= A1_2 then
    L3_2 = topscanhandler
    L3_2 = L3_2.seats
    L3_2 = L3_2[A0_2]
    L4_2 = L3_2.seats
    L4_2 = L4_2[A1_2]
    L5_2 = L4_2.taken
    if true == L5_2 then
      L5_2 = L4_2.takenplayerid
      if L5_2 == L2_2 then
        L5_2 = Config
        L5_2 = L5_2.ThemeParkDisableExit
        if false ~= L5_2 then
          L5_2 = topscanhandler
          L5_2 = L5_2.started
          if false ~= L5_2 then
            goto lbl_54
          end
        end
        L5_2 = pairs
        L6_2 = playsersinthemepark
        L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
        for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
          L11_2 = TriggerClientEvent
          L12_2 = "rtx_themepark:TopScan:SynchronizeSeat"
          L13_2 = L10_2
          L14_2 = A0_2
          L15_2 = A1_2
          L16_2 = false
          L17_2 = L4_2.takenplayerid
          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
        end
        L5_2 = TriggerClientEvent
        L6_2 = "rtx_themepark:TopScan:SeatExit"
        L7_2 = L4_2.takenplayerid
        L8_2 = false
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = TriggerClientEvent
        L6_2 = "rtx_themepark:Global:AttractionUsing"
        L7_2 = L4_2.takenplayerid
        L8_2 = false
        L5_2(L6_2, L7_2, L8_2)
        L4_2.taken = false
        L4_2.takenplayerid = nil
        L4_2.seattype = 1
        goto lbl_63
        ::lbl_54::
        L5_2 = TriggerClientEvent
        L6_2 = "rtx_themepark:Notify"
        L7_2 = L2_2
        L8_2 = Language
        L9_2 = Config
        L9_2 = L9_2.Language
        L8_2 = L8_2[L9_2]
        L8_2 = L8_2.inprogress
        L5_2(L6_2, L7_2, L8_2)
      end
    end
  end
  ::lbl_63::
end
L0_1(L1_1, L2_1)
L0_1 = Config
L0_1 = L0_1.ThemeParkAttractionFallChance
if L0_1 then
  L0_1 = Config
  L0_1 = L0_1.ThemeParkFallSettings
  L0_1 = L0_1.attractions
  L0_1 = L0_1.topscan
  if L0_1 then
    L0_1 = RegisterServerEvent
    L1_1 = "rtx_themepark:TopScan:ThrowAttraction"
    L0_1(L1_1)
    L0_1 = AddEventHandler
    L1_1 = "rtx_themepark:TopScan:ThrowAttraction"
    function L2_1(A0_2, A1_2)
      local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
      L2_2 = source
      if nil ~= A0_2 and nil ~= A1_2 then
        L3_2 = topscanhandler
        L3_2 = L3_2.seats
        L3_2 = L3_2[A0_2]
        L4_2 = L3_2.seats
        L4_2 = L4_2[A1_2]
        L5_2 = L4_2.taken
        if true == L5_2 then
          L5_2 = L4_2.takenplayerid
          if L5_2 == L2_2 then
            L5_2 = pairs
            L6_2 = playsersinthemepark
            L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
            for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
              L11_2 = TriggerClientEvent
              L12_2 = "rtx_themepark:TopScan:SynchronizeSeat"
              L13_2 = L10_2
              L14_2 = A0_2
              L15_2 = A1_2
              L16_2 = false
              L17_2 = L4_2.takenplayerid
              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
            end
            L5_2 = TriggerClientEvent
            L6_2 = "rtx_themepark:TopScan:SeatThrowClient"
            L7_2 = L4_2.takenplayerid
            L5_2(L6_2, L7_2)
            L5_2 = TriggerClientEvent
            L6_2 = "rtx_themepark:Global:AttractionUsing"
            L7_2 = L4_2.takenplayerid
            L8_2 = false
            L5_2(L6_2, L7_2, L8_2)
            L4_2.taken = false
            L4_2.takenplayerid = nil
            L4_2.seattype = 1
          end
        end
      end
    end
    L0_1(L1_1, L2_1)
  end
end
