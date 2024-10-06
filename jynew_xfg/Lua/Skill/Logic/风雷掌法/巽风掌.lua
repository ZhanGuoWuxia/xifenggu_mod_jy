--一次迅猛的拍掌, 造成{{[stat:atk] * 0.7}}攻击力的外伤，命中敌方后为自身添加1层[巽]。
local skill = simple_damage_skill_template("巽风掌", stat_key.Attack, 0.7)

function skill:OnSkillHit(args)
    local ownerId = args.CasterId
    add_buff( "巽", ownerId, ownerId, 1, 2)
end

return skill