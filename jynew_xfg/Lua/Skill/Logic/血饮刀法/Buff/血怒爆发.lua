local buff = buff_define("血怒爆发")

--自身气血全满时，施展出的[血饮斩]暴击率提升20%
function buff:BeforeAttackerCrit(args)
    local ownerId = self:GetBuffOwnerId(args)
    if role_hp_percent(ownerId) == 1 and args.Skill:IsSkill("血饮斩") then
        args.CritParam.CritAddition = args.CritParam.CritAddition + 200
    end
end

return buff