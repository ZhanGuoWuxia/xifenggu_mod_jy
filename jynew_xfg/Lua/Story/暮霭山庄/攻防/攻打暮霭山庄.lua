local faction_control = require("Common/faction")
local isLastFight = faction_control.only_last_building_left("暮霭山庄")
if isLastFight then
    set_flag_int("攻打暮霭山庄阵型", 3)
else

end