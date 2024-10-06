local skill = skill_define("天玄回元")

function skill:OnCast(args)
    self:TryDoActionToTargets(args,
    function(roleId)
        if roleId ~= args.CasterId then
            add_buff("回元", roleId, args.CasterId, 2, 2)
            --如果 点亮了 回天之力，设置个参数 能够消耗2层恢复气血
            if role_has_buff(args.CasterId, "回天之力") then
                set_role_buff_int(roleId, "回元", "回天之力", 1)
            end
        end
    end)
end

return skill