local addFriendshipPoint = 10

local area = current_area
if not area then
    return
end


local targetMenpai = menpai_of_area(area)

local options = {"狩猎", "闲聊", "切磋", "送礼"}
local idx = math.random(1, #options)
switch(idx) {
    ["1"] = function()
        avg_talk("司徒来也", "听闻贵派武功非凡，此次狩猎，不知能否有幸邀请贵派一同参与，共赏山林之美？")
        local prey = {"熊", "狼", "羊", "野猪", "蛇"}
        local pickNum = math.random(1, 6)
        local formation_roles = {}
        for i = 1, pickNum do
            local formation_item = { Pos = i, Role = create_temp_role(table.pick_random(prey))}
            table.insert(formation_roles, formation_item)
        end
        local targetMenpaiRoles = table.cslist_2_table(roles_of_menpai(targetMenpai))
        local ally = table.pick_random(targetMenpaiRoles)
        avg_talk(ally.BeanId, "让我来松松筋骨！")
        local startParam = {
            Team1 = {
                { Pos = 2, Role = ally },
            },
            Team2 = formation_roles,
            MaxTurn = 99,
            BattleName = "狩猎",
            IsQuick = false,
            PlayerTeam = 0,
            DisableJoinBattleCount = true,
            Scene = "BatteMaps/BattleScenes/jyx2_2.unity",
            BGM = "Music/热血_侠肝义胆.wav",
            RolesAIMustControl = {ally.BeanId},
        }
        local ret = start_battle(startParam)
        if ret == 1 then
            avg_talk("司徒来也", "今日一见，贵派弟子的勇猛果敢，真是令人赞叹。")
        else
            avg_talk("", "对方安慰你，下次定要猎得猎物。")
        end
    end,
    ["2"] = function()
        avg_talk("司徒来也", "在下(player:fullname)，特来拜访贵派，望能通报一声。")
        avg_talk("", "守门弟子笑脸相迎，你快步进入，随后两派在友好的氛围中好感得到提升。")
    end,
    ["3"] = function()
        avg_talk("司徒来也", "听闻贵派武功独步武林，不知今日是否有荣幸一睹风采？")
        avg_talk("", "对方欣然应允。")
        local faction_control = require("Common/faction")
        local enemies = faction_control.pick_random_template_roles(targetMenpai, 1, 6)
        if #enemies == 0 then
            table.insert(enemies, create_temp_role("随机坦克", 5))
        end
        local startParam = {
            Team2 = ai_std_formation_roles(enemies),
            MaxTurn = 99,
            BattleName = "切磋",
            IsQuick = false,
            PlayerTeam = 0,
            DisableJoinBattleCount = true,
            Scene = "BatteMaps/BattleScenes/HuYanMen_0.unity",
            BGM = "Music/热血_侠肝义胆.wav",
        }
        local ret = start_battle(startParam)
        if ret == 1 then
            avg_talk("司徒来也", "侥幸赢得几手，下次再来切磋。")
        else
            avg_talk("", "对方哈哈大笑，拱手说着承让承让。")
        end
    end,
    ["4"] = function()
        local economy = require("Common/economy")
        local cost = economy.cost_of_gift()
        local money = get_player_money()
        if money < cost then
            pop_tip(string.i18_format("银两不足, 需要 <color=red>银两 x {0}</color>", cost))
            return
        end
        avg_talk("司徒来也", "这是我派特意为贵派准备的一点心意，请笑纳！")
        add_player_money(-cost)
    end,
}

change_both_friendship("player", targetMenpai, addFriendshipPoint)
