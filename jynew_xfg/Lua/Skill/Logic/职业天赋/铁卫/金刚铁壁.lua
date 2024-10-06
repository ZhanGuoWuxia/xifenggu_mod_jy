local skill = skill_define("铁卫_金刚铁壁")
--举起巨盾为自己及处于后面的单位提供护盾，护盾值基于释放者自身最大生命值的10%
local HpFactor = 0.1

function skill:OnCast(args)
    local AddShieldValue = role_stat(args.CasterId, stat_key.MaxHp) * HpFactor
    role_add_shield(args.CasterId, AddShieldValue)

    --如果处在第一列，则为身后的两名单位添加护盾
    if (pos_of_role(args.CasterId)==0 or 3 or 6) then
        role_add_shield( roleid_at_pos((pos_of_role(args.CasterId)+1),team_of_role(args.CasterId)), AddShieldValue)
        role_add_shield( roleid_at_pos((pos_of_role(args.CasterId)+2),team_of_role(args.CasterId)), AddShieldValue)
    --处在第二列，则为身后的单位添加护盾
    elseif (pos_of_role(args.CasterId)==1 or 4 or 7) then
        role_add_shield( roleid_at_pos((pos_of_role(args.CasterId)+1),team_of_role(args.CasterId)), AddShieldValue)
    end

end

return skill