local buff = buff_define("醉生梦死")
local CritFixValue = 1000

--接下来3次攻击计算暴击值+1000

function buff:BeforeAttackerCrit(args)
    args.CritParam.CritAddition = args.CritParam.CritAddition  + CritFixValue
end

function buff:OnAttack(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local cnt = get_role_buff_int(OwnerId, "醉生梦死", "醉生梦死计数")
    cnt = cnt - 1
    set_role_buff_int(OwnerId, "醉生梦死", "醉生梦死计数", cnt)
    if cnt <= 0 then
        remove_buff("醉生梦死", OwnerId)
    end
end

return buff