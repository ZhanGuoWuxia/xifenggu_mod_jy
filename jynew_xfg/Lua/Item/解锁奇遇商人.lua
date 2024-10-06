local config = require 'Item/item_config'
local economy = require 'Common/economy'

local cost = economy.cost_of_strange_seller()
local current_round = get_game_round()
if not has_flag("已解锁奇遇商人") then
    avg_talk("[speaker:奇怪的商人][img:npc_ShangRen]", "江湖之大，能与少侠相遇，还真是有缘啊。")
    avg_talk("司徒来也", "无事献殷勤，有何贵干？")
    avg_talk("[speaker:奇怪的商人][img:npc_ShangRen]", "少侠此言差矣！我夜观天象，发现此地灵气浓郁，因此携宝物而来，寻找机缘之人。")
    avg_talk("司徒来也", "行脚商便行脚商，说得如此天花乱坠，又能有什么宝物？")
    avg_talk("[speaker:奇怪的商人][img:npc_ShangRen]", "少侠有所不知，既是宝物，又怎么会轻易示人？须得给些“诚意钱”不是？")
    avg_talk("司徒来也", "你倒说说，怎么个诚意？")
    avg_talk("[speaker:奇怪的商人][img:npc_ShangRen]", "你得先花一点银子，然后我自给展示几件宝贝，你可以选择其中一件，如果你不满意，可以选择取消，但银两吗，便无法返还了，所以还请少侠慎重选择。")
    avg_talk("司徒来也", "还真是够“诚意”啊……")
    avg_talk("[speaker:奇怪的商人][img:npc_ShangRen]", "考虑到头次开张，交个朋友，我可以给少侠打个5折, 之后我每回合都要涨价100两银子的。") 
    set_flag("已解锁奇遇商人")
    cost = math.floor(cost / 2)
else
    avg_talk("[speaker:奇怪的商人][img:npc_ShangRen]", "真是有缘，又同少侠见面了。这次少侠可需要些什么？")
end

avg_talk("", string.i18_format("当前购买宝贝需要花费: <color=red>{0}</color> 银两", cost))
local options = {
    "给我看看你有啥好东西",
    "还是算了吧",
}
local function avg_select()
    local idx = show_quick_selections(options)
    switch(idx) {
        ["1"] = function()
            if cost > 0 then
                local money = get_player_money()
                local is_ok = yes_or_no(string.i18_format("此次购买将花费<color=red>银两 x {0}</color>, 是否继续\n(继续后不会返还此次花费的银两)？", cost))
                if not is_ok then
                    return
                end
                if money < cost then
                    pop_tip(string.i18_format("银两不足, 需要 <color=red>银两 x {0}</color>", cost))
                    return
                end
                add_player_money(-cost)
            end
            local item_list = config.get_seller_items()
            local itemIdx = show_item_card_select(item_list)
            if itemIdx > #item_list then
                --取消并返回
                avg_select()
            else
                --选择物品
                local itemId = item_list[itemIdx]
                if current_round <= 25 then
                    add_player_item(itemId, 1, "#(0-1)")
                elseif current_round <= 50 then
                    add_player_item(itemId, 1, "#(1-3)")
                elseif current_round <= 75 then
                    add_player_item(itemId, 1, "#(2-4)")
                else
                    add_player_item(itemId, 1, "#(3-5)")
                end
                set_flag("该回合已经购买过奇遇商人")
                return
            end
        end,
        ["2"] = function()
            return
        end
    }
end
avg_select()
