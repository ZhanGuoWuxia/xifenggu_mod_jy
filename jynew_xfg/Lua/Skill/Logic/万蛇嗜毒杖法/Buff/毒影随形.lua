local buff = buff_define("毒影随形")
--施展[万蛇嗜毒杖法]招式时，场上每有1名中毒状态的单位，则有10%的概率额外附加1层[<color=purple>中毒</color>]状态，持续2回合

local function buff_chance(args)
    local toxicUnitAmount = get_all_roles_specified_buff_amount("中毒") * 10
    local prob = toxicUnitAmount + (role_has_buff(buff_arg_owner(args), "毒影随形")and 10 or 0)
    return chance(prob)
end

--造成伤害后
function buff:AfterSkillDamage(args)
    if not args.Skill:IsSkill("毒杖横扫") and not args.Skill:IsSkill("万蛇噬魂") then
        return
    end
    
    if not buff_chance(args) then
        return
    end

    local ownerId = self:GetBuffOwnerId(args)
    local defenderId = args.DefenderId
    add_buff("中毒", defenderId, ownerId, 1, 2)
end

return buff