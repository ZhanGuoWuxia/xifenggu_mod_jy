local territory = current_territory
if not territory then
    return false
end

local area = territory.DisputedArea
local attackMenpai = territory.Attacker

if not area or not attackMenpai then
    print_warning("territory area or attackMenpai is nil")
    return false
end

--不是玩家门派占领
if not is_player_menpai(attackMenpai) then
    return false
end

--玩家之前占领过
local flagKey = "first_occupy_" .. tostring(area.Id)
local is_re_occupy = has_flag(flagKey)
if is_re_occupy then
    return false
end

return true
