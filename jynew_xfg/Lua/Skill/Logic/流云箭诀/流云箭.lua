local skill = skill_define("流云箭")

local damageScaleFactor = 1
local fluctuationRange = 0.1
--伤害
skill.GetSkillDamage = function(self, args)
    local dmg = role_stat(args.CasterId, stat_key.Attack) * damageScaleFactor
    local randomscale = (1 + fluctuationRange * math.sin(math.random() * math.pi * 2))
    dmg = dmg * randomscale
    return dmg
end

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        add_buff("命中提升", roleId, args.CasterId, 5, 1)
    end)
    self:TryDoSkillDamage(args)
end

return skill