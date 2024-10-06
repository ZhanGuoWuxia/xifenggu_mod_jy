local skill =  skill_define("涅槃重生")
--使用后提升20%攻击力，持续2回合

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        add_buff("涅槃重生", roleId, args.CasterId, 1, 2)
    end)
end

return skill