local buff = buff_define("铁壁")

function buff:OnReceiveShield(args)
    local ownerId = self:GetBuffOwnerId(args)
    if role_stat(ownerId, stat_key.Shield) > get_role_buff_int(ownerId, "铁壁记录", "之前护盾") and get_role_buff_int(ownerId, "铁壁记录", "护盾消耗完了") < 1 then
        local shieldExp = get_role_buff_int(ownerId, "铁壁记录", "护盾消耗")
        shieldExp = shieldExp + args.AbsorbShield
        if shieldExp > 0 then
            set_role_buff_int(ownerId, "铁壁记录", "护盾消耗", shieldExp)
            --如果 护盾消耗 大于 增加的护盾了，记录下
            if get_role_buff_int(ownerId, "铁壁记录", "护盾消耗") >= get_role_buff_int(ownerId, "铁壁记录", "护盾增加值") then
                set_role_buff_int(ownerId, "铁壁记录", "护盾消耗完了", 1)
            end
        end
    end
    set_role_buff_int(ownerId, "铁壁记录", "护盾没被一次砍光", 1)
end

--buff移除时，如果 护盾没有消耗完 就扣除
function buff:OnRemove(args)
    local ownerId = self:GetBuffOwnerId(args)
    if get_role_buff_int(ownerId, "铁壁记录", "护盾消耗完了") < 1 and get_role_buff_int(ownerId, "铁壁记录", "护盾没被一次砍没") == 1 then
        role_add_shield(ownerId, -(get_role_buff_int(ownerId, "铁壁记录", "护盾增加值") - get_role_buff_int(ownerId, "铁壁记录", "护盾消耗")))
    end
    remove_buff("铁壁记录", ownerId, ownerId)
end

return buff