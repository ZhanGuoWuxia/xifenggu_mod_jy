local buff = buff_define("医师_蛊毒手艺")

--普攻附带1层中毒效果，持续2回合
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetId = dmgInfo.TargetRoleId
    local attakerId = dmgInfo.AttackRoleId
    if dmgInfo:IsNormalAtk() then
        add_buff("中毒", targetId, attakerId, 1, 2)
    end
end

return buff