local skill = skill_define("惊鸿破影")

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        add_buff("惊鸿", roleId, args.CasterId, 1, 2)
    end)
end

return skill