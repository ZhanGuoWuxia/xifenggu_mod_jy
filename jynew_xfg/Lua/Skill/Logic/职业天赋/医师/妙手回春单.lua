local skill = skill_define("医师_妙手回春单")
--以150%内劲恢复友方血量百分比最低的单位
function skill:OnCast(args)
    --获取友方血量最低的角色
    local targetId = get_team_lowest_hp_per_role(team_of_role(args.CasterId))
    skill_absorb_hp("妙手回春单", args.CasterId, targetId, role_stat(args.CasterId, stat_key.InnerStrength) * 1.5)
end

return skill