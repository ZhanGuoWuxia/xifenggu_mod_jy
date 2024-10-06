
local buff = buff_define("奉龙")

--目标成功闪避后恢复已损失生命值30%的血量，并降低1点层数，受到伤害后会失去层数效果
local reHpmultipier = 0.3

--若触发招架
function buff:OnDodge(args)


    local OwnerId = self:GetBuffOwnerId(args)
    local attakerId = args.AttackerId
    local reHp = role_stat(OwnerId, stat_key.MaxHp) * role_losed_hp_percent(OwnerId) * reHpmultipier
    self:TryDoBuffHeal(args, OwnerId, OwnerId, reHp)
    change_buff_pile(OwnerId, "奉龙", -1)
    if role_buff_pile(OwnerId, "奉龙") <= 0 then
        remove_buff("奉龙", OwnerId, attakerId)
    end
end

function buff:OnHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    remove_buff("奉龙", ownerId, ownerId)
end

return buff