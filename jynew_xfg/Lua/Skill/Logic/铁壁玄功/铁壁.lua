local skill = skill_define("铁壁")
--激发内力，使自身皮肤如钢铁般坚硬，形成一个持续2回合的护盾（70%已损失的气血值），[铁壁]状态存在期间无法再次增加护盾

function skill:OnCast(args)
    local ownerId = args.CasterId
    if not role_has_buff(ownerId ,"铁壁") then
        add_buff("铁壁", ownerId, ownerId, 1, 2)
        add_buff("铁壁记录", ownerId, ownerId, 1, 3)
        --记录下 没加护盾之前的值
        set_role_buff_int(ownerId, "铁壁记录", "之前护盾", role_stat(ownerId, stat_key.Shield))
        local hp = math.floor(role_losed_hp_percent(ownerId) * role_stat(ownerId, stat_key.MaxHp) * 0.7)
        set_role_buff_int(ownerId, "铁壁记录", "护盾增加值", hp)
        role_add_shield(ownerId, hp)
    end
end

return skill