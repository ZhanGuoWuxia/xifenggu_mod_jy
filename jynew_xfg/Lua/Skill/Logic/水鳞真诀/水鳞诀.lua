local skill = skill_define("水鳞诀")
--使用后提升10%内劲，持续1回合，武学到达6级就持续2回合
local isSkillLevel = 6

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        add_buff("内劲提升", roleId, args.CasterId, 10, (args.Skill.SkillLevel >= isSkillLevel) and 2 or 1)
    end)
end

return skill