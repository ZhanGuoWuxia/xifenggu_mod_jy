--攻击的目标同行和同列内每有1名[<color=purple>中毒</color>]状态的单位，则对目标额外附加1层[<color=purple>中毒</color>]
local buff = buff_define("毒牙龙杖_龙牙毒侵")


--造成伤害时获取目标前后左右的单位，然后判断这些单位是否有中毒BUFF
function buff:OnDoHit(args)
    local attakerId = args.AttackerId
    local targets = args.Targets

    for _, defenderId in pairs(targets) do
        local otherRolesCol = get_other_roles_in_same_col(defenderId)
        local addPile = 0
        for _, roleId in ipairs(otherRolesCol) do
            --判断目标战斗角色上是否有buff
            if role_has_buff(roleId, "中毒") then
                addPile = addPile + 1
            end
        end

        local otherRolesRow = get_other_roles_in_same_row(defenderId)
        for _, roleId in ipairs(otherRolesRow) do
            if role_has_buff(roleId, "中毒") then
                addPile = addPile + 1
            end
        end

        if addPile > 0 then
            add_buff("中毒", defenderId, attakerId, addPile, 2)
        end
    end

end
return buff