local buff = buff_define("夺命钩监听")

--使用[隐刃钩]命中目标后
function buff:AfterSkillDamage(args)
    if not args.Skill:IsSkill("隐刃钩") then
        return
    end
    local ownerId = self:GetBuffOwnerId(args)
    local defenderId = args.DefenderId
    
    --获取角色后方的存活角色
    local defBackRoleId = alive_role_of_back(defenderId)
    if defBackRoleId == -1 then
        return
    end
    if role_has_buff(buff_arg_owner(args), "钩爪蚀骨") then
        local addBuff = get_role_classId(defBackRoleId) == "医师" and "蚀骨_治疗" or "蚀骨_受疗"
        add_buff(addBuff, defBackRoleId, ownerId, 1, 3)
    end
    do_persue_skill(ownerId, "夺命钩", pos_of_role(defBackRoleId), enemy_team_of_role(ownerId))
end

return buff