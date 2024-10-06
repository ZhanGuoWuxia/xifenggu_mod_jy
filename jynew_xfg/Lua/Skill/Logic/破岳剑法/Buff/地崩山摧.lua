--[裂地一击]额外附加目标当前20%最大生命值的外伤伤害，自身每有一层[艮]，额外附加2%。
local buff = buff_define("地崩山摧")

local DmgType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

local additionPercent = 0.2
local plusPercent = 0.02

function buff:OnDoHit(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local pileCount = role_buff_pile(OwnerId, "艮")
    local totalPercent = additionPercent + pileCount * plusPercent
    for _, targetId in pairs(args.Targets) do
        local dmgValue = role_stat(targetId, stat_key.MaxHp) * totalPercent
        self:TryDoBuffDamage(args, targetId, targetId, dmgValue, DmgType.Physical)
    end
end

return buff