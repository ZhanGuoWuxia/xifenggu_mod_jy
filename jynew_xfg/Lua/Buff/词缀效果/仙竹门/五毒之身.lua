local buff = buff_define("五毒之身")

--被气血值高于自身的目标攻击时，会令其染上持续2回合的[瘴毒]状态，该减益会令攻击者每次恢复气血时令其中毒2回合
function buff:OnHit(args)
    local attakerId = args.AttackerId
    local ownerId = self:GetBuffOwnerId(args)
    if role_stat(attakerId, stat_key.CurrentHp) > role_stat(ownerId, stat_key.CurrentHp) then
        add_buff("瘴毒", attakerId, ownerId, 1, 2)
    end
end

return buff