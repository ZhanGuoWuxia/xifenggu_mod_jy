local buff = buff_define("猿猴托印")

--每回合开始时 添加 2次 反击次数
function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    add_buff("猿猴托印次数", ownerId, ownerId, 2, 1)
end


--若触发招架
function buff:OnParry(args)
    if not role_has_buff(self:GetBuffOwnerId(args), "猿猴托印次数") then
        return
    end

    local ownerId = self:GetBuffOwnerId(args)
    local attakerId = args.AttackerId
    change_buff_pile(ownerId, "猿猴托印次数", -1)

    do_persue_skill(ownerId, "猿猴托印", pos_of_role(attakerId), team_of_role(attakerId))
end

--若触发招架
function buff:OnDodge(args)
    if not role_has_buff(self:GetBuffOwnerId(args), "猿猴托印次数") then
        return
    end
    local ownerId = self:GetBuffOwnerId(args)
    local attakerId = args.AttackerId
    change_buff_pile(ownerId, "猿猴托印次数", -1)

    do_persue_skill(ownerId, "猿猴托印", pos_of_role(attakerId), team_of_role(attakerId))
end


return buff