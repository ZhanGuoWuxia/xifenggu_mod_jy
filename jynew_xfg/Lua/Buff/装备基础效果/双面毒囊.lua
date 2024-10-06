--每回合结束时获得一层[中毒], 自身每有一层中毒效果, 速度提升3%
--此外攻击命中敌人时,会将自身的毒素传染给敌人,使敌人获得自身一半层数的[中毒]效果
local buff = buff_define("毒之双刃")

local speed_factor = 0.03

local function RefreshCrit(args)
    local OwnerId = buff_arg_owner(args)
    local cnt = role_buff_pile(OwnerId, "中毒")
    local speed_percent = cnt * speed_factor
    args.buff:SetStat(stat_key.SpeedPercent, speed_percent)
end

function buff:OnThink(args)
    RefreshCrit(args)
end

function buff:OnRoundEnd(args)
    local OwnerId = self:GetBuffOwnerId(args)
    add_buff("中毒",OwnerId, OwnerId, 1, 2)
end

function buff:OnDoHit(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local cnt = role_buff_pile(OwnerId, "中毒")
    cnt = math.round(cnt / 2)
    if cnt <= 0 then
        return
    end
    local targets = args.Targets
    for _, targetRoleId in pairs(targets) do
        add_buff("中毒",targetRoleId, OwnerId, cnt, 2)
    end
end

return buff
