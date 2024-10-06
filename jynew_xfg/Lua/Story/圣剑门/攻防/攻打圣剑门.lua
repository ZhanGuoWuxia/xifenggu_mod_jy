local faction_control = require("Common/faction")
local isLastFight = faction_control.only_last_building_left("圣剑门")
if isLastFight then
    set_flag_int("攻打圣剑门阵型", 3)
else

end