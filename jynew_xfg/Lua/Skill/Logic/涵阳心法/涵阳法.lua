local skill = skill_define("涵阳法")
--使用后提升10%攻击力，持续1回合，武学到达6级就持续2回合
local isSkillLevel = 6

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        add_buff("攻击提升", roleId, args.CasterId, 10, (args.Skill.SkillLevel >= isSkillLevel) and 2 or 1)
    end)
end

return skill