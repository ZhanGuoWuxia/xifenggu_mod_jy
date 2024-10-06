local buff = buff_define("血祭绝蝎甲_血毒再生")
--受到致命伤害时，若场上存在1名拥有7层及以上的中毒或流血状态的单位，则吞噬其状态，使自身继续存活，并将气血值锁定为1

function IsroleBuffPiles(args)
        --获取所有存活角色列表
        local allies = get_all_teams_alive_roles()
        for i, roleId in pairs(allies) do
            if role_buff_pile(roleId, "中毒") >= 7 then
                remove_buff("中毒", roleId,  buff_arg_owner(args))
                return true
            elseif role_buff_pile(roleId, "流血") >= 7 then
                remove_buff("流血", roleId,  buff_arg_owner(args))
                return true
            end
        end
end

function buff:OnBeforeDeath(args)
    if not IsroleBuffPiles(args) then
        return
    end
    local ownerId = self:GetBuffOwnerId(args)
    set_role_cur_hp(ownerId, 1)
    self:NotifyTriggered(args, ownerId, ownerId)
    tgr_api:tgr_bubble_text(ownerId, "吞噬血毒再生")
end

return buff
