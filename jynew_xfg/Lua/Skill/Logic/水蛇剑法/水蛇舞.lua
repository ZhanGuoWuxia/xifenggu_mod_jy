local skill = simple_damage_skill_template("水蛇舞", stat_key.Attack, 0.7, 0.1)

local prob = 30

function skill:OnSkillHit(args)
    if chance(prob) then
        add_buff("蛇媚之息", args.HiterId, args.CasterId, 1, 2)
    end
end

return skill
