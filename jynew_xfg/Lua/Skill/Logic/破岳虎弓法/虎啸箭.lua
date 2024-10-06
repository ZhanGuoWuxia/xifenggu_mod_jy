local skill = simple_damage_skill_template("虎啸箭", stat_key.Attack, 1, 0.1)

local prob = 30

function skill:OnSkillHit(args)
    if chance(prob) then
        add_buff("招架弱化", args.HiterId, args.CasterId, 10, 2)
    end
end

return skill