local skill = skill_define("侠士_烈酒灼心")
--喝下一壶烈酒，能使角色暴击值提升100

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        add_buff("侠士_烈酒灼心", roleId, args.CasterId, 1, -1)
    end)
end

return skill