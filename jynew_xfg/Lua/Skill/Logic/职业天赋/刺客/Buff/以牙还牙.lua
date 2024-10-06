local buff = buff_define("刺客_以牙还牙")

--(0.15*速度值)%几率
local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Speed) * 0.15
    return chance(prob)
end

--若触发闪避
function buff:OnDodge(args)
    if not buff_chance(args) then
        return
    end

    local OwnerId = self:GetBuffOwnerId(args)
    local attakerId = args.AttackerId
    
    --以当前角色普通攻击追击
    do_persue_skill(OwnerId, "", pos_of_role(attakerId), team_of_role(attakerId))
end

return buff