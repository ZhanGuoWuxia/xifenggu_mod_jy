local buff = buff_define("剧毒蜘蛛_毒蛛临终")

--被击败时剧毒蜘蛛会释放其最后的毒液，使全场单位中毒2层
function buff:OnDeath(args)
    --获取所有存活角色列表
    local allies = get_all_teams_alive_roles()
    for i, roleId in pairs(allies) do
        add_buff("中毒", roleId, buff_arg_owner(args), 2, 3)
    end
end

return buff