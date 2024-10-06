local buff = buff_define("破风式痕")

--成功概率
local probability = 50
--增加伤害比
local PlusDamageRatio = 0.05
--附加的BUFF ID
local BuffId = "刀痕"
--最大层数
local MaxMomentumCount = 10

--目标每有一层[刀痕]，释放破风式斩时对其提升5%伤害
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo

    --判断 伤害来源是不是破风刀法，不是的话直接出去
    if not dmgInfo.SourceSkillId == "破风击" and not dmgInfo.SourceSkillId == "破风式斩" and not dmgInfo.SourceSkillId == "风影千重斩" then
        return
    end

    --如果目标身上有刀痕buff，则对其提升伤害
    if role_has_buff(dmgInfo.TargetRoleId, BuffId) then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio * role_buff_pile(dmgInfo.TargetRoleId, BuffId)
    end
end

--所有攻击有50%概率对目标叠加1层刀痕(上限10层)
function buff:OnDoHit(args)
    if chance(probability) then
        for _, targetId in pairs(args.Targets) do
            if role_buff_pile(targetId, BuffId) <= MaxMomentumCount then
                add_buff(BuffId, targetId, args.AttackerId, 1, -1)
            end
        end
    end
end

return buff