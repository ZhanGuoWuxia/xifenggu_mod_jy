local skill = skill_define("医师_净心丹")
--随机驱散1个减益状态
local removeBuffNum = 1

function skill:OnCast(args)
    --获取友方存活角色
    local allies = get_team_alive_roles( team_of_role(args.CasterId) )
    --为存活的友方角色 移除减益
    for i, targetId in pairs(allies) do
        dispel_random_debuffs(targetId, args.CasterId, removeBuffNum)
    end
end

return skill
