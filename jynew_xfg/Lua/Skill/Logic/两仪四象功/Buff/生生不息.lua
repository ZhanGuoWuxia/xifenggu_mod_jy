--回合结束时，若位于最后一列，恢复25%最大生命值，乾、坤、坎、离、震、巽、艮、兑每有一种只能以额外回复5%最大生命值, 持续两回合
local buff = buff_define("生生不息")

local BaguaBuffs = {"乾", "坤", "坎", "离", "震", "巽", "艮", "兑"}

local baseRecoverFactor = 0.25
local additionRecoverFactor = 0.05


function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local col = col_of_role (ownerId)
    if col == MAX_TEAM_COL - 1 then
        local cnt = 0
        for _, buffId in pairs(BaguaBuffs) do
            if role_has_buff(ownerId, buffId)then
                cnt = cnt + 1
            end
        end
        local recoverFactor = baseRecoverFactor + cnt * additionRecoverFactor
        local reHp = role_stat(ownerId, stat_key.MaxHp) * recoverFactor
        self:TryDoBuffHeal(args, ownerId, ownerId, reHp)
    end
end

return buff