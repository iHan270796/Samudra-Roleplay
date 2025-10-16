local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = vector3
L2_1 = -1637.83447
L3_1 = -1078.90576
L4_1 = 41.26547
L1_1 = L1_1(L2_1, L3_1, L4_1)
L0_1.coords = L1_1
L0_1.started = false
L0_1.changingsides = false
L0_1.currentrotation = 0.0
L0_1.seatdown = 1
L0_1.stageinprogress = false
L0_1.stage = 15
L0_1.stagecounter = 0
L0_1.stagespeed = 0.5
L1_1 = {}
L2_1 = {}
L2_1.cageclosed = false
L3_1 = {}
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L3_1[1] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L3_1[2] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L3_1[3] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L3_1[4] = L4_1
L2_1.seats = L3_1
L1_1[1] = L2_1
L2_1 = {}
L2_1.cageclosed = true
L3_1 = {}
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L3_1[1] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L3_1[2] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L3_1[3] = L4_1
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L3_1[4] = L4_1
L2_1.seats = L3_1
L1_1[2] = L2_1
L0_1.seats = L1_1
gforcehandler = L0_1
L0_1 = GlobalState
L0_1["attraction1-phase"] = 0
L0_1 = GlobalState
L0_1["attraction1-ridedata1"] = 0.0
L0_1 = GlobalState
L0_1["attraction1-speeddata1"] = 0.1
L0_1 = GlobalState
L0_1["attraction1-synchdata"] = 1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L0_2 = gforcehandler
  L0_2 = L0_2.started
  if true == L0_2 then
    L0_2 = gforcehandler
    L0_2 = L0_2.seats
    L1_2 = gforcehandler
    L1_2 = L1_2.seatdown
    L0_2 = L0_2[L1_2]
    L0_2.cageclosed = false
    L1_2 = pairs
    L2_2 = playsersinthemepark
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = TriggerClientEvent
      L8_2 = "rtx_themepark:GForce:SynchronizeCageClient"
      L9_2 = L6_2
      L10_2 = gforcehandler
      L10_2 = L10_2.seatdown
      L11_2 = false
      L7_2(L8_2, L9_2, L10_2, L11_2)
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = 5000
    L1_2(L2_2)
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Global:MusicStartAttraction"
    L3_2 = -1
    L4_2 = "gforce"
    L5_2 = math
    L5_2 = L5_2.random
    L6_2 = 1
    L7_2 = Config
    L7_2 = L7_2.AttractionsMusic
    L7_2 = L7_2.gforce
    L7_2 = L7_2.playlist
    L7_2 = #L7_2
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L5_2(L6_2, L7_2)
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    L1_2 = gforcehandler
    L1_2.stageinprogress = true
    L1_2 = gforcehandler
    L1_2.stage = 22
    L1_2 = gforcehandler
    L1_2.stagecounter = 0
    L1_2 = gforcehandler
    L1_2.stagespeed = 0.5
    L1_2 = GlobalState
    L1_2["attraction1-phase"] = 22
    L1_2 = GlobalState
    L1_2["attraction1-ridedata1"] = 0.0
    L1_2 = GlobalState
    L1_2["attraction1-speeddata1"] = 0.1
    L1_2 = GlobalState
    L1_2["attraction1-synchdata"] = 1
    L1_2 = gforcehandler
    L1_2 = L1_2.seats
    L1_2 = L1_2[1]
    L2_2 = ipairs
    L3_2 = L1_2.seats
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L7_2.taken
      if true == L8_2 then
        L8_2 = pairs
        L9_2 = playsersinthemepark
        L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
        for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
          L14_2 = TriggerClientEvent
          L15_2 = "rtx_themepark:GForce:SynchronizeSeat"
          L16_2 = L13_2
          L17_2 = 1
          L18_2 = L6_2
          L19_2 = true
          L20_2 = L7_2.takenplayerid
          L21_2 = L7_2.seattype
          L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
        end
        L8_2 = TriggerClientEvent
        L9_2 = "rtx_themepark:Global:AttractionUsing"
        L10_2 = L7_2.takenplayerid
        L11_2 = true
        L8_2(L9_2, L10_2, L11_2)
      end
    end
    while true do
      L2_2 = gforcehandler
      L2_2 = L2_2.stageinprogress
      if true ~= L2_2 then
        break
      end
      L2_2 = Citizen
      L2_2 = L2_2.Wait
      L3_2 = 20
      L2_2(L3_2)
      L2_2 = gforcehandler
      L2_2 = L2_2.stage
      if 22 == L2_2 then
        L2_2 = gforcehandler
        L3_2 = Config
        L3_2 = L3_2.AttractionsSettings
        L3_2 = L3_2.gforce
        L3_2 = L3_2.speedmodifier
        L3_2 = 0.25 * L3_2
        L2_2.stagespeed = L3_2
        L2_2 = gforcehandler
        L2_2 = L2_2.currentrotation
        L3_2 = 180.0
        if not (L2_2 < L3_2) then
          L2_2 = gforcehandler
          L2_2 = L2_2.currentrotation
          L3_2 = 180.25
          if not (L2_2 > L3_2) then
            goto lbl_132
          end
        end
        L2_2 = gforcehandler
        L3_2 = gforcehandler
        L3_2 = L3_2.currentrotation
        L4_2 = gforcehandler
        L4_2 = L4_2.stagespeed
        L3_2 = L3_2 + L4_2
        L2_2.currentrotation = L3_2
        goto lbl_905
        ::lbl_132::
        L2_2 = gforcehandler
        L2_2.currentrotation = 180.0
        L2_2 = gforcehandler
        L2_2.stage = 20
      else
        L2_2 = gforcehandler
        L2_2 = L2_2.stage
        if 20 == L2_2 then
          L2_2 = gforcehandler
          L2_2.currentrotation = 180.0
          L2_2 = gforcehandler
          L2_2.seatdown = 2
          L2_2 = gforcehandler
          L2_2.started = false
          L2_2 = pairs
          L3_2 = playsersinthemepark
          L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
          for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
            L8_2 = TriggerClientEvent
            L9_2 = "rtx_themepark:GForce:SeatDown"
            L10_2 = L7_2
            L11_2 = 2
            L8_2(L9_2, L10_2, L11_2)
          end
          L2_2 = TriggerClientEvent
          L3_2 = "rtx_themepark:GForce:SynchronizeStarted"
          L4_2 = -1
          L5_2 = false
          L2_2(L3_2, L4_2, L5_2)
          L2_2 = gforcehandler
          L2_2 = L2_2.seats
          L2_2 = L2_2[2]
          L2_2.cageclosed = true
          L3_2 = pairs
          L4_2 = playsersinthemepark
          L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
          for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
            L9_2 = TriggerClientEvent
            L10_2 = "rtx_themepark:GForce:SynchronizeCageClient"
            L11_2 = L8_2
            L12_2 = 2
            L13_2 = true
            L9_2(L10_2, L11_2, L12_2, L13_2)
          end
          L3_2 = Citizen
          L3_2 = L3_2.Wait
          L4_2 = 2500
          L3_2(L4_2)
          L3_2 = Wait
          L4_2 = Config
          L4_2 = L4_2.AttractionsSettings
          L4_2 = L4_2.gforce
          L4_2 = L4_2.waitforplayers
          L3_2(L4_2)
          L3_2 = gforcehandler
          L3_2 = L3_2.seats
          L3_2 = L3_2[2]
          L4_2 = ipairs
          L5_2 = L3_2.seats
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
            L10_2 = L9_2.taken
            if true == L10_2 then
              L10_2 = pairs
              L11_2 = playsersinthemepark
              L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
              for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
                L16_2 = TriggerClientEvent
                L17_2 = "rtx_themepark:GForce:SynchronizeSeat"
                L18_2 = L15_2
                L19_2 = 2
                L20_2 = L8_2
                L21_2 = true
                L22_2 = L9_2.takenplayerid
                L23_2 = L9_2.seattype
                L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
              end
              L10_2 = TriggerClientEvent
              L11_2 = "rtx_themepark:Global:AttractionUsing"
              L12_2 = L9_2.takenplayerid
              L13_2 = true
              L10_2(L11_2, L12_2, L13_2)
            end
          end
          L4_2 = gforcehandler
          L4_2 = L4_2.seats
          L4_2 = L4_2[2]
          L4_2.cageclosed = false
          L5_2 = pairs
          L6_2 = playsersinthemepark
          L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
          for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
            L11_2 = TriggerClientEvent
            L12_2 = "rtx_themepark:GForce:SynchronizeCageClient"
            L13_2 = L10_2
            L14_2 = 2
            L15_2 = false
            L11_2(L12_2, L13_2, L14_2, L15_2)
          end
          L5_2 = Citizen
          L5_2 = L5_2.Wait
          L6_2 = 5000
          L5_2(L6_2)
          L5_2 = gforcehandler
          L5_2.stage = 1
          L5_2 = gforcehandler
          L5_2.started = true
          L5_2 = TriggerClientEvent
          L6_2 = "rtx_themepark:GForce:SynchronizeStarted"
          L7_2 = -1
          L8_2 = true
          L5_2(L6_2, L7_2, L8_2)
        else
          L2_2 = gforcehandler
          L2_2 = L2_2.stage
          if 1 == L2_2 then
            L2_2 = gforcehandler
            L3_2 = Config
            L3_2 = L3_2.AttractionsSettings
            L3_2 = L3_2.gforce
            L3_2 = L3_2.speedmodifier
            L3_2 = 0.25 * L3_2
            L2_2.stagespeed = L3_2
            L2_2 = gforcehandler
            L3_2 = gforcehandler
            L3_2 = L3_2.stagecounter
            L3_2 = L3_2 + 1.0
            L2_2.stagecounter = L3_2
            L2_2 = gforcehandler
            L2_2 = L2_2.stagecounter
            L3_2 = 250.0
            if L2_2 > L3_2 then
              L2_2 = gforcehandler
              L2_2.stage = 2
              L2_2 = gforcehandler
              L2_2.stagecounter = 0
            end
            L2_2 = gforcehandler
            L3_2 = gforcehandler
            L3_2 = L3_2.currentrotation
            L4_2 = gforcehandler
            L4_2 = L4_2.stagespeed
            L3_2 = L3_2 + L4_2
            L2_2.currentrotation = L3_2
          else
            L2_2 = gforcehandler
            L2_2 = L2_2.stage
            if 2 == L2_2 then
              L2_2 = gforcehandler
              L3_2 = Config
              L3_2 = L3_2.AttractionsSettings
              L3_2 = L3_2.gforce
              L3_2 = L3_2.speedmodifier
              L3_2 = 0.5 * L3_2
              L2_2.stagespeed = L3_2
              L2_2 = gforcehandler
              L3_2 = gforcehandler
              L3_2 = L3_2.stagecounter
              L3_2 = L3_2 + 1.0
              L2_2.stagecounter = L3_2
              L2_2 = gforcehandler
              L2_2 = L2_2.stagecounter
              L3_2 = 250.0
              if L2_2 > L3_2 then
                L2_2 = gforcehandler
                L2_2.stage = 3
                L2_2 = gforcehandler
                L2_2.stagecounter = 0
              end
              L2_2 = gforcehandler
              L3_2 = gforcehandler
              L3_2 = L3_2.currentrotation
              L4_2 = gforcehandler
              L4_2 = L4_2.stagespeed
              L3_2 = L3_2 + L4_2
              L2_2.currentrotation = L3_2
            else
              L2_2 = gforcehandler
              L2_2 = L2_2.stage
              if 3 == L2_2 then
                L2_2 = gforcehandler
                L3_2 = Config
                L3_2 = L3_2.AttractionsSettings
                L3_2 = L3_2.gforce
                L3_2 = L3_2.speedmodifier
                L3_2 = 0.75 * L3_2
                L2_2.stagespeed = L3_2
                L2_2 = gforcehandler
                L3_2 = gforcehandler
                L3_2 = L3_2.stagecounter
                L3_2 = L3_2 + 1.0
                L2_2.stagecounter = L3_2
                L2_2 = gforcehandler
                L2_2 = L2_2.stagecounter
                L3_2 = 250.0
                if L2_2 > L3_2 then
                  L2_2 = gforcehandler
                  L2_2.stage = 4
                  L2_2 = gforcehandler
                  L2_2.stagecounter = 0
                end
                L2_2 = gforcehandler
                L3_2 = gforcehandler
                L3_2 = L3_2.currentrotation
                L4_2 = gforcehandler
                L4_2 = L4_2.stagespeed
                L3_2 = L3_2 + L4_2
                L2_2.currentrotation = L3_2
              else
                L2_2 = gforcehandler
                L2_2 = L2_2.stage
                if 4 == L2_2 then
                  L2_2 = gforcehandler
                  L3_2 = Config
                  L3_2 = L3_2.AttractionsSettings
                  L3_2 = L3_2.gforce
                  L3_2 = L3_2.speedmodifier
                  L3_2 = 1.0 * L3_2
                  L2_2.stagespeed = L3_2
                  L2_2 = gforcehandler
                  L3_2 = gforcehandler
                  L3_2 = L3_2.stagecounter
                  L3_2 = L3_2 + 1.0
                  L2_2.stagecounter = L3_2
                  L2_2 = gforcehandler
                  L2_2 = L2_2.stagecounter
                  L3_2 = 250.0
                  if L2_2 > L3_2 then
                    L2_2 = gforcehandler
                    L2_2.stage = 5
                    L2_2 = gforcehandler
                    L2_2.stagecounter = 0
                  end
                  L2_2 = gforcehandler
                  L3_2 = gforcehandler
                  L3_2 = L3_2.currentrotation
                  L4_2 = gforcehandler
                  L4_2 = L4_2.stagespeed
                  L3_2 = L3_2 + L4_2
                  L2_2.currentrotation = L3_2
                else
                  L2_2 = gforcehandler
                  L2_2 = L2_2.stage
                  if 5 == L2_2 then
                    L2_2 = gforcehandler
                    L3_2 = Config
                    L3_2 = L3_2.AttractionsSettings
                    L3_2 = L3_2.gforce
                    L3_2 = L3_2.speedmodifier
                    L3_2 = 1.25 * L3_2
                    L2_2.stagespeed = L3_2
                    L2_2 = gforcehandler
                    L3_2 = gforcehandler
                    L3_2 = L3_2.stagecounter
                    L3_2 = L3_2 + 1.0
                    L2_2.stagecounter = L3_2
                    L2_2 = gforcehandler
                    L2_2 = L2_2.stagecounter
                    L3_2 = 250.0
                    if L2_2 > L3_2 then
                      L2_2 = gforcehandler
                      L2_2.stage = 6
                      L2_2 = gforcehandler
                      L2_2.stagecounter = 0
                    end
                    L2_2 = gforcehandler
                    L3_2 = gforcehandler
                    L3_2 = L3_2.currentrotation
                    L4_2 = gforcehandler
                    L4_2 = L4_2.stagespeed
                    L3_2 = L3_2 + L4_2
                    L2_2.currentrotation = L3_2
                  else
                    L2_2 = gforcehandler
                    L2_2 = L2_2.stage
                    if 6 == L2_2 then
                      L2_2 = gforcehandler
                      L3_2 = Config
                      L3_2 = L3_2.AttractionsSettings
                      L3_2 = L3_2.gforce
                      L3_2 = L3_2.speedmodifier
                      L3_2 = 1.75 * L3_2
                      L2_2.stagespeed = L3_2
                      L2_2 = gforcehandler
                      L3_2 = gforcehandler
                      L3_2 = L3_2.currentrotation
                      L4_2 = gforcehandler
                      L4_2 = L4_2.stagespeed
                      L3_2 = L3_2 + L4_2
                      L2_2.currentrotation = L3_2
                      L2_2 = gforcehandler
                      L2_2 = L2_2.currentrotation
                      L3_2 = 359.9
                      if L2_2 > L3_2 then
                        L2_2 = gforcehandler
                        L3_2 = gforcehandler
                        L3_2 = L3_2.stagecounter
                        L3_2 = L3_2 + 1
                        L2_2.stagecounter = L3_2
                        L2_2 = gforcehandler
                        L2_2 = L2_2.stagecounter
                        L3_2 = Config
                        L3_2 = L3_2.AttractionsSettings
                        L3_2 = L3_2.gforce
                        L3_2 = L3_2.maxrounds
                        if L2_2 > L3_2 then
                          L2_2 = gforcehandler
                          L2_2.stage = 7
                          L2_2 = gforcehandler
                          L2_2.stagecounter = 0
                        end
                      end
                    else
                      L2_2 = gforcehandler
                      L2_2 = L2_2.stage
                      if 7 == L2_2 then
                        L2_2 = gforcehandler
                        L3_2 = Config
                        L3_2 = L3_2.AttractionsSettings
                        L3_2 = L3_2.gforce
                        L3_2 = L3_2.speedmodifier
                        L3_2 = 1.25 * L3_2
                        L2_2.stagespeed = L3_2
                        L2_2 = gforcehandler
                        L3_2 = gforcehandler
                        L3_2 = L3_2.stagecounter
                        L3_2 = L3_2 + 1.0
                        L2_2.stagecounter = L3_2
                        L2_2 = gforcehandler
                        L2_2 = L2_2.stagecounter
                        if L2_2 > 100.0 then
                          L2_2 = gforcehandler
                          L2_2.stage = 8
                          L2_2 = gforcehandler
                          L2_2.stagecounter = 0
                        end
                        L2_2 = gforcehandler
                        L3_2 = gforcehandler
                        L3_2 = L3_2.currentrotation
                        L4_2 = gforcehandler
                        L4_2 = L4_2.stagespeed
                        L3_2 = L3_2 + L4_2
                        L2_2.currentrotation = L3_2
                      else
                        L2_2 = gforcehandler
                        L2_2 = L2_2.stage
                        if 8 == L2_2 then
                          L2_2 = gforcehandler
                          L3_2 = Config
                          L3_2 = L3_2.AttractionsSettings
                          L3_2 = L3_2.gforce
                          L3_2 = L3_2.speedmodifier
                          L3_2 = 1.0 * L3_2
                          L2_2.stagespeed = L3_2
                          L2_2 = gforcehandler
                          L3_2 = gforcehandler
                          L3_2 = L3_2.stagecounter
                          L3_2 = L3_2 + 1.0
                          L2_2.stagecounter = L3_2
                          L2_2 = gforcehandler
                          L2_2 = L2_2.stagecounter
                          if L2_2 > 50.0 then
                            L2_2 = gforcehandler
                            L2_2.stage = 9
                            L2_2 = gforcehandler
                            L2_2.stagecounter = 0
                          end
                          L2_2 = gforcehandler
                          L3_2 = gforcehandler
                          L3_2 = L3_2.currentrotation
                          L4_2 = gforcehandler
                          L4_2 = L4_2.stagespeed
                          L3_2 = L3_2 + L4_2
                          L2_2.currentrotation = L3_2
                        else
                          L2_2 = gforcehandler
                          L2_2 = L2_2.stage
                          if 9 == L2_2 then
                            L2_2 = gforcehandler
                            L3_2 = Config
                            L3_2 = L3_2.AttractionsSettings
                            L3_2 = L3_2.gforce
                            L3_2 = L3_2.speedmodifier
                            L3_2 = 0.75 * L3_2
                            L2_2.stagespeed = L3_2
                            L2_2 = gforcehandler
                            L3_2 = gforcehandler
                            L3_2 = L3_2.stagecounter
                            L3_2 = L3_2 + 1.0
                            L2_2.stagecounter = L3_2
                            L2_2 = gforcehandler
                            L2_2 = L2_2.stagecounter
                            if L2_2 > 50.0 then
                              L2_2 = gforcehandler
                              L2_2.stage = 10
                              L2_2 = gforcehandler
                              L2_2.stagecounter = 0
                            end
                            L2_2 = gforcehandler
                            L3_2 = gforcehandler
                            L3_2 = L3_2.currentrotation
                            L4_2 = gforcehandler
                            L4_2 = L4_2.stagespeed
                            L3_2 = L3_2 + L4_2
                            L2_2.currentrotation = L3_2
                          else
                            L2_2 = gforcehandler
                            L2_2 = L2_2.stage
                            if 10 == L2_2 then
                              L2_2 = gforcehandler
                              L3_2 = Config
                              L3_2 = L3_2.AttractionsSettings
                              L3_2 = L3_2.gforce
                              L3_2 = L3_2.speedmodifier
                              L3_2 = 0.5 * L3_2
                              L2_2.stagespeed = L3_2
                              L2_2 = gforcehandler
                              L3_2 = gforcehandler
                              L3_2 = L3_2.stagecounter
                              L3_2 = L3_2 + 1.0
                              L2_2.stagecounter = L3_2
                              L2_2 = gforcehandler
                              L2_2 = L2_2.stagecounter
                              if L2_2 > 50.0 then
                                L2_2 = gforcehandler
                                L2_2.stage = 11
                                L2_2 = gforcehandler
                                L2_2.stagecounter = 0
                              end
                              L2_2 = gforcehandler
                              L3_2 = gforcehandler
                              L3_2 = L3_2.currentrotation
                              L4_2 = gforcehandler
                              L4_2 = L4_2.stagespeed
                              L3_2 = L3_2 + L4_2
                              L2_2.currentrotation = L3_2
                            else
                              L2_2 = gforcehandler
                              L2_2 = L2_2.stage
                              if 11 == L2_2 then
                                L2_2 = gforcehandler
                                L3_2 = Config
                                L3_2 = L3_2.AttractionsSettings
                                L3_2 = L3_2.gforce
                                L3_2 = L3_2.speedmodifier
                                L3_2 = 0.25 * L3_2
                                L2_2.stagespeed = L3_2
                                L2_2 = gforcehandler
                                L3_2 = gforcehandler
                                L3_2 = L3_2.stagecounter
                                L3_2 = L3_2 + 1.0
                                L2_2.stagecounter = L3_2
                                L2_2 = gforcehandler
                                L2_2 = L2_2.stagecounter
                                if L2_2 > 50.0 then
                                  L2_2 = gforcehandler
                                  L2_2.stage = 12
                                  L2_2 = gforcehandler
                                  L2_2.stagecounter = 0
                                end
                                L2_2 = gforcehandler
                                L3_2 = gforcehandler
                                L3_2 = L3_2.currentrotation
                                L4_2 = gforcehandler
                                L4_2 = L4_2.stagespeed
                                L3_2 = L3_2 + L4_2
                                L2_2.currentrotation = L3_2
                              else
                                L2_2 = gforcehandler
                                L2_2 = L2_2.stage
                                if 12 == L2_2 then
                                  L2_2 = gforcehandler
                                  L3_2 = Config
                                  L3_2 = L3_2.AttractionsSettings
                                  L3_2 = L3_2.gforce
                                  L3_2 = L3_2.speedmodifier
                                  L3_2 = 0.25 * L3_2
                                  L2_2.stagespeed = L3_2
                                  L2_2 = gforcehandler
                                  L2_2 = L2_2.currentrotation
                                  L3_2 = 180.0
                                  if not (L2_2 < L3_2) then
                                    L2_2 = gforcehandler
                                    L2_2 = L2_2.currentrotation
                                    L3_2 = 180.25
                                    if not (L2_2 > L3_2) then
                                      goto lbl_686
                                    end
                                  end
                                  L2_2 = gforcehandler
                                  L3_2 = gforcehandler
                                  L3_2 = L3_2.currentrotation
                                  L4_2 = gforcehandler
                                  L4_2 = L4_2.stagespeed
                                  L3_2 = L3_2 + L4_2
                                  L2_2.currentrotation = L3_2
                                  goto lbl_905
                                  ::lbl_686::
                                  L2_2 = gforcehandler
                                  L2_2.currentrotation = 180.0
                                  L2_2 = gforcehandler
                                  L2_2.stage = 13
                                else
                                  L2_2 = gforcehandler
                                  L2_2 = L2_2.stage
                                  if 13 == L2_2 then
                                    L2_2 = gforcehandler
                                    L2_2.currentrotation = 180.0
                                    L2_2 = gforcehandler
                                    L2_2 = L2_2.seats
                                    L2_2 = L2_2[2]
                                    L2_2.cageclosed = true
                                    L3_2 = pairs
                                    L4_2 = playsersinthemepark
                                    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
                                    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
                                      L9_2 = TriggerClientEvent
                                      L10_2 = "rtx_themepark:GForce:SynchronizeCageClient"
                                      L11_2 = L8_2
                                      L12_2 = 2
                                      L13_2 = true
                                      L9_2(L10_2, L11_2, L12_2, L13_2)
                                    end
                                    L3_2 = Citizen
                                    L3_2 = L3_2.Wait
                                    L4_2 = 5000
                                    L3_2(L4_2)
                                    L3_2 = gforcehandler
                                    L3_2 = L3_2.seats
                                    L3_2 = L3_2[2]
                                    L4_2 = ipairs
                                    L5_2 = L3_2.seats
                                    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
                                    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
                                      L10_2 = L9_2.taken
                                      if true == L10_2 then
                                        L9_2.taken = false
                                        L10_2 = pairs
                                        L11_2 = playsersinthemepark
                                        L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
                                        for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
                                          L16_2 = TriggerClientEvent
                                          L17_2 = "rtx_themepark:GForce:SynchronizeSeat"
                                          L18_2 = L15_2
                                          L19_2 = 2
                                          L20_2 = L8_2
                                          L21_2 = false
                                          L22_2 = L9_2.takenplayerid
                                          L23_2 = L9_2.seattype
                                          L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                                        end
                                        L10_2 = TriggerClientEvent
                                        L11_2 = "rtx_themepark:GForce:SeatExit"
                                        L12_2 = L9_2.takenplayerid
                                        L13_2 = true
                                        L10_2(L11_2, L12_2, L13_2)
                                        L10_2 = TriggerClientEvent
                                        L11_2 = "rtx_themepark:Global:AttractionUsing"
                                        L12_2 = L9_2.takenplayerid
                                        L13_2 = false
                                        L10_2(L11_2, L12_2, L13_2)
                                        L10_2 = TriggerClientEvent
                                        L11_2 = "rtx_themepark:Global:TicketHandler"
                                        L12_2 = L9_2.takenplayerid
                                        L13_2 = 1
                                        L14_2 = false
                                        L10_2(L11_2, L12_2, L13_2, L14_2)
                                        L9_2.takenplayerid = nil
                                        L9_2.seattype = 1
                                      end
                                    end
                                    L4_2 = Citizen
                                    L4_2 = L4_2.Wait
                                    L5_2 = 5000
                                    L4_2(L5_2)
                                    L4_2 = gforcehandler
                                    L4_2 = L4_2.seats
                                    L4_2 = L4_2[2]
                                    L4_2.cageclosed = false
                                    L5_2 = pairs
                                    L6_2 = playsersinthemepark
                                    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
                                    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
                                      L11_2 = TriggerClientEvent
                                      L12_2 = "rtx_themepark:GForce:SynchronizeCageClient"
                                      L13_2 = L10_2
                                      L14_2 = 2
                                      L15_2 = false
                                      L11_2(L12_2, L13_2, L14_2, L15_2)
                                    end
                                    L5_2 = Citizen
                                    L5_2 = L5_2.Wait
                                    L6_2 = 5000
                                    L5_2(L6_2)
                                    L5_2 = gforcehandler
                                    L5_2.stage = 14
                                  else
                                    L2_2 = gforcehandler
                                    L2_2 = L2_2.stage
                                    if 14 == L2_2 then
                                      L2_2 = gforcehandler
                                      L3_2 = Config
                                      L3_2 = L3_2.AttractionsSettings
                                      L3_2 = L3_2.gforce
                                      L3_2 = L3_2.speedmodifier
                                      L3_2 = 0.25 * L3_2
                                      L2_2.stagespeed = L3_2
                                      L2_2 = gforcehandler
                                      L2_2 = L2_2.currentrotation
                                      L3_2 = 360.0
                                      if L2_2 < L3_2 then
                                        L2_2 = gforcehandler
                                        L2_2 = L2_2.currentrotation
                                        L3_2 = 0.25
                                        if L2_2 > L3_2 then
                                          L2_2 = gforcehandler
                                          L3_2 = gforcehandler
                                          L3_2 = L3_2.currentrotation
                                          L4_2 = gforcehandler
                                          L4_2 = L4_2.stagespeed
                                          L3_2 = L3_2 + L4_2
                                          L2_2.currentrotation = L3_2
                                      end
                                      else
                                        L2_2 = gforcehandler
                                        L2_2.currentrotation = 360.0
                                        L2_2 = gforcehandler
                                        L2_2.stage = 15
                                      end
                                    else
                                      L2_2 = gforcehandler
                                      L2_2 = L2_2.stage
                                      if 15 == L2_2 then
                                        L2_2 = gforcehandler
                                        L2_2 = L2_2.seats
                                        L2_2 = L2_2[1]
                                        L2_2.cageclosed = true
                                        L3_2 = pairs
                                        L4_2 = playsersinthemepark
                                        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
                                        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
                                          L9_2 = TriggerClientEvent
                                          L10_2 = "rtx_themepark:GForce:SynchronizeCageClient"
                                          L11_2 = L8_2
                                          L12_2 = 1
                                          L13_2 = true
                                          L9_2(L10_2, L11_2, L12_2, L13_2)
                                        end
                                        L3_2 = Citizen
                                        L3_2 = L3_2.Wait
                                        L4_2 = 5000
                                        L3_2(L4_2)
                                        L3_2 = gforcehandler
                                        L3_2 = L3_2.seats
                                        L3_2 = L3_2[1]
                                        L4_2 = ipairs
                                        L5_2 = L3_2.seats
                                        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
                                        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
                                          L10_2 = L9_2.taken
                                          if true == L10_2 then
                                            L9_2.taken = false
                                            L10_2 = pairs
                                            L11_2 = playsersinthemepark
                                            L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
                                            for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
                                              L16_2 = TriggerClientEvent
                                              L17_2 = "rtx_themepark:GForce:SynchronizeSeat"
                                              L18_2 = L15_2
                                              L19_2 = 1
                                              L20_2 = L8_2
                                              L21_2 = false
                                              L22_2 = L9_2.takenplayerid
                                              L23_2 = L9_2.seattype
                                              L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                                            end
                                            L10_2 = TriggerClientEvent
                                            L11_2 = "rtx_themepark:GForce:SeatExit"
                                            L12_2 = L9_2.takenplayerid
                                            L13_2 = true
                                            L10_2(L11_2, L12_2, L13_2)
                                            L10_2 = TriggerClientEvent
                                            L11_2 = "rtx_themepark:Global:AttractionUsing"
                                            L12_2 = L9_2.takenplayerid
                                            L13_2 = false
                                            L10_2(L11_2, L12_2, L13_2)
                                            L10_2 = TriggerClientEvent
                                            L11_2 = "rtx_themepark:Global:TicketHandler"
                                            L12_2 = L9_2.takenplayerid
                                            L13_2 = 1
                                            L14_2 = false
                                            L10_2(L11_2, L12_2, L13_2, L14_2)
                                            L9_2.takenplayerid = nil
                                            L9_2.seattype = 1
                                          end
                                        end
                                        L4_2 = gforcehandler
                                        L4_2.stageinprogress = false
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
        end
      end
      ::lbl_905::
      L2_2 = gforcehandler
      L2_2 = L2_2.stage
      if 14 == L2_2 then
      else
        L2_2 = gforcehandler
        L2_2 = L2_2.currentrotation
        L3_2 = 360.0
        if L2_2 > L3_2 then
          L2_2 = gforcehandler
          L2_2 = L2_2.currentrotation
          L2_2 = L2_2 - 360.0
          L3_2 = gforcehandler
          L4_2 = 0.0 + L2_2
          L3_2.currentrotation = L4_2
        end
      end
      L2_2 = GlobalState
      L3_2 = gforcehandler
      L3_2 = L3_2.stage
      L2_2["attraction1-phase"] = L3_2
      L2_2 = GlobalState
      L3_2 = gforcehandler
      L3_2 = L3_2.currentrotation
      L2_2["attraction1-ridedata1"] = L3_2
      L2_2 = GlobalState
      L3_2 = gforcehandler
      L3_2 = L3_2.stagespeed
      L2_2["attraction1-speeddata1"] = L3_2
      L2_2 = GlobalState
      L3_2 = GlobalState
      L3_2 = L3_2["attraction1-synchdata"]
      L3_2 = L3_2 + 1
      L2_2["attraction1-synchdata"] = L3_2
    end
    L2_2 = TriggerClientEvent
    L3_2 = "rtx_themepark:Global:MusicStopAttraction"
    L4_2 = -1
    L5_2 = "gforce"
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = gforcehandler
    L2_2.currentrotation = 0.0
    L2_2 = GlobalState
    L2_2["attraction1-phase"] = 0
    L2_2 = gforcehandler
    L2_2.seatdown = 1
    L2_2 = TriggerClientEvent
    L3_2 = "rtx_themepark:GForce:SeatDown"
    L4_2 = -1
    L5_2 = 1
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = gforcehandler
    L2_2.started = false
    L2_2 = TriggerClientEvent
    L3_2 = "rtx_themepark:GForce:SynchronizeStarted"
    L4_2 = -1
    L5_2 = false
    L2_2(L3_2, L4_2, L5_2)
  end
end
StartGForce = L0_1
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:GForce:SeatUse"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:GForce:SeatUse"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = source
  L3_2 = themeparkattractionsopenstatus
  L3_2 = L3_2[1]
  if true == L3_2 then
    L3_2 = themeparkdisabled
    if false == L3_2 then
      if nil ~= A0_2 and nil ~= A1_2 then
        L3_2 = gforcehandler
        L3_2 = L3_2.started
        if false == L3_2 then
          L3_2 = gforcehandler
          L3_2 = L3_2.changingsides
          if false == L3_2 then
            L3_2 = gforcehandler
            L3_2 = L3_2.seatdown
            if L3_2 == A0_2 then
              L3_2 = gforcehandler
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
                  L12_2 = "rtx_themepark:GForce:SynchronizeSeat"
                  L13_2 = L10_2
                  L14_2 = A0_2
                  L15_2 = A1_2
                  L16_2 = true
                  L17_2 = L4_2.takenplayerid
                  L18_2 = L4_2.seattype
                  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
                end
                L5_2 = TriggerClientEvent
                L6_2 = "rtx_themepark:GForce:SeatData"
                L7_2 = L2_2
                L8_2 = A0_2
                L9_2 = A1_2
                L5_2(L6_2, L7_2, L8_2, L9_2)
                L5_2 = TriggerClientEvent
                L6_2 = "rtx_themepark:Global:AttractionUsing"
                L7_2 = L2_2
                L8_2 = true
                L5_2(L6_2, L7_2, L8_2)
                L5_2 = Config
                L5_2 = L5_2.ThemeParkControlAttractions
                if false == L5_2 then
                  L5_2 = gforcehandler
                  L5_2 = L5_2.started
                  if false == L5_2 then
                    L5_2 = gforcehandler
                    L5_2 = L5_2.seatdown
                    if 1 == L5_2 then
                      L5_2 = Wait
                      L6_2 = Config
                      L6_2 = L6_2.AttractionsSettings
                      L6_2 = L6_2.gforce
                      L6_2 = L6_2.waitforplayers
                      L5_2(L6_2)
                      L5_2 = gforcehandler
                      L5_2 = L5_2.started
                      if false == L5_2 then
                        L5_2 = gforcehandler
                        L5_2.started = true
                        L5_2 = TriggerClientEvent
                        L6_2 = "rtx_themepark:GForce:SynchronizeStarted"
                        L7_2 = -1
                        L8_2 = true
                        L5_2(L6_2, L7_2, L8_2)
                        L5_2 = StartGForce
                        L5_2()
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
L1_1 = "rtx_themepark:GForce:SeatAnimChange"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:GForce:SeatAnimChange"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = source
  if nil ~= A0_2 and nil ~= A1_2 then
    L3_2 = gforcehandler
    L3_2 = L3_2.seats
    L3_2 = L3_2[A0_2]
    L4_2 = L3_2.seats
    L4_2 = L4_2[A1_2]
    L5_2 = L4_2.taken
    if true == L5_2 then
      L5_2 = L4_2.takenplayerid
      if L5_2 == L2_2 then
        L5_2 = L4_2.seattype
        if 1 == L5_2 then
          L4_2.seattype = 2
        else
          L4_2.seattype = 1
        end
        L5_2 = pairs
        L6_2 = playsersinthemepark
        L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
        for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
          L11_2 = TriggerClientEvent
          L12_2 = "rtx_themepark:GForce:SynchronizeSeat"
          L13_2 = L10_2
          L14_2 = A0_2
          L15_2 = A1_2
          L16_2 = true
          L17_2 = L4_2.takenplayerid
          L18_2 = L4_2.seattype
          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:GForce:ExitAttraction"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:GForce:ExitAttraction"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = source
  if nil ~= A0_2 and nil ~= A1_2 then
    L3_2 = gforcehandler
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
          L5_2 = gforcehandler
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
          L12_2 = "rtx_themepark:GForce:SynchronizeSeat"
          L13_2 = L10_2
          L14_2 = A0_2
          L15_2 = A1_2
          L16_2 = false
          L17_2 = L4_2.takenplayerid
          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
        end
        L5_2 = TriggerClientEvent
        L6_2 = "rtx_themepark:GForce:SeatExit"
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
  L0_1 = L0_1.gforce
  if L0_1 then
    L0_1 = RegisterServerEvent
    L1_1 = "rtx_themepark:GForce:ThrowAttraction"
    L0_1(L1_1)
    L0_1 = AddEventHandler
    L1_1 = "rtx_themepark:GForce:ThrowAttraction"
    function L2_1(A0_2, A1_2)
      local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
      L2_2 = source
      if nil ~= A0_2 and nil ~= A1_2 then
        L3_2 = gforcehandler
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
              L12_2 = "rtx_themepark:GForce:SynchronizeSeat"
              L13_2 = L10_2
              L14_2 = A0_2
              L15_2 = A1_2
              L16_2 = false
              L17_2 = L4_2.takenplayerid
              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
            end
            L5_2 = TriggerClientEvent
            L6_2 = "rtx_themepark:GForce:SeatThrowClient"
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
