local skill = simple_damage_skill_template("猎鹰破空", stat_key.Attack, 0.8)

function skill:OnSkillHit(args)
    local prob = role_stat(args.CasterId, stat_key.Crit) * 0.04 + role_stat(args.CasterId, stat_key.Speed) * 0.04
    if chance( prob ) then
        add_buff("易伤", args.HiterId, args.CasterId, 20, 2)
    end
end

return skill