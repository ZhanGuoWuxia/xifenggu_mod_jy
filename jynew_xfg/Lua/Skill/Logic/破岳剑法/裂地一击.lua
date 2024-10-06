--对目标一整行造成{{[stat:atk] * 0.3}}的外伤，并附加[裂地]效果,使目标防御力降低一回合。
local skill = simple_damage_skill_template("破岳", stat_key.Attack, 0.3)

function skill:OnSkillHit(args)
    local CasterId = args.CasterId
    local targetId = args.HiterId
    add_buff( "裂地", targetId, CasterId, 1)
end

return skill