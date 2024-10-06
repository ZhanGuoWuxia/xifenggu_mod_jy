--招架成功后,回复自身5%最大生命值
local buff = buff_define("守护兽的祝福")

local reHpFactor = 0.05

--若触发招架
function buff:OnParry(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local reHp = role_stat(OwnerId, stat_key.MaxHp) * reHpFactor
    do_buff_heal("守护兽的祝福", OwnerId, OwnerId, reHp)
end

return buff