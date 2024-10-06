local skill = simple_damage_skill_template("流云箭影", stat_key.Attack, 0.7, 0.1)

local prob = 30

function skill:OnSkillHit(args)
    if chance(prob) then
        add_buff("命中弱化", args.HiterId, args.CasterId, 5, 1)
    end
end

return skill