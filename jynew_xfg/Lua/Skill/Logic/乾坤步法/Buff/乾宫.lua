--位于第一列时，若身上有[乾]，回合开始时获得10%最大内力。
local buff = buff_define("乾宫")

local RecoverMpFactor = 0.1

function buff:OnRoundStart(args)
    local CasterId = args.CasterId
    local col = col_of_pos(CasterId)
    if col == 0 and role_has_buff(CasterId, "乾") then
        local maxMp = role_stat(CasterId, stat_key.MaxMp)
        local addMp = math.floor(maxMp * RecoverMpFactor)
        do_buff_Mp("乾宫", CasterId, CasterId, addMp)
    end
end

return buff