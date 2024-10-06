local buff = buff_define("虎啸弓_虎啸")
--若攻击被目标招架，有30%几率使其晕眩1回合

local probability = 30

function buff:OnBeParried(args)
    local ownerId = self:GetBuffOwnerId(args)

    for i, roleId in pairs(args.Targets) do
        if chance(probability) then
            add_buff("晕眩", roleId, ownerId, 1, 1)
        end
    end
end

return buff