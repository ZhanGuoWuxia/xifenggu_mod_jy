local buff = buff_define("火钳不留命")
--使用[普通攻击]或者[夹火刀]进行攻击后，如果目标生命低于5%,则追加攻击，造成({{[stat:atk] * 1.3}})点外伤

local hp_percent_for_check = 0.05

local function has_low_hp_target(args)
    local targets = args.TargetParam.Targets
    for _, targetId in pairs(targets) do
        if not is_dead(targetId) and role_hp_percent_check(targetId, "<", hp_percent_for_check) then
            return true
        end
    end
    return false
end

function buff:AfterSkillCast(args)
    local OwnerId = self:GetBuffOwnerId(args)

    if not args.Skill:IsSkill("基础刀法普攻") and not args.Skill:IsSkill("夹火刀") then
        return
    end

    if not has_low_hp_target(args) then
        return
    end

    do_persue_skill(OwnerId, "火钳不留命", args.TargetParam.CastPosition , enemy_team_of_role(OwnerId))
end

return buff
