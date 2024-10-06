local buff = buff_define("暗藏杀机")

local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Crit) * 0.05
    return chance(prob)
end

function buff:OnDoCrit(args)
    if not buff_chance(args) then
        return
    end
    local OwnerId = self:GetBuffOwnerId(args)
    local enemies = get_alive_enemies_of_role(OwnerId)
    local selectId = table.pick_random(enemies)
    if selectId then
        do_persue_skill(self:GetBuffOwnerId(args), "暗藏杀机", pos_of_role(selectId), team_of_role(selectId))
    end
end

return buff