local buff = buff_define("火钳留命")
--如果受到致命伤，有({{[stat:ten] * 0.05}}%)的概率免疫此次死亡，并将生命值锁定为1。
local ten2prob_factor = 0.05
local function buff_chance(args)
    local prob = ten2prob_factor * role_stat(buff_arg_owner(args), stat_key.Tenacity)
    return chance(prob)
end

function buff:OnBeforeDeath(args)
    if not buff_chance(args) then
        return
    end
    local ownerId = self:GetBuffOwnerId(args)
    set_role_cur_hp(ownerId, 1)
    self:NotifyTriggered(args, ownerId, ownerId)
end

return buff
