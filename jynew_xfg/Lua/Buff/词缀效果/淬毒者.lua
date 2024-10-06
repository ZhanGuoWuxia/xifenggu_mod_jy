--对处于中毒的单位造成伤害时，施加1层易伤，持续2回合（易伤BUFF：每层受到的伤害提升1%，上限50层）
local buff = buff_define("淬毒者")

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetId = dmgInfo.TargetRoleId
    local attakerId = dmgInfo.AttackRoleId
    if role_has_buff(targetId, "中毒")  then
        add_buff("易伤", targetId, attakerId, 20, 3)
    end
end

return buff
