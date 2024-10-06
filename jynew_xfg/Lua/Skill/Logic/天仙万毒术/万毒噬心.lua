local skill = skill_define("万毒噬心")
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType
local damageFactor = 0.01

function SelectNewTargets(args)
    local targets = get_team_alive_roles(enemy_team_of_role(args.CasterId))
    local additionalTargets = {}
     for _, targetId in pairs(targets) do
        if role_has_buff(targetId, "中毒") then
            table.insert(additionalTargets, targetId)
        end
     end
     return additionalTargets
end

--当成功施放时
function skill:OnCast(args)
    local newTargets = SelectNewTargets(args)
    args.TargetParam.CastPosition = pos_of_role(args.CasterId)
    args.TargetParam:ClearTargets()

    --有天仙毒咒的话，引爆层数由5 提升至 8 
    local maxPile = role_has_buff(args.CasterId, "天仙毒咒") and 8 or 5
    local isMaxPileBuff = false
    local isSkill = role_has_buff(args.CasterId, "万毒浩劫") and true or false
    for _, targetId in pairs(newTargets) do
        args.TargetParam:AddTarget(targetId)
        --引爆层数
        local detonateBuffPile = math.min(role_buff_pile(targetId, "中毒"), maxPile)
        local dmg = role_stat(targetId, stat_key.MaxHp) * damageFactor * detonateBuffPile * (1 + role_stat(targetId, stat_key.PoisonDamage))
        do_buff_damage("万毒噬心", args.CasterId, targetId, dmg, DamageType.Poison)

        if isSkill and (role_buff_pile(targetId, "中毒") >= 10 or is_dead(targetId)) then
            isMaxPileBuff = true
        end
        change_buff_pile(targetId, "中毒", -detonateBuffPile)
        --将一半的毒传染给周围的单位
        if isMaxPileBuff then
            add_buff("中毒", alive_role_of_up(targetId), args.CasterId, math.floor(detonateBuffPile/2), 2)
            add_buff("中毒", alive_role_of_down(targetId), args.CasterId, math.floor(detonateBuffPile/2), 2)
            add_buff("中毒", alive_role_of_front(targetId), args.CasterId, math.floor(detonateBuffPile/2), 2)
            add_buff("中毒", alive_role_of_back(targetId), args.CasterId, math.floor(detonateBuffPile/2), 2)
        end
    end

end

return skill