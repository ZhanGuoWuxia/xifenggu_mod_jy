
--回合数增长提示弹窗
show_roundchange_tip()

local playerMenpai = get_player_menpai()
if not playerMenpai then
    print_error("错误，未找到玩家门派")
    return
end

local economic = require 'Common/economy'
local money = get_player_money()
--玩家经济增长
local income = economic.income_of_menpai(playerMenpai)
if income ~= 0 then
    add_player_money(income)
    show_menpai_action(playerMenpai, string.i18_format("来自领地的收入:{0}" , income))
end
--佣金支出

local commission = economic.commission_of_menpai(playerMenpai)
if commission > money then
    executefile("Role/fire_all")
end
if commission ~= 0 then
    add_player_item("银两", -commission)
    show_menpai_action(playerMenpai, string.i18_format("佣金支出 : {0}", -commission))
end

--额外获取的道具
local module_player_turn = require 'Attr/player_turn_get_items'
module_player_turn.add_player_menpai_items()

--刷新打猎野怪点
local module_hunt = require 'Common/hunt'
module_hunt.refresh_player_hunt()

--执行玩家门派的剧情(如果有的话)
--show_menpai_action(playerMenpai, "思考中")

local action = next_menpai_story(playerMenpai)
if action and action.LuaCommandFile and action.LuaCommandFile ~= "" then
    executefile(action.luaCommandFile)
end