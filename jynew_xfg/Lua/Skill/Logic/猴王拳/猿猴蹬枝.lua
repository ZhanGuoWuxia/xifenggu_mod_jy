local skill = simple_damage_skill_template("猿猴蹬枝", stat_key.Attack, 1)
--以[白猿献果]招式作为虚招，施展完后对其追击施展此招式
--此招式无法被招架和闪避。并根据双方速度差值提升此次伤害，每相差10点提升1%,最高50%

function skill:OnCreate(args)
    add_buff("猿猴蹬枝", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("猿猴蹬枝", args.OwnerId)
end

return skill