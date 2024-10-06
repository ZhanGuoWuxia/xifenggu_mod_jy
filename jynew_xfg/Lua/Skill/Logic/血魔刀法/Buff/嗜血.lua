local buff = buff_define("嗜血")

--攻击会吸血

--每层吸血百分比
local VampirismFactor = 0.01

function buff:AfterSkillDamage(args)
    local pile = self:GetBuffPile(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local reHp = args.Damage * VampirismFactor * pile
    do_buff_heal("嗜血", OwnerId, OwnerId, reHp)
end

return buff