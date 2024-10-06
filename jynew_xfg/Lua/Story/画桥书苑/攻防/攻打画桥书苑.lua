local faction_control = require("Common/faction")
local isLastFight = faction_control.only_last_building_left("画桥书苑")
if isLastFight then
    set_flag_int("攻打画桥书苑阵型", 3)
else

end