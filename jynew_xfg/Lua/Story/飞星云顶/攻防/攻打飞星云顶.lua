local faction_control = require("Common/faction")
local isLastFight = faction_control.only_last_building_left("飞星云顶")
if isLastFight then
    set_flag_int("攻打飞星云顶阵型", 3)
else

end