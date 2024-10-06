local skill = skill_define("移花接木")
--对所有友方目标恢复一定百分比的最大内力
local mpPercent = 0.2

function skill:OnCast(args)
    --获取友方存活角色
    local allies = get_team_alive_roles( team_of_role(args.CasterId) )
    --为存活的友方角色 回复内力
    for i, targetId in pairs(allies) do
        if targetId ~= args.CasterId then
            local reMp = role_stat(targetId, stat_key.MaxMp) * mpPercent
            do_skill_re_mp("移花接木", args.CasterId, targetId, reMp)
        end
    end
end

return skill