
local buff = buff_define("剑雪千里监听")

--依据角色速度属性,有{{[stat:spd] * 0.05}}%概率成功
local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Speed) * 0.05
    return chance(prob)
end

--施展完主动技后,有{{[stat:spd] * 0.05}}%几率追加施展[剑雪千里],攻击当前目标所在的一整行,造成{{[stat:atk] * 0.8}}点外伤
function buff:AfterSkillCast(args)
    local OwnerId = self:GetBuffOwnerId(args)

    if not args.Skill:IsSkill("寒阴气绝剑") then
        return
    end

    if not buff_chance(args) then
        return
    end

    do_persue_skill(OwnerId, "剑雪千里", args.TargetParam.CastPosition , enemy_team_of_role(OwnerId))
end

return buff