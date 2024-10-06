local skill = simple_damage_skill_template("淬毒掌", stat_key.Attack, 1)

local prob = 20

--命中目标后,有20%概率叠加1层[<color=purple>中毒</color>]效果,持续1回合
function skill:OnSkillHit(args)
    if chance(prob) then
        add_buff("中毒", args.HiterId, args.CasterId, 1, 1)
    end
end

return skill