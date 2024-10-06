local skill = simple_damage_skill_template("右势猴形", stat_key.Attack, 0.7)
--以[左势猴形]招式作为虚招，施展完后对其追击施展此招式
--此招式无法被招架和闪避。并根据双方速度差值提升此次伤害，每相差10点提升1%,最高50%

function skill:OnCreate(args)
    add_buff("右势猴形", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("右势猴形", args.OwnerId)
end

return skill