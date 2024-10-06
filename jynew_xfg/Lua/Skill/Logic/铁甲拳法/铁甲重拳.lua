local skill = simple_damage_skill_template("铁甲重拳", stat_key.Attack, 1.2)
--对目标造成{{[stat:atk] * 1.2}}点外伤，若目标存在[眩晕]状态，自身获得20%最大气血值护盾

local shieldFactor = 0.2
function skill:OnSkillHit(args)
    if role_has_buff(args.HiterId, "晕眩") then
        local shield = role_stat(args.CasterId, stat_key.MaxHp) * shieldFactor
        role_add_shield(args.CasterId, shield)
    end
end

return skill