local skill =  skill_define("洛神凌波")
--选择一个队友注入凌波，提升其200点速度和50点闪避值，持续3回合

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        add_buff("洛神凌波", roleId, args.CasterId, 1, 3)
    end)
end

return skill