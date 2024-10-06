local skill = simple_damage_skill_template("医师_毒雾弥漫", stat_key.InnerStrength, 0.25)


--对敌方全部造成{{[stat:int] * 0.5}}的内伤，有{{[stat:int] * 0.15}}%概率使敌方单位中毒3回合
function skill:OnSkillHit(args)
    local prob = role_stat(args.CasterId, stat_key.InnerStrength) * 0.15

    if chance(prob) then
        add_buff("中毒", args.HiterId, args.CasterId, 1, 3)
    end
end

return skill