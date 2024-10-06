local buff = buff_define("去势")

function buff:OnReceiveDamage(args)
  args.buff:SetStat(stat_key.ReceiveDamageModifer, -0.5)
end

return buff
