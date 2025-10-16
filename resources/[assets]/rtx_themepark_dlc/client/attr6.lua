local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = IsDuplicityVersion
L0_1 = L0_1()
if L0_1 then
  L0_1 = GetPlayerPositionInRealTime72
  L0_1()
end
L0_1 = false
L1_1 = Config
L1_1 = L1_1.AttractionsSettings
L1_1 = L1_1.bumpercars
L1_1 = L1_1.minminutes
L2_1 = false
L3_1 = 0
L4_1 = nil
L5_1 = nil
L6_1 = false
L7_1 = nil
L8_1 = {}
L9_1 = vector3
L10_1 = -1636.68
L11_1 = -1063.4
L12_1 = 12.15
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coordsbuy = L9_1
L9_1 = {}
L8_1.bumperplayers = L9_1
bumperhandler = L8_1
L8_1 = RegisterNUICallback
L9_1 = "calculatepricebumper"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L0_1
  if true == L2_2 then
    L2_2 = tonumber
    L3_2 = A0_2.bumperselectedminutes
    L2_2 = L2_2(L3_2)
    L1_1 = L2_2
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "bumperbuyupdateprice"
    L4_2 = Config
    L4_2 = L4_2.AttractionsSettings
    L4_2 = L4_2.bumpercars
    L4_2 = L4_2.priceperminute
    L5_2 = L1_1
    L4_2 = L4_2 * L5_2
    L3_2.bumperpricedata = L4_2
    L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNUICallback
L9_1 = "closebumper"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L0_1
  if true == L2_2 then
    L2_2 = false
    L0_1 = L2_2
    L2_2 = Config
    L2_2 = L2_2.AttractionsSettings
    L2_2 = L2_2.bumpercars
    L2_2 = L2_2.minminutes
    L1_1 = L2_2
    L2_2 = SetNuiFocus
    L3_2 = false
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "hidebumperpay"
    L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNUICallback
L9_1 = "payforbumper"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L0_1
  if true == L2_2 then
    L2_2 = TriggerServerEvent
    L3_2 = "rtx_themepark:Bumper:PayForBumper"
    L4_2 = L1_1
    L2_2(L3_2, L4_2)
    L2_2 = false
    L0_1 = L2_2
    L2_2 = Config
    L2_2 = L2_2.AttractionsSettings
    L2_2 = L2_2.bumpercars
    L2_2 = L2_2.minminutes
    L1_1 = L2_2
    L2_2 = SetNuiFocus
    L3_2 = false
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "hidebumperpay"
    L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = {}
function L9_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.destructor
  if L1_2 then
    L1_2 = A0_2.handle
    if L1_2 then
      L1_2 = A0_2.destructor
      L2_2 = A0_2.handle
      L1_2(L2_2)
    end
  end
  A0_2.destructor = nil
  A0_2.handle = nil
end
L8_1.__gc = L9_1
function L9_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = coroutine
  L3_2 = L3_2.wrap
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = A0_2
    L0_3, L1_3 = L0_3()
    if not L1_3 or 0 == L1_3 then
      L2_3 = A2_2
      L3_3 = L0_3
      L2_3(L3_3)
      return
    end
    L2_3 = {}
    L2_3.handle = L0_3
    L3_3 = A2_2
    L2_3.destructor = L3_3
    L3_3 = setmetatable
    L4_3 = L2_3
    L5_3 = L8_1
    L3_3(L4_3, L5_3)
    L3_3 = true
    repeat
      L4_3 = coroutine
      L4_3 = L4_3.yield
      L5_3 = L1_3
      L4_3(L5_3)
      L4_3 = A1_2
      L5_3 = L0_3
      L4_3, L5_3 = L4_3(L5_3)
      L1_3 = L5_3
      L3_3 = L4_3
    until not L3_3
    L4_3 = nil
    L2_3.handle = nil
    L2_3.destructor = L4_3
    L4_3 = A2_2
    L5_3 = L0_3
    L4_3(L5_3)
  end
  return L3_2(L4_2)
end
function L10_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L9_1
  L1_2 = FindFirstVehicle
  L2_2 = FindNextVehicle
  L3_2 = EndFindVehicle
  return L0_2(L1_2, L2_2, L3_2)
end
EnumerateVehicles = L10_1
function L10_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = {}
  L1_2 = EnumerateVehicles
  L1_2, L2_2, L3_2, L4_2 = L1_2()
  for L5_2 in L1_2, L2_2, L3_2, L4_2 do
    L6_2 = table
    L6_2 = L6_2.insert
    L7_2 = L0_2
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  end
  return L0_2
end
GetVehicles = L10_1
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = GetVehicles
  L2_2 = L2_2()
  L3_2 = {}
  L4_2 = 1
  L5_2 = #L2_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = GetEntityCoords
    L9_2 = L2_2[L7_2]
    L8_2 = L8_2(L9_2)
    L9_2 = L8_2 - A0_2
    L9_2 = #L9_2
    if A1_2 >= L9_2 then
      L10_2 = table
      L10_2 = L10_2.insert
      L11_2 = L3_2
      L12_2 = L2_2[L7_2]
      L10_2(L11_2, L12_2)
    end
  end
  return L3_2
end
GetVehiclesInArea = L10_1
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = GetVehiclesInArea
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = #L2_2
  L3_2 = 0 == L3_2
  return L3_2
end
IsSpawnPointClear = L10_1
function L10_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = Config
  L0_2 = L0_2.BumperCarsSpawnPoints
  L1_2 = false
  L2_2 = nil
  L3_2 = 1
  L4_2 = #L0_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = IsSpawnPointClear
    L8_2 = L0_2[L6_2]
    L8_2 = L8_2.coords
    L9_2 = L0_2[L6_2]
    L9_2 = L9_2.radius
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L7_2 = true
      L2_2 = L0_2[L6_2]
      L1_2 = L7_2
      break
    end
  end
  if L1_2 then
    L3_2 = true
    L4_2 = L2_2
    return L3_2, L4_2
  else
    L3_2 = false
    return L3_2
  end
end
GetSpawnPoints = L10_1
function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = string
    L1_2 = L1_2.gsub
    L2_2 = A0_2
    L3_2 = "^%s*(.-)%s*$"
    L4_2 = "%1"
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    return L1_2
  else
    L1_2 = ""
    return L1_2
  end
end
PlateReformat = L10_1
function L10_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 16
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 17
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 22
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 23
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 24
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 25
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 26
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 36
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 37
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 44
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 47
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 55
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 69
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 81
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 82
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 91
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 92
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 99
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 106
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 114
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 115
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 140
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 142
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 257
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 86
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 75
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
end
DisableControlsBumper = L10_1
function L10_1(A0_2)
  local L1_2
  L1_2 = "sempre_delperropier_autodrom_auticko"
  if 1 == A0_2 then
    L1_2 = "sempre_delperropier_autodrom_auticko"
  elseif 2 == A0_2 then
    L1_2 = "sempre_delperropier_autodrom_auticko_b"
  elseif 3 == A0_2 then
    L1_2 = "sempre_delperropier_autodrom_auticko_g"
  elseif 4 == A0_2 then
    L1_2 = "sempre_delperropier_autodrom_auticko_p"
  end
  return L1_2
end
GetColorBumper = L10_1
L10_1 = RegisterNetEvent
L11_1 = "rtx_themepark:Bumper:OpenTicketMenu"
L10_1(L11_1)
L10_1 = AddEventHandler
L11_1 = "rtx_themepark:Bumper:OpenTicketMenu"
function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = GetEntityCoords
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = tickets
  if L3_2 ~= nil then
    L3_2 = L3_2.bumpercars
  else
    L3_2 = false
  end
  if false == L3_2 then
    L3_2 = bumperhandler
    L3_2 = L3_2.coordsbuy
    L3_2 = L2_2 - L3_2
    L3_2 = #L3_2
    L4_2 = Config
    L4_2 = L4_2.ThemeParkTicketMachineSettings
    L4_2 = L4_2.usedistance
    if L3_2 < L4_2 then
      L4_2 = L0_1
      if false == L4_2 then
        L4_2 = SendNUIMessage
        L5_2 = {}
        L5_2.message = "updateinterfacedata"
        L6_2 = Config
        L6_2 = L6_2.InterfaceColor
        L5_2.interfacecolordata = L6_2
        L6_2 = tostring
        L7_2 = GetCurrentResourceName
        L7_2 = L7_2()
        L6_2 = L6_2(L7_2)
        L5_2.themeparkresourcenamedata = L6_2
        L4_2(L5_2)
        L4_2 = true
        L0_1 = L4_2
        L4_2 = Config
        L4_2 = L4_2.AttractionsSettings
        L4_2 = L4_2.bumpercars
        L4_2 = L4_2.minminutes
        L1_1 = L4_2
        L4_2 = SendNUIMessage
        L5_2 = {}
        L5_2.message = "bumpercarsbuyshow"
        L6_2 = Config
        L6_2 = L6_2.AttractionsSettings
        L6_2 = L6_2.bumpercars
        L6_2 = L6_2.minminutes
        L5_2.bumperminminutesdata = L6_2
        L6_2 = Config
        L6_2 = L6_2.AttractionsSettings
        L6_2 = L6_2.bumpercars
        L6_2 = L6_2.maxminutes
        L5_2.bumpermaxminutesdata = L6_2
        L6_2 = Config
        L6_2 = L6_2.AttractionsSettings
        L6_2 = L6_2.bumpercars
        L6_2 = L6_2.priceperminute
        L7_2 = Config
        L7_2 = L7_2.AttractionsSettings
        L7_2 = L7_2.bumpercars
        L7_2 = L7_2.minminutes
        L6_2 = L6_2 * L7_2
        L5_2.bumperpricedata = L6_2
        L4_2(L5_2)
        L4_2 = SetNuiFocus
        L5_2 = true
        L6_2 = true
        L4_2(L5_2, L6_2)
      end
    end
  end
end
L10_1(L11_1, L12_1)
L10_1 = Config
L10_1 = L10_1.Target
if true == L10_1 then
  L10_1 = RegisterNetEvent
  L11_1 = "rtx_themepark:Bumper:OpenTicketTarget"
  L10_1(L11_1)
  L10_1 = AddEventHandler
  L11_1 = "rtx_themepark:Bumper:OpenTicketTarget"
  function L12_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = tickets
    if L2_2 ~= nil then
      L2_2 = L2_2.bumpercars
    else
      L2_2 = false
    end
    if false == L2_2 then
      L2_2 = bumperhandler
      L2_2 = L2_2.coordsbuy
      L2_2 = L1_2 - L2_2
      L2_2 = #L2_2
      L3_2 = Config
      L3_2 = L3_2.ThemeParkTicketMachineSettings
      L3_2 = L3_2.usedistance
      if L2_2 < L3_2 then
        L3_2 = iteminhand
        if false == L3_2 then
          L3_2 = TriggerServerEvent
          L4_2 = "rtx_themepark:Bumper:CheckTickets"
          L3_2(L4_2)
        else
          L3_2 = Notify
          L4_2 = Language
          L5_2 = Config
          L5_2 = L5_2.Language
          L4_2 = L4_2[L5_2]
          L4_2 = L4_2.iteminhand
          L3_2(L4_2)
        end
      end
    end
  end
  L10_1(L11_1, L12_1)
end
L10_1 = Config
L10_1 = L10_1.ServerSideObjectsOnly
if false == L10_1 then
  L10_1 = RegisterNetEvent
  L11_1 = "rtx_themepark:Bumper:SpawnBumperClient"
  L10_1(L11_1)
  L10_1 = AddEventHandler
  L11_1 = "rtx_themepark:Bumper:SpawnBumperClient"
  function L12_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = GetPlayerServerId
    L4_2 = PlayerId
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L4_2()
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
    L4_2 = bumperhandler
    L4_2 = L4_2.bumperplayers
    L5_2 = {}
    L5_2.seattaken = false
    L5_2.vehiclenetwork = nil
    L5_2.vehicleobject = nil
    L5_2.bumpercolor = A1_2
    L5_2.removed = false
    L4_2[L3_2] = L5_2
    L4_2 = DoesEntityExist
    L5_2 = L4_1
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = DeletEntity
      L5_2 = L4_1
      L4_2(L5_2)
    end
    L4_2 = false
    L5_2 = nil
    while false == L4_2 do
      L6_2 = GetSpawnPoints
      L6_2, L7_2 = L6_2()
      L5_2 = L7_2
      L4_2 = L6_2
      L6_2 = Citizen
      L6_2 = L6_2.Wait
      L7_2 = 100
      L6_2(L7_2)
    end
    L6_2 = GetHashKey
    L7_2 = "rtxbumper"
    L6_2 = L6_2(L7_2)
    L7_2 = RequestModel
    L8_2 = L6_2
    L7_2(L8_2)
    while true do
      L7_2 = HasModelLoaded
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        break
      end
      L7_2 = RequestModel
      L8_2 = L6_2
      L7_2(L8_2)
      L7_2 = Citizen
      L7_2 = L7_2.Wait
      L8_2 = 5
      L7_2(L8_2)
    end
    L7_2 = CreateVehicle
    L8_2 = L6_2
    L9_2 = L5_2.coords
    L9_2 = L9_2.x
    L10_2 = L5_2.coords
    L10_2 = L10_2.y
    L11_2 = L5_2.coords
    L11_2 = L11_2.z
    L12_2 = L5_2.heading
    L13_2 = true
    L14_2 = true
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L4_1 = L7_2
    L7_2 = SetVehicleHasBeenOwnedByPlayer
    L8_2 = true
    L7_2(L8_2)
    L7_2 = SetVehicleNeedsToBeHotwired
    L8_2 = false
    L7_2(L8_2)
    L7_2 = SetModelAsNoLongerNeeded
    L8_2 = L6_2
    L7_2(L8_2)
    L7_2 = SetVehRadioStation
    L8_2 = L4_1
    L9_2 = "OFF"
    L7_2(L8_2, L9_2)
    L7_2 = SetVehicleColours
    L8_2 = L4_1
    L9_2 = 111
    L10_2 = 64
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = SetVehicleDirtLevel
    L8_2 = L4_1
    L9_2 = 0.1
    L7_2(L8_2, L9_2)
    L7_2 = SetVehicleFuelLevel
    L8_2 = L4_1
    L9_2 = 100.0
    L7_2(L8_2, L9_2)
    L7_2 = SetEntityInvincible
    L8_2 = L4_1
    L7_2(L8_2)
    L7_2 = SetVehicleEngineOn
    L8_2 = L4_1
    L9_2 = true
    L10_2 = true
    L11_2 = true
    L7_2(L8_2, L9_2, L10_2, L11_2)
    L7_2 = SetVehicleRadioEnabled
    L8_2 = L4_1
    L9_2 = false
    L7_2(L8_2, L9_2)
    L7_2 = GetColorBumper
    L8_2 = A1_2
    L7_2 = L7_2(L8_2)
    L8_2 = GetHashKey
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    L9_2 = RequestModel
    L10_2 = L8_2
    L9_2(L10_2)
    while true do
      L9_2 = HasModelLoaded
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        break
      end
      L9_2 = RequestModel
      L10_2 = L8_2
      L9_2(L10_2)
      L9_2 = Citizen
      L9_2 = L9_2.Wait
      L10_2 = 5
      L9_2(L10_2)
    end
    L9_2 = bumperhandler
    L9_2 = L9_2.bumperplayers
    L9_2 = L9_2[L3_2]
    L10_2 = CreateObjectNoOffset
    L11_2 = L8_2
    L12_2 = L5_2.coords
    L12_2 = L12_2.x
    L13_2 = L5_2.coords
    L13_2 = L13_2.y
    L14_2 = L5_2.coords
    L14_2 = L14_2.z
    L15_2 = false
    L16_2 = true
    L17_2 = true
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L9_2.vehicleobject = L10_2
    L9_2 = FreezeEntityPosition
    L10_2 = bumperhandler
    L10_2 = L10_2.bumperplayers
    L10_2 = L10_2[L3_2]
    L10_2 = L10_2.vehicleobject
    L11_2 = true
    L9_2(L10_2, L11_2)
    L9_2 = SetEntityInvincible
    L10_2 = bumperhandler
    L10_2 = L10_2.bumperplayers
    L10_2 = L10_2[L3_2]
    L10_2 = L10_2.vehicleobject
    L9_2(L10_2)
    L9_2 = AttachEntityToEntity
    L10_2 = bumperhandler
    L10_2 = L10_2.bumperplayers
    L10_2 = L10_2[L3_2]
    L10_2 = L10_2.vehicleobject
    L11_2 = L4_1
    L12_2 = 0
    L13_2 = 0.0
    L14_2 = 0.0
    L15_2 = -0.1
    L16_2 = 0.0
    L17_2 = 0.0
    L18_2 = 180.0
    L19_2 = false
    L20_2 = false
    L21_2 = true
    L22_2 = false
    L23_2 = 2
    L24_2 = true
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
    L9_2 = TaskWarpPedIntoVehicle
    L10_2 = L2_2
    L11_2 = L4_1
    L12_2 = -1
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = NetworkGetNetworkIdFromEntity
    L10_2 = L4_1
    L9_2 = L9_2(L10_2)
    L10_2 = TriggerServerEvent
    L11_2 = "rtx_themepark:Bumper:SpawnBumper"
    L12_2 = L9_2
    L10_2(L11_2, L12_2)
    L10_2 = 60 * A0_2
    L3_1 = L10_2
    L10_2 = true
    L2_1 = L10_2
    L10_2 = SendNUIMessage
    L11_2 = {}
    L11_2.message = "bumperupdatetime"
    L12_2 = L3_1
    L11_2.bumpertimedata = L12_2
    L10_2(L11_2)
    L10_2 = SendNUIMessage
    L11_2 = {}
    L11_2.message = "bumpercarsshow"
    L11_2.bumperdriver = true
    L12_2 = Config
    L12_2 = L12_2.AttractionsSettings
    L12_2 = L12_2.bumpercars
    L12_2 = L12_2.bumperleavekey
    L11_2.bumperleavekeydata = L12_2
    L10_2(L11_2)
    L10_2 = SetPlayerCanDoDriveBy
    L11_2 = PlayerId
    L11_2 = L11_2()
    L12_2 = false
    L10_2(L11_2, L12_2)
    L10_2 = PlateReformat
    L11_2 = GetVehicleNumberPlateText
    L12_2 = L4_1
    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L11_2(L12_2)
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
    L11_2 = AddBumperKey
    L12_2 = L4_1
    L13_2 = GetEntityModel
    L14_2 = L4_1
    L13_2 = L13_2(L14_2)
    L14_2 = L10_2
    L11_2(L12_2, L13_2, L14_2)
  end
  L10_1(L11_1, L12_1)
else
  L10_1 = RegisterNetEvent
  L11_1 = "rtx_themepark:Bumper:SpawnBumperClient"
  L10_1(L11_1)
  L10_1 = AddEventHandler
  L11_1 = "rtx_themepark:Bumper:SpawnBumperClient"
  function L12_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
    L2_2 = false
    L3_2 = nil
    while false == L2_2 do
      L4_2 = GetSpawnPoints
      L4_2, L5_2 = L4_2()
      L3_2 = L5_2
      L2_2 = L4_2
      L4_2 = Citizen
      L4_2 = L4_2.Wait
      L5_2 = 100
      L4_2(L5_2)
    end
    L4_2 = GetColorBumper
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    L5_2 = GetHashKey
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L6_2 = RequestModel
    L7_2 = L5_2
    L6_2(L7_2)
    while true do
      L6_2 = HasModelLoaded
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        break
      end
      L6_2 = RequestModel
      L7_2 = L5_2
      L6_2(L7_2)
      L6_2 = Citizen
      L6_2 = L6_2.Wait
      L7_2 = 5
      L6_2(L7_2)
    end
    L6_2 = TriggerServerEvent
    L7_2 = "rtx_themepark:Bumper:SpawnBumper"
    L8_2 = L3_2.coords
    L9_2 = L3_2.heading
    L10_2 = A0_2
    L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L10_1(L11_1, L12_1)
  L10_1 = RegisterNetEvent
  L11_1 = "rtx_themepark:Bumper:BumperHandler"
  L10_1(L11_1)
  L10_1 = AddEventHandler
  L11_1 = "rtx_themepark:Bumper:BumperHandler"
  function L12_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = false
    while false == L3_2 do
      L4_2 = Citizen
      L4_2 = L4_2.Wait
      L5_2 = 5
      L4_2(L5_2)
      L3_2 = true
      L4_2 = NetworkDoesNetworkIdExist
      L5_2 = A1_2
      L4_2 = L4_2(L5_2)
      if not L4_2 then
        L3_2 = false
        L4_2 = DoesEntityExist
        L5_2 = NetToVeh
        L6_2 = A1_2
        L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
        L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
        if not L4_2 then
          L3_2 = false
        end
      end
    end
    L4_2 = NetToVeh
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    L4_1 = L4_2
    L4_2 = SetVehicleHasBeenOwnedByPlayer
    L5_2 = true
    L4_2(L5_2)
    L4_2 = SetVehicleNeedsToBeHotwired
    L5_2 = false
    L4_2(L5_2)
    L4_2 = SetModelAsNoLongerNeeded
    L5_2 = bumpermodelveh
    L4_2(L5_2)
    L4_2 = SetVehRadioStation
    L5_2 = L4_1
    L6_2 = "OFF"
    L4_2(L5_2, L6_2)
    L4_2 = SetVehicleColours
    L5_2 = L4_1
    L6_2 = 111
    L7_2 = 64
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = SetVehicleDirtLevel
    L5_2 = L4_1
    L6_2 = 0.1
    L4_2(L5_2, L6_2)
    L4_2 = SetVehicleFuelLevel
    L5_2 = L4_1
    L6_2 = 100.0
    L4_2(L5_2, L6_2)
    L4_2 = SetEntityInvincible
    L5_2 = L4_1
    L4_2(L5_2)
    L4_2 = SetVehicleEngineOn
    L5_2 = L4_1
    L6_2 = true
    L7_2 = true
    L8_2 = true
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = SetVehicleRadioEnabled
    L5_2 = L4_1
    L6_2 = false
    L4_2(L5_2, L6_2)
    L4_2 = TaskWarpPedIntoVehicle
    L5_2 = L2_2
    L6_2 = L4_1
    L7_2 = -1
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = 60 * A0_2
    L3_1 = L4_2
    L4_2 = true
    L2_1 = L4_2
    L4_2 = SendNUIMessage
    L5_2 = {}
    L5_2.message = "bumperupdatetime"
    L6_2 = L3_1
    L5_2.bumpertimedata = L6_2
    L4_2(L5_2)
    L4_2 = SendNUIMessage
    L5_2 = {}
    L5_2.message = "bumpercarsshow"
    L5_2.bumperdriver = true
    L6_2 = Config
    L6_2 = L6_2.AttractionsSettings
    L6_2 = L6_2.bumpercars
    L6_2 = L6_2.bumperleavekey
    L5_2.bumperleavekeydata = L6_2
    L4_2(L5_2)
    L4_2 = SetPlayerCanDoDriveBy
    L5_2 = PlayerId
    L5_2 = L5_2()
    L6_2 = false
    L4_2(L5_2, L6_2)
    L4_2 = PlateReformat
    L5_2 = GetVehicleNumberPlateText
    L6_2 = L4_1
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    L5_2 = AddBumperKey
    L6_2 = L4_1
    L7_2 = GetEntityModel
    L8_2 = L4_1
    L7_2 = L7_2(L8_2)
    L8_2 = L4_2
    L5_2(L6_2, L7_2, L8_2)
  end
  L10_1(L11_1, L12_1)
end
L10_1 = RegisterNetEvent
L11_1 = "rtx_themepark:Bumper:SynchronizeBumper"
L10_1(L11_1)
L10_1 = AddEventHandler
L11_1 = "rtx_themepark:Bumper:SynchronizeBumper"
function L12_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2
  L5_2 = bumperhandler
  L5_2 = L5_2.bumperplayers
  L5_2 = L5_2[A0_2]
  if nil ~= L5_2 then
    L5_2 = bumperhandler
    L5_2 = L5_2.bumperplayers
    L5_2 = L5_2[A0_2]
    L5_2.vehiclenetwork = A1_2
    L5_2.seattaken = A2_2
    L5_2.seattakenid = A3_2
  else
    L5_2 = bumperhandler
    L5_2 = L5_2.bumperplayers
    L6_2 = {}
    L6_2.seattaken = A2_2
    L6_2.seattakenid = A3_2
    L6_2.vehiclenetwork = A1_2
    L6_2.vehicleobject = nil
    L6_2.bumpercolor = A4_2
    L6_2.removed = false
    L5_2[A0_2] = L6_2
  end
end
L10_1(L11_1, L12_1)
L10_1 = RegisterNetEvent
L11_1 = "rtx_themepark:Bumper:SynchronizeBumperSeat"
L10_1(L11_1)
L10_1 = AddEventHandler
L11_1 = "rtx_themepark:Bumper:SynchronizeBumperSeat"
function L12_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L3_2 = bumperhandler
  L3_2 = L3_2.bumperplayers
  L3_2 = L3_2[A0_2]
  if nil ~= L3_2 then
    L3_2 = bumperhandler
    L3_2 = L3_2.bumperplayers
    L3_2 = L3_2[A0_2]
    L3_2.seattaken = A1_2
    if false == A1_2 then
      L4_2 = GetPlayerFromServerId
      L5_2 = L3_2.seattakenid
      L4_2 = L4_2(L5_2)
      if -1 ~= L4_2 then
        L5_2 = GetPlayerPed
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L6_2 = DoesEntityExist
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        if L6_2 then
          L6_2 = DetachEntity
          L7_2 = L5_2
          L6_2(L7_2)
          L6_2 = FreezeEntityPosition
          L7_2 = L5_2
          L8_2 = false
          L6_2(L7_2, L8_2)
          L6_2 = ClearPedTasks
          L7_2 = L5_2
          L6_2(L7_2)
        end
      end
      L3_2.seattakenid = nil
    else
      L3_2.seattakenid = A2_2
      L4_2 = GetPlayerFromServerId
      L5_2 = L3_2.seattakenid
      L4_2 = L4_2(L5_2)
      if -1 ~= L4_2 then
        L5_2 = GetPlayerPed
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L6_2 = NetworkDoesNetworkIdExist
        L7_2 = L3_2.vehiclenetwork
        L6_2 = L6_2(L7_2)
        if L6_2 then
          L6_2 = NetworkGetEntityFromNetworkId
          L7_2 = L3_2.vehiclenetwork
          L6_2 = L6_2(L7_2)
          L7_2 = DoesEntityExist
          L8_2 = L6_2
          L7_2 = L7_2(L8_2)
          if L7_2 then
            L7_2 = DoesEntityExist
            L8_2 = L5_2
            L7_2 = L7_2(L8_2)
            if L7_2 then
              L7_2 = FreezeEntityPosition
              L8_2 = L5_2
              L9_2 = true
              L7_2(L8_2, L9_2)
              L7_2 = NetworkAllowLocalEntityAttachment
              L8_2 = L5_2
              L9_2 = true
              L7_2(L8_2, L9_2)
              L7_2 = AttachEntityToEntity
              L8_2 = L5_2
              L9_2 = L6_2
              L10_2 = 0
              L11_2 = 0.25
              L12_2 = -0.25
              L13_2 = 0.1
              L14_2 = 0.0
              L15_2 = 0.0
              L16_2 = 0.0
              L17_2 = false
              L18_2 = false
              L19_2 = true
              L20_2 = false
              L21_2 = 2
              L22_2 = true
              L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              L7_2 = "anim@veh@gokart@generic@idles@base"
              L8_2 = "base"
              while true do
                L9_2 = HasAnimDictLoaded
                L10_2 = L7_2
                L9_2 = L9_2(L10_2)
                if L9_2 then
                  break
                end
                L9_2 = RequestAnimDict
                L10_2 = L7_2
                L9_2(L10_2)
                L9_2 = Citizen
                L9_2 = L9_2.Wait
                L10_2 = 5
                L9_2(L10_2)
              end
              L9_2 = TaskPlayAnim
              L10_2 = L5_2
              L11_2 = L7_2
              L12_2 = L8_2
              L13_2 = 8.0
              L14_2 = 8.0
              L15_2 = -1
              L16_2 = 1
              L17_2 = 0
              L18_2 = 0
              L19_2 = 0
              L20_2 = 0
              L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            end
          end
        end
      end
    end
  end
end
L10_1(L11_1, L12_1)
L10_1 = RegisterNetEvent
L11_1 = "rtx_themepark:Bumper:SeatStart"
L10_1(L11_1)
L10_1 = AddEventHandler
L11_1 = "rtx_themepark:Bumper:SeatStart"
function L12_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L6_1
  if false == L1_2 then
    L1_2 = true
    L6_1 = L1_2
    L7_1 = A0_2
    L1_2 = SendNUIMessage
    L2_2 = {}
    L2_2.message = "bumpercarsshow"
    L2_2.bumperdriver = false
    L3_2 = Config
    L3_2 = L3_2.AttractionsSettings
    L3_2 = L3_2.bumpercars
    L3_2 = L3_2.bumperleavekey
    L2_2.bumperleavekeydata = L3_2
    L1_2(L2_2)
    L1_2 = SetPlayerCanDoDriveBy
    L2_2 = PlayerId
    L2_2 = L2_2()
    L3_2 = false
    L1_2(L2_2, L3_2)
  end
end
L10_1(L11_1, L12_1)
L10_1 = RegisterNetEvent
L11_1 = "rtx_themepark:Bumper:SeatStop"
L10_1(L11_1)
L10_1 = AddEventHandler
L11_1 = "rtx_themepark:Bumper:SeatStop"
function L12_1()
  local L0_2, L1_2, L2_2
  L0_2 = L6_1
  if true == L0_2 then
    L0_2 = false
    L6_1 = L0_2
    L0_2 = nil
    L7_1 = L0_2
    L0_2 = SendNUIMessage
    L1_2 = {}
    L1_2.message = "hidebumpercars"
    L0_2(L1_2)
    L0_2 = SetPlayerCanDoDriveBy
    L1_2 = PlayerId
    L1_2 = L1_2()
    L2_2 = true
    L0_2(L1_2, L2_2)
  end
end
L10_1(L11_1, L12_1)
L10_1 = RegisterNetEvent
L11_1 = "rtx_themepark:Bumper:BumperEndClient"
L10_1(L11_1)
L10_1 = AddEventHandler
L11_1 = "rtx_themepark:Bumper:BumperEndClient"
function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = bumperhandler
  L1_2 = L1_2.bumperplayers
  L1_2 = L1_2[A0_2]
  if nil ~= L1_2 then
    L1_2 = bumperhandler
    L1_2 = L1_2.bumperplayers
    L1_2 = L1_2[A0_2]
    L1_2.removed = true
    L2_2 = L1_2.seattaken
    if true == L2_2 then
      L2_2 = GetPlayerFromServerId
      L3_2 = L1_2.seattakenid
      L2_2 = L2_2(L3_2)
      if -1 ~= L2_2 then
        L3_2 = GetPlayerPed
        L4_2 = L2_2
        L3_2 = L3_2(L4_2)
        L4_2 = DoesEntityExist
        L5_2 = L3_2
        L4_2 = L4_2(L5_2)
        if L4_2 then
          L4_2 = DetachEntity
          L5_2 = L3_2
          L4_2(L5_2)
          L4_2 = FreezeEntityPosition
          L5_2 = L3_2
          L6_2 = false
          L4_2(L5_2, L6_2)
          L4_2 = ClearPedTasks
          L5_2 = L3_2
          L4_2(L5_2)
          L4_2 = L6_1
          if true == L4_2 then
            L4_2 = L7_1
            if L4_2 == A0_2 then
              L4_2 = GetPlayerServerId
              L5_2 = PlayerId
              L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2()
              L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
              L5_2 = L1_2.seattakenid
              if L4_2 == L5_2 then
                L5_2 = false
                L6_1 = L5_2
                L5_2 = nil
                L7_1 = L5_2
                L5_2 = SendNUIMessage
                L6_2 = {}
                L6_2.message = "hidebumpercars"
                L5_2(L6_2)
                L5_2 = SetEntityCoordsNoOffset
                L6_2 = L2_2
                L7_2 = Config
                L7_2 = L7_2.AttractionsSettings
                L7_2 = L7_2.bumpercars
                L7_2 = L7_2.bumperdespawncoords
                L7_2 = L7_2.coords
                L7_2 = L7_2.x
                L8_2 = Config
                L8_2 = L8_2.AttractionsSettings
                L8_2 = L8_2.bumpercars
                L8_2 = L8_2.bumperdespawncoords
                L8_2 = L8_2.coords
                L8_2 = L8_2.y
                L9_2 = Config
                L9_2 = L9_2.AttractionsSettings
                L9_2 = L9_2.bumpercars
                L9_2 = L9_2.bumperdespawncoords
                L9_2 = L9_2.coords
                L9_2 = L9_2.z
                L5_2(L6_2, L7_2, L8_2, L9_2)
                L5_2 = SetEntityHeading
                L6_2 = L2_2
                L7_2 = Config
                L7_2 = L7_2.AttractionsSettings
                L7_2 = L7_2.bumpercars
                L7_2 = L7_2.bumperdespawncoords
                L7_2 = L7_2.heading
                L5_2(L6_2, L7_2)
                L5_2 = SetPlayerCanDoDriveBy
                L6_2 = PlayerId
                L6_2 = L6_2()
                L7_2 = true
                L5_2(L6_2, L7_2)
              end
            end
          end
        end
      end
    end
    L2_2 = NetworkDoesNetworkIdExist
    L3_2 = L1_2.vehiclenetwork
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = NetworkGetEntityFromNetworkId
      L3_2 = L1_2.vehiclenetwork
      L2_2 = L2_2(L3_2)
      L3_2 = DoesEntityExist
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L3_2 = DeleteEntity
        L4_2 = L2_2
        L3_2(L4_2)
      end
    end
    L2_2 = DoesEntityExist
    L3_2 = L1_2.vehicleobject
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = DetachEntity
      L3_2 = L1_2.vehicleobject
      L2_2(L3_2)
      L2_2 = DeleteEntity
      L3_2 = L1_2.vehicleobject
      L2_2(L3_2)
    end
    L2_2 = bumperhandler
    L2_2 = L2_2.bumperplayers
    L2_2[A0_2] = nil
  end
end
L10_1(L11_1, L12_1)
L10_1 = Config
L10_1 = L10_1.AttractionsSettings
L10_1 = L10_1.bumpercars
L10_1 = L10_1.disable
if false == L10_1 then
  L10_1 = Citizen
  L10_1 = L10_1.CreateThread
  function L11_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = true
      L1_2 = false
      L2_2 = nearbythemepark
      if true == L2_2 then
        L2_2 = tickets
        if L2_2 ~= nil then
          L2_2 = L2_2.bumpercars
        else
          L2_2 = false
        end
        if false == L2_2 then
          L2_2 = playercurrentcoords
          L3_2 = bumperhandler
          L3_2 = L3_2.coordsbuy
          L2_2 = L2_2 - L3_2
          L2_2 = #L2_2
          L3_2 = Config
          L3_2 = L3_2.ThemeParkTicketMachineSettings
          L3_2 = L3_2.usedistance
          if L2_2 < L3_2 then
            L1_2 = true
          end
        end
      end
      if L1_2 then
        L0_2 = false
        L2_2 = L0_1
        if false == L2_2 then
          L2_2 = Config
          L2_2 = L2_2.Target
          if false == L2_2 then
            L2_2 = Config
            L2_2 = L2_2.ThemeParkInteractionSystem
            if 1 == L2_2 then
              L2_2 = SendNUIMessage
              L3_2 = {}
              L3_2.message = "infonotifyshow"
              L4_2 = Language
              L5_2 = Config
              L5_2 = L5_2.Language
              L4_2 = L4_2[L5_2]
              L4_2 = L4_2.pressforbuyticketinteract
              L3_2.infonotifytext = L4_2
              L2_2(L3_2)
            else
              L2_2 = Config
              L2_2 = L2_2.ThemeParkInteractionSystem
              if 2 == L2_2 then
                L2_2 = DrawText3D
                L3_2 = bumperhandler
                L3_2 = L3_2.coordsbuy
                L3_2 = L3_2.x
                L4_2 = bumperhandler
                L4_2 = L4_2.coordsbuy
                L4_2 = L4_2.y
                L5_2 = bumperhandler
                L5_2 = L5_2.coordsbuy
                L5_2 = L5_2.z
                L6_2 = Language
                L7_2 = Config
                L7_2 = L7_2.Language
                L6_2 = L6_2[L7_2]
                L6_2 = L6_2.pressforbuyticket
                L2_2(L3_2, L4_2, L5_2, L6_2)
              else
                L2_2 = Config
                L2_2 = L2_2.ThemeParkInteractionSystem
                if 3 == L2_2 then
                  L2_2 = ShowGtaClassicInteraction
                  L3_2 = Language
                  L4_2 = Config
                  L4_2 = L4_2.Language
                  L3_2 = L3_2[L4_2]
                  L3_2 = L3_2.pressforbuyticketinteractclassic
                  L2_2(L3_2)
                end
              end
            end
          end
        else
          L2_2 = Config
          L2_2 = L2_2.ThemeParkInteractionSystem
          if 1 == L2_2 then
            L2_2 = SendNUIMessage
            L3_2 = {}
            L3_2.message = "hide"
            L2_2(L3_2)
          end
        end
      else
        L2_2 = Config
        L2_2 = L2_2.ThemeParkInteractionSystem
        if 1 == L2_2 then
          L2_2 = SendNUIMessage
          L3_2 = {}
          L3_2.message = "hide"
          L2_2(L3_2)
        end
      end
      if L0_2 then
        L2_2 = Citizen
        L2_2 = L2_2.Wait
        L3_2 = 1000
        L2_2(L3_2)
      end
    end
  end
  L10_1(L11_1)
  L10_1 = Citizen
  L10_1 = L10_1.CreateThread
  function L11_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = true
      L1_2 = false
      L2_2 = -1
      L3_2 = nil
      L4_2 = L2_1
      if false == L4_2 then
        L4_2 = L6_1
        if false == L4_2 then
          L4_2 = nearbythemepark
          if true == L4_2 then
            L4_2 = pairs
            L5_2 = bumperhandler
            L5_2 = L5_2.bumperplayers
            L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
            for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
              L10_2 = L9_2.seattaken
              if false == L10_2 then
                L10_2 = NetworkDoesNetworkIdExist
                L11_2 = L9_2.vehiclenetwork
                L10_2 = L10_2(L11_2)
                if L10_2 then
                  L10_2 = NetworkGetEntityFromNetworkId
                  L11_2 = L9_2.vehiclenetwork
                  L10_2 = L10_2(L11_2)
                  L11_2 = DoesEntityExist
                  L12_2 = L10_2
                  L11_2 = L11_2(L12_2)
                  if L11_2 then
                    L11_2 = GetEntityCoords
                    L12_2 = L10_2
                    L11_2 = L11_2(L12_2)
                    L12_2 = playercurrentcoords
                    L12_2 = L12_2 - L11_2
                    L12_2 = #L12_2
                    if L12_2 < 20.0 then
                      L13_2 = Config
                      L13_2 = L13_2.AttractionsSettings
                      L13_2 = L13_2.bumpercars
                      L13_2 = L13_2.seatdistance
                      if L12_2 < L13_2 and (-1 == L2_2 or L2_2 > L12_2) then
                        L2_2 = L12_2
                        L1_2 = true
                        L3_2 = L8_2
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      if L1_2 then
        L5_1 = L3_2
        L4_2 = usingattraction
        if false == L4_2 then
          L0_2 = false
          L4_2 = Config
          L4_2 = L4_2.ThemeParkInteractionSystem
          if 1 == L4_2 then
            L4_2 = SendNUIMessage
            L5_2 = {}
            L5_2.message = "infonotifyshow"
            L6_2 = Language
            L7_2 = Config
            L7_2 = L7_2.Language
            L6_2 = L6_2[L7_2]
            L6_2 = L6_2.pressforusebumperinteract
            L5_2.infonotifytext = L6_2
            L4_2(L5_2)
          else
            L4_2 = Config
            L4_2 = L4_2.ThemeParkInteractionSystem
            if 2 == L4_2 then
              L4_2 = bumperhandler
              L4_2 = L4_2.bumperplayers
              L5_2 = L5_1
              L4_2 = L4_2[L5_2]
              L5_2 = NetworkDoesNetworkIdExist
              L6_2 = L4_2.vehiclenetwork
              L5_2 = L5_2(L6_2)
              if L5_2 then
                L5_2 = NetworkGetEntityFromNetworkId
                L6_2 = L4_2.vehiclenetwork
                L5_2 = L5_2(L6_2)
                L6_2 = DoesEntityExist
                L7_2 = L5_2
                L6_2 = L6_2(L7_2)
                if L6_2 then
                  L6_2 = GetEntityCoords
                  L7_2 = L5_2
                  L6_2 = L6_2(L7_2)
                  L7_2 = DrawText3D
                  L8_2 = L6_2.x
                  L9_2 = L6_2.y
                  L10_2 = L6_2.z
                  L11_2 = Language
                  L12_2 = Config
                  L12_2 = L12_2.Language
                  L11_2 = L11_2[L12_2]
                  L11_2 = L11_2.pressforusebumper
                  L7_2(L8_2, L9_2, L10_2, L11_2)
                end
              end
            else
              L4_2 = Config
              L4_2 = L4_2.ThemeParkInteractionSystem
              if 3 == L4_2 then
                L4_2 = ShowGtaClassicInteraction
                L5_2 = Language
                L6_2 = Config
                L6_2 = L6_2.Language
                L5_2 = L5_2[L6_2]
                L5_2 = L5_2.pressforusebumperinteractclassic
                L4_2(L5_2)
              end
            end
          end
        end
      else
        L4_2 = Config
        L4_2 = L4_2.ThemeParkInteractionSystem
        if 1 == L4_2 then
          L4_2 = SendNUIMessage
          L5_2 = {}
          L5_2.message = "hide"
          L4_2(L5_2)
        end
        L4_2 = nil
        L5_1 = L4_2
      end
      if L0_2 then
        L4_2 = Citizen
        L4_2 = L4_2.Wait
        L5_2 = 1000
        L4_2(L5_2)
      end
    end
  end
  L10_1(L11_1)
  L10_1 = Citizen
  L10_1 = L10_1.CreateThread
  function L11_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = true
      L1_2 = nearbythemepark
      if true == L1_2 then
        L1_2 = pairs
        L2_2 = bumperhandler
        L2_2 = L2_2.bumperplayers
        L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
        for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
          L7_2 = NetworkDoesNetworkIdExist
          L8_2 = L6_2.vehiclenetwork
          L7_2 = L7_2(L8_2)
          if L7_2 then
            L7_2 = NetToVeh
            L8_2 = L6_2.vehiclenetwork
            L7_2 = L7_2(L8_2)
            L8_2 = DoesEntityExist
            L9_2 = L7_2
            L8_2 = L8_2(L9_2)
            if L8_2 then
              L8_2 = DoesEntityExist
              L9_2 = L6_2.vehicleobject
              L8_2 = L8_2(L9_2)
              if L8_2 then
              else
                L8_2 = L6_2.removed
                if false == L8_2 then
                  L8_2 = GetColorBumper
                  L9_2 = L6_2.bumpercolor
                  L8_2 = L8_2(L9_2)
                  L9_2 = GetHashKey
                  L10_2 = L8_2
                  L9_2 = L9_2(L10_2)
                  L10_2 = RequestModel
                  L11_2 = L9_2
                  L10_2(L11_2)
                  while true do
                    L10_2 = HasModelLoaded
                    L11_2 = L9_2
                    L10_2 = L10_2(L11_2)
                    if L10_2 then
                      break
                    end
                    L10_2 = RequestModel
                    L11_2 = L9_2
                    L10_2(L11_2)
                    L10_2 = Citizen
                    L10_2 = L10_2.Wait
                    L11_2 = 5
                    L10_2(L11_2)
                  end
                  L10_2 = GetEntityCoords
                  L11_2 = L7_2
                  L10_2 = L10_2(L11_2)
                  L11_2 = CreateObjectNoOffset
                  L12_2 = L9_2
                  L13_2 = L10_2.x
                  L14_2 = L10_2.y
                  L15_2 = L10_2.z
                  L16_2 = false
                  L17_2 = true
                  L18_2 = true
                  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
                  L6_2.vehicleobject = L11_2
                  L11_2 = FreezeEntityPosition
                  L12_2 = L6_2.vehicleobject
                  L13_2 = true
                  L11_2(L12_2, L13_2)
                  L11_2 = SetEntityInvincible
                  L12_2 = L6_2.vehicleobject
                  L11_2(L12_2)
                  L11_2 = AttachEntityToEntity
                  L12_2 = L6_2.vehicleobject
                  L13_2 = L7_2
                  L14_2 = 0
                  L15_2 = 0.0
                  L16_2 = 0.0
                  L17_2 = -0.1
                  L18_2 = 0.0
                  L19_2 = 0.0
                  L20_2 = 180.0
                  L21_2 = false
                  L22_2 = false
                  L23_2 = true
                  L24_2 = false
                  L25_2 = 2
                  L26_2 = true
                  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
                end
              end
            end
          end
        end
      end
      if L0_2 then
        L1_2 = Citizen
        L1_2 = L1_2.Wait
        L2_2 = 1000
        L1_2(L2_2)
      end
    end
  end
  L10_1(L11_1)
  L10_1 = Citizen
  L10_1 = L10_1.CreateThread
  function L11_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 1000
      L0_2(L1_2)
      L0_2 = L2_1
      if true == L0_2 then
        L0_2 = L3_1
        if L0_2 > 0 then
          L0_2 = L3_1
          L0_2 = L0_2 - 1
          L3_1 = L0_2
          L0_2 = SendNUIMessage
          L1_2 = {}
          L1_2.message = "bumperupdatetime"
          L2_2 = L3_1
          L1_2.bumpertimedata = L2_2
          L0_2(L1_2)
        else
          L0_2 = PlayerPedId
          L0_2 = L0_2()
          L1_2 = 0
          L3_1 = L1_2
          L1_2 = false
          L2_1 = L1_2
          L1_2 = GetPlayerServerId
          L2_2 = PlayerId
          L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L2_2()
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
          L2_2 = bumperhandler
          L2_2 = L2_2.bumperplayers
          L2_2 = L2_2[L1_2]
          L3_2 = DoesEntityExist
          L4_2 = L2_2.vehicleobject
          L3_2 = L3_2(L4_2)
          if L3_2 then
            L3_2 = DeleteEntity
            L4_2 = L2_2.vehicleobject
            L3_2(L4_2)
          end
          L3_2 = PlateReformat
          L4_2 = GetVehicleNumberPlateText
          L5_2 = L4_1
          L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)
          L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
          L4_2 = RemoveBumperKey
          L5_2 = L4_1
          L6_2 = GetEntityModel
          L7_2 = L4_1
          L6_2 = L6_2(L7_2)
          L7_2 = L3_2
          L4_2(L5_2, L6_2, L7_2)
          L4_2 = Config
          L4_2 = L4_2.ServerSideObjectsOnly
          if false == L4_2 then
            L4_2 = DoesEntityExist
            L5_2 = L4_1
            L4_2 = L4_2(L5_2)
            if L4_2 then
              L4_2 = DeleteEntity
              L5_2 = L4_1
              L4_2(L5_2)
            end
          end
          L4_2 = SetEntityCoordsNoOffset
          L5_2 = L0_2
          L6_2 = Config
          L6_2 = L6_2.AttractionsSettings
          L6_2 = L6_2.bumpercars
          L6_2 = L6_2.bumperdespawncoords
          L6_2 = L6_2.coords
          L6_2 = L6_2.x
          L7_2 = Config
          L7_2 = L7_2.AttractionsSettings
          L7_2 = L7_2.bumpercars
          L7_2 = L7_2.bumperdespawncoords
          L7_2 = L7_2.coords
          L7_2 = L7_2.y
          L8_2 = Config
          L8_2 = L8_2.AttractionsSettings
          L8_2 = L8_2.bumpercars
          L8_2 = L8_2.bumperdespawncoords
          L8_2 = L8_2.coords
          L8_2 = L8_2.z
          L4_2(L5_2, L6_2, L7_2, L8_2)
          L4_2 = SetEntityHeading
          L5_2 = L0_2
          L6_2 = Config
          L6_2 = L6_2.AttractionsSettings
          L6_2 = L6_2.bumpercars
          L6_2 = L6_2.bumperdespawncoords
          L6_2 = L6_2.heading
          L4_2(L5_2, L6_2)
          L4_2 = TriggerServerEvent
          L5_2 = "rtx_themepark:Bumper:BumperEnd"
          L4_2(L5_2)
          L4_2 = SendNUIMessage
          L5_2 = {}
          L5_2.message = "hidebumpercars"
          L4_2(L5_2)
          L4_2 = SetPlayerCanDoDriveBy
          L5_2 = PlayerId
          L5_2 = L5_2()
          L6_2 = true
          L4_2(L5_2, L6_2)
        end
      end
    end
  end
  L10_1(L11_1)
  L10_1 = Config
  L10_1 = L10_1.AttractionsSettings
  L10_1 = L10_1.bumpercars
  L10_1 = L10_1.disablebumperkeyboard
  if L10_1 then
    L10_1 = Citizen
    L10_1 = L10_1.CreateThread
    function L11_1()
      local L0_2, L1_2
      while true do
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 5
        L0_2(L1_2)
        L0_2 = L2_1
        if true ~= L0_2 then
          L0_2 = L6_1
          if true ~= L0_2 then
            goto lbl_14
          end
        end
        L0_2 = DisableControlsBumper
        L0_2()
        goto lbl_18
        ::lbl_14::
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 1500
        L0_2(L1_2)
        ::lbl_18::
      end
    end
    L10_1(L11_1)
  end
end
L10_1 = Config
L10_1 = L10_1.Target
if false == L10_1 then
  L10_1 = RegisterCommand
  L11_1 = "buybumperticket"
  function L12_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = tickets
    if L2_2 ~= nil then
      L2_2 = L2_2.bumpercars
    else
      L2_2 = false
    end
    if false == L2_2 then
      L2_2 = bumperhandler
      L2_2 = L2_2.coordsbuy
      L2_2 = L1_2 - L2_2
      L2_2 = #L2_2
      L3_2 = Config
      L3_2 = L3_2.ThemeParkTicketMachineSettings
      L3_2 = L3_2.usedistance
      if L2_2 < L3_2 then
        L3_2 = iteminhand
        if false == L3_2 then
          L3_2 = TriggerServerEvent
          L4_2 = "rtx_themepark:Bumper:CheckTickets"
          L3_2(L4_2)
        else
          L3_2 = Notify
          L4_2 = Language
          L5_2 = Config
          L5_2 = L5_2.Language
          L4_2 = L4_2[L5_2]
          L4_2 = L4_2.iteminhand
          L3_2(L4_2)
        end
      end
    end
  end
  L10_1(L11_1, L12_1)
  L10_1 = RegisterKeyMapping
  L11_1 = "buybumperticket"
  L12_1 = Language
  L13_1 = Config
  L13_1 = L13_1.Language
  L12_1 = L12_1[L13_1]
  L12_1 = L12_1.bindbuyticket
  L13_1 = "keyboard"
  L14_1 = Config
  L14_1 = L14_1.ThemeParkTicketMachineSettings
  L14_1 = L14_1.usekey
  L10_1(L11_1, L12_1, L13_1, L14_1)
end
L10_1 = RegisterCommand
L11_1 = "usebumperseat"
function L12_1()
  local L0_2, L1_2, L2_2
  L0_2 = L6_1
  if false == L0_2 then
    L0_2 = L5_1
    if nil ~= L0_2 then
      L0_2 = iteminhand
      if false == L0_2 then
        L0_2 = TriggerServerEvent
        L1_2 = "rtx_themepark:Bumper:BumperSeatStart"
        L2_2 = L5_1
        L0_2(L1_2, L2_2)
      else
        L0_2 = Notify
        L1_2 = Language
        L2_2 = Config
        L2_2 = L2_2.Language
        L1_2 = L1_2[L2_2]
        L1_2 = L1_2.iteminhand
        L0_2(L1_2)
      end
    end
  end
end
L10_1(L11_1, L12_1)
L10_1 = RegisterKeyMapping
L11_1 = "usebumperseat"
L12_1 = Language
L13_1 = Config
L13_1 = L13_1.Language
L12_1 = L12_1[L13_1]
L12_1 = L12_1.bindusebumper
L13_1 = "keyboard"
L14_1 = Config
L14_1 = L14_1.AttractionsSettings
L14_1 = L14_1.bumpercars
L14_1 = L14_1.bumperusekey
L10_1(L11_1, L12_1, L13_1, L14_1)
L10_1 = RegisterCommand
L11_1 = "leavebumper"
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = L2_1
  if true == L0_2 then
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = 0
    L3_1 = L1_2
    L1_2 = false
    L2_1 = L1_2
    L1_2 = GetPlayerServerId
    L2_2 = PlayerId
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L2_2()
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    L2_2 = bumperhandler
    L2_2 = L2_2.bumperplayers
    L2_2 = L2_2[L1_2]
    L3_2 = DoesEntityExist
    L4_2 = L2_2.vehicleobject
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = DeleteEntity
      L4_2 = L2_2.vehicleobject
      L3_2(L4_2)
    end
    L3_2 = PlateReformat
    L4_2 = GetVehicleNumberPlateText
    L5_2 = L4_1
    L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L4_2 = RemoveBumperKey
    L5_2 = L4_1
    L6_2 = GetEntityModel
    L7_2 = L4_1
    L6_2 = L6_2(L7_2)
    L7_2 = L3_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Config
    L4_2 = L4_2.ServerSideObjectsOnly
    if false == L4_2 then
      L4_2 = DoesEntityExist
      L5_2 = L4_1
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L4_2 = DeleteEntity
        L5_2 = L4_1
        L4_2(L5_2)
      end
    end
    L4_2 = SetEntityCoordsNoOffset
    L5_2 = L0_2
    L6_2 = Config
    L6_2 = L6_2.AttractionsSettings
    L6_2 = L6_2.bumpercars
    L6_2 = L6_2.bumperdespawncoords
    L6_2 = L6_2.coords
    L6_2 = L6_2.x
    L7_2 = Config
    L7_2 = L7_2.AttractionsSettings
    L7_2 = L7_2.bumpercars
    L7_2 = L7_2.bumperdespawncoords
    L7_2 = L7_2.coords
    L7_2 = L7_2.y
    L8_2 = Config
    L8_2 = L8_2.AttractionsSettings
    L8_2 = L8_2.bumpercars
    L8_2 = L8_2.bumperdespawncoords
    L8_2 = L8_2.coords
    L8_2 = L8_2.z
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = SetEntityHeading
    L5_2 = L0_2
    L6_2 = Config
    L6_2 = L6_2.AttractionsSettings
    L6_2 = L6_2.bumpercars
    L6_2 = L6_2.bumperdespawncoords
    L6_2 = L6_2.heading
    L4_2(L5_2, L6_2)
    L4_2 = TriggerServerEvent
    L5_2 = "rtx_themepark:Bumper:BumperEnd"
    L4_2(L5_2)
    L4_2 = SendNUIMessage
    L5_2 = {}
    L5_2.message = "hidebumpercars"
    L4_2(L5_2)
    L4_2 = SetPlayerCanDoDriveBy
    L5_2 = PlayerId
    L5_2 = L5_2()
    L6_2 = true
    L4_2(L5_2, L6_2)
  else
    L0_2 = L6_1
    if true == L0_2 then
      L0_2 = L7_1
      if nil ~= L0_2 then
        L0_2 = TriggerServerEvent
        L1_2 = "rtx_themepark:Bumper:BumperSeatEnd"
        L2_2 = L7_1
        L0_2(L1_2, L2_2)
      end
    end
  end
end
L10_1(L11_1, L12_1)
L10_1 = RegisterKeyMapping
L11_1 = "leavebumper"
L12_1 = Language
L13_1 = Config
L13_1 = L13_1.Language
L12_1 = L12_1[L13_1]
L12_1 = L12_1.bindleavebumper
L13_1 = "keyboard"
L14_1 = Config
L14_1 = L14_1.AttractionsSettings
L14_1 = L14_1.bumpercars
L14_1 = L14_1.bumperleavekey
L10_1(L11_1, L12_1, L13_1, L14_1)
