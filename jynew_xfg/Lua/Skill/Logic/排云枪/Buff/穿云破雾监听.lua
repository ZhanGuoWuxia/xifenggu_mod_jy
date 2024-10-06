local buff = buff_define("穿云破雾监听")

local function ExitsArmorPiercedRole(args)
    for _, defenderId in pairs(args.Targets) do
        if role_has_buff(defenderId, "破甲") then
            return true
        end
    end
    return false
end

function buff:OnDoHit(args)
    if not args.Skill:IsSkill("穿云式") then
        return
    end

    if ExitsArmorPiercedRole(args) then
        local attakerId = args.AttackerId
        add_buff("穿云破雾蓄力", attakerId)
    end
    
end

return buff