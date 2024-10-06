local get_mercenary_random_pool = game_api.GetMercenaryRandomPool

local pool_list = table.cslist_2_table(get_mercenary_random_pool())
local mercenaries = table.pick_random_many(pool_list, 5)
local options = {
    "去看看",
    "算了，我不想去了",
}
local msg = string.i18_format("掌门，息风谷正有一场人才竞拍会，我们是否要去看看？")
local idx = show_avg_select("齐六哥", msg, options)
switch(idx) {
    ["1"] = function()
        set_flag("该回合已经参加过拍卖雇佣")
        --先随机出现五个人才，玩家可以选择其中一个人才进行竞拍
        --每轮竞拍加价，玩家可以选择放弃竞拍加价，但是不会返还之前的竞拍加价费用，每轮竞拍加价100两、200两、300两
        --三轮加价完毕后，最终以最高价获得人才
        ::select_role::
        local is_confirm, role = single_role_select(mercenaries)
        if not is_confirm then
            return -1
        end
        if not role then
            print_error("错误, 无法获取目标角色")
            return -1
        end
        local is_ok = yes_or_no(string.i18_format("确定选择<color=#ff2400>{0}</color>来竞拍吗？", role.Name))
        if not is_ok then
            goto select_role
        end
        local current_bid = 100 * role.Level
        local current_menpai = nil
        ::bid_role::
        for i = 1, 3 do
            local bid_options = {
                "100两",
                "200两",
                "300两",
                "放弃竞拍",
            }

            local bidIdx = show_avg_select("", string.i18_format("第<color=red>{0}</color>轮竞拍，该角色当前竞价<color=#ff2400>{1}</color>两，请选择你的加价", i, current_bid), bid_options)
            if bidIdx == 4 then
                --放弃竞拍
                if current_menpai then
                    hire_role(current_menpai, role)
                    pop_tip(string.i18_format("{0}以<color=red>{1}</color>两的价格获得了<color=#ff2400>{2}</color>", current_menpai.Name, current_bid, role.Name))
                end
                return
            else
                local bid = bidIdx * 100
                local bid_sum = current_bid + bidIdx * 100
                local money = get_player_money()
                if money < bid_sum then
                    pop_tip(string.i18_format("银两不足, 需要<color=red>银两 x {0}</color>", bid_sum))
                    goto bid_role
                end
                current_bid = bid_sum
                pop_tip(string.i18_format("你加价了<color=red>{0}</color>两", bid))
            end
            --获取其他解锁的对手
            local unlocked_menpais = get_unlocked_other_menpais(get_player_menpai())
            for _, menpai in pairs(unlocked_menpais) do
                if chance(50) then
                    local other_bid = table.pick_random({100, 200, 300})
                    current_bid = current_bid + other_bid
                    current_menpai = menpai
                    avg_talk(menpai.PresetLeaderId, string.i18_format("我要加价了，你们谁也别想抢走<color=#ff2400>{0}</color>。", role.Name))
                    pop_tip(string.i18_format("{0}加价了<color=red>{1}</color>两", menpai.Name, other_bid))
                end
            end
        end
        --最终获得人才
        add_player_money(-current_bid)
        player_hire_role(role)
        pop_tip(string.i18_format("你以<color=red>{0}</color>两的价格获得了<color=#ff2400>{1}</color>", current_bid, role.Name))
        return
    end,
    ["2"] = function()
        return
    end
}