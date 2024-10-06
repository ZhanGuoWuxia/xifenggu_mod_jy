local buff = buff_define("蟾毒之气")
--释放[蛤蟆功]招式后，吐出蟾毒令敌方全体[中毒]3层

function buff:AfterSkillCast(args)
    if not args.Skill:IsSkill("蛤蟆功") then 
        return
    end
    local ownerId = self:GetBuffOwnerId(args)
    local enemyAllies = get_team_alive_roles(enemy_team_of_role(ownerId))
    add_buff_to_roles("中毒", enemyAllies, ownerId ,3 ,2)
end

return buff