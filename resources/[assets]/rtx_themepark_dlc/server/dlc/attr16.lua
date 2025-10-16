local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L0_1.started = false
L0_1.startid = 0
L0_1.getnew = false
L1_1 = {}
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L3_1 = {}
L4_1 = vec3
L5_1 = 0.267
L6_1 = -0.385
L7_1 = 0.393
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1.coords = L4_1
L4_1 = vec3
L5_1 = 0.0
L6_1 = 0.0
L7_1 = 0.0
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1.rotation = L4_1
L2_1.offsets = L3_1
L1_1[1] = L2_1
L2_1 = {}
L2_1.taken = false
L2_1.takenplayerid = nil
L3_1 = {}
L4_1 = vec3
L5_1 = 0.253
L6_1 = -0.383
L7_1 = 0.393
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1.coords = L4_1
L4_1 = vec3
L5_1 = 0.0
L6_1 = 0.0
L7_1 = 0.0
L4_1 = L4_1(L5_1, L6_1, L7_1)
L3_1.rotation = L4_1
L2_1.offsets = L3_1
L1_1[2] = L2_1
L0_1.seats = L1_1
hauntedhousehandler = L0_1
L0_1 = GlobalState
L0_1["attraction16-phase"] = 0
L0_1 = GlobalState
L0_1["attraction16-ridedata1"] = 1
L0_1 = GlobalState
L0_1["attraction16-ridedata2"] = 8
L0_1 = GlobalState
L0_1["attraction16-synchdata"] = 1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = hauntedhousehandler
  L0_2 = L0_2.started
  if true == L0_2 then
    L0_2 = ipairs
    L1_2 = hauntedhousehandler
    L1_2 = L1_2.seats
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = L5_2.taken
      if true == L6_2 then
        L6_2 = TriggerClientEvent
        L7_2 = "rtx_themepark:HauntedHouse:SynchronizeSeat"
        L8_2 = -1
        L9_2 = L4_2
        L10_2 = true
        L11_2 = L5_2.takenplayerid
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1000
    L0_2(L1_2)
    L0_2 = GlobalState
    L0_2["attraction16-phase"] = 1
    L0_2 = GlobalState
    L0_2["attraction16-ridedata1"] = 1
    L0_2 = GlobalState
    L0_2["attraction16-ridedata2"] = 8
    L0_2 = GlobalState
    L0_2["attraction16-synchdata"] = 1
    L0_2 = hauntedhousehandler
    L0_2.startid = 0
    L0_2 = 1
    L1_2 = Config
    L1_2 = L1_2.AttractionsSettings
    L1_2 = L1_2.hauntedhouse
    L1_2 = L1_2.speedmodifier
    L1_2 = 8 * L1_2
    L2_2 = GlobalState
    L2_2["attraction16-ridedata1"] = L0_2
    while true do
      L2_2 = 40000
      if not (L0_2 < L2_2) then
        break
      end
      L2_2 = Citizen
      L2_2 = L2_2.Wait
      L3_2 = 20
      L2_2(L3_2)
      L2_2 = Config
      L2_2 = L2_2.AttractionsSettings
      L2_2 = L2_2.hauntedhouse
      L2_2 = L2_2.speedmodifier
      L2_2 = 8 * L2_2
      L0_2 = L1_2
      L1_2 = L1_2 + L2_2
      L3_2 = GlobalState
      L3_2["attraction16-ridedata1"] = L0_2
      L3_2 = GlobalState
      L3_2["attraction16-ridedata2"] = L1_2
      L3_2 = GlobalState
      L4_2 = GlobalState
      L4_2 = L4_2["attraction16-synchdata"]
      L4_2 = L4_2 + 1
      L3_2["attraction16-synchdata"] = L4_2
      if 2288 == L0_2 then
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:HauntedHouse:OpenDoor"
        L5_2 = -1
        L6_2 = 1
        L3_2(L4_2, L5_2, L6_2)
      elseif 3896 == L0_2 then
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:HauntedHouse:OpenDoor"
        L5_2 = -1
        L6_2 = 2
        L3_2(L4_2, L5_2, L6_2)
      elseif 7960 == L0_2 then
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:HauntedHouse:OpenDoor"
        L5_2 = -1
        L6_2 = 3
        L3_2(L4_2, L5_2, L6_2)
      elseif 13832 == L0_2 then
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:HauntedHouse:OpenDoor"
        L5_2 = -1
        L6_2 = 4
        L3_2(L4_2, L5_2, L6_2)
      elseif 18984 == L0_2 then
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:HauntedHouse:OpenDoor"
        L5_2 = -1
        L6_2 = 5
        L3_2(L4_2, L5_2, L6_2)
      elseif 29208 == L0_2 then
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:HauntedHouse:OpenDoor"
        L5_2 = -1
        L6_2 = 6
        L3_2(L4_2, L5_2, L6_2)
      elseif 34536 == L0_2 then
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:HauntedHouse:OpenDoor"
        L5_2 = -1
        L6_2 = 7
        L3_2(L4_2, L5_2, L6_2)
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:HauntedHouse:OpenDoor"
        L5_2 = -1
        L6_2 = 8
        L3_2(L4_2, L5_2, L6_2)
      end
      if 33080 == L0_2 then
        L3_2 = ipairs
        L4_2 = hauntedhousehandler
        L4_2 = L4_2.seats
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = L8_2.taken
          if true == L9_2 then
            L9_2 = TriggerClientEvent
            L10_2 = "rtx_themepark:HauntedHouse:ValakJumpScare"
            L11_2 = L8_2.takenplayerid
            L9_2(L10_2, L11_2)
          end
        end
      elseif 27496 == L0_2 then
        L3_2 = ipairs
        L4_2 = hauntedhousehandler
        L4_2 = L4_2.seats
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = L8_2.taken
          if true == L9_2 then
            L9_2 = TriggerClientEvent
            L10_2 = "rtx_themepark:HauntedHouse:AnabelleHide"
            L11_2 = L8_2.takenplayerid
            L9_2(L10_2, L11_2)
          end
        end
      elseif 28368 == L0_2 then
        L3_2 = ipairs
        L4_2 = hauntedhousehandler
        L4_2 = L4_2.seats
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = L8_2.taken
          if true == L9_2 then
            L9_2 = TriggerClientEvent
            L10_2 = "rtx_themepark:HauntedHouse:Anabelle"
            L11_2 = L8_2.takenplayerid
            L9_2(L10_2, L11_2)
          end
        end
      elseif 30832 == L0_2 then
        L3_2 = ipairs
        L4_2 = hauntedhousehandler
        L4_2 = L4_2.seats
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = L8_2.taken
          if true == L9_2 then
            L9_2 = TriggerClientEvent
            L10_2 = "rtx_themepark:HauntedHouse:ValakCross"
            L11_2 = L8_2.takenplayerid
            L9_2(L10_2, L11_2)
          end
        end
      end
    end
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = 2000
    L2_2(L3_2)
    L2_2 = TriggerClientEvent
    L3_2 = "rtx_themepark:HauntedHouse:AttractionEnded"
    L4_2 = -1
    L2_2(L3_2, L4_2)
    L2_2 = ipairs
    L3_2 = hauntedhousehandler
    L3_2 = L3_2.seats
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L7_2.taken
      if true == L8_2 then
        L7_2.taken = false
        L8_2 = TriggerClientEvent
        L9_2 = "rtx_themepark:HauntedHouse:SynchronizeSeat"
        L10_2 = -1
        L11_2 = L6_2
        L12_2 = false
        L13_2 = L7_2.takenplayerid
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
        L8_2 = TriggerClientEvent
        L9_2 = "rtx_themepark:HauntedHouse:SeatExit"
        L10_2 = L7_2.takenplayerid
        L11_2 = true
        L12_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2)
        L8_2 = TriggerClientEvent
        L9_2 = "rtx_themepark:Global:AttractionUsing"
        L10_2 = L7_2.takenplayerid
        L11_2 = false
        L8_2(L9_2, L10_2, L11_2)
        L8_2 = TriggerClientEvent
        L9_2 = "rtx_themepark:Global:TicketHandler"
        L10_2 = L7_2.takenplayerid
        L11_2 = 16
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
        L7_2.takenplayerid = nil
      end
    end
    L2_2 = hauntedhousehandler
    L2_2.started = false
    L2_2 = GlobalState
    L2_2["attraction16-phase"] = 0
    L2_2 = GlobalState
    L2_2["attraction16-ridedata1"] = 1
    L2_2 = GlobalState
    L2_2["attraction16-ridedata2"] = 8
    L2_2 = TriggerClientEvent
    L3_2 = "rtx_themepark:HauntedHouse:SynchronizeStarted"
    L4_2 = -1
    L5_2 = false
    L2_2(L3_2, L4_2, L5_2)
  end
end
StartHauntedHouse = L0_1
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:HauntedHouse:SeatUse"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:HauntedHouse:SeatUse"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  L2_2 = themeparkattractionsopenstatus
  L2_2 = L2_2[17]
  if true == L2_2 then
    L2_2 = themeparkdisabled
    if false == L2_2 then
      if nil ~= A0_2 then
        L2_2 = hauntedhousehandler
        L2_2 = L2_2.started
        if false == L2_2 then
          L2_2 = hauntedhousehandler
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
              L10_2 = "rtx_themepark:HauntedHouse:SynchronizeSeat"
              L11_2 = L8_2
              L12_2 = A0_2
              L13_2 = true
              L14_2 = L2_2.takenplayerid
              L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
            end
            L3_2 = TriggerClientEvent
            L4_2 = "rtx_themepark:Global:AttractionUsing"
            L5_2 = L1_2
            L6_2 = true
            L3_2(L4_2, L5_2, L6_2)
            L3_2 = TriggerClientEvent
            L4_2 = "rtx_themepark:HauntedHouse:SeatData"
            L5_2 = L1_2
            L6_2 = A0_2
            L3_2(L4_2, L5_2, L6_2)
            L3_2 = Config
            L3_2 = L3_2.ThemeParkControlAttractions
            if false == L3_2 then
              L3_2 = hauntedhousehandler
              L3_2 = L3_2.started
              if false == L3_2 then
                L3_2 = Wait
                L4_2 = Config
                L4_2 = L4_2.AttractionsSettings
                L4_2 = L4_2.hauntedhouse
                L4_2 = L4_2.waitforplayers
                L3_2(L4_2)
                L3_2 = hauntedhousehandler
                L3_2 = L3_2.started
                if false == L3_2 then
                  L3_2 = Config
                  L3_2 = L3_2.ThemeParkControlAttractions
                  if false == L3_2 then
                    L3_2 = hauntedhousehandler
                    L3_2.started = true
                    L3_2 = TriggerClientEvent
                    L4_2 = "rtx_themepark:HauntedHouse:SynchronizeStarted"
                    L5_2 = -1
                    L6_2 = true
                    L3_2(L4_2, L5_2, L6_2)
                    L3_2 = StartHauntedHouse
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
L1_1 = "rtx_themepark:HauntedHouse:ExitAttraction"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:HauntedHouse:ExitAttraction"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  if nil ~= A0_2 then
    L2_2 = hauntedhousehandler
    L2_2 = L2_2.seats
    L2_2 = L2_2[A0_2]
    L3_2 = L2_2.taken
    if true == L3_2 then
      L3_2 = L2_2.takenplayerid
      if L3_2 == L1_2 then
        L3_2 = Config
        L3_2 = L3_2.ThemeParkDisableExit
        if false ~= L3_2 then
          L3_2 = hauntedhousehandler
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
          L10_2 = "rtx_themepark:HauntedHouse:SynchronizeSeat"
          L11_2 = L8_2
          L12_2 = A0_2
          L13_2 = false
          L14_2 = L2_2.takenplayerid
          L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
        end
        L3_2 = TriggerClientEvent
        L4_2 = "rtx_themepark:HauntedHouse:SeatExit"
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
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:HauntedHouse:Start"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = hauntedhousehandler
  L0_2 = L0_2.started
  if false == L0_2 then
    L0_2 = hauntedhousehandler
    L0_2.started = true
    L0_2 = TriggerClientEvent
    L1_2 = "rtx_themepark:HauntedHouse:SynchronizeStarted"
    L2_2 = -1
    L3_2 = true
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = StartHauntedHouse
    L0_2()
  end
end
L0_1(L1_1, L2_1)
