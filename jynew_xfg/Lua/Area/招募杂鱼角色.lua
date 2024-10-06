local economy = require 'Common/economy'

local function recruit_fellow(roleId, recruit_msg)
    local area = current_area
    local additionLevel = economy.addition_role_level_of_develop(area)
    local finalLevel = math.min(default_level_of_role(roleId) + additionLevel, MaxRoleLevel)
    local cost = economy.cost_of_recruit_role(finalLevel)

    local msg = string.i18_format("当前招募将花费 银两 x {0}\n是否继续", cost)
    local is_ok = yes_or_no(msg)
    if not is_ok then
        return false
    end

    if cost > get_player_money() then
        pop_tip("没有足够的银两")
        return false
    end

    local role = create_save_role(roleId)
    if not role then
        pop_tip("错误，未找到该角色配置")
        return false
    end
    add_player_money(-cost)
    recruit_msg = recruit_msg or i18n_text("久闻(player:fname)掌门大名, 我愿拜入你门下")
    avg_talk(role, recruit_msg)
    avg_talk("齐六哥", string.i18_format("{0} <color=green> Lv.{1} </color> 加入了我们的复兴大业", role.Name, role.Level))
    player_add_disciple(role, false)
    return true
end

return {
    recruit_fellow = recruit_fellow
}