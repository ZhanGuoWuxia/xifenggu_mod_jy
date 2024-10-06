local buff = buff_define("血色魔阵")
--生命值提高n%，免疫1次致命伤，并瞬间恢复0.8n%生命值（n为吸收发展度）

local restoreHpFactor = 0.8
local developPoint = get_flag_int("吸收发展度")

function buff:OnAdd(args)
  args.buff:SetStat(stat_key.MaxHpPercent, developPoint * 0.01)
end

function buff:OnBeforeDeath(args)
  local ownerId = self:GetBuffOwnerId(args)
  local restoreHp = role_stat(ownerId, stat_key.MaxHp) * restoreHpFactor * developPoint * 0.01
  set_role_cur_hp(ownerId, restoreHp)
  self:NotifyTriggered(args, ownerId, ownerId)
  tgr_api:tgr_bubble_text(ownerId, "不死血阵！启动！")
  remove_buff("血色魔阵", ownerId, ownerId)
end

return buff
