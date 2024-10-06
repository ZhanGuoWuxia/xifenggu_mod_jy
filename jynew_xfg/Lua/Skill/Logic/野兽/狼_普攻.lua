local skill = simple_damage_skill_template("狼_普攻", stat_key.Attack, 1, 0.1)

local prob = 30

--命中目标后,有30%概率叠加1层[<color=purple>流血</color>]效果,持续1回合
function skill:OnSkillHit(args)
    if chance(prob) then
        add_buff("流血", args.HiterId, args.CasterId, 1, 2)
    end
end

return skill