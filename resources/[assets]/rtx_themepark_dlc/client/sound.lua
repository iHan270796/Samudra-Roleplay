local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = IsDuplicityVersion
L0_1 = L0_1()
if L0_1 then
  L0_1 = GetPlayerPositionInRealTime77
  L0_1()
end
L0_1 = 0
L1_1 = Config
L1_1 = L1_1.ThemeParkControlAttractions
if L1_1 then
  L1_1 = false
  L2_1 = false
  L3_1 = false
  function L4_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2
    L2_2 = A1_2 or nil
    if not A1_2 then
      L2_2 = 0
    end
    L3_2 = 10
    L2_2 = L3_2 ^ L2_2
    L3_2 = math
    L3_2 = L3_2.floor
    L4_2 = A0_2 * L2_2
    L4_2 = L4_2 + 0.5
    L3_2 = L3_2(L4_2)
    L3_2 = L3_2 / L2_2
    return L3_2
  end
  RoundNumber = L4_1
  function L4_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
    L3_2 = controlmachines
    L3_2 = L3_2[A2_2]
    L3_2 = L3_2.musichandler
    if nil ~= L3_2 then
      L4_2 = SendNUIMessage
      L5_2 = {}
      L5_2.message = "stopsound"
      L5_2.soundid = A2_2
      L6_2 = L3_2.soundcategory
      L5_2.soundcategorytype = L6_2
      L4_2(L5_2)
      L4_2 = controlmachines
      L4_2 = L4_2[A2_2]
      L4_2.musichandler = nil
    end
    L4_2 = A0_2
    L5_2 = "classic"
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = A0_2
    L8_2 = "youtube.com"
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L6_2 = string
      L6_2 = L6_2.find
      L7_2 = A0_2
      L8_2 = "^https://www.youtube.com"
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        L6_2 = string
        L6_2 = L6_2.sub
        L7_2 = A0_2
        L8_2 = 33
        L6_2 = L6_2(L7_2, L8_2)
        L7_2 = string
        L7_2 = L7_2.sub
        L8_2 = L6_2
        L9_2 = 1
        L10_2 = 11
        L7_2 = L7_2(L8_2, L9_2, L10_2)
        L4_2 = L7_2
        L5_2 = "youtube"
      else
        L6_2 = string
        L6_2 = L6_2.find
        L7_2 = A0_2
        L8_2 = "^https://youtube.com"
        L6_2 = L6_2(L7_2, L8_2)
        if L6_2 then
          L6_2 = string
          L6_2 = L6_2.sub
          L7_2 = A0_2
          L8_2 = 29
          L6_2 = L6_2(L7_2, L8_2)
          L7_2 = string
          L7_2 = L7_2.sub
          L8_2 = L6_2
          L9_2 = 1
          L10_2 = 11
          L7_2 = L7_2(L8_2, L9_2, L10_2)
          L4_2 = L7_2
          L5_2 = "youtube"
        else
          L6_2 = string
          L6_2 = L6_2.find
          L7_2 = A0_2
          L8_2 = "^http://youtube.com"
          L6_2 = L6_2(L7_2, L8_2)
          if L6_2 then
            L6_2 = string
            L6_2 = L6_2.sub
            L7_2 = A0_2
            L8_2 = 28
            L6_2 = L6_2(L7_2, L8_2)
            L7_2 = string
            L7_2 = L7_2.sub
            L8_2 = L6_2
            L9_2 = 1
            L10_2 = 11
            L7_2 = L7_2(L8_2, L9_2, L10_2)
            L4_2 = L7_2
            L5_2 = "youtube"
          else
            L6_2 = string
            L6_2 = L6_2.find
            L7_2 = A0_2
            L8_2 = "^http://www.youtube.com"
            L6_2 = L6_2(L7_2, L8_2)
            if L6_2 then
              L6_2 = string
              L6_2 = L6_2.sub
              L7_2 = A0_2
              L8_2 = 33
              L6_2 = L6_2(L7_2, L8_2)
              L7_2 = string
              L7_2 = L7_2.sub
              L8_2 = L6_2
              L9_2 = 1
              L10_2 = 11
              L7_2 = L7_2(L8_2, L9_2, L10_2)
              L4_2 = L7_2
              L5_2 = "youtube"
            else
              L6_2 = string
              L6_2 = L6_2.find
              L7_2 = A0_2
              L8_2 = "^www.youtube.com"
              L6_2 = L6_2(L7_2, L8_2)
              if L6_2 then
                L6_2 = string
                L6_2 = L6_2.sub
                L7_2 = A0_2
                L8_2 = 25
                L6_2 = L6_2(L7_2, L8_2)
                L7_2 = string
                L7_2 = L7_2.sub
                L8_2 = L6_2
                L9_2 = 1
                L10_2 = 11
                L7_2 = L7_2(L8_2, L9_2, L10_2)
                L4_2 = L7_2
                L5_2 = "youtube"
              else
                L6_2 = string
                L6_2 = L6_2.find
                L7_2 = A0_2
                L8_2 = "^youtube.com"
                L6_2 = L6_2(L7_2, L8_2)
                if L6_2 then
                  L6_2 = string
                  L6_2 = L6_2.sub
                  L7_2 = A0_2
                  L8_2 = 21
                  L6_2 = L6_2(L7_2, L8_2)
                  L7_2 = string
                  L7_2 = L7_2.sub
                  L8_2 = L6_2
                  L9_2 = 1
                  L10_2 = 11
                  L7_2 = L7_2(L8_2, L9_2, L10_2)
                  L4_2 = L7_2
                  L5_2 = "youtube"
                end
              end
            end
          end
        end
      end
    else
      L6_2 = string
      L6_2 = L6_2.find
      L7_2 = A0_2
      L8_2 = "youtu.be"
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        soundsrcreformatedtype = "youtube"
        L6_2 = string
        L6_2 = L6_2.find
        L7_2 = A0_2
        L8_2 = "^https://www.youtu.be"
        L6_2 = L6_2(L7_2, L8_2)
        if L6_2 then
          L6_2 = string
          L6_2 = L6_2.sub
          L7_2 = A0_2
          L8_2 = 22
          L6_2 = L6_2(L7_2, L8_2)
          L7_2 = string
          L7_2 = L7_2.sub
          L8_2 = L6_2
          L9_2 = 1
          L10_2 = 11
          L7_2 = L7_2(L8_2, L9_2, L10_2)
          L4_2 = L7_2
          L5_2 = "youtube"
        else
          L6_2 = string
          L6_2 = L6_2.find
          L7_2 = A0_2
          L8_2 = "^https://youtu.be"
          L6_2 = L6_2(L7_2, L8_2)
          if L6_2 then
            L6_2 = string
            L6_2 = L6_2.sub
            L7_2 = A0_2
            L8_2 = 18
            L6_2 = L6_2(L7_2, L8_2)
            L7_2 = string
            L7_2 = L7_2.sub
            L8_2 = L6_2
            L9_2 = 1
            L10_2 = 11
            L7_2 = L7_2(L8_2, L9_2, L10_2)
            L4_2 = L7_2
            L5_2 = "youtube"
          else
            L6_2 = string
            L6_2 = L6_2.find
            L7_2 = A0_2
            L8_2 = "^http://youtu.be"
            L6_2 = L6_2(L7_2, L8_2)
            if L6_2 then
              L6_2 = string
              L6_2 = L6_2.sub
              L7_2 = A0_2
              L8_2 = 17
              L6_2 = L6_2(L7_2, L8_2)
              L7_2 = string
              L7_2 = L7_2.sub
              L8_2 = L6_2
              L9_2 = 1
              L10_2 = 11
              L7_2 = L7_2(L8_2, L9_2, L10_2)
              L4_2 = L7_2
              L5_2 = "youtube"
            else
              L6_2 = string
              L6_2 = L6_2.find
              L7_2 = A0_2
              L8_2 = "^http://www.youtu.be"
              L6_2 = L6_2(L7_2, L8_2)
              if L6_2 then
                L6_2 = string
                L6_2 = L6_2.sub
                L7_2 = A0_2
                L8_2 = 21
                L6_2 = L6_2(L7_2, L8_2)
                L7_2 = string
                L7_2 = L7_2.sub
                L8_2 = L6_2
                L9_2 = 1
                L10_2 = 11
                L7_2 = L7_2(L8_2, L9_2, L10_2)
                L4_2 = L7_2
                L5_2 = "youtube"
              else
                L6_2 = string
                L6_2 = L6_2.find
                L7_2 = A0_2
                L8_2 = "^www.youtu.be"
                L6_2 = L6_2(L7_2, L8_2)
                if L6_2 then
                  L6_2 = string
                  L6_2 = L6_2.sub
                  L7_2 = A0_2
                  L8_2 = 14
                  L6_2 = L6_2(L7_2, L8_2)
                  L7_2 = string
                  L7_2 = L7_2.sub
                  L8_2 = L6_2
                  L9_2 = 1
                  L10_2 = 11
                  L7_2 = L7_2(L8_2, L9_2, L10_2)
                  L4_2 = L7_2
                  L5_2 = "youtube"
                else
                  L6_2 = string
                  L6_2 = L6_2.find
                  L7_2 = A0_2
                  L8_2 = "^youtu.be"
                  L6_2 = L6_2(L7_2, L8_2)
                  if L6_2 then
                    L6_2 = string
                    L6_2 = L6_2.sub
                    L7_2 = A0_2
                    L8_2 = 10
                    L6_2 = L6_2(L7_2, L8_2)
                    L7_2 = string
                    L7_2 = L7_2.sub
                    L8_2 = L6_2
                    L9_2 = 1
                    L10_2 = 11
                    L7_2 = L7_2(L8_2, L9_2, L10_2)
                    L4_2 = L7_2
                    L5_2 = "youtube"
                  end
                end
              end
            end
          end
        end
      end
    end
    L6_2 = controlmachines
    L6_2 = L6_2[A2_2]
    L7_2 = {}
    L7_2.soundsrc = L4_2
    L7_2.soundvolume = A1_2
    L7_2.soundcategory = L5_2
    L7_2.sounddetailsready = false
    L7_2.soundname = ""
    L7_2.soundtime = 0
    L7_2.soundtimemax = 0
    L6_2.musichandler = L7_2
  end
  CreateSound = L4_1
  function L4_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
    L1_2 = false
    L2_2 = ""
    L3_2 = string
    L3_2 = L3_2.find
    L4_2 = A0_2
    L5_2 = "youtube.com"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L3_2 = string
      L3_2 = L3_2.find
      L4_2 = A0_2
      L5_2 = "^https://www.youtube.com"
      L3_2 = L3_2(L4_2, L5_2)
      if L3_2 then
        L3_2 = string
        L3_2 = L3_2.sub
        L4_2 = A0_2
        L5_2 = 33
        L3_2 = L3_2(L4_2, L5_2)
        L4_2 = string
        L4_2 = L4_2.sub
        L5_2 = L3_2
        L6_2 = 1
        L7_2 = 11
        L4_2 = L4_2(L5_2, L6_2, L7_2)
        L2_2 = L4_2
        L1_2 = true
      else
        L3_2 = string
        L3_2 = L3_2.find
        L4_2 = A0_2
        L5_2 = "^https://youtube.com"
        L3_2 = L3_2(L4_2, L5_2)
        if L3_2 then
          L3_2 = string
          L3_2 = L3_2.sub
          L4_2 = A0_2
          L5_2 = 29
          L3_2 = L3_2(L4_2, L5_2)
          L4_2 = string
          L4_2 = L4_2.sub
          L5_2 = L3_2
          L6_2 = 1
          L7_2 = 11
          L4_2 = L4_2(L5_2, L6_2, L7_2)
          L2_2 = L4_2
          L1_2 = true
        else
          L3_2 = string
          L3_2 = L3_2.find
          L4_2 = A0_2
          L5_2 = "^http://youtube.com"
          L3_2 = L3_2(L4_2, L5_2)
          if L3_2 then
            L3_2 = string
            L3_2 = L3_2.sub
            L4_2 = A0_2
            L5_2 = 28
            L3_2 = L3_2(L4_2, L5_2)
            L4_2 = string
            L4_2 = L4_2.sub
            L5_2 = L3_2
            L6_2 = 1
            L7_2 = 11
            L4_2 = L4_2(L5_2, L6_2, L7_2)
            L2_2 = L4_2
            L1_2 = true
          else
            L3_2 = string
            L3_2 = L3_2.find
            L4_2 = A0_2
            L5_2 = "^http://www.youtube.com"
            L3_2 = L3_2(L4_2, L5_2)
            if L3_2 then
              L3_2 = string
              L3_2 = L3_2.sub
              L4_2 = A0_2
              L5_2 = 33
              L3_2 = L3_2(L4_2, L5_2)
              L4_2 = string
              L4_2 = L4_2.sub
              L5_2 = L3_2
              L6_2 = 1
              L7_2 = 11
              L4_2 = L4_2(L5_2, L6_2, L7_2)
              L2_2 = L4_2
              L1_2 = true
            else
              L3_2 = string
              L3_2 = L3_2.find
              L4_2 = A0_2
              L5_2 = "^www.youtube.com"
              L3_2 = L3_2(L4_2, L5_2)
              if L3_2 then
                L3_2 = string
                L3_2 = L3_2.sub
                L4_2 = A0_2
                L5_2 = 25
                L3_2 = L3_2(L4_2, L5_2)
                L4_2 = string
                L4_2 = L4_2.sub
                L5_2 = L3_2
                L6_2 = 1
                L7_2 = 11
                L4_2 = L4_2(L5_2, L6_2, L7_2)
                L2_2 = L4_2
                L1_2 = true
              else
                L3_2 = string
                L3_2 = L3_2.find
                L4_2 = A0_2
                L5_2 = "^youtube.com"
                L3_2 = L3_2(L4_2, L5_2)
                if L3_2 then
                  L3_2 = string
                  L3_2 = L3_2.sub
                  L4_2 = A0_2
                  L5_2 = 21
                  L3_2 = L3_2(L4_2, L5_2)
                  L4_2 = string
                  L4_2 = L4_2.sub
                  L5_2 = L3_2
                  L6_2 = 1
                  L7_2 = 11
                  L4_2 = L4_2(L5_2, L6_2, L7_2)
                  L2_2 = L4_2
                  L1_2 = true
                end
              end
            end
          end
        end
      end
    else
      L3_2 = string
      L3_2 = L3_2.find
      L4_2 = A0_2
      L5_2 = "youtu.be"
      L3_2 = L3_2(L4_2, L5_2)
      if L3_2 then
        L3_2 = string
        L3_2 = L3_2.find
        L4_2 = A0_2
        L5_2 = "^https://www.youtu.be"
        L3_2 = L3_2(L4_2, L5_2)
        if L3_2 then
          L3_2 = string
          L3_2 = L3_2.sub
          L4_2 = A0_2
          L5_2 = 22
          L3_2 = L3_2(L4_2, L5_2)
          L4_2 = string
          L4_2 = L4_2.sub
          L5_2 = L3_2
          L6_2 = 1
          L7_2 = 11
          L4_2 = L4_2(L5_2, L6_2, L7_2)
          L2_2 = L4_2
          L1_2 = true
        else
          L3_2 = string
          L3_2 = L3_2.find
          L4_2 = A0_2
          L5_2 = "^https://youtu.be"
          L3_2 = L3_2(L4_2, L5_2)
          if L3_2 then
            L3_2 = string
            L3_2 = L3_2.sub
            L4_2 = A0_2
            L5_2 = 18
            L3_2 = L3_2(L4_2, L5_2)
            L4_2 = string
            L4_2 = L4_2.sub
            L5_2 = L3_2
            L6_2 = 1
            L7_2 = 11
            L4_2 = L4_2(L5_2, L6_2, L7_2)
            L2_2 = L4_2
            L1_2 = true
          else
            L3_2 = string
            L3_2 = L3_2.find
            L4_2 = A0_2
            L5_2 = "^http://youtu.be"
            L3_2 = L3_2(L4_2, L5_2)
            if L3_2 then
              L3_2 = string
              L3_2 = L3_2.sub
              L4_2 = A0_2
              L5_2 = 17
              L3_2 = L3_2(L4_2, L5_2)
              L4_2 = string
              L4_2 = L4_2.sub
              L5_2 = L3_2
              L6_2 = 1
              L7_2 = 11
              L4_2 = L4_2(L5_2, L6_2, L7_2)
              L2_2 = L4_2
              L1_2 = true
            else
              L3_2 = string
              L3_2 = L3_2.find
              L4_2 = A0_2
              L5_2 = "^http://www.youtu.be"
              L3_2 = L3_2(L4_2, L5_2)
              if L3_2 then
                L3_2 = string
                L3_2 = L3_2.sub
                L4_2 = A0_2
                L5_2 = 21
                L3_2 = L3_2(L4_2, L5_2)
                L4_2 = string
                L4_2 = L4_2.sub
                L5_2 = L3_2
                L6_2 = 1
                L7_2 = 11
                L4_2 = L4_2(L5_2, L6_2, L7_2)
                L2_2 = L4_2
                L1_2 = true
              else
                L3_2 = string
                L3_2 = L3_2.find
                L4_2 = A0_2
                L5_2 = "^www.youtu.be"
                L3_2 = L3_2(L4_2, L5_2)
                if L3_2 then
                  L3_2 = string
                  L3_2 = L3_2.sub
                  L4_2 = A0_2
                  L5_2 = 14
                  L3_2 = L3_2(L4_2, L5_2)
                  L4_2 = string
                  L4_2 = L4_2.sub
                  L5_2 = L3_2
                  L6_2 = 1
                  L7_2 = 11
                  L4_2 = L4_2(L5_2, L6_2, L7_2)
                  L2_2 = L4_2
                  L1_2 = true
                else
                  L3_2 = string
                  L3_2 = L3_2.find
                  L4_2 = A0_2
                  L5_2 = "^youtu.be"
                  L3_2 = L3_2(L4_2, L5_2)
                  if L3_2 then
                    L3_2 = string
                    L3_2 = L3_2.sub
                    L4_2 = A0_2
                    L5_2 = 10
                    L3_2 = L3_2(L4_2, L5_2)
                    L4_2 = string
                    L4_2 = L4_2.sub
                    L5_2 = L3_2
                    L6_2 = 1
                    L7_2 = 11
                    L4_2 = L4_2(L5_2, L6_2, L7_2)
                    L2_2 = L4_2
                    L1_2 = true
                  end
                end
              end
            end
          end
        end
      end
    end
    if L1_2 then
      L3_2 = L1_1
      if false == L3_2 then
        L3_2 = false
        L3_1 = L3_2
        L3_2 = false
        L2_1 = L3_2
        L3_2 = true
        L1_1 = L3_2
        L3_2 = SendNUIMessage
        L4_2 = {}
        L4_2.message = "checkmusicurl"
        L4_2.soundsrc = L2_2
        L3_2(L4_2)
        while true do
          L3_2 = L2_1
          if false ~= L3_2 then
            break
          end
          L3_2 = Citizen
          L3_2 = L3_2.Wait
          L4_2 = 0
          L3_2(L4_2)
        end
        L3_2 = L3_1
        return L3_2
      else
        L3_2 = false
        return L3_2
      end
    else
      L3_2 = false
      return L3_2
    end
  end
  SoundUrlCheck = L4_1
  L4_1 = Citizen
  L4_1 = L4_1.CreateThread
  function L5_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 500
      L0_2(L1_2)
      L0_2 = nearbythemepark
      if L0_2 then
        L0_2 = false
        L1_2 = PlayerPedId
        L1_2 = L1_2()
        L2_2 = GetEntityCoords
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        L3_2 = ipairs
        L4_2 = controlmachines
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = L8_2.musichandler
          L10_2 = L8_2.musichandler
          if nil ~= L10_2 then
            L0_2 = true
            L10_2 = L8_2.musiccoords
            L11_2 = L2_2 - L10_2
            L11_2 = #L11_2
            L12_2 = L9_2.soundcategory
            if "youtube" == L12_2 then
              L12_2 = L9_2.soundvolume
              L13_2 = L9_2.soundvolume
              L13_2 = L13_2 / 100
              L13_2 = L13_2 * 1.0
              L14_2 = L8_2.musicmaxdistance
              L14_2 = L11_2 / L14_2
              L15_2 = L14_2 * 100
              L16_2 = 100
              L16_2 = L16_2 - L15_2
              L17_2 = L9_2.soundvolume
              L17_2 = L17_2 / 100
              L17_2 = L17_2 * L16_2
              if L17_2 > 0 then
                L18_2 = math
                L18_2 = L18_2.floor
                L19_2 = L17_2
                L18_2 = L18_2(L19_2)
                L12_2 = L18_2
              else
                L12_2 = 0
              end
              L18_2 = L8_2.musicmaxdistance
              if L14_2 > L18_2 then
                L18_2 = SendNUIMessage
                L19_2 = {}
                L19_2.message = "playsound"
                L19_2.soundid = L7_2
                L20_2 = L9_2.soundsrc
                L19_2.soundsrc = L20_2
                L19_2.soundvolume = 0.0
                L20_2 = L9_2.soundcategory
                L19_2.soundcategory = L20_2
                L18_2(L19_2)
              else
                L18_2 = streamermodeactivated
                if true == L18_2 then
                  L18_2 = SendNUIMessage
                  L19_2 = {}
                  L19_2.message = "playsound"
                  L19_2.soundid = L7_2
                  L20_2 = L9_2.soundsrc
                  L19_2.soundsrc = L20_2
                  L19_2.soundvolume = 0.0
                  L20_2 = L9_2.soundcategory
                  L19_2.soundcategory = L20_2
                  L18_2(L19_2)
                else
                  L18_2 = SendNUIMessage
                  L19_2 = {}
                  L19_2.message = "playsound"
                  L19_2.soundid = L7_2
                  L20_2 = L9_2.soundsrc
                  L19_2.soundsrc = L20_2
                  L19_2.soundvolume = L12_2
                  L20_2 = L9_2.soundcategory
                  L19_2.soundcategory = L20_2
                  L18_2(L19_2)
                end
              end
            else
              L12_2 = L9_2.soundvolume
              L12_2 = L12_2 / 100
              L12_2 = L12_2 * 1.0
              L13_2 = L8_2.musicmaxdistance
              L13_2 = L11_2 / L13_2
              L14_2 = L13_2 * 100
              L15_2 = 100
              L15_2 = L15_2 - L14_2
              L16_2 = L9_2.soundvolume
              L16_2 = L16_2 / 100
              L16_2 = L16_2 * L15_2
              L17_2 = L16_2 / 100
              L17_2 = L17_2 * 1.0
              if L16_2 > 0 then
                L18_2 = RoundNumber
                L19_2 = L17_2
                L20_2 = 2
                L18_2 = L18_2(L19_2, L20_2)
                soundvolume = L18_2
              else
                soundvolume = 0.0
              end
              L18_2 = L8_2.musicmaxdistance
              if L13_2 > L18_2 then
                L18_2 = SendNUIMessage
                L19_2 = {}
                L19_2.message = "playsound"
                L19_2.soundid = L7_2
                L20_2 = L9_2.soundsrc
                L19_2.soundsrc = L20_2
                L19_2.soundvolume = 0.0
                L20_2 = L9_2.soundcategory
                L19_2.soundcategory = L20_2
                L18_2(L19_2)
              else
                L18_2 = streamermodeactivated
                if true == L18_2 then
                  L18_2 = SendNUIMessage
                  L19_2 = {}
                  L19_2.message = "playsound"
                  L19_2.soundid = L7_2
                  L20_2 = L9_2.soundsrc
                  L19_2.soundsrc = L20_2
                  L19_2.soundvolume = 0.0
                  L20_2 = L9_2.soundcategory
                  L19_2.soundcategory = L20_2
                  L18_2(L19_2)
                else
                  L18_2 = SendNUIMessage
                  L19_2 = {}
                  L19_2.message = "playsound"
                  L19_2.soundid = L7_2
                  L20_2 = L9_2.soundsrc
                  L19_2.soundsrc = L20_2
                  L20_2 = soundvolume
                  L19_2.soundvolume = L20_2
                  L20_2 = L9_2.soundcategory
                  L19_2.soundcategory = L20_2
                  L18_2(L19_2)
                end
              end
            end
          end
        end
        if false == L0_2 then
          L3_2 = Citizen
          L3_2 = L3_2.Wait
          L4_2 = 500
          L3_2(L4_2)
        end
      else
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 1000
        L0_2(L1_2)
        L0_2 = ipairs
        L1_2 = controlmachines
        L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
        for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
          L6_2 = L5_2.musichandler
          L7_2 = L5_2.musichandler
          if nil ~= L7_2 then
            L7_2 = SendNUIMessage
            L8_2 = {}
            L8_2.message = "playsound"
            L8_2.soundid = L4_2
            L9_2 = L6_2.soundsrc
            L8_2.soundsrc = L9_2
            L8_2.soundvolume = 0.0
            L9_2 = L6_2.soundcategory
            L8_2.soundcategory = L9_2
            L7_2(L8_2)
          end
        end
      end
    end
  end
  L4_1(L5_1)
  L4_1 = RegisterNetEvent
  L5_1 = "rtx_themepark:Music:ThemeParkControlMusicPlayClient"
  L4_1(L5_1)
  L4_1 = AddEventHandler
  L5_1 = "rtx_themepark:Music:ThemeParkControlMusicPlayClient"
  function L6_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2
    L3_2 = CreateSound
    L4_2 = A1_2
    L5_2 = A2_2
    L6_2 = A0_2
    L3_2(L4_2, L5_2, L6_2)
  end
  L4_1(L5_1, L6_1)
  L4_1 = RegisterNetEvent
  L5_1 = "rtx_themepark:Music:ThemeParkControlMusicStopClient"
  L4_1(L5_1)
  L4_1 = AddEventHandler
  L5_1 = "rtx_themepark:Music:ThemeParkControlMusicStopClient"
  function L6_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2
    L1_2 = controlmachines
    L1_2 = L1_2[A0_2]
    L1_2 = L1_2.musichandler
    if nil ~= L1_2 then
      L1_2 = controlmachines
      L1_2 = L1_2[A0_2]
      L1_2 = L1_2.musichandler
      L2_2 = SendNUIMessage
      L3_2 = {}
      L3_2.message = "stopsound"
      L3_2.soundid = A0_2
      L4_2 = L1_2.soundcategory
      L3_2.soundcategorytype = L4_2
      L2_2(L3_2)
      L2_2 = controlmachines
      L2_2 = L2_2[A0_2]
      L2_2.musichandler = nil
      L2_2 = inattractioncontrolmenu
      if true == L2_2 then
        L2_2 = attractioncontrolledid
        if A0_2 == L2_2 then
          L2_2 = SendNUIMessage
          L3_2 = {}
          L3_2.message = "updateattractionmusiclabel"
          L3_2.musiclabel = ""
          L2_2(L3_2)
        end
      end
    end
  end
  L4_1(L5_1, L6_1)
  L4_1 = RegisterNetEvent
  L5_1 = "rtx_themepark:Music:ThemeParkControlMusicVolume"
  L4_1(L5_1)
  L4_1 = AddEventHandler
  L5_1 = "rtx_themepark:Music:ThemeParkControlMusicVolume"
  function L6_1(A0_2, A1_2)
    local L2_2, L3_2
    L2_2 = controlmachines
    L2_2 = L2_2[A0_2]
    L2_2.musicvolume = A1_2
    L3_2 = controlmachines
    L3_2 = L3_2[A0_2]
    L3_2 = L3_2.musichandler
    if nil ~= L3_2 then
      L3_2 = controlmachines
      L3_2 = L3_2[A0_2]
      L3_2 = L3_2.musichandler
      L3_2.soundvolume = A1_2
    end
  end
  L4_1(L5_1, L6_1)
  L4_1 = RegisterNUICallback
  L5_1 = "soundend"
  function L6_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2
    L2_2 = controlmachines
    L3_2 = tonumber
    L4_2 = A0_2.soundid
    L3_2 = L3_2(L4_2)
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.musichandler
    L3_2 = TriggerEvent
    L4_2 = "rtx_themepark:SoundEnded"
    L5_2 = L2_2.soundsrc
    L6_2 = L2_2.soundcategory
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.message = "stopsound"
    L5_2 = tonumber
    L6_2 = A0_2.soundid
    L5_2 = L5_2(L6_2)
    L4_2.soundid = L5_2
    L5_2 = L2_2.soundcategory
    L4_2.soundcategorytype = L5_2
    L3_2(L4_2)
    L2_2 = nil
    L3_2 = A1_2
    L4_2 = "ok"
    L3_2(L4_2)
  end
  L4_1(L5_1, L6_1)
  L4_1 = RegisterNUICallback
  L5_1 = "sounderror"
  function L6_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2
    L2_2 = controlmachines
    L3_2 = tonumber
    L4_2 = A0_2.soundid
    L3_2 = L3_2(L4_2)
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.musichandler
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.message = "stopsound"
    L5_2 = tonumber
    L6_2 = A0_2.soundid
    L5_2 = L5_2(L6_2)
    L4_2.soundid = L5_2
    L5_2 = L2_2.soundcategory
    L4_2.soundcategorytype = L5_2
    L3_2(L4_2)
    L2_2 = nil
    L3_2 = A1_2
    L4_2 = "ok"
    L3_2(L4_2)
  end
  L4_1(L5_1, L6_1)
  L4_1 = RegisterNUICallback
  L5_1 = "updatesounddata"
  function L6_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2
    L2_2 = controlmachines
    L3_2 = tonumber
    L4_2 = A0_2.soundid
    L3_2 = L3_2(L4_2)
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.musichandler
    L3_2 = tostring
    L4_2 = A0_2.soundname
    L3_2 = L3_2(L4_2)
    L2_2.soundname = L3_2
    L3_2 = tonumber
    L4_2 = A0_2.soundtime
    L3_2 = L3_2(L4_2)
    L2_2.soundtime = L3_2
    L3_2 = A0_2.soundtimemax
    if nil ~= L3_2 then
      L3_2 = tonumber
      L4_2 = A0_2.soundtimemax
      L3_2 = L3_2(L4_2)
      L2_2.soundtimemax = L3_2
    else
      L2_2.soundtimemax = "stream"
    end
    L2_2.sounddetailsready = true
    L3_2 = Citizen
    L3_2 = L3_2.Wait
    L4_2 = 100
    L3_2(L4_2)
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.message = "updatesounddata"
    L5_2 = tonumber
    L6_2 = A0_2.soundid
    L5_2 = L5_2(L6_2)
    L4_2.soundid = L5_2
    L5_2 = L2_2.soundcategory
    L4_2.soundcategorytype = L5_2
    L3_2(L4_2)
    L3_2 = inattractioncontrolmenu
    if true == L3_2 then
      L3_2 = tonumber
      L4_2 = A0_2.soundid
      L3_2 = L3_2(L4_2)
      L4_2 = attractioncontrolledid
      if L3_2 == L4_2 then
        L3_2 = controlmachines
        L4_2 = tonumber
        L5_2 = A0_2.soundid
        L4_2 = L4_2(L5_2)
        L3_2 = L3_2[L4_2]
        L3_2 = L3_2.musichandler
        if nil ~= L3_2 then
          L4_2 = SendNUIMessage
          L5_2 = {}
          L5_2.message = "updateattractionmusiclabel"
          L6_2 = L2_2.soundname
          L5_2.musiclabel = L6_2
          L4_2(L5_2)
        else
          L4_2 = SendNUIMessage
          L5_2 = {}
          L5_2.message = "updateattractionmusiclabel"
          L5_2.musiclabel = ""
          L4_2(L5_2)
        end
      end
    end
    L3_2 = A1_2
    L4_2 = "ok"
    L3_2(L4_2)
  end
  L4_1(L5_1, L6_1)
  L4_1 = RegisterNUICallback
  L5_1 = "checkdone"
  function L6_1(A0_2, A1_2)
    local L2_2, L3_2
    L2_2 = A0_2.soundallowed
    L3_1 = L2_2
    L2_2 = false
    L1_1 = L2_2
    L2_2 = true
    L2_1 = L2_2
    L2_2 = A1_2
    L3_2 = "ok"
    L2_2(L3_2)
  end
  L4_1(L5_1, L6_1)
end
L1_1 = {}
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.gforce = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.topscan = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.vortex = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.detonator = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.boat = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.bumpercars = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.ferris = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.rollercoaster = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.prater = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.breakdance = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.slingshot = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.carousel = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.extasy = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.spinride = L2_1
L2_1 = {}
L2_1.started = false
L2_1.musicurl = ""
L1_1.rollercoaster2 = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.message = "stopsoundattraction"
  L4_2.soundid = A0_2
  L3_2(L4_2)
  L3_2 = A1_2
  L4_2 = "classic"
  L5_2 = string
  L5_2 = L5_2.find
  L6_2 = A1_2
  L7_2 = "youtube.com"
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L5_2 = string
    L5_2 = L5_2.find
    L6_2 = A1_2
    L7_2 = "^https://www.youtube.com"
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      L5_2 = string
      L5_2 = L5_2.sub
      L6_2 = A1_2
      L7_2 = 33
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = string
      L6_2 = L6_2.sub
      L7_2 = L5_2
      L8_2 = 1
      L9_2 = 11
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L3_2 = L6_2
      L4_2 = "youtube"
    else
      L5_2 = string
      L5_2 = L5_2.find
      L6_2 = A1_2
      L7_2 = "^https://youtube.com"
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 then
        L5_2 = string
        L5_2 = L5_2.sub
        L6_2 = A1_2
        L7_2 = 29
        L5_2 = L5_2(L6_2, L7_2)
        L6_2 = string
        L6_2 = L6_2.sub
        L7_2 = L5_2
        L8_2 = 1
        L9_2 = 11
        L6_2 = L6_2(L7_2, L8_2, L9_2)
        L3_2 = L6_2
        L4_2 = "youtube"
      else
        L5_2 = string
        L5_2 = L5_2.find
        L6_2 = A1_2
        L7_2 = "^http://youtube.com"
        L5_2 = L5_2(L6_2, L7_2)
        if L5_2 then
          L5_2 = string
          L5_2 = L5_2.sub
          L6_2 = A1_2
          L7_2 = 28
          L5_2 = L5_2(L6_2, L7_2)
          L6_2 = string
          L6_2 = L6_2.sub
          L7_2 = L5_2
          L8_2 = 1
          L9_2 = 11
          L6_2 = L6_2(L7_2, L8_2, L9_2)
          L3_2 = L6_2
          L4_2 = "youtube"
        else
          L5_2 = string
          L5_2 = L5_2.find
          L6_2 = A1_2
          L7_2 = "^http://www.youtube.com"
          L5_2 = L5_2(L6_2, L7_2)
          if L5_2 then
            L5_2 = string
            L5_2 = L5_2.sub
            L6_2 = A1_2
            L7_2 = 33
            L5_2 = L5_2(L6_2, L7_2)
            L6_2 = string
            L6_2 = L6_2.sub
            L7_2 = L5_2
            L8_2 = 1
            L9_2 = 11
            L6_2 = L6_2(L7_2, L8_2, L9_2)
            L3_2 = L6_2
            L4_2 = "youtube"
          else
            L5_2 = string
            L5_2 = L5_2.find
            L6_2 = A1_2
            L7_2 = "^www.youtube.com"
            L5_2 = L5_2(L6_2, L7_2)
            if L5_2 then
              L5_2 = string
              L5_2 = L5_2.sub
              L6_2 = A1_2
              L7_2 = 25
              L5_2 = L5_2(L6_2, L7_2)
              L6_2 = string
              L6_2 = L6_2.sub
              L7_2 = L5_2
              L8_2 = 1
              L9_2 = 11
              L6_2 = L6_2(L7_2, L8_2, L9_2)
              L3_2 = L6_2
              L4_2 = "youtube"
            else
              L5_2 = string
              L5_2 = L5_2.find
              L6_2 = A1_2
              L7_2 = "^youtube.com"
              L5_2 = L5_2(L6_2, L7_2)
              if L5_2 then
                L5_2 = string
                L5_2 = L5_2.sub
                L6_2 = A1_2
                L7_2 = 21
                L5_2 = L5_2(L6_2, L7_2)
                L6_2 = string
                L6_2 = L6_2.sub
                L7_2 = L5_2
                L8_2 = 1
                L9_2 = 11
                L6_2 = L6_2(L7_2, L8_2, L9_2)
                L3_2 = L6_2
                L4_2 = "youtube"
              end
            end
          end
        end
      end
    end
  else
    L5_2 = string
    L5_2 = L5_2.find
    L6_2 = A1_2
    L7_2 = "youtu.be"
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      soundsrcreformatedtype = "youtube"
      L5_2 = string
      L5_2 = L5_2.find
      L6_2 = A1_2
      L7_2 = "^https://www.youtu.be"
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 then
        L5_2 = string
        L5_2 = L5_2.sub
        L6_2 = A1_2
        L7_2 = 22
        L5_2 = L5_2(L6_2, L7_2)
        L6_2 = string
        L6_2 = L6_2.sub
        L7_2 = L5_2
        L8_2 = 1
        L9_2 = 11
        L6_2 = L6_2(L7_2, L8_2, L9_2)
        L3_2 = L6_2
        L4_2 = "youtube"
      else
        L5_2 = string
        L5_2 = L5_2.find
        L6_2 = A1_2
        L7_2 = "^https://youtu.be"
        L5_2 = L5_2(L6_2, L7_2)
        if L5_2 then
          L5_2 = string
          L5_2 = L5_2.sub
          L6_2 = A1_2
          L7_2 = 18
          L5_2 = L5_2(L6_2, L7_2)
          L6_2 = string
          L6_2 = L6_2.sub
          L7_2 = L5_2
          L8_2 = 1
          L9_2 = 11
          L6_2 = L6_2(L7_2, L8_2, L9_2)
          L3_2 = L6_2
          L4_2 = "youtube"
        else
          L5_2 = string
          L5_2 = L5_2.find
          L6_2 = A1_2
          L7_2 = "^http://youtu.be"
          L5_2 = L5_2(L6_2, L7_2)
          if L5_2 then
            L5_2 = string
            L5_2 = L5_2.sub
            L6_2 = A1_2
            L7_2 = 17
            L5_2 = L5_2(L6_2, L7_2)
            L6_2 = string
            L6_2 = L6_2.sub
            L7_2 = L5_2
            L8_2 = 1
            L9_2 = 11
            L6_2 = L6_2(L7_2, L8_2, L9_2)
            L3_2 = L6_2
            L4_2 = "youtube"
          else
            L5_2 = string
            L5_2 = L5_2.find
            L6_2 = A1_2
            L7_2 = "^http://www.youtu.be"
            L5_2 = L5_2(L6_2, L7_2)
            if L5_2 then
              L5_2 = string
              L5_2 = L5_2.sub
              L6_2 = A1_2
              L7_2 = 21
              L5_2 = L5_2(L6_2, L7_2)
              L6_2 = string
              L6_2 = L6_2.sub
              L7_2 = L5_2
              L8_2 = 1
              L9_2 = 11
              L6_2 = L6_2(L7_2, L8_2, L9_2)
              L3_2 = L6_2
              L4_2 = "youtube"
            else
              L5_2 = string
              L5_2 = L5_2.find
              L6_2 = A1_2
              L7_2 = "^www.youtu.be"
              L5_2 = L5_2(L6_2, L7_2)
              if L5_2 then
                L5_2 = string
                L5_2 = L5_2.sub
                L6_2 = A1_2
                L7_2 = 14
                L5_2 = L5_2(L6_2, L7_2)
                L6_2 = string
                L6_2 = L6_2.sub
                L7_2 = L5_2
                L8_2 = 1
                L9_2 = 11
                L6_2 = L6_2(L7_2, L8_2, L9_2)
                L3_2 = L6_2
                L4_2 = "youtube"
              else
                L5_2 = string
                L5_2 = L5_2.find
                L6_2 = A1_2
                L7_2 = "^youtu.be"
                L5_2 = L5_2(L6_2, L7_2)
                if L5_2 then
                  L5_2 = string
                  L5_2 = L5_2.sub
                  L6_2 = A1_2
                  L7_2 = 10
                  L5_2 = L5_2(L6_2, L7_2)
                  L6_2 = string
                  L6_2 = L6_2.sub
                  L7_2 = L5_2
                  L8_2 = 1
                  L9_2 = 11
                  L6_2 = L6_2(L7_2, L8_2, L9_2)
                  L3_2 = L6_2
                  L4_2 = "youtube"
                end
              end
            end
          end
        end
      end
    end
  end
  L2_2.started = true
  L2_2.musicurl = L3_2
end
CreateSoundAttraction = L2_1
L2_1 = Citizen
L2_1 = L2_1.CreateThread
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1000
    L0_2(L1_2)
    L0_2 = nearbythemepark
    if L0_2 then
      L0_2 = L0_1
      if L0_2 > 0 then
        L0_2 = pairs
        L1_2 = L1_1
        L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
        for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
          L6_2 = L5_2.started
          if true == L6_2 then
            L6_2 = Config
            L6_2 = L6_2.AttractionsMusic
            L6_2 = L6_2[L4_2]
            L7_2 = L6_2.coords
            L8_2 = playercurrentcoords
            L8_2 = L8_2 - L7_2
            L8_2 = #L8_2
            L9_2 = L6_2.musicvolume
            L10_2 = L6_2.musicvolume
            L10_2 = L10_2 / 100
            L10_2 = L10_2 * 1.0
            L11_2 = L6_2.maxdistance
            L11_2 = L8_2 / L11_2
            L12_2 = L11_2 * 100
            L13_2 = 100
            L13_2 = L13_2 - L12_2
            L14_2 = L6_2.musicvolume
            L14_2 = L14_2 / 100
            L14_2 = L14_2 * L13_2
            if L14_2 > 0 then
              L15_2 = math
              L15_2 = L15_2.floor
              L16_2 = L14_2
              L15_2 = L15_2(L16_2)
              L9_2 = L15_2
            else
              L9_2 = 0
            end
            L15_2 = L6_2.maxdistance
            if L11_2 > L15_2 then
              L15_2 = SendNUIMessage
              L16_2 = {}
              L16_2.message = "playsoundattraction"
              L16_2.soundid = L4_2
              L17_2 = L5_2.musicurl
              L16_2.soundsrc = L17_2
              L16_2.soundvolume = 0.0
              L15_2(L16_2)
            else
              L15_2 = streamermodeactivated
              if true == L15_2 then
                L15_2 = SendNUIMessage
                L16_2 = {}
                L16_2.message = "playsoundattraction"
                L16_2.soundid = L4_2
                L17_2 = L5_2.musicurl
                L16_2.soundsrc = L17_2
                L16_2.soundvolume = 0.0
                L15_2(L16_2)
              else
                L15_2 = SendNUIMessage
                L16_2 = {}
                L16_2.message = "playsoundattraction"
                L16_2.soundid = L4_2
                L17_2 = L5_2.musicurl
                L16_2.soundsrc = L17_2
                L16_2.soundvolume = L9_2
                L15_2(L16_2)
              end
            end
          else
            L6_2 = SendNUIMessage
            L7_2 = {}
            L7_2.message = "playsoundattraction"
            L7_2.soundid = L4_2
            L8_2 = L5_2.musicurl
            L7_2.soundsrc = L8_2
            L7_2.soundvolume = 0.0
            L6_2(L7_2)
          end
        end
      end
    end
  end
end
L2_1(L3_1)
L2_1 = RegisterNetEvent
L3_1 = "rtx_themepark:Global:MusicStartAttraction"
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "rtx_themepark:Global:MusicStartAttraction"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = Config
  L2_2 = L2_2.AttractionsMusic
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.playlist
  L2_2 = L2_2[A1_2]
  L2_2 = L2_2.musicurl
  L3_2 = Config
  L3_2 = L3_2.AttractionsMusic
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.disable
  if false == L3_2 then
    L3_2 = CreateSoundAttraction
    L4_2 = A0_2
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
    L3_2 = L0_1
    L3_2 = L3_2 + 1
    L0_1 = L3_2
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "rtx_themepark:Global:MusicStopAttraction"
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "rtx_themepark:Global:MusicStopAttraction"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  L2_2 = Config
  L2_2 = L2_2.AttractionsMusic
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.disable
  if false == L2_2 then
    L1_2.started = false
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "stopsoundattraction"
    L3_2.soundid = A0_2
    L2_2(L3_2)
    L2_2 = L0_1
    L2_2 = L2_2 - 1
    L0_1 = L2_2
  end
end
L2_1(L3_1, L4_1)
