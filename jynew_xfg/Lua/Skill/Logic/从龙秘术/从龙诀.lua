local skill = skill_define("从龙诀")

local AdditionBuffLevel = 6

function skill:OnCast(args)
    local curLevel = args.Skill.SkillLevel
    local PileToAdd = curLevel >= AdditionBuffLevel and 2 or 1
    self:TryDoActionToTargets(args, 
    function(roleId) 
        add_buff("奉龙", roleId, args.CasterId, PileToAdd, 2)
    end)
end

return skill