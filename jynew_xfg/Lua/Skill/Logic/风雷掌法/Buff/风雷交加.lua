--巽风掌命中敌方时，若自身有震，则击散对方10点内力。震雷掌命中敌方时，若自身有[巽]，则将目标晕眩一回合。
local buff = buff_define("风雷交加")

function buff:OnDoHit(args)
    local OwnerId = self:GetBuffOwnerId(args)
    if args.Skill:IsSkill("巽风掌") and role_has_buff(OwnerId, "巽") then
        for _, targetId in pairs(args.Targets) do
            do_buff_Mp("风雷交加", OwnerId, targetId, -10)
        end
    end

    if args.Skill:IsSkill("震雷掌") and role_has_buff(OwnerId, "震") then
        for _, targetId in pairs(args.Targets) do
            add_buff("晕眩", targetId, OwnerId)
        end
    end

end

return buff