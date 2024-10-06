local buff = buff_define("蝮蛇弓_蛇袭")

--攻击命中敌方时，敌方获得一层[蛇之创伤], 降低一定闪避
function buff:OnDoHit(args)
    local OwnerId = self:GetBuffOwnerId(args)
    add_buff_to_roles("蝮蛇弓_蛇之创伤", args.Targets, OwnerId, 1 , 2)
end

return buff
