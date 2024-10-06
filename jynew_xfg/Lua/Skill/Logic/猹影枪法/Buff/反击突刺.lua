
local buff = buff_define("反击突刺")

--若触发招架，反击的目标若存在10层中毒或流血，则100%对其晕眩
function buff:OnParry(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local attakerId = args.AttackerId
    
    if role_buff_pile(attakerId, "中毒") >= 10 or role_buff_pile(attakerId, "流血") >= 10 then
    add_buff("晕眩", attakerId, OwnerId, 1, 2)
    end
    do_persue_skill(OwnerId, "反击突刺", pos_of_role(attakerId), team_of_role(attakerId))
end

return buff