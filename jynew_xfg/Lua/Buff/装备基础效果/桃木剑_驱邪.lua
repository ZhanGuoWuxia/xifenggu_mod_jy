--攻击命中敌方时，驱散其层数最高的增益。技能治疗友方时,驱散其层数最高的减益。
local buff = buff_define("桃木剑_驱邪")

function buff:OnDoHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    local targets = args.Targets
    for _, defenderId in pairs(targets) do
        local targetBuff = get_role_max_pile_positive_buff(defenderId)
        if targetBuff then
            dispel_buff_by_id(defenderId, ownerId, targetBuff.BuffId) 
        end
    end
end


function buff:OnDoSkillHeal(args)
    local ownerId = self:GetBuffOwnerId(args)
    local targets = args.Targets
    for _, healReceiverId in pairs(targets) do
        local targetBuff = get_role_max_pile_debuff(healReceiverId)
        if targetBuff then
            dispel_buff_by_id(healReceiverId, ownerId, targetBuff.BuffId) 
        end
    end
end

return buff