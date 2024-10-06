--造成{{[stat:atk] * 0.8}}攻击力的外伤，命中敌方后为自身添加1层[艮]。
local skill = simple_damage_skill_template("破岳", stat_key.Attack, 0.75)

function skill:OnSkillHit(args)
    local ownerId = args.CasterId
    add_buff( "艮", ownerId, ownerId, 1)
end

return skill