local buff = buff_define("游侠_隐匿")
--当场上还有队友存活时，提高自身闪避值

--当回合开始时
function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    --获取友方存活角色
    local allies = get_team_alive_roles( team_of_role(ownerId) )

    --判断下友方除自己外还有没有存活的目标
    if #allies > 1 then
        add_buff("游侠_隐匿", ownerId, ownerId)
    else
        remove_buff("游侠_隐匿", ownerId, ownerId)
    end
    
end

return buff