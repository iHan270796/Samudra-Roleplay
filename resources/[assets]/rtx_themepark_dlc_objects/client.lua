local L0_1, L1_1, L2_1, L3_1
L0_1 = RegisterCommand
L1_1 = "playmyanim"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = "export@head_000_r"
  L1_2 = "head_000_r"
  L2_2 = RequestAnimDict
  L3_2 = L0_2
  L2_2(L3_2)
  while true do
    L2_2 = HasAnimDictLoaded
    L3_2 = L0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = Wait
    L3_2 = 1
    L2_2(L3_2)
  end
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = TaskPlayAnim
  L4_2 = L2_2
  L5_2 = L0_2
  L6_2 = L1_2
  L7_2 = 4.0
  L8_2 = 4.0
  L9_2 = -1
  L10_2 = 1
  L11_2 = 0.0
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L3_2 = RemoveAnimDict
  L4_2 = L0_2
  L3_2(L4_2)
end
L3_1 = false
L0_1(L1_1, L2_1, L3_1)
