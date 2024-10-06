local skill = skill_define("霸绝")

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        add_buff("霸绝", roleId, args.CasterId, 1, -1)
    end)
end

return skill