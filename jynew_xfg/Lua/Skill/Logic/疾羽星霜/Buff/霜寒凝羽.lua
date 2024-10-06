local buff = buff_define("霜寒凝羽")
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.InnerStrength) * 0.15
    return chance(prob)
end

--附加的BUFF ID
local BuffId = "寒凝羽"
local damageFactor = 0.3

function buff:OnDoHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    local dmg = role_stat(ownerId, stat_key.InnerStrength) * damageFactor

    if buff_chance(args) then
        for _, targetId in pairs(args.Targets) do
            if role_buff_pile(targetId, BuffId) >= 5 then
                --如果处在第一列，对 前中 2个单位造成伤害
                if (pos_of_role(targetId)==0 or 3 or 6) then
                    self:TryDoBuffDamage(args, ownerId, targetId, dmg, DamageType.Magical)
                    self:TryDoBuffDamage(args, ownerId, targetId + 1, dmg, DamageType.Magical)
                --如果处在第二列，对 前中后 3个单位造成伤害
                elseif (pos_of_role(ownerId)==1 or 4 or 7) then
                    self:TryDoBuffDamage(args, ownerId, targetId, dmg, DamageType.Magical)
                    self:TryDoBuffDamage(args, ownerId, targetId + 1, dmg, DamageType.Magical)
                    self:TryDoBuffDamage(args, ownerId, targetId - 1, dmg, DamageType.Magical)
                --如果处在最后一列，对 中后 2个单位造成伤害
                elseif (pos_of_role(ownerId)==2 or 5 or 8) then
                    self:TryDoBuffDamage(args, ownerId, targetId, dmg, DamageType.Magical)
                    self:TryDoBuffDamage(args, ownerId, targetId - 1, dmg, DamageType.Magical)
                end
                add_buff("内劲提升", ownerId, 10, 3)
                remove_buff(BuffId, targetId, ownerId)
            else
                add_buff(BuffId, targetId, args.AttackerId, 1, -1)
            end


        end
    end
end

return buff