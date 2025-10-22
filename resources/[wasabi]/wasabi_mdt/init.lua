local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
Locales = L0_1
function L0_1(A0_2, ...)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = (...)
  if L1_2 then
    L1_2 = print
    L2_2 = "^7(^1ERROR^7) "
    L3_2 = string
    L3_2 = L3_2.format
    L4_2 = A0_2
    L5_2 = ...
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = "^7"
    L2_2 = L2_2 .. L3_2 .. L4_2
    L1_2(L2_2)
  else
    L1_2 = print
    L2_2 = "^7(^1ERROR^7) "
    L3_2 = A0_2
    L4_2 = "^7"
    L2_2 = L2_2 .. L3_2 .. L4_2
    L1_2(L2_2)
  end
end
Error = L0_1
function L0_1(A0_2, ...)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = (...)
  if L1_2 then
    L1_2 = print
    L2_2 = "^7(^2SUCCESS^7) "
    L3_2 = string
    L3_2 = L3_2.format
    L4_2 = A0_2
    L5_2 = ...
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = "^7"
    L2_2 = L2_2 .. L3_2 .. L4_2
    L1_2(L2_2)
  else
    L1_2 = print
    L2_2 = "^7(^2SUCCESS^7) "
    L3_2 = A0_2
    L4_2 = "^7"
    L2_2 = L2_2 .. L3_2 .. L4_2
    L1_2(L2_2)
  end
end
Success = L0_1
function L0_1(A0_2, ...)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = ShowDebugPrints
  if not L1_2 then
    return
  end
  L1_2 = (...)
  if L1_2 then
    L1_2 = print
    L2_2 = "^7(^3DEBUG^7) "
    L3_2 = string
    L3_2 = L3_2.format
    L4_2 = A0_2
    L5_2 = ...
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = "^7"
    L2_2 = L2_2 .. L3_2 .. L4_2
    L1_2(L2_2)
  else
    L1_2 = print
    L2_2 = "^7(^3DEBUG^7) "
    L3_2 = A0_2
    L4_2 = "^7"
    L2_2 = L2_2 .. L3_2 .. L4_2
    L1_2(L2_2)
  end
end
Debug = L0_1
function L0_1(A0_2, ...)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Locales
  L2_2 = Config
  L2_2 = L2_2.Locale
  L1_2 = L1_2[L2_2]
  if nil ~= L1_2 then
    L1_2 = Locales
    L2_2 = Config
    L2_2 = L2_2.Locale
    L1_2 = L1_2[L2_2]
    L1_2 = L1_2[A0_2]
    if nil ~= L1_2 then
      L1_2 = (...)
      if L1_2 then
        L1_2 = string
        L1_2 = L1_2.format
        L2_2 = Locales
        L3_2 = Config
        L3_2 = L3_2.Locale
        L2_2 = L2_2[L3_2]
        L2_2 = L2_2[A0_2]
        L3_2, L4_2, L5_2 = ...
        return L1_2(L2_2, L3_2, L4_2, L5_2)
      else
        L1_2 = Locales
        L2_2 = Config
        L2_2 = L2_2.Locale
        L1_2 = L1_2[L2_2]
        L1_2 = L1_2[A0_2]
        return L1_2
      end
    else
      L1_2 = "Translation ["
      L2_2 = Config
      L2_2 = L2_2.Locale
      L3_2 = "]["
      L4_2 = A0_2
      L5_2 = "] does not exist"
      L1_2 = L1_2 .. L2_2 .. L3_2 .. L4_2 .. L5_2
      return L1_2
    end
  else
    L1_2 = "Locale ["
    L2_2 = Config
    L2_2 = L2_2.Locale
    L3_2 = "] does not exist"
    L1_2 = L1_2 .. L2_2 .. L3_2
    return L1_2
  end
end
_L = L0_1
L0_1 = pairs
L1_1 = Resources
L0_1, L1_1, L2_1, L3_1 = L0_1(L1_1)
for L4_1, L5_1 in L0_1, L1_1, L2_1, L3_1 do
  L6_1 = GetResourceState
  L7_1 = L5_1.name
  L6_1 = L6_1(L7_1)
  if "started" == L6_1 then
    if "QBTarget" == L4_1 then
      L6_1 = GetResourceState
      L7_1 = Resources
      L7_1 = L7_1.OXTarget
      L7_1 = L7_1.name
      L6_1 = L6_1(L7_1)
      if "started" == L6_1 then
    end
    else
      L6_1 = type
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      if "table" == L6_1 then
        L6_1 = L5_1.export
        if "all" == L6_1 then
          L6_1 = _G
          L7_1 = exports
          L8_1 = L5_1.name
          L7_1 = L7_1[L8_1]
          L6_1[L4_1] = L7_1
        else
          L6_1 = L5_1.export
          if L6_1 then
            L6_1 = _G
            L7_1 = exports
            L8_1 = L5_1.name
            L7_1 = L7_1[L8_1]
            L8_1 = L5_1.export
            L7_1 = L7_1[L8_1]
            L7_1 = L7_1()
            L6_1[L4_1] = L7_1
          else
            L6_1 = _G
            L6_1[L4_1] = true
          end
        end
      end
      L6_1 = IgnoreScriptFoundLogs
      if not L6_1 then
        L6_1 = Success
        L7_1 = "Initialized: "
        L8_1 = L5_1.name
        L7_1 = L7_1 .. L8_1
        L6_1(L7_1)
      end
    end
  end
end
L0_1 = wsb
if L0_1 then
  L0_1 = Success
  L1_1 = "Initialized ^1"
  L2_1 = GetCurrentResourceName
  L2_1 = L2_1()
  L3_1 = " ^7by ^1Wasabi Scripts^7"
  L1_1 = L1_1 .. L2_1 .. L3_1
  L0_1(L1_1)
else
  L0_1 = Error
  L1_1 = "No wasabi bridge found for %s"
  L2_1 = GetCurrentResourceName
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1()
  L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
  L0_1 = Error
  L1_1 = "Make sure to ensure wasabi_bridge in your server.cfg before this resource"
  L0_1(L1_1)
end
