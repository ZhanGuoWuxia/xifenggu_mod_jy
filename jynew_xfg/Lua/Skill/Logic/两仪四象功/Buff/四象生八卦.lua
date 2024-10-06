--受到伤害时，获得乾][坤][坎][离][震][艮][巽][兑]中的任意两种增益，优先添加未拥有的。
local buff = buff_define("四象生八卦")

local BaguaBuffs = {"乾", "坤", "坎", "离", "震", "巽", "艮", "兑"}

local function next_buffs(ownerID)
    local buffs_not_existed = {}
    local buffs_existed = {}
    for _, buffId in pairs(BaguaBuffs) do
        local cnt = role_buff_pile(ownerID, buffId)
        if cnt <= 0 then
            table.insert(buffs_not_existed, buffId)
        else
            table.insert(buffs_existed, buffId)
        end
    end
    
    if #buffs_not_existed >= 2 then
        return table.pick_random_many(buffs_not_existed, 2)
    elseif #buffs_not_existed == 1 then
        buffs_not_existed[#buffs_not_existed + 1] = table.pick_random(buffs_existed)
        return buffs_not_existed
    else
        return table.pick_random_many(buffs_existed, 2)
    end
end

function buff:OnReceiveDamage(args)
    local ownerId = self:GetBuffOwnerId(args)
    local buffs = next_buffs(ownerId)
    for _, buffId in pairs(buffs) do
        add_buff(buffId, ownerId, ownerId, 1, 2)
    end
end


return buff