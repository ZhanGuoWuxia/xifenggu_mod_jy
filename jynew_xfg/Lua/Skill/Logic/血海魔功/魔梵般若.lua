local skill = skill_define("魔梵般若")
--以牺牲自己25%血为代价，提升攻击力30%，持续2回合

--损失最大生命值百分比
local HpOfLost = 0.25
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

function skill:OnCast(args)
  self:DeductHp(args)
  self:TryDoActionToTargets(args,
  function(roleId)
      add_buff("攻击提升", roleId, args.CasterId, 30, 2)
  end)
end

function skill:DeductHp(args)
    local CasterId = args.CasterId
    --获取角色最大生命值
    local GetRoleHp = math.ceil(role_stat(CasterId, stat_key.MaxHp) * HpOfLost)
    --根据最大生命值受到伤害
    deduct_hp(CasterId, GetRoleHp, DamageType.Physical)
end

return skill