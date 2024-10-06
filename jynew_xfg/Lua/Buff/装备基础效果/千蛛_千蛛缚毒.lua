--攻击目标时有20%概率附加1层中毒，且目标每有1层减益状态则提高2%概率
local buff = buff_define("千蛛_千蛛缚毒")

local basePR = 20
local incrPP = 2

local function buff_chance(args)
    return chance(args)
end

function buff:OnDoHit(args)
    local attakerId = args.AttackerId
    local targets = args.Targets

    for _, defenderId in pairs(targets) do
        local getDebuffsPiles = get_role_debuffs_piles(defenderId)
        local PR = basePR + getDebuffsPiles * incrPP
        if not buff_chance(PR) then
            return
        end
        add_buff("中毒", defenderId, attakerId,1,2)
    end
end
return buff
