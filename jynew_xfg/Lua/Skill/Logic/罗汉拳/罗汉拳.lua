local skill = simple_damage_skill_template("罗汉拳", stat_key.Attack, 1.2)

local function ArhatFistStunCondition(args)
    --根据内劲来计算晕眩概率
    local InnerStrength = role_stat(args.CasterId, stat_key.InnerStrength)
    local prob = formula_skill_chance(15, InnerStrength, 0.1)
    return chance(prob)
end

function skill:OnSkillHit(args)
    if ArhatFistStunCondition(args) then
        add_buff("晕眩", args.HiterId, args.CasterId, 1, 2)
    end
end

return skill