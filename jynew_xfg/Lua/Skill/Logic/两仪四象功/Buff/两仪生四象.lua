--每回合开始时，为自身周围八格的友军添加 “乾、坤、坎、离、震、巽、艮、兑”中的其中一种BUFF。
local buff = buff_define("两仪生四象")

local BaguaBuffs = {"乾", "坤", "坎", "离", "震", "巽", "艮", "兑"}

function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    local targets = alive_roles_around_role(ownerId)
    for _, targetId in pairs(targets) do
        local buffId = BaguaBuffs[math.random(1, #BaguaBuffs)]
        add_buff(buffId, targetId, ownerId, 1, 2)
    end
end

return buff