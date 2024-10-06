local buff = buff_define("铁卫_刚猛无比")

--每次受到攻击后，提升自身4%攻击力和50点暴击值，直到攻击后重置
function buff:OnHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    add_buff("刚猛", ownerId, ownerId)
end

--当Buff携带者招架也提升
function buff:OnParry(args)
    local ownerId = self:GetBuffOwnerId(args)
    add_buff("刚猛", ownerId, ownerId)
end

--完成攻击后移除
function buff:OnFinishSkillAttack(args)
    local ownerId = self:GetBuffOwnerId(args)
    if args.Skill.IsNormalAttack then
        remove_buff("刚猛", ownerId, ownerId)
    end
end

return buff