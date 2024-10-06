local buff = buff_define("自作聪明")
--触发招架后，有70%概率令攻击者的某个减益状态时长延长1回合。也有可能直接驱散对方1个减益状态

local probability = 70
local addRound = 1

function buff:OnParry(args)
    local ownerId = self:GetBuffOwnerId(args)
    local attakerId = args.AttackerId
    if chance(probability) then
        local attakerIdDebuffs = get_role_all_debuffs(attakerId)
        if #attakerIdDebuffs > 0 then
            for _, buff in pairs(attakerIdDebuffs) do
                buff.LeftRound = buff.LeftRound + addRound
                break
            end
        end
    else
        dispel_random_debuffs(attakerId, ownerId, 1)
    end
end

return buff