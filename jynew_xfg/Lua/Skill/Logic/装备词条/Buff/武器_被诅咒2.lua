--每回合结束后，将有一道雷霆霹向场上随机一个位置，对其造成目标10%最大生命值伤害，并昏迷1回合
local buff = buff_define("武器_被诅咒1")

local damageFactor = 0.1

function buff:OnRoundEnd(args)
    local hitterId = roleid_at_pos(math.random(0,9), math.random(0,1))
    if hitterId ~= -1 then
        local dmg = role_stat(hitterId, stat_key.MaxHp) * damageFactor
        self:TryDoBuffDamage(args, -1, hitterId, dmg)
        add_buff("晕眩", hitterId, -1, 1, 2)
    end

end

return buff