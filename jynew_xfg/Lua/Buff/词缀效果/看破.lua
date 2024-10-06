local buff = buff_define("看破")
local probability = 30

--当招架成功时，有30%的概率清除自身一个减益buff
function buff:OnParry(args)
    local OwnerId = self:GetBuffOwnerId(args)
    if chance(probability) then
        dispel_random_debuffs(OwnerId, OwnerId, 1)
    end
end

return buff
