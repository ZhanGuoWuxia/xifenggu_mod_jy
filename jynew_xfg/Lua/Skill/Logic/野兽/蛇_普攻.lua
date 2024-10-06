local skill = simple_damage_skill_template("蛇_普攻", stat_key.Attack, 0.9)

local prob = 30

--命中目标后,有30%概率叠加1层[<color=purple>中毒</color>]效果,持续2回合
function skill:OnSkillHit(args)
    if chance(prob) then
        add_buff("中毒", args.HiterId, args.CasterId, 1, 2)
    end
end

return skill