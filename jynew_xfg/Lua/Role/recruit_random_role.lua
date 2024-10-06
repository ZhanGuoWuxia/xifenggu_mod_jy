local economic = require 'Common/economy'
local instructor = require 'Common/instructor'
local player_menpai = get_player_menpai()
if not player_menpai then
    print_error("无法获取玩家门派数据")
    return -1
end

--酒香亭随机招募

local develop = current_area and current_area.Develop or 0
local medianLevel = player_menpai:MedianOfRoleLevel()
local AdditionLevel = economic.addition_role_level_of_develop(current_area)
local roleLevel = math.clamp(medianLevel +  AdditionLevel, 1, MaxRoleLevel)
local cost = economic.cost_of_recruit_role(roleLevel)

if not has_flag("第一次招贤纳士") then
    --第一次不要钱
    cost = 0
end

local money = get_player_money()
if money < cost then
    pop_tip("银两不足, 本次招募需要 银两 x " .. cost)
    return -1
end

local selectedRoleIds = {"随机坦克", "随机侠士", "随机游侠", "随机刺客", "随机医师"}

local options = {"坚不可摧之人",  "江湖多面手", "百步穿杨之人", "精通暗杀之人", "妙手回春之人", "算了，我暂时不打算招募了"}
local msg = string.i18_format("掌门，我准备在此处地界发布新的招贤令了，你希望招募怎样的人才?\n(当前地块发布招募令需要消耗 <color=#ff2400>银两 x {0}</color>，人才实力和当前地块发展度正相关)", cost)
local idx = show_avg_select("齐六哥", msg, options)
local ret = -1
if idx < #options then
    local role = create_save_role(selectedRoleIds[idx], roleLevel)
    if role then
        --扣钱
        add_player_money(-cost)
        instructor.gen_affix_via_develop_point(role, develop)
        local msg = string.i18_format("{0} <color=green> Lv.{1} </color> 响应了招募并加入了我们", role.Name, role.Level)
        avg_talk("齐六哥", msg)
        player_add_disciple(role, false)
        set_flag_int("随机招募次数", get_flag_int("随机招募次数") + 1)
    else
        --失败扣一半
        add_player_item("银两", -cost // 2)
        avg_talk("齐六哥", "无人应召，等过一段时间再试试吧")
    end
    ret = 0
    if not has_flag("第一次招贤纳士") then
        restore_api.add_fire_point(5)
        set_flag("第一次招贤纳士")
    end
end

return ret
