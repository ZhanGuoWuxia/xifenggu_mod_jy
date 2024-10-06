local other_menpais = table.select(get_strategy_other_menpais(get_player_menpai()), function(menpai) return menpai.Name end)

local idx = show_avg_select("", "请选择你潜入刺杀的门派。", other_menpais)

avg_talk("", "请选择你要潜入刺杀的刺客（潜入成功概率取决于速度和轻功）。")

local playerMenpai = get_player_menpai()
local playerMenpaiRoles = table.cslist_2_table(roles_of_menpai(playerMenpai))
local targetMenpai = get_menpai_by_id(other_menpais[idx])

local is_confirm, role1 = single_role_select(playerMenpaiRoles)
if not is_confirm then
    return -1
end
if not role1 then
    print_error("错误, 无法获取目标角色")
    return -1
end

local spd = role_attr(role1, stat_key.Speed)
local qinggong = role_attr(role1, stat_key.qinggong)

local isOk = chance(spd / 10 + qinggong)
if isOk then
    local targetMenpaiRoles = table.cslist_2_table(roles_of_menpai(targetMenpai))
    local role2 = table.pick_random(targetMenpaiRoles)
    avg_talk(role1, "哈哈！成功潜入，猎杀时刻！")
    avg_talk(role2, "啊！是谁？是谁在暗处，是好汉就别躲着！")
    avg_talk(role1, "好！让你做个明白鬼！")
    --战斗
    local startParam = {
        Team1 = {
            { Pos = 3, Role = role1 },
        },
        Team2 = {
            { Pos = 3, Role = role2 },
        },
        MaxTurn = 99,
        BattleName = "潜入刺杀之战",
        IsQuick = false,
        PlayerTeam = 0,
        DisableJoinBattleCount = true,
        IsAskForPlayerFormation = false,
        Scene = "BatteMaps/BattleScenes/jyx2_7.unity",
        BGM = "Music/热血_侠肝义胆.wav",
    }
    local ret = start_battle(startParam)
    if ret == 1 then
        local RoleGenType = CS.ZhanGuoWuxia.Backend.Beans.RoleGenType
        if role2.RoleGenType == RoleGenType.Template then
            kill_disciple(role2)
        else
            role2:ChangeHealthStatus(0)
            pop_tip(string.i18_format("<color=#ff7a00>{0}</color>受到了重伤，奄奄一息！", role2.Name))
        end
    else

    end
else
    avg_talk(role1, "防守竟然如此严密，找不到潜入的缺口。")
end
pop_tip("你的行为彻底激怒了对方，他们扬言要疯狂地报复。")
change_both_friendship(playerMenpai, targetMenpai, -40)
set_flag("该回合已经潜入刺杀")
