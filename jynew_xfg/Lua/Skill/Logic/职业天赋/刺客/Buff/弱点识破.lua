local buff = buff_define("刺客_弱点识破")

--对单位造成暴击时，对目标标记一层[破绽]
function buff:OnDoCrit(args)
    local ownerId = self:GetBuffOwnerId(args)
    for _, targetId in pairs(args.Targets) do
        add_buff("刺客_破绽", targetId, ownerId, 1)
    end
end

--判断攻击的目标 破绽层数
local function is_buff_target(args)
    local targets = args.TargetParam.Targets
    for _, targetId in pairs(targets) do
        if role_buff_pile(targetId, "刺客_破绽") >= 5 then
            remove_buff("刺客_破绽", targetId, args.ownerId)
            return true
        end
    end
    return false
end


--当破绽达到5层时，下次攻击此单位时会追加一次攻击
function buff:AfterSkillCast(args)
    local ownerId = self:GetBuffOwnerId(args)

    if not is_buff_target(args) then
        return
    end

    --以当前角色普通攻击追击
    do_persue_skill(ownerId, "", args.TargetParam.CastPosition , enemy_team_of_role(ownerId))
end

return buff