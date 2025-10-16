local L0_1, L1_1, L2_1
L0_1 = {}
L0_1.currentplayers = 0
L1_1 = {}
L0_1.bumperplayers = L1_1
bumperhandler = L0_1
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Bumper:CheckTickets"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Bumper:CheckTickets"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = source
  L1_2 = themeparkattractionsopenstatus
  L1_2 = L1_2[6]
  if true == L1_2 then
    L1_2 = themeparkdisabled
    if false == L1_2 then
      L1_2 = attractionlockdown
      if false == L1_2 then
        L1_2 = Config
        L1_2 = L1_2.AttractionsSettings
        L1_2 = L1_2.bumpercars
        L1_2 = L1_2.disable
        if false == L1_2 then
          L1_2 = bumperhandler
          L1_2 = L1_2.currentplayers
          L2_2 = Config
          L2_2 = L2_2.AttractionsSettings
          L2_2 = L2_2.bumpercars
          L2_2 = L2_2.maxplayers
          if L1_2 < L2_2 then
            L1_2 = TriggerClientEvent
            L2_2 = "rtx_themepark:Bumper:OpenTicketMenu"
            L3_2 = L0_2
            L1_2(L2_2, L3_2)
          else
            L1_2 = TriggerClientEvent
            L2_2 = "rtx_themepark:Notify"
            L3_2 = L0_2
            L4_2 = Language
            L5_2 = Config
            L5_2 = L5_2.Language
            L4_2 = L4_2[L5_2]
            L4_2 = L4_2.bumpermaxplayers
            L1_2(L2_2, L3_2, L4_2)
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
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Bumper:PayForBumper"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Bumper:PayForBumper"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = source
  L2_2 = themeparkattractionsopenstatus
  L2_2 = L2_2[6]
  if true == L2_2 then
    L2_2 = themeparkdisabled
    if false == L2_2 then
      L2_2 = Config
      L2_2 = L2_2.AttractionsSettings
      L2_2 = L2_2.bumpercars
      L2_2 = L2_2.disable
      if false == L2_2 then
        if nil ~= A0_2 then
          L2_2 = bumperhandler
          L2_2 = L2_2.currentplayers
          L3_2 = Config
          L3_2 = L3_2.AttractionsSettings
          L3_2 = L3_2.bumpercars
          L3_2 = L3_2.maxplayers
          if L2_2 < L3_2 then
            L2_2 = Config
            L2_2 = L2_2.AttractionsSettings
            L2_2 = L2_2.bumpercars
            L2_2 = L2_2.priceperminute
            L2_2 = L2_2 * A0_2
            L3_2 = GetMoneyRTX
            L4_2 = L1_2
            L3_2 = L3_2(L4_2)
            if L2_2 <= L3_2 then
              L4_2 = RemoveMoneyRTX
              L5_2 = L1_2
              L6_2 = L2_2
              L4_2(L5_2, L6_2)
              L4_2 = bumperhandler
              L4_2 = L4_2.currentplayers
              if 0 == L4_2 then
                L4_2 = TriggerClientEvent
                L5_2 = "rtx_themepark:Global:MusicStartAttraction"
                L6_2 = -1
                L7_2 = "bumpercars"
                L8_2 = math
                L8_2 = L8_2.random
                L9_2 = 1
                L10_2 = Config
                L10_2 = L10_2.AttractionsMusic
                L10_2 = L10_2.bumpercars
                L10_2 = L10_2.playlist
                L10_2 = #L10_2
                L8_2, L9_2, L10_2 = L8_2(L9_2, L10_2)
                L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
              end
              L4_2 = bumperhandler
              L5_2 = bumperhandler
              L5_2 = L5_2.currentplayers
              L5_2 = L5_2 + 1
              L4_2.currentplayers = L5_2
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L1_2
              L7_2 = Language
              L8_2 = Config
              L8_2 = L8_2.Language
              L7_2 = L7_2[L8_2]
              L7_2 = L7_2.bumperticketpurchased
              L4_2(L5_2, L6_2, L7_2)
              L4_2 = math
              L4_2 = L4_2.random
              L5_2 = 1
              L6_2 = 4
              L4_2 = L4_2(L5_2, L6_2)
              L5_2 = bumperhandler
              L5_2 = L5_2.bumperplayers
              L6_2 = {}
              L6_2.seattaken = false
              L6_2.seattakenid = nil
              L6_2.vehiclenetwork = nil
              L6_2.vehiclehandler = nil
              L6_2.bumpercolor = L4_2
              L5_2[L1_2] = L6_2
              L5_2 = TriggerClientEvent
              L6_2 = "rtx_themepark:Bumper:SpawnBumperClient"
              L7_2 = L1_2
              L8_2 = A0_2
              L9_2 = L4_2
              L5_2(L6_2, L7_2, L8_2, L9_2)
              L5_2 = Config
              L5_2 = L5_2.ThemeParkCanBeOwned
              if L5_2 then
                L5_2 = round
                L6_2 = Config
                L6_2 = L6_2.ThemeParkOwnedSettings
                L6_2 = L6_2.ticketmultipler
                L6_2 = L2_2 * L6_2
                L7_2 = 0
                L5_2 = L5_2(L6_2, L7_2)
                L6_2 = themeparkowned
                L7_2 = themeparkowned
                L7_2 = L7_2.balance
                L7_2 = L7_2 + L5_2
                L6_2.balance = L7_2
                L6_2 = UpdateParkMoney
                L7_2 = themeparkowned
                L7_2 = L7_2.balance
                L6_2(L7_2)
              end
            else
              L4_2 = TriggerClientEvent
              L5_2 = "rtx_themepark:Notify"
              L6_2 = L1_2
              L7_2 = LanguageFile
              L8_2 = "nomoneyenoughthemeparkattraction"
              L9_2 = L2_2
              L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2)
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
            end
          else
            L2_2 = TriggerClientEvent
            L3_2 = "rtx_themepark:Notify"
            L4_2 = L1_2
            L5_2 = Language
            L6_2 = Config
            L6_2 = L6_2.Language
            L5_2 = L5_2[L6_2]
            L5_2 = L5_2.bumpermaxplayers
            L2_2(L3_2, L4_2, L5_2)
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
L0_1 = Config
L0_1 = L0_1.ServerSideObjectsOnly
if false == L0_1 then
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Bumper:SpawnBumper"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Bumper:SpawnBumper"
  function L2_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
    L1_2 = source
    L2_2 = bumperhandler
    L2_2 = L2_2.bumperplayers
    L2_2 = L2_2[L1_2]
    if nil ~= L2_2 then
      L2_2 = bumperhandler
      L2_2 = L2_2.bumperplayers
      L2_2 = L2_2[L1_2]
      L2_2.vehiclenetwork = A0_2
      L2_2 = pairs
      L3_2 = playsersinthemepark
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = TriggerClientEvent
        L9_2 = "rtx_themepark:Bumper:SynchronizeBumper"
        L10_2 = L7_2
        L11_2 = L1_2
        L12_2 = A0_2
        L13_2 = false
        L14_2 = nil
        L15_2 = bumperhandler
        L15_2 = L15_2.bumperplayers
        L15_2 = L15_2[L1_2]
        L15_2 = L15_2.bumpercolor
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      end
    end
  end
  L0_1(L1_1, L2_1)
else
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Bumper:SpawnBumper"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Bumper:SpawnBumper"
  function L2_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
    L3_2 = source
    L4_2 = bumperhandler
    L4_2 = L4_2.bumperplayers
    L4_2 = L4_2[L3_2]
    if nil ~= L4_2 then
      L4_2 = GetPlayerPed
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = print
      L6_2 = A0_2
      L5_2(L6_2)
      L5_2 = bumperhandler
      L5_2 = L5_2.bumperplayers
      L5_2 = L5_2[L3_2]
      L6_2 = CreateVehicleServerSetter
      L7_2 = 329824403
      L8_2 = "automobile"
      L9_2 = A0_2.x
      L10_2 = A0_2.y
      L11_2 = A0_2.z
      L11_2 = L11_2 + 0.25
      L12_2 = A1_2
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L5_2.vehiclehandler = L6_2
      while true do
        L5_2 = DoesEntityExist
        L6_2 = bumperhandler
        L6_2 = L6_2.bumperplayers
        L6_2 = L6_2[L3_2]
        L6_2 = L6_2.vehiclehandler
        L5_2 = L5_2(L6_2)
        if L5_2 then
          break
        end
        L5_2 = Citizen
        L5_2 = L5_2.Wait
        L6_2 = 0
        L5_2(L6_2)
      end
      L5_2 = bumperhandler
      L5_2 = L5_2.bumperplayers
      L5_2 = L5_2[L3_2]
      L6_2 = NetworkGetNetworkIdFromEntity
      L7_2 = bumperhandler
      L7_2 = L7_2.bumperplayers
      L7_2 = L7_2[L3_2]
      L7_2 = L7_2.vehiclehandler
      L6_2 = L6_2(L7_2)
      L5_2.vehiclenetwork = L6_2
      L5_2 = TaskWarpPedIntoVehicle
      L6_2 = L4_2
      L7_2 = bumperhandler
      L7_2 = L7_2.bumperplayers
      L7_2 = L7_2[L3_2]
      L7_2 = L7_2.vehiclehandler
      L8_2 = -1
      L5_2(L6_2, L7_2, L8_2)
      L5_2 = TriggerClientEvent
      L6_2 = "rtx_themepark:Bumper:BumperHandler"
      L7_2 = L3_2
      L8_2 = A2_2
      L9_2 = bumperhandler
      L9_2 = L9_2.bumperplayers
      L9_2 = L9_2[L3_2]
      L9_2 = L9_2.vehiclenetwork
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = pairs
      L6_2 = playsersinthemepark
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
      for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
        L11_2 = TriggerClientEvent
        L12_2 = "rtx_themepark:Bumper:SynchronizeBumper"
        L13_2 = L10_2
        L14_2 = L3_2
        L15_2 = bumperhandler
        L15_2 = L15_2.bumperplayers
        L15_2 = L15_2[L3_2]
        L15_2 = L15_2.vehiclenetwork
        L16_2 = false
        L17_2 = nil
        L18_2 = bumperhandler
        L18_2 = L18_2.bumperplayers
        L18_2 = L18_2[L3_2]
        L18_2 = L18_2.bumpercolor
        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
      end
    end
  end
  L0_1(L1_1, L2_1)
end
L0_1 = Config
L0_1 = L0_1.ServerSideObjectsOnly
if false == L0_1 then
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Bumper:BumperEnd"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Bumper:BumperEnd"
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
    L0_2 = source
    L1_2 = bumperhandler
    L1_2 = L1_2.bumperplayers
    L1_2 = L1_2[L0_2]
    if nil ~= L1_2 then
      L1_2 = bumperhandler
      L2_2 = bumperhandler
      L2_2 = L2_2.currentplayers
      L2_2 = L2_2 - 1
      L1_2.currentplayers = L2_2
      L1_2 = TriggerClientEvent
      L2_2 = "rtx_themepark:Bumper:BumperEndClient"
      L3_2 = -1
      L4_2 = L0_2
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = TriggerClientEvent
      L2_2 = "rtx_themepark:Notify"
      L3_2 = L0_2
      L4_2 = Language
      L5_2 = Config
      L5_2 = L5_2.Language
      L4_2 = L4_2[L5_2]
      L4_2 = L4_2.bumperridend
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = bumperhandler
      L1_2 = L1_2.bumperplayers
      L1_2[L0_2] = nil
      L1_2 = bumperhandler
      L1_2 = L1_2.currentplayers
      if 0 == L1_2 then
        L1_2 = TriggerClientEvent
        L2_2 = "rtx_themepark:Global:MusicStopAttraction"
        L3_2 = -1
        L4_2 = "bumpercars"
        L1_2(L2_2, L3_2, L4_2)
      end
    end
  end
  L0_1(L1_1, L2_1)
else
  L0_1 = RegisterServerEvent
  L1_1 = "rtx_themepark:Bumper:BumperEnd"
  L0_1(L1_1)
  L0_1 = AddEventHandler
  L1_1 = "rtx_themepark:Bumper:BumperEnd"
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
    L0_2 = source
    L1_2 = bumperhandler
    L1_2 = L1_2.bumperplayers
    L1_2 = L1_2[L0_2]
    if nil ~= L1_2 then
      L1_2 = DoesEntityExist
      L2_2 = bumperhandler
      L2_2 = L2_2.bumperplayers
      L2_2 = L2_2[L0_2]
      L2_2 = L2_2.vehiclehandler
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = DeleteEntity
        L2_2 = bumperhandler
        L2_2 = L2_2.bumperplayers
        L2_2 = L2_2[L0_2]
        L2_2 = L2_2.vehiclehandler
        L1_2(L2_2)
      end
      L1_2 = bumperhandler
      L2_2 = bumperhandler
      L2_2 = L2_2.currentplayers
      L2_2 = L2_2 - 1
      L1_2.currentplayers = L2_2
      L1_2 = TriggerClientEvent
      L2_2 = "rtx_themepark:Bumper:BumperEndClient"
      L3_2 = -1
      L4_2 = L0_2
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = TriggerClientEvent
      L2_2 = "rtx_themepark:Notify"
      L3_2 = L0_2
      L4_2 = Language
      L5_2 = Config
      L5_2 = L5_2.Language
      L4_2 = L4_2[L5_2]
      L4_2 = L4_2.bumperridend
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = bumperhandler
      L1_2 = L1_2.bumperplayers
      L1_2[L0_2] = nil
      L1_2 = bumperhandler
      L1_2 = L1_2.currentplayers
      if 0 == L1_2 then
        L1_2 = TriggerClientEvent
        L2_2 = "rtx_themepark:Global:MusicStopAttraction"
        L3_2 = -1
        L4_2 = "bumpercars"
        L1_2(L2_2, L3_2, L4_2)
      end
    end
  end
  L0_1(L1_1, L2_1)
end
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Bumper:BumperSeatEnd"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Bumper:BumperSeatEnd"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  L2_2 = bumperhandler
  L2_2 = L2_2.bumperplayers
  L2_2 = L2_2[A0_2]
  if nil ~= L2_2 then
    L2_2 = bumperhandler
    L2_2 = L2_2.bumperplayers
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.seattakenid
    if L2_2 == L1_2 then
      L2_2 = pairs
      L3_2 = playsersinthemepark
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = TriggerClientEvent
        L9_2 = "rtx_themepark:Bumper:SynchronizeBumperSeat"
        L10_2 = L7_2
        L11_2 = A0_2
        L12_2 = false
        L13_2 = nil
        L14_2 = bumperhandler
        L14_2 = L14_2.bumperplayers
        L14_2 = L14_2[A0_2]
        L14_2 = L14_2.bumpercolor
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      end
      L2_2 = TriggerClientEvent
      L3_2 = "rtx_themepark:Bumper:SeatStop"
      L4_2 = L1_2
      L2_2(L3_2, L4_2)
      L2_2 = bumperhandler
      L2_2 = L2_2.bumperplayers
      L2_2 = L2_2[A0_2]
      L2_2.seattaken = false
      L2_2 = bumperhandler
      L2_2 = L2_2.bumperplayers
      L2_2 = L2_2[A0_2]
      L2_2.seattakenid = nil
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "rtx_themepark:Bumper:BumperSeatStart"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "rtx_themepark:Bumper:BumperSeatStart"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  L2_2 = bumperhandler
  L2_2 = L2_2.bumperplayers
  L2_2 = L2_2[A0_2]
  if nil ~= L2_2 then
    L2_2 = bumperhandler
    L2_2 = L2_2.bumperplayers
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.seattakenid
    if nil == L2_2 then
      L2_2 = pairs
      L3_2 = playsersinthemepark
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = TriggerClientEvent
        L9_2 = "rtx_themepark:Bumper:SynchronizeBumperSeat"
        L10_2 = L7_2
        L11_2 = A0_2
        L12_2 = true
        L13_2 = L1_2
        L14_2 = bumperhandler
        L14_2 = L14_2.bumperplayers
        L14_2 = L14_2[A0_2]
        L14_2 = L14_2.bumpercolor
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      end
      L2_2 = TriggerClientEvent
      L3_2 = "rtx_themepark:Bumper:SeatStart"
      L4_2 = L1_2
      L5_2 = A0_2
      L2_2(L3_2, L4_2, L5_2)
      L2_2 = bumperhandler
      L2_2 = L2_2.bumperplayers
      L2_2 = L2_2[A0_2]
      L2_2.seattaken = true
      L2_2 = bumperhandler
      L2_2 = L2_2.bumperplayers
      L2_2 = L2_2[A0_2]
      L2_2.seattakenid = L1_2
    end
  end
end
L0_1(L1_1, L2_1)
