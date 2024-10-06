local buff = buff_define("机不可失")

--当身前或身旁两侧的队友闪避敌方攻击后，对露出破绽的攻击者进行刺剑追击，造成80%攻击力的外伤
function buff:OnAllyDodge(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local AttackerId = args.AttackerId
    if alive_role_of_front(OwnerId) == args.DefenderId or alive_role_of_down(OwnerId) == args.DefenderId or alive_role_of_up(OwnerId) == args.DefenderId then
        do_persue_skill(OwnerId, "机不可失", pos_of_role(AttackerId), team_of_role(AttackerId))
    end
end

function buff:OnDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    remove_buff("机不可失", OwnerId, OwnerId)
end

return buff