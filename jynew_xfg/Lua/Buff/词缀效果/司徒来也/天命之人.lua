--使其自身提升10%造成的伤害，自身降低10%收到的伤害。并且当主角在场时，所有队友获得3%的伤害提升。
local buff = buff_define("天命之人")

local plusDamageRatio = 0.1
local reduceDamageRatio = 0.1

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    dmgInfo.DamageRatio = dmgInfo.DamageRatio + plusDamageRatio
end

function buff:BeforeReceiveDamage(args)
    local dmgInfo = args.DamageInfo
    dmgInfo.DamageRatio = dmgInfo.DamageRatio - reduceDamageRatio
end


function buff:OnAdd(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_team_alive_roles(team_of_role(OwnerId))
    for i, roleId in pairs(allies) do
        if OwnerId ~= roleId then
            add_buff("天命光环", roleId, OwnerId)
        end
    end
end

function buff:OnDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_roles_of_team(team_of_role(OwnerId))
    for i, roleId in pairs(allies) do
        if OwnerId ~= roleId then
            remove_buff("天命光环", roleId, OwnerId)
        end
    end
end

return buff
