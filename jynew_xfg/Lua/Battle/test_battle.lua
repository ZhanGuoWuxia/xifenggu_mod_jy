print("测试战斗")


--位置示意图
--列col   行row
--[[ 
                左边        右边
          列2 列1 列0  列0  列1  列2
 行 0:     2   1   0 || 0   1    2
 行 1：    5   4   3 || 3   4    5
 行 2:     8   7   6 || 6   7    8
    
     ↓ 
--]]


local startParam = {
    Team1 =
    {
        --{Pos = 3, Role = get_role_by_id("测试木桩")},
        {Pos  =5, Role = get_role_by_id("何猛")},
    },
    Team2 =
    {
        --{Pos = 3, Role = create_temp_role("测试木桩")},
        {Pos = 3, Role = create_temp_role("测试木桩")},
        {Pos = 4, Role = create_temp_role("测试木桩")},
        {Pos = 5, Role = create_temp_role("测试木桩")},
        --{Pos = 2, Role = create_temp_role("万雀溪谷祭司")},
        --{Pos = 3, Role = create_temp_role("万雀溪谷祭司")},
        --{Pos = 4, Role = create_temp_role("万雀溪谷祭司")},
        --{Pos = 5, Role = create_temp_role("东方骤雨")},
    },
    MaxTurn = 99,
    BattleName = "测试战斗",
    PlayerTeam = 0,
    DisableJoinBattleCount = true,
    Scene = "BatteMaps/BattleScenes/HuYanMen_0.unity"
}

local ret = start_battle(startParam)
pop_msg_box("比赛结果:" .. ret)
