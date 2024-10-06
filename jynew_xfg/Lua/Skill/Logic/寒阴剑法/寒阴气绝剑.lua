local skill = simple_damage_skill_template("寒阴气绝剑", stat_key.Attack, 1.2)
--对目标造成{{[stat:atk] * 1.2}}点外伤。并将寒阴之气灌入其体内，有{{[stat:spd] * 0.2}}%概率使其2回合内无法集气

--依据角色速度属性,有{{[stat:spd] * 0.2}}%概率成功
local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Speed) * 0.2
    return chance(prob)
end

--将寒阴之气灌入其体内，使其2回合内无法进行集气。
function skill:OnSkillHit(args)
    if not buff_chance(args) then
        return
    end

    add_buff("封脉", args.HiterId, args.CasterId, 1, 2)
end

return skill