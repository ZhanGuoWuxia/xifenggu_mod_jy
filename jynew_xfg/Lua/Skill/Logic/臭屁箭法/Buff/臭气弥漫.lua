local buff = buff_define("臭气弥漫")

--臭屁会影响到目标周围的单位，但只会令其感受到些许[恶心]
function buff:OnDoHit(args)
    if not args.Skill:IsSkill("臭屁箭") then
        return
    end
    local ownerId = self:GetBuffOwnerId(args)
    for _, targetId in pairs(args.Targets) do
        add_buff("恶心", alive_role_of_up(targetId), ownerId, 1, 2)
        add_buff("恶心", alive_role_of_down(targetId), ownerId, 1, 2)
        add_buff("恶心", alive_role_of_front(targetId), ownerId, 1, 2)
        add_buff("恶心", alive_role_of_back(targetId), ownerId, 1, 2)
    end
end

return buff