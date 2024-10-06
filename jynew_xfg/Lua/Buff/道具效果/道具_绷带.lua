--在每回合结束时，若处于<color=red>流血</color>状态，则使用绷带包扎去除。
--每场战斗至多包扎10次，每包扎1层流血扣除1次。
local buff = buff_define("道具_绷带")
local useMax = 10

local function handle_bandage_and_bleed(id)
    local cnt = get_role_buff_int(id, "道具_绷带", "绷带次数")
    if role_has_buff(id, "流血") and cnt > 0 then
        local buffPile = role_buff_pile(id, "流血")
        local removePile = math.max(-cnt, -buffPile)
        change_buff_pile(id, "流血", removePile)
        cnt = cnt - buffPile
        set_role_buff_int(id, "道具_绷带", "绷带次数", cnt)
        tgr_api:tgr_bubble_text(id, "绷带去除<color=red>"..-removePile.."层流血</color>，剩余<color=green>"..math.max(cnt, 0).."</color>次")
        if cnt <= 0 then
            remove_buff("道具_绷带", id, id)
        end
    end
end


function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    if args.turn ==1 then
        set_role_buff_int(ownerId, "道具_绷带", "绷带次数", useMax)
    end
end

function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    handle_bandage_and_bleed(ownerId)
end


return buff