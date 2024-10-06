local skill = skill_define("洗筋伐髓")


function skill:OnCast(args)
    self:TryDoActionToTargets(args, 
    function(roleId) 
        add_buff("舒筋活血", roleId, args.CasterId, 10, 3)
    end)
end

return skill