local buff = buff_define("霸王再世")

--有{{[stat:atk] * 0.1}}%的几率
local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Attack) * 0.1
    return chance(prob)
end

--在暴击时释放一次全屏攻击
function buff:OnDoCrit(args)
    if not buff_chance(args) then
        return
    end
    local ownerId = self:GetBuffOwnerId(args)
    do_persue_skill(ownerId, "霸王再世", TeamPos.Center, enemy_team_of_role(ownerId))
end

return buff