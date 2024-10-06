
--向前移动一格。到达阵型最前方第一行时，自身每有一种八卦Buff，攻击力和防御力提升5%。
--若已经位于最前方，则与同列最后的队友交换位置。
local skill = skill_define("乾坤步")

local BaGuaBuffs = {
    "乾",
    "坤",
    "震",
    "巽",
    "坎",
    "离",
    "艮",
    "兑"
}

function skill:OnCast(args)
    local CasterId = args.CasterId
    tgr_api:tgr_bubble_text(CasterId, "乾坤一转，步履生风！")
    local row = row_of_role(CasterId)
    local col = col_of_role(CasterId)
    if col <= 0 then
        col = MAX_TEAM_COL - 1
    else
        col = col - 1
    end
    local newPos = row_col_2_pos(row, col)
    swap_or_change_role_pos(CasterId, newPos)
    if col == 0 then
        local buffCount = 0
        for i = 1, #BaGuaBuffs do
            if role_has_buff (CasterId, BaGuaBuffs[i]) then
                buffCount = buffCount + 1
            end
        end
        if buffCount > 0 then
           add_buff("乾坤步增益", CasterId, CasterId, buffCount, 2)
        end
    end
end

return skill