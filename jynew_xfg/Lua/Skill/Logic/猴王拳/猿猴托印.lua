local skill = simple_damage_skill_template("猿猴托印", stat_key.Attack, 0.7)
--自身闪避或招架后对其反击，造成外伤

function skill:OnCreate(args)
    add_buff("猿猴托印", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("猿猴托印", args.OwnerId)
end

return skill