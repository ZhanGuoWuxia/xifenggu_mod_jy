--位于最后一列时，若身上有[坤],  回合结束时恢复已损失生命值10%的血量。
local buff = buff_define("坤阙")

local RecoverHpFactor = 0.1

function buff:OnRoundEnd(args)
    
    local CasterId = args.CasterId
    local col = col_of_pos(CasterId)
    if col == MAX_TEAM_COL - 1 and role_has_buff(CasterId, "坤") then
        local maxHp = role_stat(CasterId, stat_key.MaxHp)
        local reHp = role_losed_hp_percent(CasterId) * maxHp * RecoverHpFactor
        self:TryDoBuffHeal(args, CasterId, CasterId, reHp)
    end

end

return buff