local L0_1, L1_1, L2_1
L0_1 = {}
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
L0_1.shooters = L1_1
shooterhandler = L0_1
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Shooter:Start"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Shooter:Start"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = source
  L2_2 = 5
  if 2 == A0_2 then
    L2_2 = 4
  end
  L3_2 = themeparkattractionsopenstatus
  L3_2 = L3_2[L2_2]
  if true == L3_2 then
    L3_2 = themeparkdisabled
    if false == L3_2 then
      L3_2 = attractionlockdown
      if false == L3_2 then
        L3_2 = shooterhandler
        L3_2 = L3_2.shooters
        L3_2 = L3_2[A0_2]
        L4_2 = L3_2.taken
        if false == L4_2 then
          L3_2.taken = true
          L3_2.takenplayerid = L1_2
          L4_2 = TriggerClientEvent
          L5_2 = "rtx_themepark:Shooter:SynchronizeShooter"
          L6_2 = -1
          L7_2 = A0_2
          L8_2 = true
          L4_2(L5_2, L6_2, L7_2, L8_2)
          L4_2 = TriggerClientEvent
          L5_2 = "rtx_themepark:Shooter:StartClient"
          L6_2 = L1_2
          L7_2 = A0_2
          L4_2(L5_2, L6_2, L7_2)
          L4_2 = TriggerClientEvent
          L5_2 = "rtx_themepark:Global:AttractionUsing"
          L6_2 = L1_2
          L7_2 = true
          L4_2(L5_2, L6_2, L7_2)
          L4_2 = TriggerClientEvent
          L5_2 = "rtx_themepark:Global:TicketHandler"
          L6_2 = L1_2
          L7_2 = 8
          L8_2 = false
          L4_2(L5_2, L6_2, L7_2, L8_2)
        end
    end
  end
  else
    L3_2 = TriggerClientEvent
    L4_2 = "rtx_themepark:Notify"
    L5_2 = L1_2
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
L1_1 = "rtx_themepark:Shooter:End"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Shooter:End"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = source
  L3_2 = shooterhandler
  L3_2 = L3_2.shooters
  L3_2 = L3_2[A0_2]
  L4_2 = L3_2.taken
  if true == L4_2 then
    L4_2 = L3_2.takenplayerid
    if L4_2 == L2_2 then
      L3_2.taken = false
      L3_2.takenplayerid = nil
      L4_2 = TriggerClientEvent
      L5_2 = "rtx_themepark:Shooter:SynchronizeShooter"
      L6_2 = -1
      L7_2 = A0_2
      L8_2 = false
      L4_2(L5_2, L6_2, L7_2, L8_2)
      L4_2 = TriggerClientEvent
      L5_2 = "rtx_themepark:Global:AttractionUsing"
      L6_2 = L2_2
      L7_2 = false
      L4_2(L5_2, L6_2, L7_2)
      L4_2 = Config
      L4_2 = L4_2.ShootingRangePrizes
      L4_2 = L4_2[1]
      L4_2 = L4_2.minimumscore
      if A1_2 >= L4_2 then
        L5_2 = 1
        L6_2 = ipairs
        L7_2 = Config
        L7_2 = L7_2.ShootingRangePrizes
        L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
        for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
          L12_2 = L11_2.minimumscore
          if A1_2 >= L12_2 then
            L5_2 = L10_2
          end
        end
        L6_2 = GiveShootingRangeRewardToPlayer
        L7_2 = L2_2
        L8_2 = L5_2
        L6_2(L7_2, L8_2)
      end
    end
  end
end
L0_1(L1_1, L2_1)
