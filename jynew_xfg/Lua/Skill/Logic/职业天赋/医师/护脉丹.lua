local skill = skill_define("医师_护脉丹")
--恢复5点内力值
local reMp = 5

function skill:OnCast(args)
    --获取友方存活角色
    local allies = get_team_alive_roles( team_of_role(args.CasterId) )
    --为存活的友方角色 回复内力
    for i, targetId in pairs(allies) do
        do_skill_re_mp("护脉丹", args.CasterId, targetId, reMp)
    end
end

return skill