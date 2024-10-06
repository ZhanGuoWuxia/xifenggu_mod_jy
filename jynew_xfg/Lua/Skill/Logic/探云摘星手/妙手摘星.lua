--攻击当前目标,造成{{[stat:atk] * 1.2}}的外伤，有30%概率并偷取{{100 +[stat:spd] * 0.25}}数量的银两
local skill = simple_damage_skill_template("妙手摘星", stat_key.Attack, 1.2)
local addMoney = 25
local fixedMoney = 100
local additionMoneyFactor = 0.25
local prob = 30

--当技能命中时
---@param args.CasterId. int 施法者Id
---@param args.HiterId int 被命中者Id
---@param args.Skill BattleSkillInstance 技能实例对象
function skill:OnSkillHit(args)
    if chance(prob) then
        local cnt = get_role_buff_int(args.CasterId, "君子爱财", "君子爱财计数")
        local money = math.floor(fixedMoney + additionMoneyFactor * role_stat(args.CasterId, stat_key.Speed) + addMoney * cnt)
        battle_role_steal_money(args.CasterId, money, args.HiterId)
    end
end


return skill
