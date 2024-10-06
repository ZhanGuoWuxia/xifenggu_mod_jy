
local role = current_role
if not role then
    print_error("错误,无法强化角色，目标不存在")
    return false
end

if role.FatePoint <= 0  then
    pop_tip("没有足够的角色气运点数")
    return false
end

local config = require 'Role/role_upgrade_config'
local economy = require 'Common/economy'

local cost = economy.cost_of_reroll_affix()
local money = get_player_money()
local is_ok = yes_or_no(string.i18_format("此次修炼将花费<color=red>银两 x {0}</color>, 是否继续\n(继续后不会返还此次花费的银两？", cost))
if not is_ok then
    return false
end
if money < cost then
    pop_tip(string.i18_format("银两不足, 需要 <color=red>银两 x {0}</color>", cost))
    return false
end
add_player_money(-cost)

show_story_bg("bg_59.png", "角色修炼")
local success = false

local train_options =
{
    "锤炼己身",
    "参悟天地之道",
    "算了，我改主意了"
}

::selection_root::
local selectIdx = show_avg_select("", "你打算让这名角色如何修炼", train_options)
if selectIdx == 1 then
    local attr_configs = config.attr_configs
    local attr_options = attr_configs:as_selections()
    local attrIdx = show_avg_select("", "你打算强化哪种属性", attr_options)
    if attrIdx == #attr_options then
        goto selection_root
    else
        local selectattr = attr_configs.options[attrIdx].attr
        local attr_to_add = {[selectattr.attr_key] = selectattr.value}
        role.AttrsSelf = role.AttrsSelf + attr_to_add
        success = true
    end
elseif selectIdx == 2 then
    ::selection_affix::
    local selectAffixCount = 3
    local rst = show_affix_select(role, selectAffixCount)
    if rst.IsCancel then
        --取消并返回
        success = false
    else
        --选择词缀
        local affix_id = rst.AffixId
        if role:ContainsAffix(affix_id) then
            pop_tip("该角色已经领悟这个词缀了")
            success = false
            goto selection_affix
        else
            role_add_affix(role, affix_id)
            success = true
        end
    end
else
    --donothing
end


if success then
    role:ChangeFatePoint(role.FatePoint - 1)
    role:RefreshAttr()
end

hide_story_bg()

return success
