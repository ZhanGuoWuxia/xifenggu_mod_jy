local faction_control = require("Common/faction")
local isLastFight = faction_control.only_last_building_left("万雀溪谷")
if isLastFight then
    set_flag_int("攻打万雀溪谷阵型", 3)
else

end