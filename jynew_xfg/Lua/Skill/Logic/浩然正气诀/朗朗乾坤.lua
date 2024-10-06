local skill = skill_define("朗朗乾坤")
--自身回复20%的最大内力值
local mpPercent = 0.2

function skill:OnCast(args)
  local reMp = role_stat(args.CasterId, stat_key.MaxMp) * mpPercent
  do_skill_re_mp("朗朗乾坤", args.CasterId, args.CasterId, reMp)
end

return skill