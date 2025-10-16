local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = IsDuplicityVersion
L0_1 = L0_1()
if L0_1 then
  L0_1 = GetPlayerPositionInRealTime71
  L0_1()
end
L0_1 = {}
L0_1.seatid = nil
L1_1 = nil
L2_1 = false
L3_1 = false
L4_1 = 0
L5_1 = {}
L6_1 = vector3
L7_1 = -1656.25
L8_1 = -1120.387
L9_1 = 30.07145
L6_1 = L6_1(L7_1, L8_1, L9_1)
L5_1.coords = L6_1
L5_1.mainhandler = nil
L5_1.animhandler = nil
L5_1.started = false
L5_1.currentrotation = 0.0
L5_1.stageinprogress = false
L5_1.stage = 0
L5_1.stagecounter = 0
L5_1.stagespeed = 0.5
L5_1.stagedirection = 1
L5_1.getnew = false
L5_1.synchronizestop = false
L5_1.cageclosed = false
L6_1 = {}
L7_1 = {}
L7_1.handler = false
L8_1 = {}
L9_1 = vec3
L10_1 = 1.829
L11_1 = -0.043
L12_1 = -13.715
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 0.0
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[1] = L7_1
L7_1 = {}
L7_1.handler = false
L8_1 = {}
L9_1 = vec3
L10_1 = 3.093
L11_1 = -0.043
L12_1 = -13.572
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 0.0
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[2] = L7_1
L7_1 = {}
L7_1.handler = false
L8_1 = {}
L9_1 = vec3
L10_1 = 4.307
L11_1 = -0.043
L12_1 = -13.366
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 0.0
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[3] = L7_1
L7_1 = {}
L7_1.handler = false
L8_1 = {}
L9_1 = vec3
L10_1 = 5.552
L11_1 = -0.043
L12_1 = -13.085
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 0.0
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[4] = L7_1
L7_1 = {}
L7_1.handler = false
L8_1 = {}
L9_1 = vec3
L10_1 = -1.589
L11_1 = -0.006
L12_1 = -13.715
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 180.149994
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[5] = L7_1
L7_1 = {}
L7_1.handler = false
L8_1 = {}
L9_1 = vec3
L10_1 = -2.846
L11_1 = -0.006
L12_1 = -13.572
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 180.149994
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[6] = L7_1
L7_1 = {}
L7_1.handler = false
L8_1 = {}
L9_1 = vec3
L10_1 = -4.072
L11_1 = -0.006
L12_1 = -13.366
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 180.149994
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[7] = L7_1
L7_1 = {}
L7_1.handler = false
L8_1 = {}
L9_1 = vec3
L10_1 = -5.306
L11_1 = -0.006
L12_1 = -13.085
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 180.149994
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[8] = L7_1
L5_1.seatcage = L6_1
L6_1 = {}
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -1.2
L11_1 = -0.912
L12_1 = -14.122
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[1] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -1.2
L11_1 = -0.484
L12_1 = -14.122
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[2] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -1.2
L11_1 = 0.462
L12_1 = -14.122
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[3] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -1.2
L11_1 = 0.869
L12_1 = -14.122
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[4] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -2.39
L11_1 = -0.96
L12_1 = -14.019
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[5] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -2.39
L11_1 = -0.505
L12_1 = -14.019
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[6] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -2.39
L11_1 = 0.445
L12_1 = -14.019
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[7] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -2.39
L11_1 = 0.867
L12_1 = -14.019
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[8] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -3.609
L11_1 = -0.956
L12_1 = -13.847
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[9] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -3.64
L11_1 = -0.479
L12_1 = -13.847
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[10] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -3.64
L11_1 = 0.394
L12_1 = -13.847
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[11] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -3.64
L11_1 = 0.89
L12_1 = -13.847
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[12] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -4.959
L11_1 = -0.986
L12_1 = -13.571
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[13] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -4.959
L11_1 = -0.504
L12_1 = -13.571
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[14] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -4.959
L11_1 = 0.419
L12_1 = -13.571
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[15] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = -4.959
L11_1 = 0.897
L12_1 = -13.571
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = -86.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[16] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 1.4
L11_1 = -0.912
L12_1 = -14.122
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[17] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 1.4
L11_1 = -0.484
L12_1 = -14.122
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[18] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 1.4
L11_1 = 0.462
L12_1 = -14.122
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[19] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 1.4
L11_1 = 0.869
L12_1 = -14.122
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[20] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 2.59
L11_1 = -0.96
L12_1 = -14.019
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[21] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 2.59
L11_1 = -0.505
L12_1 = -14.019
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[22] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 2.59
L11_1 = 0.445
L12_1 = -14.019
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[23] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 2.59
L11_1 = 0.867
L12_1 = -14.019
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[24] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 3.809
L11_1 = -0.956
L12_1 = -13.847
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[25] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 3.84
L11_1 = -0.479
L12_1 = -13.847
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[26] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 3.84
L11_1 = 0.394
L12_1 = -13.847
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[27] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 3.84
L11_1 = 0.89
L12_1 = -13.847
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[28] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 5.159
L11_1 = -0.986
L12_1 = -13.571
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[29] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 5.159
L11_1 = -0.504
L12_1 = -13.571
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[30] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 5.159
L11_1 = 0.419
L12_1 = -13.571
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[31] = L7_1
L7_1 = {}
L7_1.taken = false
L7_1.takenplayerid = nil
L8_1 = {}
L9_1 = vec3
L10_1 = 5.159
L11_1 = 0.897
L12_1 = -13.571
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.coords = L9_1
L9_1 = vec3
L10_1 = 0.0
L11_1 = 0.0
L12_1 = 92.650002
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1.rotation = L9_1
L7_1.offsets = L8_1
L6_1[32] = L7_1
L5_1.seats = L6_1
boathandler = L5_1
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:Boat:SynchronizeMovement"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:Boat:SynchronizeMovement"
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = nearbythemepark
  if true == L5_2 then
    if 15 == A2_2 or 16 == A2_2 then
      L5_2 = boathandler
      L5_2.getnew = true
      L5_2 = boathandler
      L5_2.synchronizestop = false
      L5_2 = boathandler
      L5_2.currentrotation = A0_2
      L5_2 = SetEntityRotation
      L6_2 = boathandler
      L6_2 = L6_2.mainhandler
      L7_2 = 0.0
      L8_2 = A0_2
      L9_2 = 215.0
      L5_2(L6_2, L7_2, L8_2, L9_2)
    elseif true == A4_2 then
      L5_2 = boathandler
      L5_2.getnew = true
      L5_2 = SetEntityRotation
      L6_2 = boathandler
      L6_2 = L6_2.mainhandler
      L7_2 = 0.0
      L8_2 = boathandler
      L8_2 = L8_2.currentrotation
      L9_2 = 215.0
      L5_2(L6_2, L7_2, L8_2, L9_2)
    else
      L5_2 = boathandler
      L5_2.getnew = true
      L5_2 = SetEntityRotation
      L6_2 = boathandler
      L6_2 = L6_2.mainhandler
      L7_2 = 0.0
      L8_2 = A0_2
      L9_2 = 215.0
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = boathandler
      L5_2.currentrotation = A0_2
      L5_2 = Citizen
      L5_2 = L5_2.Wait
      L6_2 = 1
      L5_2(L6_2)
      L5_2 = boathandler
      L5_2.getnew = false
      L5_2 = A1_2 * 0.1
      L6_2 = 1
      L7_2 = currentfps
      if L7_2 < 70 then
        L5_2 = A1_2 * 0.25
        L6_2 = 0
      else
        L7_2 = currentfps
        if L7_2 < 110 then
          L5_2 = A1_2 * 0.15
          L6_2 = 0
        end
      end
      while true do
        L7_2 = boathandler
        L7_2 = L7_2.getnew
        if false ~= L7_2 then
          break
        end
        L7_2 = boathandler
        L7_2 = L7_2.synchronizestop
        if false ~= L7_2 then
          break
        end
        L7_2 = nearbythemepark
        if true ~= L7_2 then
          break
        end
        L7_2 = Citizen
        L7_2 = L7_2.Wait
        L8_2 = L6_2
        L7_2(L8_2)
        if 1 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 2 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 3 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 4 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 5 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 6 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 7 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 8 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 9 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 10 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 11 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 12 == A2_2 then
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 13 == A2_2 then
          currentstagespeed = 0.25
          if 1 == A3_2 then
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 - L5_2
            L7_2.currentrotation = L8_2
          end
        elseif 14 == A2_2 and 1 == A3_2 then
          L7_2 = boathandler
          L7_2 = L7_2.currentrotation
          L8_2 = 0.1
          if L7_2 > L8_2 then
            L7_2 = boathandler
            L7_2.getnew = true
          else
            L7_2 = boathandler
            L8_2 = boathandler
            L8_2 = L8_2.currentrotation
            L8_2 = L8_2 + L5_2
            L7_2.currentrotation = L8_2
          end
        end
        L7_2 = boathandler
        L7_2 = L7_2.getnew
        if false == L7_2 then
          L7_2 = SetEntityRotation
          L8_2 = boathandler
          L8_2 = L8_2.mainhandler
          L9_2 = 0.0
          L10_2 = boathandler
          L10_2 = L10_2.currentrotation
          L11_2 = 215.0
          L7_2(L8_2, L9_2, L10_2, L11_2)
        end
      end
    end
  else
    L5_2 = boathandler
    L5_2.getnew = true
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:Boat:SynchronizeStarted"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:Boat:SynchronizeStarted"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = boathandler
  L1_2.started = A0_2
  if true == A0_2 then
    L1_2 = SetEntityCompletelyDisableCollision
    L2_2 = boathandler
    L2_2 = L2_2.mainhandler
    L3_2 = false
    L4_2 = false
    L1_2(L2_2, L3_2, L4_2)
  else
    L1_2 = SetEntityCompletelyDisableCollision
    L2_2 = boathandler
    L2_2 = L2_2.mainhandler
    L3_2 = true
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:Boat:DisableCollision"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:Boat:DisableCollision"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if true == A0_2 then
    L1_2 = SetEntityCompletelyDisableCollision
    L2_2 = boathandler
    L2_2 = L2_2.mainhandler
    L3_2 = true
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
  else
    L1_2 = SetEntityCompletelyDisableCollision
    L2_2 = boathandler
    L2_2 = L2_2.mainhandler
    L3_2 = false
    L4_2 = false
    L1_2(L2_2, L3_2, L4_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:Boat:SeatData"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:Boat:SeatData"
function L7_1(A0_2)
  local L1_2, L2_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.message = "attractionhow"
  L2_2.attractionanimchange = true
  L1_2(L2_2)
  L1_1 = A0_2
  L1_2 = true
  L3_1 = L1_2
  L1_2 = Config
  L1_2 = L1_2.ThemeParkFallSettings
  L1_2 = L1_2.fallchancecheck
  L4_1 = L1_2
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "rtx_themepark:Boat:SeatExit"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "rtx_themepark:Boat:SeatExit"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = boathandler
  L1_2 = L1_2.started
  if false == L1_2 or true == A0_2 then
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = DetachEntity
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = FreezeEntityPosition
    L3_2 = L1_2
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = ClearPedTasks
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "hideattraction"
    L2_2(L3_2)
    L2_2 = nil
    L1_1 = L2_2
  else
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = DetachEntity
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = FreezeEntityPosition
    L3_2 = L1_2
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = ClearPedTasks
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = SetEntityCoordsNoOffset
    L3_2 = L1_2
    L4_2 = Config
    L4_2 = L4_2.AttractionsSettings
    L4_2 = L4_2.boat
    L4_2 = L4_2.exitcoords
    L4_2 = L4_2.coords
    L4_2 = L4_2.x
    L5_2 = Config
    L5_2 = L5_2.AttractionsSettings
    L5_2 = L5_2.boat
    L5_2 = L5_2.exitcoords
    L5_2 = L5_2.coords
    L5_2 = L5_2.y
    L6_2 = Config
    L6_2 = L6_2.AttractionsSettings
    L6_2 = L6_2.boat
    L6_2 = L6_2.exitcoords
    L6_2 = L6_2.coords
    L6_2 = L6_2.z
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = SetEntityHeading
    L3_2 = L1_2
    L4_2 = Config
    L4_2 = L4_2.AttractionsSettings
    L4_2 = L4_2.boat
    L4_2 = L4_2.exitcoords
    L4_2 = L4_2.heading
    L2_2(L3_2, L4_2)
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.message = "hideattraction"
    L2_2(L3_2)
    L2_2 = nil
    L1_1 = L2_2
  end
  L1_2 = false
  L3_1 = L1_2
end
L5_1(L6_1, L7_1)
L5_1 = Config
L5_1 = L5_1.ThemeParkAttractionFallChance
if L5_1 then
  L5_1 = Config
  L5_1 = L5_1.ThemeParkFallSettings
  L5_1 = L5_1.attractions
  L5_1 = L5_1.boat
  if L5_1 then
    L5_1 = RegisterNetEvent
    L6_1 = "rtx_themepark:Boat:SeatThrowClient"
    L5_1(L6_1)
    L5_1 = AddEventHandler
    L6_1 = "rtx_themepark:Boat:SeatThrowClient"
    function L7_1()
      local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
      L0_2 = L1_1
      if nil ~= L0_2 then
        L0_2 = PlayerPedId
        L0_2 = L0_2()
        L1_2 = DetachEntity
        L2_2 = L0_2
        L1_2(L2_2)
        L1_2 = FreezeEntityPosition
        L2_2 = L0_2
        L3_2 = false
        L1_2(L2_2, L3_2)
        L1_2 = ClearPedTasks
        L2_2 = L0_2
        L1_2(L2_2)
        L1_2 = SendNUIMessage
        L2_2 = {}
        L2_2.message = "hideattraction"
        L1_2(L2_2)
        L1_2 = nil
        L1_1 = L1_2
        usingattraction = false
        L1_2 = GetEntityForwardVector
        L2_2 = L0_2
        L1_2 = L1_2(L2_2)
        L2_2 = math
        L2_2 = L2_2.random
        L2_2 = L2_2()
        L2_2 = L2_2 * 9.0
        L2_2 = 10.0 + L2_2
        L3_2 = SetPedToRagdoll
        L4_2 = L0_2
        L5_2 = 2000
        L6_2 = 2000
        L7_2 = false
        L8_2 = false
        L9_2 = false
        L10_2 = false
        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
        L3_2 = ApplyForceToEntity
        L4_2 = L0_2
        L5_2 = 1
        L6_2 = L1_2.x
        L6_2 = L6_2 * L2_2
        L7_2 = L1_2.y
        L7_2 = L7_2 * L2_2
        L8_2 = L1_2.z
        L8_2 = L8_2 + 10.0
        L9_2 = 0
        L10_2 = 0
        L11_2 = 0
        L12_2 = 0
        L13_2 = false
        L14_2 = true
        L15_2 = true
        L16_2 = false
        L17_2 = true
        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
        L3_2 = Notify
        L4_2 = Language
        L5_2 = Config
        L5_2 = L5_2.Language
        L4_2 = L4_2[L5_2]
        L4_2 = L4_2.themeparkfall
        L3_2(L4_2)
      end
    end
    L5_1(L6_1, L7_1)
  end
end
L5_1 = Config
L5_1 = L5_1.Target
if true == L5_1 then
  L5_1 = RegisterNetEvent
  L6_1 = "rtx_themepark:Boat:SeatTarget"
  L5_1(L6_1)
  L5_1 = AddEventHandler
  L6_1 = "rtx_themepark:Boat:SeatTarget"
  function L7_1()
    local L0_2, L1_2, L2_2
    L0_2 = boathandler
    L0_2 = L0_2.started
    if false == L0_2 then
      L0_2 = usingattraction
      if false == L0_2 then
        L0_2 = L0_1.seatid
        if nil ~= L0_2 then
          L0_2 = iteminhand
          if false == L0_2 then
            L0_2 = TriggerServerEvent
            L1_2 = "rtx_themepark:Boat:SeatUse"
            L2_2 = L0_1.seatid
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
  end
  L5_1(L6_1, L7_1)
end
L5_1 = Citizen
L5_1 = L5_1.CreateThread
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1000
    L0_2(L1_2)
    L0_2 = nearbythemepark
    if true == L0_2 then
      L0_2 = DoesEntityExist
      L1_2 = boathandler
      L1_2 = L1_2.mainhandler
      L0_2 = L0_2(L1_2)
      if L0_2 then
        L0_2 = FreezeEntityPosition
        L1_2 = boathandler
        L1_2 = L1_2.mainhandler
        L2_2 = true
        L0_2(L1_2, L2_2)
      else
        L0_2 = GetHashKey
        L1_2 = "sempre_delperropier_boat_lodka"
        L0_2 = L0_2(L1_2)
        L1_2 = RequestModel
        L2_2 = L0_2
        L1_2(L2_2)
        while true do
          L1_2 = HasModelLoaded
          L2_2 = L0_2
          L1_2 = L1_2(L2_2)
          if L1_2 then
            break
          end
          L1_2 = RequestModel
          L2_2 = L0_2
          L1_2(L2_2)
          L1_2 = Citizen
          L1_2 = L1_2.Wait
          L2_2 = 5
          L1_2(L2_2)
        end
        L1_2 = boathandler
        L2_2 = CreateObjectNoOffset
        L3_2 = L0_2
        L4_2 = boathandler
        L4_2 = L4_2.coords
        L4_2 = L4_2.x
        L5_2 = boathandler
        L5_2 = L5_2.coords
        L5_2 = L5_2.y
        L6_2 = boathandler
        L6_2 = L6_2.coords
        L6_2 = L6_2.z
        L7_2 = false
        L8_2 = true
        L9_2 = true
        L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
        L1_2.mainhandler = L2_2
        L1_2 = SetEntityRotation
        L2_2 = boathandler
        L2_2 = L2_2.mainhandler
        L3_2 = 0.0
        L4_2 = boathandler
        L4_2 = L4_2.currentrotation
        L5_2 = 215.0
        L1_2(L2_2, L3_2, L4_2, L5_2)
        L1_2 = NetworkAllowLocalEntityAttachment
        L2_2 = boathandler
        L2_2 = L2_2.mainhandler
        L3_2 = true
        L1_2(L2_2, L3_2)
        L1_2 = FreezeEntityPosition
        L2_2 = boathandler
        L2_2 = L2_2.mainhandler
        L3_2 = true
        L1_2(L2_2, L3_2)
      end
      L0_2 = DoesEntityExist
      L1_2 = boathandler
      L1_2 = L1_2.mainhandler
      L0_2 = L0_2(L1_2)
      if L0_2 then
        L0_2 = DoesEntityExist
        L1_2 = boathandler
        L1_2 = L1_2.animhandler
        L0_2 = L0_2(L1_2)
        if L0_2 then
          L0_2 = FreezeEntityPosition
          L1_2 = boathandler
          L1_2 = L1_2.animhandler
          L2_2 = true
          L0_2(L1_2, L2_2)
        else
          L0_2 = GetHashKey
          L1_2 = "sempre_delperropier_boat_anim"
          L0_2 = L0_2(L1_2)
          L1_2 = RequestModel
          L2_2 = L0_2
          L1_2(L2_2)
          while true do
            L1_2 = HasModelLoaded
            L2_2 = L0_2
            L1_2 = L1_2(L2_2)
            if L1_2 then
              break
            end
            L1_2 = RequestModel
            L2_2 = L0_2
            L1_2(L2_2)
            L1_2 = Citizen
            L1_2 = L1_2.Wait
            L2_2 = 5
            L1_2(L2_2)
          end
          L1_2 = boathandler
          L2_2 = CreateObjectNoOffset
          L3_2 = L0_2
          L4_2 = boathandler
          L4_2 = L4_2.coords
          L4_2 = L4_2.x
          L5_2 = boathandler
          L5_2 = L5_2.coords
          L5_2 = L5_2.y
          L6_2 = boathandler
          L6_2 = L6_2.coords
          L6_2 = L6_2.z
          L7_2 = false
          L8_2 = true
          L9_2 = true
          L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
          L1_2.animhandler = L2_2
          L1_2 = SetEntityRotation
          L2_2 = boathandler
          L2_2 = L2_2.animhandler
          L3_2 = 0.0
          L4_2 = boathandler
          L4_2 = L4_2.currentrotation
          L5_2 = 215.0
          L1_2(L2_2, L3_2, L4_2, L5_2)
          L1_2 = NetworkAllowLocalEntityAttachment
          L2_2 = boathandler
          L2_2 = L2_2.animhandler
          L3_2 = true
          L1_2(L2_2, L3_2)
          L1_2 = FreezeEntityPosition
          L2_2 = boathandler
          L2_2 = L2_2.animhandler
          L3_2 = true
          L1_2(L2_2, L3_2)
          L1_2 = AttachEntityToEntity
          L2_2 = boathandler
          L2_2 = L2_2.animhandler
          L3_2 = boathandler
          L3_2 = L3_2.mainhandler
          L4_2 = 0
          L5_2 = 0.0
          L6_2 = 0.0
          L7_2 = 0.0
          L8_2 = 0.0
          L9_2 = 0.0
          L10_2 = 0.0
          L11_2 = false
          L12_2 = false
          L13_2 = true
          L14_2 = false
          L15_2 = 2
          L16_2 = true
          L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        end
      end
      L0_2 = ipairs
      L1_2 = boathandler
      L1_2 = L1_2.seatcage
      L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
      for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
        L6_2 = DoesEntityExist
        L7_2 = L5_2.handler
        L6_2 = L6_2(L7_2)
        if L6_2 then
          L6_2 = FreezeEntityPosition
          L7_2 = L5_2.handler
          L8_2 = true
          L6_2(L7_2, L8_2)
        else
          L6_2 = GetHashKey
          L7_2 = "sempre_delperropier_boat_zavirani"
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
          L7_2 = 0.0
          L8_2 = boathandler
          L8_2 = L8_2.cageclosed
          if true == L8_2 then
            L7_2 = -96.0
          end
          L8_2 = CreateObjectNoOffset
          L9_2 = L6_2
          L10_2 = boathandler
          L10_2 = L10_2.coords
          L10_2 = L10_2.x
          L11_2 = boathandler
          L11_2 = L11_2.coords
          L11_2 = L11_2.y
          L12_2 = boathandler
          L12_2 = L12_2.coords
          L12_2 = L12_2.z
          L13_2 = false
          L14_2 = true
          L15_2 = true
          L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
          L5_2.handler = L8_2
          L8_2 = SetEntityRotation
          L9_2 = L5_2.handler
          L10_2 = 0.0
          L11_2 = 0.0
          L12_2 = 220.0
          L8_2(L9_2, L10_2, L11_2, L12_2)
          L8_2 = NetworkAllowLocalEntityAttachment
          L9_2 = L5_2.handler
          L10_2 = true
          L8_2(L9_2, L10_2)
          L8_2 = FreezeEntityPosition
          L9_2 = L5_2.handler
          L10_2 = true
          L8_2(L9_2, L10_2)
          L8_2 = AttachEntityToEntity
          L9_2 = L5_2.handler
          L10_2 = boathandler
          L10_2 = L10_2.mainhandler
          L11_2 = 0
          L12_2 = L5_2.offsets
          L12_2 = L12_2.coords
          L12_2 = L12_2.x
          L13_2 = L5_2.offsets
          L13_2 = L13_2.coords
          L13_2 = L13_2.y
          L14_2 = L5_2.offsets
          L14_2 = L14_2.coords
          L14_2 = L14_2.z
          L15_2 = L5_2.offsets
          L15_2 = L15_2.rotation
          L15_2 = L15_2.x
          L16_2 = L7_2
          L17_2 = L5_2.offsets
          L17_2 = L17_2.rotation
          L17_2 = L17_2.z
          L18_2 = false
          L19_2 = false
          L20_2 = false
          L21_2 = false
          L22_2 = 2
          L23_2 = true
          L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
        end
      end
    end
  end
end
L5_1(L6_1)
L5_1 = -1
L6_1 = Citizen
L6_1 = L6_1.CreateThread
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 0
    L0_2(L1_2)
    L0_2 = GlobalState
    L0_2 = L0_2["attraction5-phase"]
    if 0 ~= L0_2 then
      L0_2 = nearbythemepark
      if false ~= L0_2 then
        goto lbl_21
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
    L0_2 = boathandler
    L0_2.getnew = true
    L0_2 = -1
    L5_1 = L0_2
    goto lbl_47
    ::lbl_21::
    L0_2 = L5_1
    if -1 ~= L0_2 then
      L0_2 = L5_1
      L1_2 = GlobalState
      L1_2 = L1_2["attraction5-synchdata"]
      if not (L0_2 < L1_2) then
        goto lbl_47
      end
    end
    L0_2 = tonumber
    L1_2 = GlobalState
    L1_2 = L1_2["attraction5-synchdata"]
    L0_2 = L0_2(L1_2)
    L5_1 = L0_2
    L0_2 = TriggerEvent
    L1_2 = "rtx_themepark:Boat:SynchronizeMovement"
    L2_2 = GlobalState
    L2_2 = L2_2["attraction5-ridedata1"]
    L3_2 = GlobalState
    L3_2 = L3_2["attraction5-speeddata1"]
    L4_2 = GlobalState
    L4_2 = L4_2["attraction5-phase"]
    L5_2 = GlobalState
    L5_2 = L5_2["attraction5-direction"]
    L6_2 = GlobalState
    L6_2 = L6_2["attraction5-stop"]
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
    ::lbl_47::
  end
end
L6_1(L7_1)
L6_1 = Config
L6_1 = L6_1.AttractionsSettings
L6_1 = L6_1.boat
L6_1 = L6_1.disable
if false == L6_1 then
  L6_1 = Citizen
  L6_1 = L6_1.CreateThread
  function L7_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
      L0_2 = true
      L1_2 = false
      L2_2 = -1
      L3_2 = {}
      L3_2.seatid = nil
      L4_2 = nearbythemepark
      if true == L4_2 then
        L4_2 = tickets
        L4_2 = L4_2.boat
        if true == L4_2 then
          L4_2 = boathandler
          L4_2 = L4_2.started
          if false == L4_2 then
            L4_2 = ipairs
            L5_2 = boathandler
            L5_2 = L5_2.seats
            L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
            for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
              L10_2 = L9_2.taken
              if false == L10_2 then
                L10_2 = GetOffsetFromEntityInWorldCoords
                L11_2 = boathandler
                L11_2 = L11_2.mainhandler
                L12_2 = L9_2.offsets
                L12_2 = L12_2.coords
                L12_2 = L12_2.x
                L13_2 = L9_2.offsets
                L13_2 = L13_2.coords
                L13_2 = L13_2.y
                L14_2 = L9_2.offsets
                L14_2 = L14_2.coords
                L14_2 = L14_2.z
                L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
                L11_2 = playercurrentcoords
                L11_2 = L11_2 - L10_2
                L11_2 = #L11_2
                if L11_2 < 20.0 then
                  L12_2 = Config
                  L12_2 = L12_2.AttractionsSettings
                  L12_2 = L12_2.boat
                  L12_2 = L12_2.usedistance
                  if L11_2 < L12_2 and (-1 == L2_2 or L2_2 > L11_2) then
                    L2_2 = L11_2
                    L1_2 = true
                    L3_2.seatid = L8_2
                  end
                end
              end
            end
          end
        end
        if L1_2 then
          L4_2 = {}
          L5_2 = L3_2.seatid
          L4_2.seatid = L5_2
          L0_1 = L4_2
          L4_2 = false
          L5_2 = usingattraction
          if false == L5_2 then
            L0_2 = false
            L5_2 = Config
            L5_2 = L5_2.Target
            if false == L5_2 then
              L5_2 = boathandler
              L5_2 = L5_2.seats
              L6_2 = L0_1.seatid
              L5_2 = L5_2[L6_2]
              L6_2 = Config
              L6_2 = L6_2.ThemeParkInteractionSystem
              if 1 == L6_2 then
                L6_2 = SendNUIMessage
                L7_2 = {}
                L7_2.message = "infonotifyshow"
                L8_2 = Language
                L9_2 = Config
                L9_2 = L9_2.Language
                L8_2 = L8_2[L9_2]
                L8_2 = L8_2.pressforuseseatinteract
                L7_2.infonotifytext = L8_2
                L6_2(L7_2)
                L4_2 = true
              else
                L6_2 = Config
                L6_2 = L6_2.ThemeParkInteractionSystem
                if 2 == L6_2 then
                  L6_2 = GetOffsetFromEntityInWorldCoords
                  L7_2 = boathandler
                  L7_2 = L7_2.mainhandler
                  L8_2 = L5_2.offsets
                  L8_2 = L8_2.coords
                  L8_2 = L8_2.x
                  L9_2 = L5_2.offsets
                  L9_2 = L9_2.coords
                  L9_2 = L9_2.y
                  L10_2 = L5_2.offsets
                  L10_2 = L10_2.coords
                  L10_2 = L10_2.z
                  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
                  L7_2 = DrawText3D
                  L8_2 = L6_2.x
                  L9_2 = L6_2.y
                  L10_2 = L6_2.z
                  L11_2 = Language
                  L12_2 = Config
                  L12_2 = L12_2.Language
                  L11_2 = L11_2[L12_2]
                  L11_2 = L11_2.pressforuseseat
                  L7_2(L8_2, L9_2, L10_2, L11_2)
                else
                  L6_2 = Config
                  L6_2 = L6_2.ThemeParkInteractionSystem
                  if 3 == L6_2 then
                    L6_2 = ShowGtaClassicInteraction
                    L7_2 = Language
                    L8_2 = Config
                    L8_2 = L8_2.Language
                    L7_2 = L7_2[L8_2]
                    L7_2 = L7_2.pressforuseseatinteractclassic
                    L6_2(L7_2)
                  end
                end
              end
            end
          end
        else
          L4_2 = Config
          L4_2 = L4_2.ThemeParkInteractionSystem
          if 1 == L4_2 then
            L4_2 = L0_1.seatid
            if nil ~= L4_2 then
              L4_2 = SendNUIMessage
              L5_2 = {}
              L5_2.message = "hide"
              L4_2(L5_2)
            end
          end
          L4_2 = {}
          L4_2.seatid = nil
          L0_1 = L4_2
        end
      end
      if L0_2 then
        L4_2 = Citizen
        L4_2 = L4_2.Wait
        L5_2 = 1000
        L4_2(L5_2)
      end
    end
  end
  L6_1(L7_1)
end
L6_1 = Config
L6_1 = L6_1.ThemeParkAttractionFallChance
if L6_1 then
  L6_1 = Config
  L6_1 = L6_1.ThemeParkFallSettings
  L6_1 = L6_1.attractions
  L6_1 = L6_1.boat
  if L6_1 then
    L6_1 = Citizen
    L6_1 = L6_1.CreateThread
    function L7_1()
      local L0_2, L1_2, L2_2, L3_2
      while true do
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 0
        L0_2(L1_2)
        L0_2 = nearbythemepark
        if true == L0_2 then
          L0_2 = L1_1
          if nil ~= L0_2 then
            L0_2 = L3_1
            if true == L0_2 then
              L0_2 = boathandler
              L0_2 = L0_2.started
              if true == L0_2 then
                L0_2 = L4_1
                if L0_2 > 0 then
                  L0_2 = L4_1
                  L0_2 = L0_2 - 1
                  L4_1 = L0_2
                  L0_2 = Citizen
                  L0_2 = L0_2.Wait
                  L1_2 = 1000
                  L0_2(L1_2)
                else
                  L0_2 = Citizen
                  L0_2 = L0_2.Wait
                  L1_2 = 1000
                  L0_2(L1_2)
                  L0_2 = math
                  L0_2 = L0_2.random
                  L1_2 = 1000
                  L0_2 = L0_2(L1_2)
                  L1_2 = Config
                  L1_2 = L1_2.ThemeParkFallSettings
                  L1_2 = L1_2.fallchance
                  if L0_2 <= L1_2 then
                    L1_2 = false
                    L3_1 = L1_2
                    L1_2 = usingattraction
                    if true == L1_2 then
                      L1_2 = L1_1
                      if nil ~= L1_2 then
                        L1_2 = TriggerServerEvent
                        L2_2 = "rtx_themepark:Boat:ThrowAttraction"
                        L3_2 = L1_1
                        L1_2(L2_2, L3_2)
                      end
                    end
                  else
                    L1_2 = Config
                    L1_2 = L1_2.ThemeParkFallSettings
                    L1_2 = L1_2.fallchancecheck
                    L4_1 = L1_2
                  end
                end
            end
          end
          else
            L0_2 = Citizen
            L0_2 = L0_2.Wait
            L1_2 = 1500
            L0_2(L1_2)
          end
        else
          L0_2 = Citizen
          L0_2 = L0_2.Wait
          L1_2 = 1500
          L0_2(L1_2)
        end
      end
    end
    L6_1(L7_1)
  end
end
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:Boat:SynchronizeSeat"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:Boat:SynchronizeSeat"
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L4_2 = boathandler
  L4_2 = L4_2.seats
  L4_2 = L4_2[A0_2]
  L4_2.taken = A1_2
  if false == A1_2 then
    if nil ~= A2_2 then
      L5_2 = GetPlayerFromServerId
      L6_2 = A2_2
      L5_2 = L5_2(L6_2)
      if -1 ~= L5_2 then
        L6_2 = GetPlayerPed
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        L7_2 = DoesEntityExist
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L7_2 = DetachEntity
          L8_2 = L6_2
          L7_2(L8_2)
          L7_2 = FreezeEntityPosition
          L8_2 = L6_2
          L9_2 = false
          L7_2(L8_2, L9_2)
          L7_2 = ClearPedTasks
          L8_2 = L6_2
          L7_2(L8_2)
        end
      end
    end
  else
    L5_2 = GetPlayerFromServerId
    L6_2 = A2_2
    L5_2 = L5_2(L6_2)
    if -1 ~= L5_2 then
      L6_2 = GetPlayerPed
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      L7_2 = DoesEntityExist
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        if 2 == A3_2 then
          L7_2 = FreezeEntityPosition
          L8_2 = L6_2
          L9_2 = true
          L7_2(L8_2, L9_2)
          L7_2 = NetworkAllowLocalEntityAttachment
          L8_2 = L6_2
          L9_2 = true
          L7_2(L8_2, L9_2)
          L7_2 = AttachEntityToEntity
          L8_2 = L6_2
          L9_2 = boathandler
          L9_2 = L9_2.mainhandler
          L10_2 = 0
          L11_2 = L4_2.offsets
          L11_2 = L11_2.coords
          L11_2 = L11_2.x
          L12_2 = L4_2.offsets
          L12_2 = L12_2.coords
          L12_2 = L12_2.y
          L13_2 = L4_2.offsets
          L13_2 = L13_2.coords
          L13_2 = L13_2.z
          L13_2 = L13_2 + 0.1
          L14_2 = L4_2.offsets
          L14_2 = L14_2.rotation
          L14_2 = L14_2.x
          L15_2 = L4_2.offsets
          L15_2 = L15_2.rotation
          L15_2 = L15_2.y
          L16_2 = L4_2.offsets
          L16_2 = L16_2.rotation
          L16_2 = L16_2.z
          L17_2 = false
          L18_2 = false
          L19_2 = true
          L20_2 = false
          L21_2 = 2
          L22_2 = true
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
          L7_2 = "rtxthemepark"
          L8_2 = "rtxhandsup_clip"
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
          L10_2 = L6_2
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
        else
          L7_2 = FreezeEntityPosition
          L8_2 = L6_2
          L9_2 = true
          L7_2(L8_2, L9_2)
          L7_2 = NetworkAllowLocalEntityAttachment
          L8_2 = L6_2
          L9_2 = true
          L7_2(L8_2, L9_2)
          L7_2 = AttachEntityToEntity
          L8_2 = L6_2
          L9_2 = boathandler
          L9_2 = L9_2.mainhandler
          L10_2 = 0
          L11_2 = L4_2.offsets
          L11_2 = L11_2.coords
          L11_2 = L11_2.x
          L12_2 = L4_2.offsets
          L12_2 = L12_2.coords
          L12_2 = L12_2.y
          L13_2 = L4_2.offsets
          L13_2 = L13_2.coords
          L13_2 = L13_2.z
          L14_2 = L4_2.offsets
          L14_2 = L14_2.rotation
          L14_2 = L14_2.x
          L15_2 = L4_2.offsets
          L15_2 = L15_2.rotation
          L15_2 = L15_2.y
          L16_2 = L4_2.offsets
          L16_2 = L16_2.rotation
          L16_2 = L16_2.z
          L17_2 = false
          L18_2 = false
          L19_2 = true
          L20_2 = false
          L21_2 = 2
          L22_2 = true
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
          L7_2 = "amb@prop_human_seat_chair_mp@female@proper@base"
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
          L10_2 = L6_2
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
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:Boat:SynchronizeCageClient"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:Boat:SynchronizeCageClient"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L1_2 = boathandler
  L1_2.cageclosed = A0_2
  if true == A0_2 then
    L1_2 = 0.0
    while L1_2 > -96.0 do
      L2_2 = Citizen
      L2_2 = L2_2.Wait
      L3_2 = 10
      L2_2(L3_2)
      L1_2 = L1_2 - 0.25
      L2_2 = ipairs
      L3_2 = boathandler
      L3_2 = L3_2.seatcage
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = DoesEntityExist
        L9_2 = L7_2.handler
        L8_2 = L8_2(L9_2)
        if L8_2 then
          L8_2 = AttachEntityToEntity
          L9_2 = L7_2.handler
          L10_2 = boathandler
          L10_2 = L10_2.mainhandler
          L11_2 = 0
          L12_2 = L7_2.offsets
          L12_2 = L12_2.coords
          L12_2 = L12_2.x
          L13_2 = L7_2.offsets
          L13_2 = L13_2.coords
          L13_2 = L13_2.y
          L14_2 = L7_2.offsets
          L14_2 = L14_2.coords
          L14_2 = L14_2.z
          L15_2 = L7_2.offsets
          L15_2 = L15_2.rotation
          L15_2 = L15_2.x
          L16_2 = L1_2
          L17_2 = L7_2.offsets
          L17_2 = L17_2.rotation
          L17_2 = L17_2.z
          L18_2 = false
          L19_2 = false
          L20_2 = false
          L21_2 = false
          L22_2 = 2
          L23_2 = true
          L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
        end
      end
    end
    L2_2 = ipairs
    L3_2 = boathandler
    L3_2 = L3_2.seatcage
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = DoesEntityExist
      L9_2 = L7_2.handler
      L8_2 = L8_2(L9_2)
      if L8_2 then
        L8_2 = AttachEntityToEntity
        L9_2 = L7_2.handler
        L10_2 = boathandler
        L10_2 = L10_2.mainhandler
        L11_2 = 0
        L12_2 = L7_2.offsets
        L12_2 = L12_2.coords
        L12_2 = L12_2.x
        L13_2 = L7_2.offsets
        L13_2 = L13_2.coords
        L13_2 = L13_2.y
        L14_2 = L7_2.offsets
        L14_2 = L14_2.coords
        L14_2 = L14_2.z
        L15_2 = L7_2.offsets
        L15_2 = L15_2.rotation
        L15_2 = L15_2.x
        L16_2 = L1_2
        L17_2 = L7_2.offsets
        L17_2 = L17_2.rotation
        L17_2 = L17_2.z
        L18_2 = false
        L19_2 = false
        L20_2 = false
        L21_2 = false
        L22_2 = 2
        L23_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
      end
    end
  else
    L1_2 = -96.0
    while L1_2 < 0.0 do
      L2_2 = Citizen
      L2_2 = L2_2.Wait
      L3_2 = 10
      L2_2(L3_2)
      L1_2 = L1_2 + 0.25
      L2_2 = ipairs
      L3_2 = boathandler
      L3_2 = L3_2.seatcage
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = DoesEntityExist
        L9_2 = L7_2.handler
        L8_2 = L8_2(L9_2)
        if L8_2 then
          L8_2 = AttachEntityToEntity
          L9_2 = L7_2.handler
          L10_2 = boathandler
          L10_2 = L10_2.mainhandler
          L11_2 = 0
          L12_2 = L7_2.offsets
          L12_2 = L12_2.coords
          L12_2 = L12_2.x
          L13_2 = L7_2.offsets
          L13_2 = L13_2.coords
          L13_2 = L13_2.y
          L14_2 = L7_2.offsets
          L14_2 = L14_2.coords
          L14_2 = L14_2.z
          L15_2 = L7_2.offsets
          L15_2 = L15_2.rotation
          L15_2 = L15_2.x
          L16_2 = L1_2
          L17_2 = L7_2.offsets
          L17_2 = L17_2.rotation
          L17_2 = L17_2.z
          L18_2 = false
          L19_2 = false
          L20_2 = false
          L21_2 = false
          L22_2 = 2
          L23_2 = true
          L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
        end
      end
    end
    L2_2 = ipairs
    L3_2 = boathandler
    L3_2 = L3_2.seatcage
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = DoesEntityExist
      L9_2 = L7_2.handler
      L8_2 = L8_2(L9_2)
      if L8_2 then
        L8_2 = AttachEntityToEntity
        L9_2 = L7_2.handler
        L10_2 = boathandler
        L10_2 = L10_2.mainhandler
        L11_2 = 0
        L12_2 = L7_2.offsets
        L12_2 = L12_2.coords
        L12_2 = L12_2.x
        L13_2 = L7_2.offsets
        L13_2 = L13_2.coords
        L13_2 = L13_2.y
        L14_2 = L7_2.offsets
        L14_2 = L14_2.coords
        L14_2 = L14_2.z
        L15_2 = L7_2.offsets
        L15_2 = L15_2.rotation
        L15_2 = L15_2.x
        L16_2 = L1_2
        L17_2 = L7_2.offsets
        L17_2 = L17_2.rotation
        L17_2 = L17_2.z
        L18_2 = false
        L19_2 = false
        L20_2 = false
        L21_2 = false
        L22_2 = 2
        L23_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
      end
    end
  end
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "rtx_themepark:Boat:SynchronizeCageClientResync"
L6_1(L7_1)
L6_1 = AddEventHandler
L7_1 = "rtx_themepark:Boat:SynchronizeCageClientResync"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L1_2 = boathandler
  L1_2.cageclosed = A0_2
  if true == A0_2 then
    L1_2 = ipairs
    L2_2 = boathandler
    L2_2 = L2_2.seatcage
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = DoesEntityExist
      L8_2 = L6_2.handler
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L7_2 = 0.0
        if true == A0_2 then
          L7_2 = -96.0
        end
        L8_2 = AttachEntityToEntity
        L9_2 = L6_2.handler
        L10_2 = boathandler
        L10_2 = L10_2.mainhandler
        L11_2 = 0
        L12_2 = L6_2.offsets
        L12_2 = L12_2.coords
        L12_2 = L12_2.x
        L13_2 = L6_2.offsets
        L13_2 = L13_2.coords
        L13_2 = L13_2.y
        L14_2 = L6_2.offsets
        L14_2 = L14_2.coords
        L14_2 = L14_2.z
        L15_2 = L6_2.offsets
        L15_2 = L15_2.rotation
        L15_2 = L15_2.x
        L16_2 = L7_2
        L17_2 = L6_2.offsets
        L17_2 = L17_2.rotation
        L17_2 = L17_2.z
        L18_2 = false
        L19_2 = false
        L20_2 = false
        L21_2 = false
        L22_2 = 2
        L23_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
      end
    end
  else
    L1_2 = ipairs
    L2_2 = boathandler
    L2_2 = L2_2.seatcage
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = DoesEntityExist
      L8_2 = L6_2.handler
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L7_2 = 0.0
        if true == A0_2 then
          L7_2 = -96.0
        end
        L8_2 = AttachEntityToEntity
        L9_2 = L6_2.handler
        L10_2 = boathandler
        L10_2 = L10_2.mainhandler
        L11_2 = 0
        L12_2 = L6_2.offsets
        L12_2 = L12_2.coords
        L12_2 = L12_2.x
        L13_2 = L6_2.offsets
        L13_2 = L13_2.coords
        L13_2 = L13_2.y
        L14_2 = L6_2.offsets
        L14_2 = L14_2.coords
        L14_2 = L14_2.z
        L15_2 = L6_2.offsets
        L15_2 = L15_2.rotation
        L15_2 = L15_2.x
        L16_2 = L7_2
        L17_2 = L6_2.offsets
        L17_2 = L17_2.rotation
        L17_2 = L17_2.z
        L18_2 = false
        L19_2 = false
        L20_2 = false
        L21_2 = false
        L22_2 = 2
        L23_2 = true
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
      end
    end
  end
end
L6_1(L7_1, L8_1)
L6_1 = Config
L6_1 = L6_1.Target
if false == L6_1 then
  L6_1 = RegisterCommand
  L7_1 = "useboatseat"
  function L8_1()
    local L0_2, L1_2, L2_2
    L0_2 = usingattraction
    if false == L0_2 then
      L0_2 = L0_1.seatid
      if nil ~= L0_2 then
        L0_2 = iteminhand
        if false == L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "rtx_themepark:Boat:SeatUse"
          L2_2 = L0_1.seatid
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
  L6_1(L7_1, L8_1)
  L6_1 = RegisterKeyMapping
  L7_1 = "useboatseat"
  L8_1 = Language
  L9_1 = Config
  L9_1 = L9_1.Language
  L8_1 = L8_1[L9_1]
  L8_1 = L8_1.bindboatseatuse
  L9_1 = "keyboard"
  L10_1 = Config
  L10_1 = L10_1.ThemeParkSeatKey
  L6_1(L7_1, L8_1, L9_1, L10_1)
end
L6_1 = RegisterCommand
L7_1 = "changeboatanim"
function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = usingattraction
  if true == L0_2 then
    L0_2 = L1_1
    if nil ~= L0_2 then
      L0_2 = L2_1
      if false == L0_2 then
        L0_2 = true
        L2_1 = L0_2
        L0_2 = TriggerServerEvent
        L1_2 = "rtx_themepark:Boat:SeatAnimChange"
        L2_2 = L1_1
        L0_2(L1_2, L2_2)
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = Config
        L1_2 = L1_2.AttractionsSettings
        L1_2 = L1_2.boat
        L1_2 = L1_2.animcooldown
        L0_2(L1_2)
        L0_2 = false
        L2_1 = L0_2
      end
    end
  end
end
L6_1(L7_1, L8_1)
L6_1 = RegisterKeyMapping
L7_1 = "changeboatanim"
L8_1 = Language
L9_1 = Config
L9_1 = L9_1.Language
L8_1 = L8_1[L9_1]
L8_1 = L8_1.bindattractionanimchange
L9_1 = "keyboard"
L10_1 = Config
L10_1 = L10_1.ThemeParkAnimChangeKey
L6_1(L7_1, L8_1, L9_1, L10_1)
L6_1 = RegisterCommand
L7_1 = "exitboat"
function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = usingattraction
  if true == L0_2 then
    L0_2 = L1_1
    if nil ~= L0_2 then
      L0_2 = Config
      L0_2 = L0_2.ThemeParkDisableExit
      if false ~= L0_2 then
        L0_2 = boathandler
        L0_2 = L0_2.started
        if false ~= L0_2 then
          goto lbl_20
        end
      end
      L0_2 = TriggerServerEvent
      L1_2 = "rtx_themepark:Boat:ExitAttraction"
      L2_2 = L1_1
      L0_2(L1_2, L2_2)
      goto lbl_27
      ::lbl_20::
      L0_2 = Notify
      L1_2 = Language
      L2_2 = Config
      L2_2 = L2_2.Language
      L1_2 = L1_2[L2_2]
      L1_2 = L1_2.inprogress
      L0_2(L1_2)
    end
  end
  ::lbl_27::
end
L6_1(L7_1, L8_1)
L6_1 = RegisterKeyMapping
L7_1 = "exitboat"
L8_1 = Language
L9_1 = Config
L9_1 = L9_1.Language
L8_1 = L8_1[L9_1]
L8_1 = L8_1.bindattractionexitkey
L9_1 = "keyboard"
L10_1 = Config
L10_1 = L10_1.ThemeParkExitKey
L6_1(L7_1, L8_1, L9_1, L10_1)
