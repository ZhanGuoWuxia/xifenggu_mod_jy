--每次对目标造成伤害时，有30%的概率击散目标3点内力
local buff = buff_define("散功助手")
local probability = 30
local reduceMp = -3

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetId = dmgInfo.TargetRoleId
    local attakerId = dmgInfo.AttackRoleId
    if chance(probability)  then
        self:TryDoBuffMpChange(args, attakerId, targetId, reduceMp)
    end
end

return buff
