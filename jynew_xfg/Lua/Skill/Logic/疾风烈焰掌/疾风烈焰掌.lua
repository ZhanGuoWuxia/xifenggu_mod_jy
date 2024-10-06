local skill = skill_define("疾风烈焰掌")

function skill:GetSkillDamage(args)
    return role_stat(args.CasterId, stat_key.Attack) * 0.5
end

function skill:OnCast(args)
    self:TryDoActionToTargets(args, 
    function(roleId) 
        add_buff("烈火不息", roleId, args.CasterId, 2, 2)
    end)
    self:TryDoSkillDamage(args)
end


return skill
