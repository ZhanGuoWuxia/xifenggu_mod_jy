---NormalAtk:普攻 Proactive:主动技 Passive:被动技
local SkillFormType = CS.ZhanGuoWuxia.Backend.Beans.SkillFormType

local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType
local DamageSourceType = CS.ZhanGuoWuxia.Backend.Battle.Data.DamageSourceType
local BattleRecoverType = CS.ZhanGuoWuxia.Backend.Battle.Data.BattleRecoverType
local RecoverSourceType = CS.ZhanGuoWuxia.Backend.Battle.Data.RecoverSourceType
local ActionHitType = CS.ZhanGuoWuxia.Backend.Battle.Data.ActionHitType
local CritType = CS.ZhanGuoWuxia.Backend.Battle.Data.CriticalRet
local BuffActionType = CS.ZhanGuoWuxia.Backend.Battle.Data.BuffActionType
local IsTypeOfSkillForm = game_api.IsTypeOfSkillForm
local BlockInBatlle = game_api.BlockInBatlle


function skill_define(skillName)
    return class(skillName, require("Skill/skillbase"))
end


--简单的技能定义
---@param skillName string 技能名
---@param statNameForDamage string 伤害或者治疗基于的属性
---@param damageScaleFactor float 属性缩放系数
---@param fluctuationRange float 波动系数 比如0.2就是随机上下波动20%
local function simple_skill(skillName, statNameForDamage, damageScaleFactor, fluctuationRange)
    local skill = skill_define(skillName)
    --默认值
    statNameForDamage = statNameForDamage or stat_key.Attack
    damageScaleFactor = damageScaleFactor or 1
    fluctuationRange = fluctuationRange and math.abs(fluctuationRange) or 0.05 --默认上下波动5%
    --伤害
    skill.GetSkillDamage = function(self, args)
        local dmg = role_stat(args.CasterId, statNameForDamage) * damageScaleFactor
        local randomscale = (1 + fluctuationRange * math.sin(math.random() * math.pi * 2))
        print("伤害 <" .. statNameForDamage .. "> :" .. dmg)
        print("伤害波动缩放:" .. randomscale)
        dmg = dmg * randomscale
        return dmg
    end
    return skill
end

--简单的伤害性技能定义
---@param skillName string 技能名
---@param statNameForDamage string 伤害基于的属性
---@param damageScaleFactor float 属性缩放系数
---@param fluctuationRange float 伤害波动系数 比如0.2就是随机上下波动20%
function simple_damage_skill_template(skillName, statNameForDamage, damageScaleFactor, fluctuationRange)
    local skill = simple_skill(skillName, statNameForDamage, damageScaleFactor, fluctuationRange)
    --施加伤害
    skill.OnCast = function(self, args)
        self:TryDoSkillDamage(args)
    end
    return skill
end

--简单的治疗性技能定义
---@param skillName string 技能名
---@param statNameForDamage string 伤害基于的属性
---@param damageScaleFactor float 属性缩放系数
---@param fluctuationRange float 伤害波动系数 比如0.2就是随机上下波动20%
function simple_heal_skill_template(skillName, statNameForDamage, damageScaleFactor, fluctuationRange)
    local skill = simple_skill(skillName, statNameForDamage, damageScaleFactor, fluctuationRange)
    --施加伤害
    skill.OnCast = function(self, args)
        self:TryDoSkillHeal(args)
    end
    return skill
end


--判断是否为普通攻击
function is_normal_atk(skillId)
    return IsTypeOfSkillForm(skillId, SkillFormType.NormalAtk)
end

--让一个指定角色执行反击技
---@param roleId int 战斗角色InstanceId，一般从回调里的arg传入
---@param skillId string 目标角色身上要执行的技能Id
---@param CastPosition int 施放位置
---@param TeamSide int 哪一边 0 左侧队伍 1 右侧队伍
function do_counter_skill(roleId, skillId, CastPosition, TeamSide)
    local caster = get_battle_role(roleId)
    if not caster then
        return
    end
    caster:PrepareCounter(skillId, CastPosition, TeamSide)
end

--让一个指定角色执行追击技
---@param roleId int 战斗角色InstanceId，一般从回调里的arg传入
---@param skillId string 目标角色身上要执行的技能Id
---@param CastPosition int 施放位置
---@param TeamSide int 哪一边 0 左侧队伍 1 右侧队伍
function do_persue_skill(roleId, skillId, CastPosition, TeamSide)
    local caster = get_battle_role(roleId)
    if not caster then
        return
    end
    caster:PreparePersue(skillId, CastPosition, TeamSide)
end

--让一个指定角色执行挡刀技
function do_block_skill(roleId, targetRoleId, dmgInfo, CastPosition, TeamSide)
    BlockInBatlle(roleId, targetRoleId, CastPosition, TeamSide)
    do_buff_damage("挡刀", dmgInfo.AttackRoleId, roleId, dmgInfo.TempValue)
    dmgInfo.TempValue = 0
    dmgInfo.DamageRatio = 0
end

function skill_absorb_hp(skillId, performRoleId, targetRoleId, healValue)
    if healValue <= 0 then
        return
    end
    local role = get_battle_role(targetRoleId)
    if not role then
        return
    end
    local rst = CS.ZhanGuoWuxia.Backend.Battle.Data.RecoverResult()
    rst.SourceSkillId = skillId
    rst.SourceType = RecoverSourceType.Absorb
    rst.RecoverType = BattleRecoverType.Hp
    rst.PerformRoleId = performRoleId
    rst.ReceiveRoleId = targetRoleId
    rst.IsCrit = false
    rst.RecoverValue = math.floor(healValue)
    role:DoRecoverHp(rst)
end

function do_skill_re_mp(skillId, performRoleId, targetRoleId, recoverMp)
    if recoverMp <= 0 then
        return
    end
    local role = get_battle_role(targetRoleId)
    if not role then
        return
    end
    local rst = CS.ZhanGuoWuxia.Backend.Battle.Data.RecoverResult()
    rst.SourceSkillId = skillId
    rst.SourceType = RecoverSourceType.Skill
    rst.RecoverType = BattleRecoverType.Mp
    rst.PerformRoleId = performRoleId
    rst.ReceiveRoleId = targetRoleId
    rst.IsCrit = false
    rst.RecoverValue = math.floor(recoverMp)
    role:DoChangeMp(rst)
end

--扣除最大生命值
function deduct_hp(targetRoleId, dmgValue, dmgType)
    local role = get_battle_role(targetRoleId)
    if not role then
        return
    end

    local damageResult = CS.ZhanGuoWuxia.Backend.Battle.Data.DamageResult()
    damageResult.AttackRoleId = targetRoleId
    damageResult.TargetRoleId = targetRoleId
    damageResult.CritRet = CritType.NotCrit
    damageResult.HitType = ActionHitType.Hit
    damageResult.TempValue = math.max(0, dmgValue)
    damageResult.DmgType = dmgType and dmgType or DamageType.Physical
    damageResult.DamageRatio = 1
    role:ReceiveDamage(damageResult, false)
end