local skill = skill_define("潜龙术")


function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        add_buff("蛰伏", roleId, args.CasterId, 1, -1)
    end)
end

return skill
