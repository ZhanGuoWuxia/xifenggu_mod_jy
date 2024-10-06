local buff = buff_define("受虐")
local healfactor = 0.5
local healchance = 50
--受到伤害时会提升自身1%所受伤害, 每有一名友方目标死亡，提升10%所受伤害，最高可获得100%易伤, 受到伤害有50%概率随机为一名受伤的队友提供本次伤害50%的治疗回复(包括自己)。

function buff:OnReceiveDamage(args)
    --local dmgInfo = args.DamageInfo
    local dmgValue = args.ActualDamage
    local OwnerId = self:GetBuffOwnerId(args)

    add_buff("受虐计数", OwnerId, OwnerId, 1)

    if chance(healchance) then
        local hurt_allies = get_team_hurt_roles(team_of_role(OwnerId))
        if #hurt_allies > 0 then
            local healedRoleId = table.pick_random(hurt_allies)
            if healedRoleId then
                self:TryDoBuffHeal(args, OwnerId, healedRoleId, dmgValue * healfactor)
            end
        end
    end
end

function buff:OnOtherDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local DeathRoleId = args.DeathResult.DeathRoleId
    if is_same_team(OwnerId, DeathRoleId) then
        add_buff("受虐计数", OwnerId, OwnerId, 10)
    end
end

return buff
