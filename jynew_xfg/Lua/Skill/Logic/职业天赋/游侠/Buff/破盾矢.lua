local buff = buff_define("游侠_破盾矢")

local shieldClearFactor = 0.8
--伤害造成暴击后，清除目标80%护盾值
function buff:OnDoCrit(args)
    for _, targetId in pairs(args.Targets) do
        --获取角色护盾值
        local RoleShield = role_stat(targetId, stat_key.Shield)
        role_add_shield(targetId , -(RoleShield * shieldClearFactor))
    end
end



return buff