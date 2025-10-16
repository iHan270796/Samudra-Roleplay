local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L0_1.started = false
L0_1.startid = 0
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L5_1 = {}
L5_1.taken = false
L5_1.takenplayerid = nil
L5_1.seattype = 1
L6_1 = {}
L6_1.taken = false
L6_1.takenplayerid = nil
L6_1.seattype = 1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L7_1.seattype = 1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L2_1.players = L3_1
L1_1[1] = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L5_1 = {}
L5_1.taken = false
L5_1.takenplayerid = nil
L5_1.seattype = 1
L6_1 = {}
L6_1.taken = false
L6_1.takenplayerid = nil
L6_1.seattype = 1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L7_1.seattype = 1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L2_1.players = L3_1
L1_1[2] = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L5_1 = {}
L5_1.taken = false
L5_1.takenplayerid = nil
L5_1.seattype = 1
L6_1 = {}
L6_1.taken = false
L6_1.takenplayerid = nil
L6_1.seattype = 1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L7_1.seattype = 1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L2_1.players = L3_1
L1_1[3] = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = {}
L4_1.taken = false
L4_1.takenplayerid = nil
L4_1.seattype = 1
L5_1 = {}
L5_1.taken = false
L5_1.takenplayerid = nil
L5_1.seattype = 1
L6_1 = {}
L6_1.taken = false
L6_1.takenplayerid = nil
L6_1.seattype = 1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L7_1.seattype = 1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L2_1.players = L3_1
L1_1[4] = L2_1
L0_1.carts = L1_1
rollercoasterhandler = L0_1
L0_1 = GlobalState
L0_1["attraction8-phase"] = 0
L0_1 = GlobalState
L0_1["attraction8-ridedata1"] = 1
L0_1 = GlobalState
L0_1["attraction8-ridedata2"] = 8
L0_1 = GlobalState
L0_1["attraction8-synchdata"] = 1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L0_2 = rollercoasterhandler
  L0_2 = L0_2.started
  if true == L0_2 then
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1000
    L0_2(L1_2)
    L0_2 = TriggerClientEvent
    L1_2 = "rtx_themepark:Global:MusicStartAttraction"
    L2_2 = -1
    L3_2 = "rollercoaster"
    L4_2 = math
    L4_2 = L4_2.random
    L5_2 = 1
    L6_2 = Config
    L6_2 = L6_2.AttractionsMusic
    L6_2 = L6_2.rollercoaster
    L6_2 = L6_2.playlist
    L6_2 = #L6_2
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2 = L4_2(L5_2, L6_2)
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
    L0_2 = rollercoasterhandler
    L0_2.startid = 0
    L0_2 = GlobalState
    L0_2["attraction8-phase"] = 1
    L0_2 = GlobalState
    L0_2["attraction8-ridedata1"] = 1
    L0_2 = GlobalState
    L0_2["attraction8-ridedata2"] = 8
    L0_2 = GlobalState
    L0_2["attraction8-synchdata"] = 1
    L0_2 = ipairs
    L1_2 = rollercoasterhandler
    L1_2 = L1_2.carts
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = ipairs
      L7_2 = L5_2.players
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
      for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
        L12_2 = L11_2.taken
        if true == L12_2 then
          L12_2 = pairs
          L13_2 = playsersinthemepark
          L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
          for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
            L18_2 = TriggerClientEvent
            L19_2 = "rtx_themepark:Rollercoaster:SynchronizeSeat"
            L20_2 = L17_2
            L21_2 = L4_2
            L22_2 = L10_2
            L23_2 = true
            L24_2 = L11_2.takenplayerid
            L25_2 = L11_2.seattype
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
          end
          L12_2 = TriggerClientEvent
          L13_2 = "rtx_themepark:Global:AttractionUsing"
          L14_2 = L11_2.takenplayerid
          L15_2 = true
          L12_2(L13_2, L14_2, L15_2)
        end
      end
    end
    L0_2 = 1
    L1_2 = Config
    L1_2 = L1_2.AttractionsSettings
    L1_2 = L1_2.rollercoaster
    L1_2 = L1_2.speedmodifier
    L1_2 = 8 * L1_2
    L2_2 = pairs
    L3_2 = playsersinthemepark
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = TriggerClientEvent
      L9_2 = "rtx_themepark:Rollercoaster:StartAttraction"
      L10_2 = L7_2
      L11_2 = L0_2
      L12_2 = L1_2
      L8_2(L9_2, L10_2, L11_2, L12_2)
    end
    L2_2 = GlobalState
    L2_2["attraction8-ridedata1"] = L0_2
    L2_2 = GlobalState
    L2_2["attraction8-ridedata2"] = L1_2
    L2_2 = GlobalState
    L3_2 = GlobalState
    L3_2 = L3_2["attraction8-synchdata"]
    L3_2 = L3_2 + 1
    L2_2["attraction8-synchdata"] = L3_2
    while true do
      L2_2 = 9320
      if not (L0_2 < L2_2) then
        break
      end
      L2_2 = Citizen
      L2_2 = L2_2.Wait
      L3_2 = 20
      L2_2(L3_2)
      L2_2 = Config
      L2_2 = L2_2.AttractionsSettings
      L2_2 = L2_2.rollercoaster
      L2_2 = L2_2.speedmodifier
      L2_2 = 8 * L2_2
      L0_2 = L1_2
      L1_2 = L1_2 + L2_2
      L3_2 = GlobalState
      L3_2["attraction8-ridedata1"] = L0_2
      L3_2 = GlobalState
      L3_2["attraction8-ridedata2"] = L1_2
      L3_2 = GlobalState
      L4_2 = GlobalState
      L4_2 = L4_2["attraction8-synchdata"]
      L4_2 = L4_2 + 1
      L3_2["attraction8-synchdata"] = L4_2
    end
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = 2000
    L2_2(L3_2)
    L2_2 = TriggerClientEvent
    L3_2 = "rtx_themepark:Rollercoaster:AttractionEnded"
    L4_2 = -1
    L2_2(L3_2, L4_2)
    L2_2 = ipairs
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = ipairs
      L9_2 = L7_2.players
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
        L14_2 = L13_2.taken
        if true == L14_2 then
          L14_2 = pairs
          L15_2 = playsersinthemepark
          L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
          for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
            L20_2 = TriggerClientEvent
            L21_2 = "rtx_themepark:Rollercoaster:SynchronizeSeat"
            L22_2 = L19_2
            L23_2 = L6_2
            L24_2 = L12_2
            L25_2 = false
            L26_2 = L13_2.takenplayerid
            L27_2 = L13_2.seattype
            L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
          end
          L14_2 = TriggerClientEvent
          L15_2 = "rtx_themepark:Global:AttractionUsing"
          L16_2 = L13_2.takenplayerid
          L17_2 = false
          L14_2(L15_2, L16_2, L17_2)
          L14_2 = TriggerClientEvent
          L15_2 = "rtx_themepark:Rollercoaster:SeatExit"
          L16_2 = L13_2.takenplayerid
          L14_2(L15_2, L16_2)
          L14_2 = TriggerClientEvent
          L15_2 = "rtx_themepark:Global:TicketHandler"
          L16_2 = L13_2.takenplayerid
          L17_2 = 7
          L18_2 = false
          L14_2(L15_2, L16_2, L17_2, L18_2)
          L13_2.taken = false
          L13_2.takenplayerid = nil
          L13_2.seattype = 1
        end
      end
    end
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = 2500
    L2_2(L3_2)
    L2_2 = TriggerClientEvent
    L3_2 = "rtx_themepark:Global:MusicStopAttraction"
    L4_2 = -1
    L5_2 = "rollercoaster"
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = GlobalState
    L2_2["attraction8-phase"] = 0
    L2_2 = rollercoasterhandler
    L2_2.started = false
    L2_2 = TriggerClientEvent
    L3_2 = "rtx_themepark:Rollercoaster:SynchronizeStarted"
    L4_2 = -1
    L5_2 = false
    L2_2(L3_2, L4_2, L5_2)
  end
end
StartRollercoaster = L0_1
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Rollercoaster:SeatUse"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Rollercoaster:SeatUse"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = source
  L3_2 = themeparkattractionsopenstatus
  L3_2 = L3_2[3]
  if true == L3_2 then
    L3_2 = themeparkdisabled
    if false == L3_2 then
      if nil ~= A0_2 and nil ~= A1_2 then
        L3_2 = rollercoasterhandler
        L3_2 = L3_2.started
        if false == L3_2 then
          L3_2 = rollercoasterhandler
          L3_2 = L3_2.carts
          L3_2 = L3_2[A0_2]
          L4_2 = L3_2.players
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
              L12_2 = "rtx_themepark:Rollercoaster:SynchronizeSeat"
              L13_2 = L10_2
              L14_2 = A0_2
              L15_2 = A1_2
              L16_2 = true
              L17_2 = L4_2.takenplayerid
              L18_2 = L4_2.seattype
              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
            end
            L5_2 = TriggerClientEvent
            L6_2 = "rtx_themepark:Global:AttractionUsing"
            L7_2 = L2_2
            L8_2 = true
            L5_2(L6_2, L7_2, L8_2)
            L5_2 = TriggerClientEvent
            L6_2 = "rtx_themepark:Rollercoaster:SeatData"
            L7_2 = L2_2
            L8_2 = A0_2
            L9_2 = A1_2
            L5_2(L6_2, L7_2, L8_2, L9_2)
            L5_2 = Config
            L5_2 = L5_2.ThemeParkControlAttractions
            if false == L5_2 then
              L5_2 = rollercoasterhandler
              L5_2 = L5_2.started
              if false == L5_2 then
                L5_2 = Wait
                L6_2 = Config
                L6_2 = L6_2.AttractionsSettings
                L6_2 = L6_2.rollercoaster
                L6_2 = L6_2.waitforplayers
                L5_2(L6_2)
                L5_2 = rollercoasterhandler
                L5_2 = L5_2.started
                if false == L5_2 then
                  L5_2 = rollercoasterhandler
                  L5_2.started = true
                  L5_2 = TriggerClientEvent
                  L6_2 = "rtx_themepark:Rollercoaster:SynchronizeStarted"
                  L7_2 = -1
                  L8_2 = true
                  L5_2(L6_2, L7_2, L8_2)
                  L5_2 = StartRollercoaster
                  L5_2()
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
L1_1 = "rtx_themepark:Rollercoaster:SeatAnimChange"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Rollercoaster:SeatAnimChange"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = source
  if nil ~= A0_2 and nil ~= A1_2 then
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L3_2 = L3_2[A0_2]
    L3_2 = L3_2.players
    L3_2 = L3_2[A1_2]
    L4_2 = L3_2.taken
    if true == L4_2 then
      L4_2 = L3_2.takenplayerid
      if L4_2 == L2_2 then
        L4_2 = L3_2.seattype
        if 1 == L4_2 then
          L3_2.seattype = 2
        else
          L3_2.seattype = 1
        end
        L4_2 = pairs
        L5_2 = playsersinthemepark
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          L10_2 = TriggerClientEvent
          L11_2 = "rtx_themepark:Rollercoaster:SynchronizeSeat"
          L12_2 = L9_2
          L13_2 = A0_2
          L14_2 = A1_2
          L15_2 = true
          L16_2 = L3_2.takenplayerid
          L17_2 = L3_2.seattype
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Rollercoaster:ExitAttraction"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Rollercoaster:ExitAttraction"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = source
  if nil ~= A0_2 and nil ~= A1_2 then
    L3_2 = rollercoasterhandler
    L3_2 = L3_2.carts
    L3_2 = L3_2[A0_2]
    L3_2 = L3_2.players
    L3_2 = L3_2[A1_2]
    L4_2 = L3_2.taken
    if true == L4_2 then
      L4_2 = L3_2.takenplayerid
      if L4_2 == L2_2 then
        L4_2 = Config
        L4_2 = L4_2.ThemeParkDisableExit
        if false ~= L4_2 then
          L4_2 = rollercoasterhandler
          L4_2 = L4_2.started
          if false ~= L4_2 then
            goto lbl_53
          end
        end
        L4_2 = pairs
        L5_2 = playsersinthemepark
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          L10_2 = TriggerClientEvent
          L11_2 = "rtx_themepark:Rollercoaster:SynchronizeSeat"
          L12_2 = L9_2
          L13_2 = A0_2
          L14_2 = A1_2
          L15_2 = false
          L16_2 = L3_2.takenplayerid
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        end
        L4_2 = TriggerClientEvent
        L5_2 = "rtx_themepark:Rollercoaster:SeatExit"
        L6_2 = L3_2.takenplayerid
        L4_2(L5_2, L6_2)
        L4_2 = TriggerClientEvent
        L5_2 = "rtx_themepark:Global:AttractionUsing"
        L6_2 = L3_2.takenplayerid
        L7_2 = false
        L4_2(L5_2, L6_2, L7_2)
        L3_2.taken = false
        L3_2.takenplayerid = nil
        L3_2.seattype = 1
        goto lbl_62
        ::lbl_53::
        L4_2 = TriggerClientEvent
        L5_2 = "rtx_themepark:Notify"
        L6_2 = L2_2
        L7_2 = Language
        L8_2 = Config
        L8_2 = L8_2.Language
        L7_2 = L7_2[L8_2]
        L7_2 = L7_2.inprogress
        L4_2(L5_2, L6_2, L7_2)
      end
    end
  end
  ::lbl_62::
end
L0_1(L1_1, L2_1)
L0_1 = Config
L0_1 = L0_1.ThemeParkAttractionFallChance
if L0_1 then
  L0_1 = Config
  L0_1 = L0_1.ThemeParkFallSettings
  L0_1 = L0_1.attractions
  L0_1 = L0_1.rollercoaster
  if L0_1 then
    L0_1 = RegisterServerEvent
    L1_1 = "rtx_themepark:Rollercoaster:ThrowAttraction"
    L0_1(L1_1)
    L0_1 = AddEventHandler
    L1_1 = "rtx_themepark:Rollercoaster:ThrowAttraction"
    function L2_1(A0_2, A1_2)
      local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
      L2_2 = source
      if nil ~= A0_2 and nil ~= A1_2 then
        L3_2 = rollercoasterhandler
        L3_2 = L3_2.carts
        L3_2 = L3_2[A0_2]
        L3_2 = L3_2.players
        L3_2 = L3_2[A1_2]
        L4_2 = L3_2.taken
        if true == L4_2 then
          L4_2 = L3_2.takenplayerid
          if L4_2 == L2_2 then
            L4_2 = pairs
            L5_2 = playsersinthemepark
            L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
            for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
              L10_2 = TriggerClientEvent
              L11_2 = "rtx_themepark:Rollercoaster:SynchronizeSeat"
              L12_2 = L9_2
              L13_2 = A0_2
              L14_2 = A1_2
              L15_2 = false
              L16_2 = L3_2.takenplayerid
              L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
            end
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Rollercoaster:SeatThrowClient"
            L6_2 = L3_2.takenplayerid
            L4_2(L5_2, L6_2)
            L4_2 = TriggerClientEvent
            L5_2 = "rtx_themepark:Global:AttractionUsing"
            L6_2 = L3_2.takenplayerid
            L7_2 = false
            L4_2(L5_2, L6_2, L7_2)
            L3_2.taken = false
            L3_2.takenplayerid = nil
            L3_2.seattype = 1
          end
        end
      end
    end
    L0_1(L1_1, L2_1)
  end
end
