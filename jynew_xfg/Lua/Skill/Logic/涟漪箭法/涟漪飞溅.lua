local skill = simple_damage_skill_template("涟漪飞溅", stat_key.Attack, 1)

function skill:OnSkillHit(args)
    --获取命中角色所在列
    local hitRoleCol = col_of_role(args.HiterId)
    --获取命中角色所在行
    local hitRoleRow = row_of_role(args.HiterId)
    --获取后方的角色
    local addBuffRole = roleid_at_row_col(hitRoleRow, hitRoleCol + 1, team_of_role(args.HiterId))
    if addBuffRole then
        local buff = get_role_max_pile_debuff(args.HiterId)
        if buff then
            add_buff(buff.BuffId , addBuffRole, args.CasterId, buff.Pile, buff.LeftRound)
        end
    end
    
end

return skill