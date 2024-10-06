local buff = buff_define("护体袈裟监听")
local CritType = CS.ZhanGuoWuxia.Backend.Battle.Data.CriticalRet

local function get_shield_add_num(roleId)
    return role_stat(roleId, stat_key.Tenacity) * 5 
end

function buff:BeforeSkillCast(args)
    if not args.Skill:IsSkill("金刚降魔掌") then 
        return
    end

    role_add_shield(args.CasterId, get_shield_add_num(args.CasterId))
end


function buff:AfterAttackerCrit(args)

    if not args.Skill:IsSkill("金刚降魔掌") then 
        return
    end

    if args.CritRet ~= CritType.CritButResist then
        return
    end

    dispel_positive_buffs(args.DefenderId, args.AttackerId)
end

return buff