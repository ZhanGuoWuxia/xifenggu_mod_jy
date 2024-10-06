local faction_control = require("Common/faction")
local isLastFight = faction_control.only_last_building_left("灵猹仙洞")
if isLastFight then
    set_flag_int("攻打灵猹仙洞阵型", 3)
else

end