local buff = buff_define("迷魂步")
--造成伤害前，目标每有1种减益状态，则此次伤害命中率提升5%

function buff:BeforeAttackerHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    args.HitParam.AntiDodgeAddition = args.HitParam.AntiDodgeAddition + get_role_debuffs_amount(args.HitParam.DefenderId) * 50
end

return buff