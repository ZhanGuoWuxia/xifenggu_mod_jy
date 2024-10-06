local skill =  skill_define("春风拂柳")
--选择一个队友清除1层减益状态

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        dispel_random_debuffs(roleId, args.CasterId, 1)
    end)
end

return skill