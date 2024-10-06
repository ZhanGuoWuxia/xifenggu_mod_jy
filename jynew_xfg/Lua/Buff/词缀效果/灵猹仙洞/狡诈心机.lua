local buff = buff_define("狡诈心机")
--队友死亡后，将其全部减益状态返还给攻击者

function buff:OnOtherDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    --死亡角色ID
    local DeathRoleId = args.DeathResult.DeathRoleId
    --谁击杀的角色ID
    local KillRoleId = args.DeathResult.KillRoleId

    if is_same_team(OwnerId, DeathRoleId) then
        local deadRoleDebuffs = get_role_all_debuffs(DeathRoleId)
        if #deadRoleDebuffs > 0 then
            for _, buff in pairs(deadRoleDebuffs) do
                add_buff(buff.BuffId, KillRoleId, DeathRoleId, buff.Pile, buff.LeftRound)
            end
        end
    end
end

return buff