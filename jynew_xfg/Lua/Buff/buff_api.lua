

local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType
local DamageSourceType = CS.ZhanGuoWuxia.Backend.Battle.Data.DamageSourceType
local BattleRecoverType = CS.ZhanGuoWuxia.Backend.Battle.Data.BattleRecoverType
local RecoverSourceType = CS.ZhanGuoWuxia.Backend.Battle.Data.RecoverSourceType
local ActionHitType = CS.ZhanGuoWuxia.Backend.Battle.Data.ActionHitType
local CritType = CS.ZhanGuoWuxia.Backend.Battle.Data.CriticalRet
local BuffActionType = CS.ZhanGuoWuxia.Backend.Battle.Data.BuffActionType

function buff_define(buffName)
    return class(buffName, require("Buff/buffbase"))
end

--按照技能类型影响伤害系数的Buff模板
function subskill_dmg_modifier(buffName, dmgFactor, ...)
    local modifier = buff_define(buffName)

    local subSkillTypes = {...}
    modifier.BeforeGiveDamage = function(self, args)
        local dmgInfo = args.DamageInfo
        --满足条件就改变系数并退出
        for _, subSkillType in pairs(subSkillTypes) do
            if dmgInfo:IsSubSkill(subSkillType) then
                dmgInfo.DamageRatio = dmgInfo.DamageRatio + dmgFactor
                break
            end
        end
    end

    return modifier
end

function passive_define(passiveName, buffid)
    local passiveskill = skill_define(passiveName)
    passiveskill.OnCreate = function(self, args)
        add_buff(buffid, args.OwnerId)
    end
    passiveskill.OnDestroy = function(self, args)
        remove_buff(buffid, args.OwnerId)
    end
    return passiveskill
end

local function get_buff(roleId, buffName)
    local role = get_battle_role(roleId)
    if not role then
        return nil
    end
    local buff = role:GetBuff(buffName)
    return buff
end

--告知表现层逻辑这个buff触发了
function notify_buff_triggered(buffId, performRoleId, receiveRoleId)
    local battle = current_battle()
    if battle == nil then
        return
    end
    battle:RecordBuffAction(buffId, performRoleId, receiveRoleId, BuffActionType.TriggerBuff)
end

--从回调参数中尝试获取当前触发buff的携带者
function buff_arg_owner(args)
    return args.buff ~= nil and args.buff.OwnedRoleId or -1
end

--从回调参数中尝试获取当前触发buff的施加者
function buff_arg_caster(args)
    return args.buff ~= nil and args.buff.LastCasterId or -1
end

--从回调参数中尝试获取当前触发buff的层数
function buff_arg_pile(args)
    return args.buff ~= nil and args.buff.Pile or 0
end

--判断目标战斗角色上是否有buff
function role_has_buff(roleId, buffName)
    local role = get_battle_role(roleId)
    if not role then
        return false
    end
    return role:HasBuff(buffName)
end

--获取目标角色的指定buff的层数
function role_buff_pile(roleId, buffName)
    local buff = get_buff(roleId, buffName)
    if not buff then
        return 0
    end
    return buff.Pile
end

--获取目标角色的指定buff的持续回合数
function role_buff_left_round(roleId, buffName)
    local buff = get_buff(roleId, buffName)
    if not buff then
        return 0
    end
    return buff.LeftRound
end

function get_role_buff_int(roleId, buffName, dataName)
    local buff = get_buff(roleId, buffName)
    if not buff then
        return 0
    end
    return buff:GetInt(dataName)
end

function set_role_buff_int(roleId, buffName, dataName, val)
    local buff = get_buff(roleId, buffName)
    if not buff then
        return
    end
    return buff:SetInt(dataName, val)
end

--增加或者减少对应buff层数
function change_buff_pile(roleId, buffName, num)
    local buff = get_buff(roleId, buffName)
    if not buff then
        return
    end
    if num < 0 and -num >= role_buff_pile(roleId, buffName)  then
        remove_buff(buffName, roleId, roleId)
    else
        buff.Pile = buff.Pile + num
    end
end

--直接修改对应buff层数
function edit_buff_pile(roleId, buffName, num)
    local buff = get_buff(roleId, buffName)
    if not buff then
        return
    end
    if num < 0 then
        remove_buff(buffName, roleId, roleId)
    else
        buff.Pile = num
    end
end

--增加或者减少对应buff持续回合
function change_buff_left_round(roleId, buffName, num)
    local buff = get_buff(roleId, buffName)
    if not buff then
        return
    end
    if num < 0 and -num >= role_buff_left_round(roleId, buffName)  then
        remove_buff(buffName, roleId, roleId)
    else
        buff.LeftRound = buff.LeftRound + num
    end
end

--直接修改对应buff持续回合
function edit_buff_left_round(roleId, buffName, num)
    local buff = get_buff(roleId, buffName)
    if not buff then
        return
    end
    if num < 0 then
        remove_buff(buffName, roleId, roleId)
    else
        buff.Pile = buff.LeftRound + num
    end
end

--给角色增加BUFF
function add_buff(buffId, receiveRoleId, performRoleId, pile, leftRound)
    local receiver = get_battle_role(receiveRoleId)
    if not receiver then
        print("buff receiver not found, Id:" .. receiveRoleId)
        return
    end
    performRoleId = performRoleId or -1
    pile = pile or 1
    leftRound = leftRound or 1
    return receiver:AddBuff(buffId, performRoleId, pile, leftRound)
end

--给角色列表里的所有角色增加BUFF
function add_buff_to_roles(buffId, receiveRoles, performRoleId, pile, leftRound)
    for _, receiveRoleId in pairs(receiveRoles) do
        add_buff(buffId,  receiveRoleId, performRoleId, pile, leftRound)
    end
end

--设置BUFF属性
function set_role_buff_stat(roleId, buffName, statName, statValue)
    local buff = get_buff(roleId, buffName)
    if buff then
        buff:SetStat(statName, statValue)
    end
end

----获取BUFF属性
function get_role_buff_stat(roleId, buffName, statName)
    local buff = get_buff(roleId, buffName)
    if buff then
        return buff:GetStat(statName)
    end
end

--从目标身上强制移除一个buff
function remove_buff(buffId, receiveRoleId, performRoleId)
    local receiver = get_battle_role(receiveRoleId)
    if not receiver then
        return
    end
    performRoleId = performRoleId or -1
    return receiver:RemoveBuff(buffId, performRoleId)
end

local function is_positive_buff(buff)
    return buff.IsPositive
end

--尝试驱散目标身上的所有增益
function dispel_positive_buffs(receiveRoleId, performRoleId)
    local receiver = get_battle_role(receiveRoleId)
    if not receiver then
        return
    end
    performRoleId = performRoleId or -1
    receiver:DispelBuffsWhen(is_positive_buff, performRoleId)
end

--尝试随机驱散目标身上指定数量的增益
function dispel_random_positive_buffs(receiveRoleId, performRoleId, dispelNum)
    local receiver = get_battle_role(receiveRoleId)
    if not receiver then
        return
    end
    performRoleId = performRoleId or -1
    dispelNum = dispelNum or 1
    receiver:DispelRandomBuffsWhen(is_positive_buff, performRoleId, dispelNum)
end

local function is_debuff(buff)
    return not buff.IsPositive
end

--尝试驱散目标身上的所有减益
function dispel_debuffs(receiveRoleId, performRoleId)
    local receiver = get_battle_role(receiveRoleId)
    if not receiver then
        return
    end
    performRoleId = performRoleId or -1
    receiver:DispelBuffsWhen(is_debuff, performRoleId)
end

--尝试随机驱散目标身上指定数量的减益
function dispel_random_debuffs(receiveRoleId, performRoleId, dispelNum)
    local receiver = get_battle_role(receiveRoleId)
    if not receiver then
        return
    end
    performRoleId = performRoleId or -1
    dispelNum = dispelNum or 1
    receiver:DispelRandomBuffsWhen(is_debuff, performRoleId, dispelNum)
end

--尝试驱散目标身上指定Id的buff
function dispel_buff_by_id(receiveRoleId, performRoleId, buffId)
    local receiver = get_battle_role(receiveRoleId)
    if not receiver then
        return false
    end
    performRoleId = performRoleId or -1
    return receiver:DispelBuffById(buffId, performRoleId)
end

--通过BUFF造成伤害
function do_buff_damage(buffId, performRoleId, targetRoleId, dmgValue, dmgType)
    local role = get_battle_role(targetRoleId)
    if not role then
        return
    end
    local dmgResult = CS.ZhanGuoWuxia.Backend.Battle.Data.DamageResult()
    dmgResult.BuffId = buffId
    dmgResult.SourceType = DamageSourceType.Buff
    dmgResult.AttackRoleId = performRoleId
    dmgResult.TargetRoleId = targetRoleId
    dmgResult.CritRet = CritType.NotCrit
    dmgResult.HitType = ActionHitType.Hit
    dmgResult.TempValue = math.max(0, dmgValue)
    dmgResult.DmgType = dmgType and dmgType or DamageType.Physical
    dmgResult.DamageRatio = 1
    role:ReceiveDamage(dmgResult, false)
end

--通过BUFF恢复血条
function do_buff_heal(buffId, performRoleId, targetRoleId, healValue)
    if healValue <= 0 then
        return
    end
    local role = get_battle_role(targetRoleId)
    if not role then
        return
    end
    local rst = CS.ZhanGuoWuxia.Backend.Battle.Data.RecoverResult()
    rst.SourceBuffId = buffId
    rst.SourceType = RecoverSourceType.Buff
    rst.RecoverType = BattleRecoverType.Hp
    rst.PerformRoleId = performRoleId
    rst.ReceiveRoleId = targetRoleId
    rst.IsCrit = false
    rst.RecoverValue = math.floor(healValue)
    role:DoRecoverHp(rst)
end

--通过BUFF恢复蓝条
function do_buff_Mp(buffId, performRoleId, targetRoleId, val)
    local role = get_battle_role(targetRoleId)
    if not role then
        return
    end
    local rst = CS.ZhanGuoWuxia.Backend.Battle.Data.RecoverResult()
    rst.SourceBuffId = buffId
    rst.SourceType = RecoverSourceType.Buff
    rst.RecoverType = BattleRecoverType.Mp
    rst.PerformRoleId = performRoleId
    rst.ReceiveRoleId = targetRoleId
    rst.IsCrit = false
    rst.RecoverValue = val
    role:DoChangeMp(rst)
end

--获取 目标所有非特殊 减益状态的总数量
function get_role_debuffs_amount(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return
    end

    local debuffsAmount = 0
    for _, buff in pairs(role.Buffs) do
        --非特殊减益
        if not buff.IsPositive and not buff.IsSpecial then
            debuffsAmount = debuffsAmount + 1
         end
    end
    print("减益状态的总数量："..debuffsAmount)
    return debuffsAmount
end

--获取 目标所有非特殊 减益状态所有层数
function get_role_debuffs_piles(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return
    end

    local debuffsPiles = 0
    for _, buff in pairs(role.Buffs) do
        --非特殊减益
        if not buff.IsPositive and not buff.IsSpecial then
            debuffsPiles = debuffsPiles + buff.Pile
        end
    end
    print("减益状态所有层数相加："..debuffsPiles)
    return debuffsPiles
end



--获取 目标所有非特殊 增益状态的总数量
function get_role_buffs_amount(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return
    end

    local buffsAmount = 0
    for _, buff in pairs(role.Buffs) do
        --非特殊增益
        if buff.IsPositive and not buff.IsSpecial then
            buffsAmount = buffsAmount + 1
         end
    end
    print("增益状态的总数量："..buffsAmount)
    return buffsAmount
end

--获取 目标所有非特殊 增益状态所有层数
function get_role_buffs_piles(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return
    end

    local buffsPiles = 0
    for _, buff in pairs(role.Buffs) do
        --非特殊增益
        if buff.IsPositive and not buff.IsSpecial then
            buffsPiles = buffsPiles + buff.Pile
         end
    end
    print("增益状态所有层数相加："..buffsPiles)
    return buffsPiles
end



--令目标指定类型的所有非特殊状态增加/减少piles层
--type：-1减益；0全部；1增益
function role_buffs_add_piles(roleId, piles, type)
    local role = get_battle_role(roleId)
    if not role then
        return
    end

    for _, buff in pairs(role.Buffs) do
        if (type == 0 and not buff.IsSpecial) or
           (type == -1 and not buff.IsPositive and not buff.IsSpecial) or
           (type == 1 and buff.IsPositive and not buff.IsSpecial) then
            buff.Pile = buff.Pile + piles
        end
    end
end


--令目标指定类型的所有状态持续时间 增加/减少duration
--type：-1减益；0全部；1增益
function role_buffs_add_piles(roleId, duration, type)
    local role = get_battle_role(roleId)
    if not role then
        return
    end

    for _, buff in pairs(role.Buffs) do
        if (type == 0 and not buff.IsSpecial) or
           (type == -1 and not buff.IsPositive and not buff.IsSpecial) or
           (type == 1 and buff.IsPositive and not buff.IsSpecial) then
            buff.LeftRound = buff.LeftRound + duration
        end
    end
end



--判断目标身上是否有减益状态
function role_has_debuff(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return false
    end
    for _, buff in pairs(role.Buffs) do
        --非特殊减益
        if not buff.IsPositive and not buff.IsSpecial then
            return true
         end
    end
    return false
end



--获取 目标 最高层数的减益状态
function get_role_max_pile_debuff(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return
    end

    local maxPileDebuff = nil
    local maxPile = 0
    for _, buff in pairs(role.Buffs) do
        --非特殊减益
        if not buff.IsPositive and not buff.IsSpecial and buff.Pile > maxPile then
            maxPile = buff.Pile
            maxPileDebuff = buff
         end
    end
    return maxPileDebuff
end

--获取 目标 最高层数的增益状态
function get_role_max_pile_positive_buff(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return
    end

    local maxPileDebuff = nil
    local maxPile = 0
    for _, buff in pairs(role.Buffs) do
        --非特殊增益
        if buff.IsPositive and not buff.IsSpecial and buff.Pile > maxPile then
            maxPile = buff.Pile
            maxPileDebuff = buff
         end
    end
    return maxPileDebuff
end


--获取场上所有存活单位 指定BUFF的总数量
function get_all_roles_specified_buff_amount(buffName)
    local allies = get_all_teams_alive_roles()
    if #allies <= 0 then
        return 0
    end
    local buffAmount = 0
    for i, roleId in pairs(allies) do
        if role_has_buff(roleId, buffName) then
            buffAmount = buffAmount + 1
        end
    end
    return buffAmount
end

--获取 目标所有非特殊+可驱散 buff
function get_role_all_debuffs(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return
    end

    local debuffs = {}
    for _, buff in pairs(role.Buffs) do
        --非特殊减益
        if not buff.IsPositive and not buff.IsSpecial and buff.CanDispel then
            table.insert(debuffs, buff)
        end
    end

    return debuffs
end