local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = vector3
L2_1 = -1707.20227
L3_1 = -1119.9856
L4_1 = 34.3946571
L1_1 = L1_1(L2_1, L3_1, L4_1)
L0_1.coords = L1_1
L0_1.started = false
L0_1.currentrotation = 0.0
L0_1.currentrotation2 = 0.0
L0_1.stageinprogress = false
L0_1.stage = 16
L0_1.stagecounter = 0
L0_1.stagespeed = 0.5
L0_1.stagespeed2 = 0.5
L0_1.cageclosed = false
L1_1 = {}
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[1] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[2] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[3] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[4] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[5] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[6] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[7] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[8] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[9] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[10] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[11] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[12] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[13] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[14] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[15] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[16] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[17] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[18] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[19] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[20] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[21] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[22] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[23] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[24] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[25] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[26] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[27] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[28] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[29] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[30] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[31] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L1_1[32] = L2_1
L0_1.seats = L1_1
vortexhandler = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = Config
  L3_2 = L3_2.AttractionsSettings
  L3_2 = L3_2.vortex
  L3_2 = L3_2.speedmodifier
  L3_2 = A0_2 * L3_2
  L4_2 = A1_2 / A2_2
  L4_2 = L4_2 * 100.0
  if L4_2 > 60.0 then
    L5_2 = 130.0
    L5_2 = L5_2 - L4_2
    L6_2 = L5_2 / 100.0
    L6_2 = L6_2 * L3_2
    return L6_2
  elseif L4_2 < 20.0 then
    L5_2 = 130.0
    L5_2 = L5_2 - L4_2
    L6_2 = 100.0
    L6_2 = L6_2 / L5_2
    L6_2 = L6_2 * L3_2
    return L6_2
  else
    return L3_2
  end
end
CalculateSpeedVortex = L0_1
L0_1 = GlobalState
L0_1["attraction3-phase"] = 0
L0_1 = GlobalState
L0_1["attraction3-ridedata1"] = 0.0
L0_1 = GlobalState
L0_1["attraction3-ridedata2"] = 0.0
L0_1 = GlobalState
L0_1["attraction3-speeddata1"] = 0.1
L0_1 = GlobalState
L0_1["attraction3-speeddata2"] = 0.1
L0_1 = GlobalState
L0_1["attraction3-direction"] = 1
L0_1 = GlobalState
L0_1["attraction3-synchdata"] = 1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = vortexhandler
  L0_2 = L0_2.started
  if true == L0_2 then
    L0_2 = vortexhandler
    L0_2.cageclosed = true
    L0_2 = pairs
    L1_2 = playsersinthemepark
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = TriggerClientEvent
      L7_2 = "rtx_themepark:Vortex:SynchronizeCageClient"
      L8_2 = L5_2
      L9_2 = true
      L6_2(L7_2, L8_2, L9_2)
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 7500
    L0_2(L1_2)
    L0_2 = TriggerClientEvent
    L1_2 = "rtx_themepark:Global:MusicStartAttraction"
    L2_2 = -1
    L3_2 = "vortex"
    L4_2 = math
    L4_2 = L4_2.random
    L5_2 = 1
    L6_2 = Config
    L6_2 = L6_2.AttractionsMusic
    L6_2 = L6_2.vortex
    L6_2 = L6_2.playlist
    L6_2 = #L6_2
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L4_2(L5_2, L6_2)
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L0_2 = vortexhandler
    L0_2.stageinprogress = true
    L0_2 = vortexhandler
    L0_2.stage = 1
    L0_2 = vortexhandler
    L0_2.stagecounter = 0
    L0_2 = vortexhandler
    L0_2.stagespeed = 0.5
    L0_2 = vortexhandler
    L0_2.stagespeed2 = 0.5
    L0_2 = vortexhandler
    L0_2.stagedirection = 1
    L0_2 = GlobalState
    L0_2["attraction3-phase"] = 1
    L0_2 = GlobalState
    L0_2["attraction3-ridedata1"] = 0.0
    L0_2 = GlobalState
    L0_2["attraction3-ridedata2"] = 0.0
    L0_2 = GlobalState
    L0_2["attraction3-speeddata1"] = 0.5
    L0_2 = GlobalState
    L0_2["attraction3-speeddata2"] = 0.5
    L0_2 = GlobalState
    L0_2["attraction3-direction"] = 1
    L0_2 = GlobalState
    L0_2["attraction3-synchdata"] = 1
    L0_2 = ipairs
    L1_2 = vortexhandler
    L1_2 = L1_2.seats
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = L5_2.taken
      if true == L6_2 then
        L6_2 = pairs
        L7_2 = playsersinthemepark
        L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
        for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
          L12_2 = TriggerClientEvent
          L13_2 = "rtx_themepark:Vortex:SynchronizeSeat"
          L14_2 = L11_2
          L15_2 = L4_2
          L16_2 = true
          L17_2 = L5_2.takenplayerid
          L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
        end
        L6_2 = TriggerClientEvent
        L7_2 = "rtx_themepark:Global:AttractionUsing"
        L8_2 = L5_2.takenplayerid
        L9_2 = true
        L6_2(L7_2, L8_2, L9_2)
      end
    end
    while true do
      L0_2 = vortexhandler
      L0_2 = L0_2.stageinprogress
      if true ~= L0_2 then
        break
      end
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 20
      L0_2(L1_2)
      L0_2 = vortexhandler
      L0_2 = L0_2.stage
      if 1 == L0_2 then
        L0_2 = vortexhandler
        L0_2 = L0_2.stagedirection
        if 1 == L0_2 then
          L0_2 = vortexhandler
          L1_2 = CalculateSpeedVortex
          L2_2 = 0.25
          L3_2 = vortexhandler
          L3_2 = L3_2.currentrotation
          L4_2 = 5.0
          L1_2 = L1_2(L2_2, L3_2, L4_2)
          L0_2.stagespeed = L1_2
          L0_2 = vortexhandler
          L0_2 = L0_2.currentrotation
          if L0_2 > 5.0 then
            L0_2 = vortexhandler
            L0_2.stagedirection = 2
          end
          L0_2 = vortexhandler
          L1_2 = vortexhandler
          L1_2 = L1_2.currentrotation
          L2_2 = vortexhandler
          L2_2 = L2_2.stagespeed
          L1_2 = L1_2 + L2_2
          L0_2.currentrotation = L1_2
        else
          L0_2 = vortexhandler
          L1_2 = CalculateSpeedVortex
          L2_2 = 0.25
          L3_2 = vortexhandler
          L3_2 = L3_2.currentrotation
          L4_2 = -5.0
          L1_2 = L1_2(L2_2, L3_2, L4_2)
          L0_2.stagespeed = L1_2
          L0_2 = vortexhandler
          L0_2 = L0_2.currentrotation
          if L0_2 < -5.0 then
            L0_2 = vortexhandler
            L0_2.stagedirection = 1
            L0_2 = vortexhandler
            L0_2.stage = 2
          end
          L0_2 = vortexhandler
          L1_2 = vortexhandler
          L1_2 = L1_2.currentrotation
          L2_2 = vortexhandler
          L2_2 = L2_2.stagespeed
          L1_2 = L1_2 - L2_2
          L0_2.currentrotation = L1_2
        end
      else
        L0_2 = vortexhandler
        L0_2 = L0_2.stage
        if 2 == L0_2 then
          L0_2 = vortexhandler
          L0_2 = L0_2.stagedirection
          if 1 == L0_2 then
            L0_2 = vortexhandler
            L1_2 = CalculateSpeedVortex
            L2_2 = 0.25
            L3_2 = vortexhandler
            L3_2 = L3_2.currentrotation
            L4_2 = 15.0
            L1_2 = L1_2(L2_2, L3_2, L4_2)
            L0_2.stagespeed = L1_2
            L0_2 = vortexhandler
            L0_2 = L0_2.currentrotation
            if L0_2 > 15.0 then
              L0_2 = vortexhandler
              L0_2.stagedirection = 2
            end
            L0_2 = vortexhandler
            L1_2 = vortexhandler
            L1_2 = L1_2.currentrotation
            L2_2 = vortexhandler
            L2_2 = L2_2.stagespeed
            L1_2 = L1_2 + L2_2
            L0_2.currentrotation = L1_2
          else
            L0_2 = vortexhandler
            L1_2 = CalculateSpeedVortex
            L2_2 = 0.25
            L3_2 = vortexhandler
            L3_2 = L3_2.currentrotation
            L4_2 = -15.0
            L1_2 = L1_2(L2_2, L3_2, L4_2)
            L0_2.stagespeed = L1_2
            L0_2 = vortexhandler
            L0_2 = L0_2.currentrotation
            if L0_2 < -15.0 then
              L0_2 = vortexhandler
              L0_2.stagedirection = 1
              L0_2 = vortexhandler
              L0_2.stage = 3
            end
            L0_2 = vortexhandler
            L1_2 = vortexhandler
            L1_2 = L1_2.currentrotation
            L2_2 = vortexhandler
            L2_2 = L2_2.stagespeed
            L1_2 = L1_2 - L2_2
            L0_2.currentrotation = L1_2
          end
        else
          L0_2 = vortexhandler
          L0_2 = L0_2.stage
          if 3 == L0_2 then
            L0_2 = vortexhandler
            L0_2.stagespeed = 0.5
            L0_2 = vortexhandler
            L1_2 = vortexhandler
            L1_2 = L1_2.stagespeed
            L2_2 = Config
            L2_2 = L2_2.AttractionsSettings
            L2_2 = L2_2.vortex
            L2_2 = L2_2.speedmodifier
            L1_2 = L1_2 * L2_2
            L0_2.stagespeed2 = L1_2
            L0_2 = vortexhandler
            L1_2 = vortexhandler
            L1_2 = L1_2.currentrotation2
            L2_2 = vortexhandler
            L2_2 = L2_2.stagespeed2
            L1_2 = L1_2 + L2_2
            L0_2.currentrotation2 = L1_2
            L0_2 = vortexhandler
            L0_2 = L0_2.stagedirection
            if 1 == L0_2 then
              L0_2 = vortexhandler
              L1_2 = CalculateSpeedVortex
              L2_2 = 0.5
              L3_2 = vortexhandler
              L3_2 = L3_2.currentrotation
              L4_2 = 40.0
              L1_2 = L1_2(L2_2, L3_2, L4_2)
              L0_2.stagespeed = L1_2
              L0_2 = vortexhandler
              L0_2 = L0_2.currentrotation
              if L0_2 > 40.0 then
                L0_2 = vortexhandler
                L0_2.stagedirection = 2
              end
              L0_2 = vortexhandler
              L1_2 = vortexhandler
              L1_2 = L1_2.currentrotation
              L2_2 = vortexhandler
              L2_2 = L2_2.stagespeed
              L1_2 = L1_2 + L2_2
              L0_2.currentrotation = L1_2
            else
              L0_2 = vortexhandler
              L1_2 = CalculateSpeedVortex
              L2_2 = 0.5
              L3_2 = vortexhandler
              L3_2 = L3_2.currentrotation
              L4_2 = -40.0
              L1_2 = L1_2(L2_2, L3_2, L4_2)
              L0_2.stagespeed = L1_2
              L0_2 = vortexhandler
              L0_2 = L0_2.currentrotation
              if L0_2 < -40.0 then
                L0_2 = vortexhandler
                L0_2.stagedirection = 1
                L0_2 = vortexhandler
                L0_2.stage = 4
              end
              L0_2 = vortexhandler
              L1_2 = vortexhandler
              L1_2 = L1_2.currentrotation
              L2_2 = vortexhandler
              L2_2 = L2_2.stagespeed
              L1_2 = L1_2 - L2_2
              L0_2.currentrotation = L1_2
            end
          else
            L0_2 = vortexhandler
            L0_2 = L0_2.stage
            if 4 == L0_2 then
              L0_2 = vortexhandler
              L0_2.stagespeed = 0.75
              L0_2 = vortexhandler
              L1_2 = vortexhandler
              L1_2 = L1_2.stagespeed
              L2_2 = Config
              L2_2 = L2_2.AttractionsSettings
              L2_2 = L2_2.vortex
              L2_2 = L2_2.speedmodifier
              L1_2 = L1_2 * L2_2
              L0_2.stagespeed2 = L1_2
              L0_2 = vortexhandler
              L1_2 = vortexhandler
              L1_2 = L1_2.currentrotation2
              L2_2 = vortexhandler
              L2_2 = L2_2.stagespeed2
              L1_2 = L1_2 + L2_2
              L0_2.currentrotation2 = L1_2
              L0_2 = vortexhandler
              L0_2 = L0_2.stagedirection
              if 1 == L0_2 then
                L0_2 = vortexhandler
                L1_2 = CalculateSpeedVortex
                L2_2 = 0.75
                L3_2 = vortexhandler
                L3_2 = L3_2.currentrotation
                L4_2 = 80.0
                L1_2 = L1_2(L2_2, L3_2, L4_2)
                L0_2.stagespeed = L1_2
                L0_2 = vortexhandler
                L0_2 = L0_2.currentrotation
                if L0_2 > 80.0 then
                  L0_2 = vortexhandler
                  L0_2.stagedirection = 2
                end
                L0_2 = vortexhandler
                L1_2 = vortexhandler
                L1_2 = L1_2.currentrotation
                L2_2 = vortexhandler
                L2_2 = L2_2.stagespeed
                L1_2 = L1_2 + L2_2
                L0_2.currentrotation = L1_2
              else
                L0_2 = vortexhandler
                L1_2 = CalculateSpeedVortex
                L2_2 = 0.75
                L3_2 = vortexhandler
                L3_2 = L3_2.currentrotation
                L4_2 = -80.0
                L1_2 = L1_2(L2_2, L3_2, L4_2)
                L0_2.stagespeed = L1_2
                L0_2 = vortexhandler
                L0_2 = L0_2.currentrotation
                if L0_2 < -80.0 then
                  L0_2 = vortexhandler
                  L0_2.stagedirection = 1
                  L0_2 = vortexhandler
                  L0_2.stage = 5
                end
                L0_2 = vortexhandler
                L1_2 = vortexhandler
                L1_2 = L1_2.currentrotation
                L2_2 = vortexhandler
                L2_2 = L2_2.stagespeed
                L1_2 = L1_2 - L2_2
                L0_2.currentrotation = L1_2
              end
            else
              L0_2 = vortexhandler
              L0_2 = L0_2.stage
              if 5 == L0_2 then
                L0_2 = vortexhandler
                L0_2.stagespeed = 1.25
                L0_2 = vortexhandler
                L1_2 = vortexhandler
                L1_2 = L1_2.stagespeed
                L2_2 = Config
                L2_2 = L2_2.AttractionsSettings
                L2_2 = L2_2.vortex
                L2_2 = L2_2.speedmodifier
                L1_2 = L1_2 * L2_2
                L0_2.stagespeed2 = L1_2
                L0_2 = vortexhandler
                L1_2 = vortexhandler
                L1_2 = L1_2.currentrotation2
                L2_2 = vortexhandler
                L2_2 = L2_2.stagespeed2
                L1_2 = L1_2 + L2_2
                L0_2.currentrotation2 = L1_2
                L0_2 = vortexhandler
                L0_2 = L0_2.stagedirection
                if 1 == L0_2 then
                  L0_2 = vortexhandler
                  L1_2 = CalculateSpeedVortex
                  L2_2 = 1.25
                  L3_2 = vortexhandler
                  L3_2 = L3_2.currentrotation
                  L4_2 = 125.0
                  L1_2 = L1_2(L2_2, L3_2, L4_2)
                  L0_2.stagespeed = L1_2
                  L0_2 = vortexhandler
                  L0_2 = L0_2.currentrotation
                  if L0_2 > 125.0 then
                    L0_2 = vortexhandler
                    L0_2.stagedirection = 2
                  end
                  L0_2 = vortexhandler
                  L1_2 = vortexhandler
                  L1_2 = L1_2.currentrotation
                  L2_2 = vortexhandler
                  L2_2 = L2_2.stagespeed
                  L1_2 = L1_2 + L2_2
                  L0_2.currentrotation = L1_2
                else
                  L0_2 = vortexhandler
                  L1_2 = CalculateSpeedVortex
                  L2_2 = 1.25
                  L3_2 = vortexhandler
                  L3_2 = L3_2.currentrotation
                  L4_2 = -125.0
                  L1_2 = L1_2(L2_2, L3_2, L4_2)
                  L0_2.stagespeed = L1_2
                  L0_2 = vortexhandler
                  L0_2 = L0_2.currentrotation
                  if L0_2 < -125.0 then
                    L0_2 = vortexhandler
                    L0_2.stagedirection = 1
                    L0_2 = vortexhandler
                    L0_2.stage = 6
                  end
                  L0_2 = vortexhandler
                  L1_2 = vortexhandler
                  L1_2 = L1_2.currentrotation
                  L2_2 = vortexhandler
                  L2_2 = L2_2.stagespeed
                  L1_2 = L1_2 - L2_2
                  L0_2.currentrotation = L1_2
                end
              else
                L0_2 = vortexhandler
                L0_2 = L0_2.stage
                if 6 == L0_2 then
                  L0_2 = vortexhandler
                  L0_2.stagespeed = 1.5
                  L0_2 = vortexhandler
                  L1_2 = vortexhandler
                  L1_2 = L1_2.stagespeed
                  L2_2 = Config
                  L2_2 = L2_2.AttractionsSettings
                  L2_2 = L2_2.vortex
                  L2_2 = L2_2.speedmodifier
                  L1_2 = L1_2 * L2_2
                  L0_2.stagespeed2 = L1_2
                  L0_2 = vortexhandler
                  L1_2 = vortexhandler
                  L1_2 = L1_2.currentrotation2
                  L2_2 = vortexhandler
                  L2_2 = L2_2.stagespeed2
                  L1_2 = L1_2 + L2_2
                  L0_2.currentrotation2 = L1_2
                  L0_2 = vortexhandler
                  L0_2 = L0_2.stagedirection
                  if 1 == L0_2 then
                    L0_2 = vortexhandler
                    L1_2 = CalculateSpeedVortex
                    L2_2 = 1.5
                    L3_2 = vortexhandler
                    L3_2 = L3_2.currentrotation
                    L4_2 = 150.0
                    L1_2 = L1_2(L2_2, L3_2, L4_2)
                    L0_2.stagespeed = L1_2
                    L0_2 = vortexhandler
                    L0_2 = L0_2.currentrotation
                    L1_2 = 150.0
                    if L0_2 > L1_2 then
                      L0_2 = vortexhandler
                      L0_2.stagedirection = 2
                    end
                    L0_2 = vortexhandler
                    L1_2 = vortexhandler
                    L1_2 = L1_2.currentrotation
                    L2_2 = vortexhandler
                    L2_2 = L2_2.stagespeed
                    L1_2 = L1_2 + L2_2
                    L0_2.currentrotation = L1_2
                  else
                    L0_2 = vortexhandler
                    L1_2 = CalculateSpeedVortex
                    L2_2 = 1.5
                    L3_2 = vortexhandler
                    L3_2 = L3_2.currentrotation
                    L4_2 = -150.0
                    L1_2 = L1_2(L2_2, L3_2, L4_2)
                    L0_2.stagespeed = L1_2
                    L0_2 = vortexhandler
                    L0_2 = L0_2.currentrotation
                    L1_2 = -150.0
                    if L0_2 < L1_2 then
                      L0_2 = vortexhandler
                      L0_2.stagedirection = 1
                      L0_2 = vortexhandler
                      L0_2.stage = 7
                    end
                    L0_2 = vortexhandler
                    L1_2 = vortexhandler
                    L1_2 = L1_2.currentrotation
                    L2_2 = vortexhandler
                    L2_2 = L2_2.stagespeed
                    L1_2 = L1_2 - L2_2
                    L0_2.currentrotation = L1_2
                  end
                else
                  L0_2 = vortexhandler
                  L0_2 = L0_2.stage
                  if 7 == L0_2 then
                    L0_2 = vortexhandler
                    L0_2.stagespeed = 1.75
                    L0_2 = vortexhandler
                    L1_2 = vortexhandler
                    L1_2 = L1_2.stagespeed
                    L2_2 = Config
                    L2_2 = L2_2.AttractionsSettings
                    L2_2 = L2_2.vortex
                    L2_2 = L2_2.speedmodifier
                    L1_2 = L1_2 * L2_2
                    L0_2.stagespeed2 = L1_2
                    L0_2 = vortexhandler
                    L1_2 = vortexhandler
                    L1_2 = L1_2.currentrotation2
                    L2_2 = vortexhandler
                    L2_2 = L2_2.stagespeed2
                    L1_2 = L1_2 + L2_2
                    L0_2.currentrotation2 = L1_2
                    L0_2 = vortexhandler
                    L0_2 = L0_2.stagedirection
                    if 1 == L0_2 then
                      L0_2 = vortexhandler
                      L1_2 = CalculateSpeedVortex
                      L2_2 = 1.75
                      L3_2 = vortexhandler
                      L3_2 = L3_2.currentrotation
                      L4_2 = 175.0
                      L1_2 = L1_2(L2_2, L3_2, L4_2)
                      L0_2.stagespeed = L1_2
                      L0_2 = vortexhandler
                      L0_2 = L0_2.currentrotation
                      L1_2 = 175.0
                      if L0_2 > L1_2 then
                        L0_2 = vortexhandler
                        L0_2.stagedirection = 2
                        L0_2 = vortexhandler
                        L1_2 = vortexhandler
                        L1_2 = L1_2.stagecounter
                        L1_2 = L1_2 + 1
                        L0_2.stagecounter = L1_2
                        L0_2 = vortexhandler
                        L0_2 = L0_2.stagecounter
                        L1_2 = Config
                        L1_2 = L1_2.AttractionsSettings
                        L1_2 = L1_2.vortex
                        L1_2 = L1_2.maxrounds
                        if L0_2 > L1_2 then
                          L0_2 = vortexhandler
                          L0_2.stage = 8
                        end
                      end
                      L0_2 = vortexhandler
                      L1_2 = vortexhandler
                      L1_2 = L1_2.currentrotation
                      L2_2 = vortexhandler
                      L2_2 = L2_2.stagespeed
                      L1_2 = L1_2 + L2_2
                      L0_2.currentrotation = L1_2
                    else
                      L0_2 = vortexhandler
                      L1_2 = CalculateSpeedVortex
                      L2_2 = 1.75
                      L3_2 = vortexhandler
                      L3_2 = L3_2.currentrotation
                      L4_2 = -175.0
                      L1_2 = L1_2(L2_2, L3_2, L4_2)
                      L0_2.stagespeed = L1_2
                      L0_2 = vortexhandler
                      L0_2 = L0_2.currentrotation
                      L1_2 = -175.0
                      if L0_2 < L1_2 then
                        L0_2 = vortexhandler
                        L0_2.stagedirection = 1
                      end
                      L0_2 = vortexhandler
                      L1_2 = vortexhandler
                      L1_2 = L1_2.currentrotation
                      L2_2 = vortexhandler
                      L2_2 = L2_2.stagespeed
                      L1_2 = L1_2 - L2_2
                      L0_2.currentrotation = L1_2
                    end
                  else
                    L0_2 = vortexhandler
                    L0_2 = L0_2.stage
                    if 8 == L0_2 then
                      L0_2 = vortexhandler
                      L0_2.stagespeed = 1.5
                      L0_2 = vortexhandler
                      L1_2 = vortexhandler
                      L1_2 = L1_2.stagespeed
                      L2_2 = Config
                      L2_2 = L2_2.AttractionsSettings
                      L2_2 = L2_2.vortex
                      L2_2 = L2_2.speedmodifier
                      L1_2 = L1_2 * L2_2
                      L0_2.stagespeed2 = L1_2
                      L0_2 = vortexhandler
                      L1_2 = vortexhandler
                      L1_2 = L1_2.currentrotation2
                      L2_2 = vortexhandler
                      L2_2 = L2_2.stagespeed2
                      L1_2 = L1_2 + L2_2
                      L0_2.currentrotation2 = L1_2
                      L0_2 = vortexhandler
                      L0_2 = L0_2.stagedirection
                      if 1 == L0_2 then
                        L0_2 = vortexhandler
                        L1_2 = CalculateSpeedVortex
                        L2_2 = 1.5
                        L3_2 = vortexhandler
                        L3_2 = L3_2.currentrotation
                        L4_2 = 150.0
                        L1_2 = L1_2(L2_2, L3_2, L4_2)
                        L0_2.stagespeed = L1_2
                        L0_2 = vortexhandler
                        L0_2 = L0_2.currentrotation
                        L1_2 = 150.0
                        if L0_2 > L1_2 then
                          L0_2 = vortexhandler
                          L0_2.stagedirection = 2
                        end
                        L0_2 = vortexhandler
                        L1_2 = vortexhandler
                        L1_2 = L1_2.currentrotation
                        L2_2 = vortexhandler
                        L2_2 = L2_2.stagespeed
                        L1_2 = L1_2 + L2_2
                        L0_2.currentrotation = L1_2
                      else
                        L0_2 = vortexhandler
                        L1_2 = CalculateSpeedVortex
                        L2_2 = 1.5
                        L3_2 = vortexhandler
                        L3_2 = L3_2.currentrotation
                        L4_2 = -150.0
                        L1_2 = L1_2(L2_2, L3_2, L4_2)
                        L0_2.stagespeed = L1_2
                        L0_2 = vortexhandler
                        L0_2 = L0_2.currentrotation
                        L1_2 = -150.0
                        if L0_2 < L1_2 then
                          L0_2 = vortexhandler
                          L0_2.stagedirection = 1
                          L0_2 = vortexhandler
                          L0_2.stage = 9
                        end
                        L0_2 = vortexhandler
                        L1_2 = vortexhandler
                        L1_2 = L1_2.currentrotation
                        L2_2 = vortexhandler
                        L2_2 = L2_2.stagespeed
                        L1_2 = L1_2 - L2_2
                        L0_2.currentrotation = L1_2
                      end
                    else
                      L0_2 = vortexhandler
                      L0_2 = L0_2.stage
                      if 9 == L0_2 then
                        L0_2 = vortexhandler
                        L0_2.stagespeed = 1.25
                        L0_2 = vortexhandler
                        L1_2 = vortexhandler
                        L1_2 = L1_2.stagespeed
                        L2_2 = Config
                        L2_2 = L2_2.AttractionsSettings
                        L2_2 = L2_2.vortex
                        L2_2 = L2_2.speedmodifier
                        L1_2 = L1_2 * L2_2
                        L0_2.stagespeed2 = L1_2
                        L0_2 = vortexhandler
                        L1_2 = vortexhandler
                        L1_2 = L1_2.currentrotation2
                        L2_2 = vortexhandler
                        L2_2 = L2_2.stagespeed2
                        L1_2 = L1_2 + L2_2
                        L0_2.currentrotation2 = L1_2
                        L0_2 = vortexhandler
                        L0_2 = L0_2.stagedirection
                        if 1 == L0_2 then
                          L0_2 = vortexhandler
                          L1_2 = CalculateSpeedVortex
                          L2_2 = 1.25
                          L3_2 = vortexhandler
                          L3_2 = L3_2.currentrotation
                          L4_2 = 125.0
                          L1_2 = L1_2(L2_2, L3_2, L4_2)
                          L0_2.stagespeed = L1_2
                          L0_2 = vortexhandler
                          L0_2 = L0_2.currentrotation
                          if L0_2 > 125.0 then
                            L0_2 = vortexhandler
                            L0_2.stagedirection = 2
                          end
                          L0_2 = vortexhandler
                          L1_2 = vortexhandler
                          L1_2 = L1_2.currentrotation
                          L2_2 = vortexhandler
                          L2_2 = L2_2.stagespeed
                          L1_2 = L1_2 + L2_2
                          L0_2.currentrotation = L1_2
                        else
                          L0_2 = vortexhandler
                          L1_2 = CalculateSpeedVortex
                          L2_2 = 1.25
                          L3_2 = vortexhandler
                          L3_2 = L3_2.currentrotation
                          L4_2 = -125.0
                          L1_2 = L1_2(L2_2, L3_2, L4_2)
                          L0_2.stagespeed = L1_2
                          L0_2 = vortexhandler
                          L0_2 = L0_2.currentrotation
                          if L0_2 < -125.0 then
                            L0_2 = vortexhandler
                            L0_2.stagedirection = 1
                            L0_2 = vortexhandler
                            L0_2.stage = 10
                          end
                          L0_2 = vortexhandler
                          L1_2 = vortexhandler
                          L1_2 = L1_2.currentrotation
                          L2_2 = vortexhandler
                          L2_2 = L2_2.stagespeed
                          L1_2 = L1_2 - L2_2
                          L0_2.currentrotation = L1_2
                        end
                      else
                        L0_2 = vortexhandler
                        L0_2 = L0_2.stage
                        if 10 == L0_2 then
                          L0_2 = vortexhandler
                          L0_2.stagespeed = 0.75
                          L0_2 = vortexhandler
                          L1_2 = vortexhandler
                          L1_2 = L1_2.stagespeed
                          L2_2 = Config
                          L2_2 = L2_2.AttractionsSettings
                          L2_2 = L2_2.vortex
                          L2_2 = L2_2.speedmodifier
                          L1_2 = L1_2 * L2_2
                          L0_2.stagespeed2 = L1_2
                          L0_2 = vortexhandler
                          L1_2 = vortexhandler
                          L1_2 = L1_2.currentrotation2
                          L2_2 = vortexhandler
                          L2_2 = L2_2.stagespeed2
                          L1_2 = L1_2 + L2_2
                          L0_2.currentrotation2 = L1_2
                          L0_2 = vortexhandler
                          L0_2 = L0_2.stagedirection
                          if 1 == L0_2 then
                            L0_2 = vortexhandler
                            L1_2 = CalculateSpeedVortex
                            L2_2 = 0.75
                            L3_2 = vortexhandler
                            L3_2 = L3_2.currentrotation
                            L4_2 = 100.0
                            L1_2 = L1_2(L2_2, L3_2, L4_2)
                            L0_2.stagespeed = L1_2
                            L0_2 = vortexhandler
                            L0_2 = L0_2.currentrotation
                            if L0_2 > 100.0 then
                              L0_2 = vortexhandler
                              L0_2.stagedirection = 2
                            end
                            L0_2 = vortexhandler
                            L1_2 = vortexhandler
                            L1_2 = L1_2.currentrotation
                            L2_2 = vortexhandler
                            L2_2 = L2_2.stagespeed
                            L1_2 = L1_2 + L2_2
                            L0_2.currentrotation = L1_2
                          else
                            L0_2 = vortexhandler
                            L1_2 = CalculateSpeedVortex
                            L2_2 = 0.75
                            L3_2 = vortexhandler
                            L3_2 = L3_2.currentrotation
                            L4_2 = -150.0
                            L1_2 = L1_2(L2_2, L3_2, L4_2)
                            L0_2.stagespeed = L1_2
                            L0_2 = vortexhandler
                            L0_2 = L0_2.currentrotation
                            if L0_2 < -100.0 then
                              L0_2 = vortexhandler
                              L0_2.stagedirection = 1
                              L0_2 = vortexhandler
                              L0_2.stage = 11
                            end
                            L0_2 = vortexhandler
                            L1_2 = vortexhandler
                            L1_2 = L1_2.currentrotation
                            L2_2 = vortexhandler
                            L2_2 = L2_2.stagespeed
                            L1_2 = L1_2 - L2_2
                            L0_2.currentrotation = L1_2
                          end
                        else
                          L0_2 = vortexhandler
                          L0_2 = L0_2.stage
                          if 11 == L0_2 then
                            L0_2 = vortexhandler
                            L0_2.stagespeed = 0.5
                            L0_2 = vortexhandler
                            L1_2 = vortexhandler
                            L1_2 = L1_2.stagespeed
                            L2_2 = Config
                            L2_2 = L2_2.AttractionsSettings
                            L2_2 = L2_2.vortex
                            L2_2 = L2_2.speedmodifier
                            L1_2 = L1_2 * L2_2
                            L0_2.stagespeed2 = L1_2
                            L0_2 = vortexhandler
                            L0_2 = L0_2.currentrotation2
                            L1_2 = 360.0
                            if L0_2 > L1_2 then
                            else
                              L0_2 = vortexhandler
                              L1_2 = vortexhandler
                              L1_2 = L1_2.currentrotation2
                              L2_2 = vortexhandler
                              L2_2 = L2_2.stagespeed2
                              L1_2 = L1_2 + L2_2
                              L0_2.currentrotation2 = L1_2
                            end
                            L0_2 = vortexhandler
                            L0_2 = L0_2.stagedirection
                            if 1 == L0_2 then
                              L0_2 = vortexhandler
                              L1_2 = CalculateSpeedVortex
                              L2_2 = 0.5
                              L3_2 = vortexhandler
                              L3_2 = L3_2.currentrotation
                              L4_2 = 25.0
                              L1_2 = L1_2(L2_2, L3_2, L4_2)
                              L0_2.stagespeed = L1_2
                              L0_2 = vortexhandler
                              L0_2 = L0_2.currentrotation
                              if L0_2 > 25.0 then
                                L0_2 = vortexhandler
                                L0_2.stagedirection = 2
                              end
                              L0_2 = vortexhandler
                              L1_2 = vortexhandler
                              L1_2 = L1_2.currentrotation
                              L2_2 = vortexhandler
                              L2_2 = L2_2.stagespeed
                              L1_2 = L1_2 + L2_2
                              L0_2.currentrotation = L1_2
                            else
                              L0_2 = vortexhandler
                              L1_2 = CalculateSpeedVortex
                              L2_2 = 0.5
                              L3_2 = vortexhandler
                              L3_2 = L3_2.currentrotation
                              L4_2 = -25.0
                              L1_2 = L1_2(L2_2, L3_2, L4_2)
                              L0_2.stagespeed = L1_2
                              L0_2 = vortexhandler
                              L0_2 = L0_2.currentrotation
                              if L0_2 < -25.0 then
                                L0_2 = vortexhandler
                                L0_2.stagedirection = 1
                                L0_2 = vortexhandler
                                L0_2.stage = 14
                              end
                              L0_2 = vortexhandler
                              L1_2 = vortexhandler
                              L1_2 = L1_2.currentrotation
                              L2_2 = vortexhandler
                              L2_2 = L2_2.stagespeed
                              L1_2 = L1_2 - L2_2
                              L0_2.currentrotation = L1_2
                            end
                          else
                            L0_2 = vortexhandler
                            L0_2 = L0_2.stage
                            if 14 == L0_2 then
                              L0_2 = vortexhandler
                              L0_2.stagespeed = 0.25
                              L0_2 = vortexhandler
                              L0_2 = L0_2.stagedirection
                              if 1 == L0_2 then
                                L0_2 = vortexhandler
                                L1_2 = vortexhandler
                                L1_2 = L1_2.currentrotation
                                L2_2 = vortexhandler
                                L2_2 = L2_2.stagespeed
                                L1_2 = L1_2 + L2_2
                                L0_2.currentrotation = L1_2
                                L0_2 = vortexhandler
                                L0_2 = L0_2.currentrotation
                                L1_2 = 0.25
                                if L0_2 > L1_2 then
                                  L0_2 = vortexhandler
                                  L0_2.stage = 15
                                end
                              end
                            else
                              L0_2 = vortexhandler
                              L0_2 = L0_2.stage
                              if 15 == L0_2 then
                                L0_2 = vortexhandler
                                L0_2.currentrotation = 0.0
                                L0_2 = vortexhandler
                                L0_2.currentrotation2 = 0.0
                                L0_2 = vortexhandler
                                L0_2.stage = 16
                              else
                                L0_2 = vortexhandler
                                L0_2 = L0_2.stage
                                if 16 == L0_2 then
                                  L0_2 = pairs
                                  L1_2 = playsersinthemepark
                                  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
                                  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
                                    L6_2 = TriggerClientEvent
                                    L7_2 = "rtx_themepark:Vortex:SynchronizeCageClient"
                                    L8_2 = L5_2
                                    L9_2 = false
                                    L6_2(L7_2, L8_2, L9_2)
                                  end
                                  L0_2 = vortexhandler
                                  L0_2.cageclosed = false
                                  L0_2 = Citizen
                                  L0_2 = L0_2.Wait
                                  L1_2 = 7500
                                  L0_2(L1_2)
                                  L0_2 = ipairs
                                  L1_2 = vortexhandler
                                  L1_2 = L1_2.seats
                                  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
                                  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
                                    L6_2 = L5_2.taken
                                    if true == L6_2 then
                                      L5_2.taken = false
                                      L6_2 = pairs
                                      L7_2 = playsersinthemepark
                                      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
                                      for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
                                        L12_2 = TriggerClientEvent
                                        L13_2 = "rtx_themepark:Vortex:SynchronizeSeat"
                                        L14_2 = L11_2
                                        L15_2 = L4_2
                                        L16_2 = false
                                        L17_2 = L5_2.takenplayerid
                                        L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
                                      end
                                      L6_2 = TriggerClientEvent
                                      L7_2 = "rtx_themepark:Vortex:SeatExit"
                                      L8_2 = L5_2.takenplayerid
                                      L9_2 = true
                                      L6_2(L7_2, L8_2, L9_2)
                                      L6_2 = TriggerClientEvent
                                      L7_2 = "rtx_themepark:Global:AttractionUsing"
                                      L8_2 = L5_2.takenplayerid
                                      L9_2 = false
                                      L6_2(L7_2, L8_2, L9_2)
                                      L6_2 = TriggerClientEvent
                                      L7_2 = "rtx_themepark:Global:TicketHandler"
                                      L8_2 = L5_2.takenplayerid
                                      L9_2 = 3
                                      L10_2 = false
                                      L6_2(L7_2, L8_2, L9_2, L10_2)
                                      L5_2.takenplayerid = nil
                                    end
                                  end
                                  L0_2 = vortexhandler
                                  L0_2.stageinprogress = false
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
      L0_2 = vortexhandler
      L0_2 = L0_2.stage
      if L0_2 >= 3 then
        L0_2 = vortexhandler
        L0_2 = L0_2.stage
        if L0_2 <= 10 then
          L0_2 = vortexhandler
          L0_2 = L0_2.currentrotation2
          L1_2 = 360.0
          if L0_2 > L1_2 then
            L0_2 = vortexhandler
            L0_2 = L0_2.currentrotation2
            L0_2 = L0_2 - 360.0
            L1_2 = vortexhandler
            L2_2 = 0.0 + L0_2
            L1_2.currentrotation2 = L2_2
          end
        end
      end
      L0_2 = GlobalState
      L1_2 = vortexhandler
      L1_2 = L1_2.stage
      L0_2["attraction3-phase"] = L1_2
      L0_2 = GlobalState
      L1_2 = vortexhandler
      L1_2 = L1_2.currentrotation
      L0_2["attraction3-ridedata1"] = L1_2
      L0_2 = GlobalState
      L1_2 = vortexhandler
      L1_2 = L1_2.currentrotation2
      L0_2["attraction3-ridedata2"] = L1_2
      L0_2 = GlobalState
      L1_2 = vortexhandler
      L1_2 = L1_2.stagespeed
      L0_2["attraction3-speeddata1"] = L1_2
      L0_2 = GlobalState
      L1_2 = vortexhandler
      L1_2 = L1_2.stagespeed2
      L0_2["attraction3-speeddata2"] = L1_2
      L0_2 = GlobalState
      L1_2 = vortexhandler
      L1_2 = L1_2.stagedirection
      L0_2["attraction3-direction"] = L1_2
      L0_2 = GlobalState
      L1_2 = GlobalState
      L1_2 = L1_2["attraction3-synchdata"]
      L1_2 = L1_2 + 1
      L0_2["attraction3-synchdata"] = L1_2
    end
    L0_2 = TriggerClientEvent
    L1_2 = "rtx_themepark:Global:MusicStopAttraction"
    L2_2 = -1
    L3_2 = "vortex"
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = vortexhandler
    L0_2.currentrotation = 0.0
    L0_2 = vortexhandler
    L0_2.currentrotation2 = 0.0
    L0_2 = GlobalState
    L0_2["attraction3-phase"] = 0
    L0_2 = GlobalState
    L0_2["attraction3-ridedata1"] = 0.0
    L0_2 = GlobalState
    L0_2["attraction3-ridedata2"] = 0.0
    L0_2 = vortexhandler
    L0_2.started = false
    L0_2 = TriggerClientEvent
    L1_2 = "rtx_themepark:Vortex:SynchronizeStarted"
    L2_2 = -1
    L3_2 = false
    L0_2(L1_2, L2_2, L3_2)
  end
end
StartVortex = L0_1
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Vortex:SeatUse"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Vortex:SeatUse"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  L2_2 = themeparkattractionsopenstatus
  L2_2 = L2_2[7]
  if true == L2_2 then
    L2_2 = themeparkdisabled
    if false == L2_2 then
      if nil ~= A0_2 then
        L2_2 = vortexhandler
        L2_2 = L2_2.started
        if false == L2_2 then
          L2_2 = vortexhandler
          L2_2 = L2_2.seats
          L2_2 = L2_2[A0_2]
          L3_2 = L2_2.taken
          if false == L3_2 then
            L2_2.taken = true
            L2_2.takenplayerid = L1_2
            L3_2 = pairs
            L4_2 = playsersinthemepark
            L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
            for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
              L9_2 = TriggerClientEvent
              L10_2 = "rtx_themepark:Vortex:SynchronizeSeat"
              L11_2 = L8_2
              L12_2 = A0_2
              L13_2 = true
              L14_2 = L2_2.takenplayerid
              L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
            end
            L3_2 = TriggerClientEvent
            L4_2 = "rtx_themepark:Vortex:SeatData"
            L5_2 = L1_2
            L6_2 = A0_2
            L3_2(L4_2, L5_2, L6_2)
            L3_2 = TriggerClientEvent
            L4_2 = "rtx_themepark:Global:AttractionUsing"
            L5_2 = L1_2
            L6_2 = true
            L3_2(L4_2, L5_2, L6_2)
            L3_2 = Config
            L3_2 = L3_2.ThemeParkControlAttractions
            if false == L3_2 then
              L3_2 = vortexhandler
              L3_2 = L3_2.started
              if false == L3_2 then
                L3_2 = attractionlockdown
                if false == L3_2 then
                  L3_2 = Wait
                  L4_2 = Config
                  L4_2 = L4_2.AttractionsSettings
                  L4_2 = L4_2.vortex
                  L4_2 = L4_2.waitforplayers
                  L3_2(L4_2)
                  L3_2 = vortexhandler
                  L3_2 = L3_2.started
                  if false == L3_2 then
                    L3_2 = vortexhandler
                    L3_2.started = true
                    L3_2 = TriggerClientEvent
                    L4_2 = "rtx_themepark:Vortex:SynchronizeStarted"
                    L5_2 = -1
                    L6_2 = true
                    L3_2(L4_2, L5_2, L6_2)
                    L3_2 = StartVortex
                    L3_2()
                  end
                end
              end
            end
          end
        end
      end
  end
  else
    L2_2 = TriggerClientEvent
    L3_2 = "rtx_themepark:Notify"
    L4_2 = L1_2
    L5_2 = Language
    L6_2 = Config
    L6_2 = L6_2.Language
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2.attractionclosed
    L2_2(L3_2, L4_2, L5_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Vortex:ExitAttraction"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Vortex:ExitAttraction"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  if nil ~= A0_2 then
    L2_2 = vortexhandler
    L2_2 = L2_2.seats
    L2_2 = L2_2[A0_2]
    L3_2 = L2_2.taken
    if true == L3_2 then
      L3_2 = L2_2.takenplayerid
      if L3_2 == L1_2 then
        L3_2 = Config
        L3_2 = L3_2.ThemeParkDisableExit
        if false ~= L3_2 then
          L3_2 = vortexhandler
          L3_2 = L3_2.started
          if false ~= L3_2 then
            goto lbl_48
          end
        end
        L3_2 = pairs
        L4_2 = playsersinthemepark
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = TriggerClientEvent
          L10_2 = "rtx_themepark:Vortex:SynchronizeSeat"
          L11_2 = L8_2
          L12_2 = A0_2
          L13_2 = false
          L14_2 = L2_2.takenplayerid
          L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
        end
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:Vortex:SeatExit"
        L5_2 = L2_2.takenplayerid
        L3_2(L4_2, L5_2)
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:Global:AttractionUsing"
        L5_2 = L2_2.takenplayerid
        L6_2 = false
        L3_2(L4_2, L5_2, L6_2)
        L2_2.taken = false
        L2_2.takenplayerid = nil
        L2_2.seattype = 1
        goto lbl_57
        ::lbl_48::
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
  ::lbl_57::
end
L0_1(L1_1, L2_1)
L0_1 = Config
L0_1 = L0_1.ThemeParkAttractionFallChance
if L0_1 then
  L0_1 = Config
  L0_1 = L0_1.ThemeParkFallSettings
  L0_1 = L0_1.attractions
  L0_1 = L0_1.vortex
  if L0_1 then
    L0_1 = RegisterServerEvent
    L1_1 = "rtx_themepark:Vortex:ThrowAttraction"
    L0_1(L1_1)
    L0_1 = AddEventHandler
    L1_1 = "rtx_themepark:Vortex:ThrowAttraction"
    function L2_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
      L1_2 = source
      if nil ~= A0_2 then
        L2_2 = vortexhandler
        L2_2 = L2_2.seats
        L2_2 = L2_2[A0_2]
        L3_2 = L2_2.taken
        if true == L3_2 then
          L3_2 = L2_2.takenplayerid
          if L3_2 == L1_2 then
            L3_2 = pairs
            L4_2 = playsersinthemepark
            L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
            for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
              L9_2 = TriggerClientEvent
              L10_2 = "rtx_themepark:Vortex:SynchronizeSeat"
              L11_2 = L8_2
              L12_2 = A0_2
              L13_2 = false
              L14_2 = L2_2.takenplayerid
              L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
            end
            L3_2 = TriggerClientEvent
            L4_2 = "rtx_themepark:Vortex:SeatThrowClient"
            L5_2 = L2_2.takenplayerid
            L3_2(L4_2, L5_2)
            L3_2 = TriggerClientEvent
            L4_2 = "rtx_themepark:Global:AttractionUsing"
            L5_2 = L2_2.takenplayerid
            L6_2 = false
            L3_2(L4_2, L5_2, L6_2)
            L2_2.taken = false
            L2_2.takenplayerid = nil
            L2_2.seattype = 1
          end
        end
      end
    end
    L0_1(L1_1, L2_1)
  end
end
