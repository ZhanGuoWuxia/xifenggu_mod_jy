local skillbase = class("skillbase")

function skillbase:GetSkillDamage(args)
    return role_stat(args.CasterId, stat_key.Attack)
end

--当技能创建时
---@param arg.OwnerId int 技能拥有者id|
---@param arg.Skill BattleSkillInstance 技能招式实例
function skillbase:OnCreate(args)

end

--当技能被销毁时(暂时用不到)
---@param arg.OwnerId int 技能拥有者id|
---@param arg.Skill BattleSkillInstance 实例
function skillbase:OnDestroy(args)

end

--获取目标位置在技能范围内的所有目标,不重载默认会用表格中配置的范围来获取目标
---@param args.TargetParam.Side int 对哪一侧施放 0=左侧队伍 1=右侧队伍
---@param args.TargetParam.CastPosition int 施放的位置 0~8(队伍1号位到9号位中的一个)
---@param args.TargetParam.Targets List<int> 作用目标角色Id列表
---@param args.Skill BattleSkillInstance 技能实例对象
---@param args.CasterId int 施法者Id
---@return bool 是否修改
function skillbase:OnModifyTarget(args)

end

--当技能命中时
---@param args.CasterId. int 施法者Id
---@param args.HiterId int 被命中者Id
---@param args.Skill BattleSkillInstance 技能实例对象
function skillbase:OnSkillHit(args)

end

--当成功施放时
---@param args.CasterId int 施法者Id
---@param args.FireTrigger bool 是否调用buff触发器
---@param args.Skill BattleSkillInstance 技能实例对象
---@param args.TargetParam.Side int 对哪一侧施放 0=左侧队伍 1=右侧队伍
---@param args.TargetParam.CastPosition int 施放的位置 0~8(队伍1号位到9号位中的一个)
---@param args.TargetParam.Targets List<int> 作用目标角色Id列表
function skillbase:OnCast(args)

end

local function is_valid_skill_action(args)
    if type(args.Skill) ~= "userdata" and args.Skill:GetType() ~= typeof(CS.ZhanGuoWuxia.Backend.Battle.BattleSkillInstance) then
        print("无效的BattleSkillInstance")
        return false
    end
    if not args.TargetParam then
        print("技能没有作用目标")
        return false
    end
    return true
end

function skillbase:TryDoSkillDamage(args)
    if not is_valid_skill_action(args) then
        return
    end
    args.Skill:DoSkillDamage(args.TargetParam, args.FireTrigger)
end

function skillbase:TryDoSkillHeal(args)
    if not is_valid_skill_action(args) then
        return
    end
    args.Skill:DoSkillHeal(args.TargetParam)
end

function skillbase:TryDoActionToTargets(args, callback)
    if not is_valid_skill_action(args) then
        return
    end

    if not args.TargetParam then
        print_error("逻辑调用层不包含目标数据")
        return
    end

    for _, roleId in pairs(args.TargetParam.Targets) do
        callback(roleId)
    end
end

function skillbase:GetSkillLevel(args)
    return args.Skill and args.Skill.SkillLevel or 0
end

return skillbase
