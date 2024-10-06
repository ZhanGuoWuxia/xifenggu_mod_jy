local buff = buff_define("铁卫_不屈")
--受到致命伤时，根据防御加韧性属性，有概率不退场，并瞬间回复10%生命值，一场战斗至多触发2次
local restoreHpFactor = 0.1

--计算概率，如果防御+韧性为1000 = 1000*0.01=10%概率
local prob_factor = 0.01
local function buff_chance(args)
    local prob = prob_factor * ( role_stat(buff_arg_owner(args), stat_key.Defense)  + role_stat(buff_arg_owner(args), stat_key.Tenacity) )
    return chance(prob)
end

function buff:OnBeforeDeath(args)
    if not buff_chance(args) then
        return
    end

    local ownerId = self:GetBuffOwnerId(args)
    if role_buff_pile(ownerId,"铁卫_不屈次数") >= 2 then
        return
    end

    local restoreHp = role_stat(ownerId, stat_key.MaxHp) * restoreHpFactor
    set_role_cur_hp(ownerId, restoreHp)
    add_buff("铁卫_不屈次数",ownerId,ownerId)
    self:NotifyTriggered(args, ownerId, ownerId)
end

return buff
