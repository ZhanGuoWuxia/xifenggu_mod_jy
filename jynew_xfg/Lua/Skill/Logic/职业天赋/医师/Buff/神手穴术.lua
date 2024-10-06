local buff = buff_define("医师_神手穴术")

--普攻附带1层封脉效果，持续2回合
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetId = dmgInfo.TargetRoleId
    local attakerId = dmgInfo.AttackRoleId
    if dmgInfo:IsNormalAtk() then
        add_buff("封脉", targetId, attakerId, 1, 2)
    end
end

return buff