--在每回合结束时，若处于<color=red>中毒</color>状态，则会移除当前一半的中毒层数,至少会移除一层中毒效果
--可以移除3次中毒效果
local buff = buff_define("蛇胆解毒丸_解毒")
local useCount = 3

local function deal_with_poison(roleId)
    local cnt = role_buff_pile(roleId, "中毒")
    if cnt > 0 then
        local removeCount = math.max(1, math.floor(cnt / 2))
        change_buff_pile(roleId, "中毒", -removeCount)
        change_buff_pile(roleId, "蛇胆解毒丸_解毒", -1)
    end
end

function buff:OnAdd(args)
    args.buff.Pile = useCount
end


function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    deal_with_poison(ownerId)
end


return buff