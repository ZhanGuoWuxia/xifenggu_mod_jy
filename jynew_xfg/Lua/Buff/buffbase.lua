
local buffbase = class("buffbase")

---注意:所有Buff事件回调都包含默认参数如下
---@param args.buff BattleBuffInstance 触发事件的buff实例对象
---@param args.turn int 触发该事件的当前回合


function buffbase:GetRegisterEvents()
    --只找子类中重载过的事件回调函数 忽略掉class中定义的方法
    local res = {}
    for k in pairs(self) do
       local func = rawget(self, k)
       if type(func) == "function" and not (k == "create" or k == "new") and buffbase[k] then
            res[#res + 1] = k
       end
    end
    return res
end

function buffbase:GetBuffOwnerId(args)
    return buff_arg_owner(args)
end

function buffbase:GetBuffLastCasterId(args)
    return buff_arg_caster(args)
end

function buffbase:GetBuffPile(args)
    return buff_arg_pile(args)
end

function buffbase:TryDoBuffDamage(args, performRoleId, targetRoleId, dmgValue, dmgType)
    do_buff_damage(args.buff.BuffId, performRoleId, targetRoleId, dmgValue, dmgType)
end

function buffbase:TryDoBuffHeal(args, performRoleId, targetRoleId, healValue)
    do_buff_heal(args.buff.BuffId, performRoleId, targetRoleId, healValue)
end

function buffbase:TryDoBuffMpChange(args, performRoleId, targetRoleId, changeValue)
    do_buff_Mp(args.buff.BuffId, performRoleId, targetRoleId, changeValue)
end

--通知下该buff触发了, 一般不怎么调用，除非需要告知表现层额外表现触发特效之类的
function buffbase:NotifyTriggered(args, performRoleId, targetRoleId)
    local buffId = args.buff.BuffId
    performRoleId = performRoleId or self:GetBuffOwnerId(args)
    targetRoleId = targetRoleId or self:GetBuffOwnerId(args)
    notify_buff_triggered(buffId, performRoleId, targetRoleId)
end

--当Buff添加到目标身上时 类似Unity的OnAwake
function buffbase:OnAdd(args)

end

--当回合开始时
function buffbase:OnRoundStart(args)
end

--当回合结束时
function buffbase:OnRoundEnd(args)

end

--当内置间隔触发时 类似每回合的Tick
function buffbase:OnThink(args)

end

--在buff携带者（攻击方）命中判定前
---@param args.HitParam.AttackerId int 攻击者Id
---@param args.HitParam.DefenderId int 防御者Id
---@param args.HitParam.DodgeAddition int 闪避修正值
---@param args.HitParam.AntiDodgeAddition int 破闪避修正值
---@param args.HitParam.ParryAddition int 格挡修正值
---@param args.HitParam.AntiParryAddition int 破格档修正值
---@param args.HitParam.DodgeScale float 闪避值计算缩放修正
---@param args.HitParam.ParryScale float 格挡值计算缩放修正
---@param args.Skill BattleSkillInstance 对应的武学招式实例
function buffbase:BeforeAttackerHit(args)

end

--在buff携带者（防御方）命中判定前
---@param args.HitParam.AttackerId int 攻击者Id
---@param args.HitParam.DefenderId int 防御者Id
---@param args.HitParam.DodgeAddition int 闪避修正值
---@param args.HitParam.AntiDodgeAddition int 破闪避修正值
---@param args.HitParam.ParryAddition int 格挡修正值
---@param args.HitParam.AntiParryAddition int 破格档修正值
---@param args.HitParam.DodgeScale float 闪避值计算缩放修正
---@param args.HitParam.ParryScale float 格挡值计算缩放修正
---@param args.Skill BattleSkillInstance 对应的武学招式实例
function buffbase:BeforeDefenderHit(args)

end


--当Buff携带者使用治疗技能造成命中时
---@param args table 参数表
---@param args.Skill BattleSkillInstance 技能实例
---@param args.HealerId int 治疗者Id
---@param args.Targets IEnumrable<int>  治疗的所有目标
function buffbase:OnDoSkillHeal(args)

end


--当Buff携带者使用伤害技能造成命中时
---@param args table 参数表
---@param args.Skill BattleSkillInstance 技能实例
---@param args.AttackerId int 攻击者Id
---@param args.Targets IEnumrable<int>  命中的所有受击者Id
function buffbase:OnDoHit(args)

end

--当Buff携带者被伤害技能命中时
function buffbase:OnHit(args)

end

--当Buff携带者被闪避
function buffbase:OnBeDodged(args)

end

--当Buff携带者闪避
function buffbase:OnDodge(args)

end

--当Buff携带者队友闪避
---@param args.Skill BattleSkillInstance 闪避的技能实例
---@param args.AttackerId int 攻击者Id
---@param args.DefenderId int 闪避者Id
---@param args.DamageInfo DamageInfo 伤害信息类,详见 DamageResult.cs
function buffbase:OnAllyDodge(args)

end

--当Buff携带者被招架时
---@param args.Skill BattleSkillInstance 被招架的技能实例
---@param AttackerId int 攻击者Id
---@param Targets HashSet<int> 招架者Id列表
function buffbase:OnBeParried(args)

end

--当Buff携带者招架
function buffbase:OnParry(args)

end

--当Buff携带者受到伤害前
---@param args.DamageInfo DamageInfo 伤害信息类,详见 DamageResult.cs
function buffbase:BeforeReceiveDamage(args)

end

--当Buff携带者造成伤害前
---@param args.DamageInfo DamageInfo 伤害信息类,详见 DamageResult.cs
function buffbase:BeforeGiveDamage(args)

end

--当Buff携带者受到伤害 但全被护盾吸收时
---@param args.DamageInfo DamageInfo 伤害信息类,详见 DamageResult.cs
---@param args.AbsorbShield 护盾吸收的伤害
function buffbase:OnReceiveShield(args)

end

--当Buff携带者受到伤害生效时
---@param args.DamageInfo DamageInfo 伤害信息类,详见 DamageResult.cs
---@param args.ActualDamage 受到的实际伤害
function buffbase:OnReceiveDamage(args)

end

--当Buff携带者造成伤害生效时
---@param args.DamageInfo DamageInfo 伤害信息类,详见 DamageResult.cs
---@param args.ActualDamage 造成的实际伤害
function buffbase:OnGiveDamage(args)

end


--当Buff列携带者使用技能造成伤害后
---@param args.AttackerId int 攻击者Id
---@param args.DefenderId int 防御者Id
---@param args.Skill BattleSkillInstance 技能实例
---@param args.Damage int 实际伤害
function buffbase:AfterSkillDamage(args)

end

--当Buff携带者施放技能前（普攻也会触发）
---@param args.CasterId int 施法者Id
---@param args.Skill BattleSkillInstance 技能实例
---@param args.TargetParam.Targets List<int> 目标id列表
---@param args.TargetParam.CastTeamSide int 目标队伍
---@param args.TargetParam.CastPosition int 施放第一位置
function buffbase:BeforeSkillCast(args)

end

--当Buff携带者施放技能后（普攻也会触发）
---@param args.CasterId int 施法者Id
---@param args.Skill BattleSkillInstance 技能实例
---@param args.TargetParam.Targets List<int> 目标id列表
---@param args.TargetParam.CastTeamSide int 目标队伍
---@param args.TargetParam.CastPosition int 施放第一位置
function buffbase:AfterSkillCast(args)

end

--当Buff携带者出手攻击时
function buffbase:OnAttack(args)

end

--当Buff携带者的队友出手时
function buffbase:OnAllyAttack(args)

end

--当Buff携带者队友被攻击时
function buffbase:OnAllyBeAttacked(args)

end

--当Buff携带者完成技能攻击后
function buffbase:OnFinishSkillAttack(args)

end

--当Buff携带者即将死亡时
---@param args.KillRoleId int 击杀者Id
---@param args.DeathRoleId int 被击杀者Id
function buffbase:OnBeforeDeath(args)

end

---@class DeathResult
---@field KillRoleId int 击杀者Id
---@field DeathReason Reason 击杀原因, Skill为技能击杀，Buff为Buff击杀
---@field ReasonSourceId string 击杀来源Id, 一般是技能Id或者BuffId
---@field DeathRoleId int 被击杀者Id

--当除Buff携带者以外的人被击杀时
---@param args.DeathResult DeathResult 死亡信息
function buffbase:OnOtherDeath(args)

end

--当Buff携带者死亡时
---@param args.DeathResult DeathResult 死亡信息
function buffbase:OnDeath(args)

end

--当Buff携带者造成击杀时
---@param args.DeathResult DeathResult 死亡信息
function buffbase:OnKill(args)

end

--在buff携带者（攻击方）暴击判定前 可对CritParam进行修改来影响暴击计算结果
---@param args.CritParam.AttackerId int 攻击者Id
---@param args.CritParam.DefenderId int 防御者Id
---@param args.CritParam.CritAddition int 附加暴击计算值
---@param args.CritParam.CritDefAddition int 附加暴抗计算值
---@param args.CritParam.CritScale float 暴击计算缩放
---@param args.Skill BattleSkillInstance 对应的武学招式实例
function buffbase:BeforeAttackerCrit(args)

end

--在buff携带者（防御方）暴击判定前 可对CritParam进行修改来影响暴击计算结果
---@param args.CritParam.AttackerId int 攻击者Id
---@param args.CritParam.DefenderId int 防御者Id
---@param args.CritParam.CritAddition int 附加暴击计算值
---@param args.CritParam.CritDefAddition int 附加暴抗计算值
---@param args.CritParam.CritScale float 暴击计算缩放
---@param args.Skill BattleSkillInstance 对应的武学招式实例
function buffbase:BeforeDefenderCrit(args)

end

--在buff携带者（攻击方）暴击判定后
---@param args.CritRet CriticalRet 暴击结果枚举
---@param args.AttackerId int 攻击者Id
---@param args.DefenderId int 防御者Id
---@param args.Skill BattleSkillInstance 对应的武学招式实例
function buffbase:AfterAttackerCrit(args)

end

--在buff携带者（防御方）暴击判定后
---@param args.CritRet CriticalRet 暴击结果枚举
---@param args.AttackerId int 攻击者Id
---@param args.DefenderId int 防御者Id
---@param args.Skill BattleSkillInstance 对应的武学招式实例
function buffbase:AfterDefenderCrit(args)

end


--当Buff携带者攻击造成暴击
---@param args.Skill BattleSkillInstance 对应的武学招式实例
---@param args.AttackerId int 攻击者Id
function buffbase:OnDoCrit(args)

end

--当Buff携带者队友暴击
function buffbase:OnAllyDoCrit(args)

end

--当Buff携带者技能暴击但是被抵抗时
function buffbase:OnCritBeResisted(args)

end


--当Buff携带者当前生命值变化
function buffbase:OnHpChange(args)

end

--当Buff携带者当前护盾值变化
function buffbase:OnShieldChange(args)

end

--当Buff携带者恢复生命前
---@param args.RecoverResult RecoverResult 恢复结构体
function buffbase:BeforeRecoverHp(args)

end

--当Buff携带者治疗他人前
---@param args.RecoverResult RecoverResult 恢复结构体
function buffbase:BeforeHealHp(args)

end

--当Buff携带者恢复生命时
---@param args.HealerId int 治疗者
---@param args.HealReceiverId int 被治疗者
---@param args.SkillId string  治疗的技能Id(若为技能治疗)
---@param args.BuffId string  治疗的来源BuffId(若为Buff治疗)
---@param args.ReHp float 恢复量
function buffbase:OnRecoverHp(args)

end

--当Buff携带者恢复内力时
---@param args.ReMp float 恢复量
function buffbase:OnRecoverMp(args)

end

--当Buff从目标身上移除时 类似Unity的OnDestroy
function buffbase:OnRemove(args)

end

return buffbase
