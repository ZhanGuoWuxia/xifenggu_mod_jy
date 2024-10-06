--回合结算时，额外获取的道具等
local function add_player_menpai_items()
    --制作金疮药总数量
    local JingChuangYao = 0
    --遍历玩家门派内角色列表 并获取对应的属性，然后相加到变量上
    local allRoles = roles_of_menpai(get_player_menpai())

    for i, role in pairs(allRoles) do
        --累加金疮药
        local gainedJingChuangYao = role.Attrs:GetFloat("金疮药制作")
        if gainedJingChuangYao > 0 then
            JingChuangYao = JingChuangYao + gainedJingChuangYao
        end

        --添加武学常识
        local gainedSkillExp = role.Attrs:GetFloat("武学常识获取")
        if gainedSkillExp > 0 then
            role.SkillExp = role.SkillExp + gainedSkillExp
            pop_tip(string.i18_format("<color=red>{0}</color>的<color=#FF00FF>武学常识</color>增加了<color=#00da2e>{1}</color>点", role.Name, gainedSkillExp))
        end
    end

    --获取物品
    add_player_item("金疮药", JingChuangYao)

end

return
{
    add_player_menpai_items = add_player_menpai_items
}