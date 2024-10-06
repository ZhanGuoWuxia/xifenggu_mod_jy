--出手雷声阵阵，对目标及其身后的一名敌人造成{{[stat:atk] * 0.5}}攻击力的外功伤害，命中后为自身添加1层[震]。
local skill = simple_damage_skill_template("震雷掌", stat_key.Attack, 0.5)

function skill:OnSkillHit(args)
    local CasterId = args.CasterId
    add_buff( "震", CasterId, CasterId, 1)
end

return skill