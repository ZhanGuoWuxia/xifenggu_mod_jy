--3回合后，主动牺牲自己，为其他所有人增加并恢复牺牲前自身当前生命50%的气血。
local buff = buff_define("服侍主人")

local addHpFactor = 0.5

function buff:OnAdd(args)
    args.buff:SetInt("服侍主人倒计时", 3)
end


function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local cur_Count = get_role_buff_int(ownerId, "服侍主人", "服侍主人倒计时")
    cur_Count = cur_Count - 1
    set_role_buff_int(ownerId, "服侍主人", "服侍主人倒计时", cur_Count)

    if cur_Count <= 0 then
        local hp = role_stat(ownerId, stat_key.CurrentHp)
        local addHp = hp * addHpFactor
        local allies = get_alive_teammates(ownerId)
        for _, allyId in pairs(allies) do     
            add_buff("仆人的服侍", allyId, ownerId)
            do_buff_heal("服侍主人", ownerId, allyId, addHp)
            role_add_shield(allyId, addHp)
        end
        suicide_battle_role(ownerId)
    end
end

return buff