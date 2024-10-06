local buff = buff_define("寒流贯脉")

--造成伤害时将寒流打入目标体内,刺入经脉,使目标减少5点内力。
local reduceMp = -5
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetId = dmgInfo.TargetRoleId
    local attakerId = dmgInfo.AttackRoleId
    
    self:TryDoBuffMpChange(args, attakerId, targetId, reduceMp)
end

return buff
