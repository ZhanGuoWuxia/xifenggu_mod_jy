local buff = buff_define("刺客_背刺")

--对处于流血、眩晕的单位发起攻击时，必定暴击
function buff:BeforeAttackerCrit(args)
    local defenderId = args.CritParam.DefenderId
    if role_has_buff(defenderId,"流血") or role_has_buff(defenderId,"晕眩") then
        args.CritParam.CritAddition = 11111
    end
end

return buff