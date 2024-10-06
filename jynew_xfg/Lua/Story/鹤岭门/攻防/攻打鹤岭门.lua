local faction_control = require("Common/faction")
local isLastFight = faction_control.only_last_building_left("鹤岭门")
if isLastFight then
    set_flag_int("攻打鹤岭门阵型", 4)
else

end