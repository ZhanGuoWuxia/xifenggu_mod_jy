local area = current_area
if not area then
    return
end

if not has_flag("尝试训练一次角色") then
    avg_talk("齐六哥", "掌门, 训练武艺会随机给予角色一些<color=#FF00FF>武学常识</color>")
    avg_talk("齐六哥", "<color=#FF00FF>武学常识</color>可用于在角色技能页面强化技能，此外角色参与战斗也可以积累<color=#FF00FF>武学常识</color>")
end

local instructor = require "Common/instructor"
local economy = require 'Common/economy'
local targetMenpai = menpai_of_area(current_area)
local disciples = disciples_of_menpai(targetMenpai)
if disciples.Count <= 0 then
    pop_tip("没有可以训练的人")
    return -1
end

::select_role::
local maxSelectCount = instructor.train_count_of_role(area.Develop)
maxSelectCount = math.min(maxSelectCount, disciples.Count)
local is_confirm, selectedRoles = multi_role_select(disciples, maxSelectCount)
if not is_confirm then
    return -1
end

if not selectedRoles or selectedRoles.Count <= 0 then
    print_error("错误, 无法获取目标角色")
    return -1
end

local cost = 0
for _, role in pairs(selectedRoles) do
    cost = cost + economy.cost_of_train_role(role)
end
local money = get_player_money()
if money < cost then
    pop_tip(string.i18_format("银两不足, 需要 <color=red>银两 x {0}</color>", cost))
    goto select_role
end

local is_ok = yes_or_no(string.i18_format("确定花费<color=red>银两 x {0}</color>进行训练？", cost))
if not is_ok then
    goto select_role
end

add_player_money(-cost)

--随机给点经验
for _, role in pairs(selectedRoles) do
    local gainedSkillExp = instructor.skill_exp_of_train_role(role)
    role.SkillExp = role.SkillExp + gainedSkillExp
    pop_tip(string.i18_format("<color=red>{0}</color>的<color=#FF00FF>武学常识</color>增加了<color=#00da2e>{1}</color>点", role.Name, gainedSkillExp))
end

if not has_flag("尝试训练一次角色") then
    restore_api.add_fire_point(5)
    set_flag("尝试训练一次角色")
end

