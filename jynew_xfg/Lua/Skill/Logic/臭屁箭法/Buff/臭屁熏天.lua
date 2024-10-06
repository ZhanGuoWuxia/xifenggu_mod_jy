local buff = buff_define("臭屁熏天")

--[臭屁箭]会令主目标呕吐不止，持续2回合[内息凌乱]无法施展任何需要内力的招式
function buff:OnDoHit(args)
    if not args.Skill:IsSkill("臭屁箭") then
        return
    end
    local ownerId = self:GetBuffOwnerId(args)
    add_buff_to_roles("内息凌乱", args.Targets, ownerId, 1 , 2)
end

return buff