local skill = simple_damage_skill_template("血腥斩", stat_key.Attack, 1)

local isSkillLevel = 4

--通过不断战斗精炼屠戮技艺。血腥斩附加流血状态的概率提升至50%
function skill:OnSkillHit(args)
    local pile = args.Skill.SkillLevel >= isSkillLevel and 2 or 1
    add_buff("流血", args.HiterId, args.CasterId, pile, 3)
end

return skill