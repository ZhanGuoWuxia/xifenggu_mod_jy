local skill = simple_damage_skill_template("淬毒掌影", stat_key.Attack, 0.8)

function skill:OnCreate(args)
    add_buff("淬毒掌影监听", args.OwnerId)
end

--命中目标后,叠加1层[<color=purple>中毒</color>]效果,持续2回合
function skill:OnSkillHit(args)
    add_buff("中毒", args.HiterId, args.AttackerId, 1, 2)
end

function skill:OnDestroy(args)
    remove_buff("淬毒掌影监听", args.OwnerId)
end

return skill