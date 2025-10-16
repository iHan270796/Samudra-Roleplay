local L0_1, L1_1, L2_1
L0_1 = {}
L0_1.started = false
cannonhandler = L0_1
L0_1 = GlobalState
L0_1["attraction18-phase"] = 0
L0_1 = GlobalState
L0_1["attraction18-playerid"] = nil
cannontaken = false
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = cannonhandler
  L1_2 = L1_2.started
  if true == L1_2 then
    L1_2 = cannontaken
    if true == L1_2 then
      L1_2 = GlobalState
      L1_2["attraction18-phase"] = 1
      L1_2 = GlobalState
      L1_2["attraction18-playerid"] = A0_2
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 500
      L1_2(L2_2)
      L1_2 = TriggerClientEvent
      L2_2 = "rtx_themepark:Cannon:PrepareBoom"
      L3_2 = A0_2
      L1_2(L2_2, L3_2)
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 5000
      L1_2(L2_2)
      L1_2 = TriggerClientEvent
      L2_2 = "rtx_themepark:Cannon:StartBoom"
      L3_2 = -1
      L1_2(L2_2, L3_2)
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 5000
      L1_2(L2_2)
      L1_2 = cannonhandler
      L1_2.started = false
      cannontaken = false
      L1_2 = GlobalState
      L1_2["attraction18-phase"] = 0
      L1_2 = GlobalState
      L1_2["attraction18-playerid"] = nil
      L1_2 = TriggerClientEvent
      L2_2 = "rtx_themepark:Global:AttractionUsing"
      L3_2 = A0_2
      L4_2 = false
      L1_2(L2_2, L3_2, L4_2)
    end
  end
end
StartCannon = L0_1
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Cannon:SeatUse"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Cannon:SeatUse"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = source
  L1_2 = themeparkattractionsopenstatus
  L1_2 = L1_2[19]
  if true == L1_2 then
    L1_2 = themeparkdisabled
    if false == L1_2 then
      L1_2 = cannontaken
      if false == L1_2 then
        L1_2 = cannonhandler
        L1_2 = L1_2.started
        if false == L1_2 then
          L1_2 = cannonhandler
          L1_2 = L1_2.started
          if false == L1_2 then
            cannontaken = true
            L1_2 = TriggerClientEvent
            L2_2 = "rtx_themepark:Global:AttractionUsing"
            L3_2 = L0_2
            L4_2 = true
            L1_2(L2_2, L3_2, L4_2)
            L1_2 = TriggerClientEvent
            L2_2 = "rtx_themepark:Global:TicketHandler"
            L3_2 = L0_2
            L4_2 = 18
            L5_2 = false
            L1_2(L2_2, L3_2, L4_2, L5_2)
            L1_2 = Config
            L1_2 = L1_2.ThemeParkControlAttractions
            if false == L1_2 then
              L1_2 = cannonhandler
              L1_2.started = true
              L1_2 = StartCannon
              L2_2 = L0_2
              L1_2(L2_2)
            else
              L1_2 = GlobalState
              L1_2["attraction18-playerid"] = L0_2
            end
          end
        end
    end
  end
  else
    L1_2 = TriggerClientEvent
    L2_2 = "rtx_themepark:Notify"
    L3_2 = L0_2
    L4_2 = Language
    L5_2 = Config
    L5_2 = L5_2.Language
    L4_2 = L4_2[L5_2]
    L4_2 = L4_2.attractionclosed
    L1_2(L2_2, L3_2, L4_2)
  end
end
L0_1(L1_1, L2_1)
