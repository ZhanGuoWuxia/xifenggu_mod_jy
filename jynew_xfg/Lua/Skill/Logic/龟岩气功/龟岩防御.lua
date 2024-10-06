local skill = skill_define("龟岩防御")
--进入[龟岩防御]状态，此状态下受到攻击时会反弹伤害，对攻击者造成外伤

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        add_buff("龟岩防御", roleId, args.CasterId, 1, 1)
    end)
end

return skill