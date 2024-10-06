local skill = simple_damage_skill_template("骤雨寒冰拳", stat_key.Attack, 0.5)

local prob = 30

function skill:OnSkillHit(args)
    if chance(prob) then
        add_buff("冰封三尺", args.HiterId, args.CasterId, 1, 2)
    end
end


return skill
