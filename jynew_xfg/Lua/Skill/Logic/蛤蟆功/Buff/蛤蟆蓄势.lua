local buff = buff_define("蛤蟆蓄势")

function buff:AfterSkillCast(args)
    if not args.Skill:IsSkill("蛤蟆功") then 
        return
    end
    local ownerId = self:GetBuffOwnerId(args)
    add_buff("蛤蟆功", ownerId, ownerId, 1, 2)
end

return buff