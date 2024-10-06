avg_talk("司徒来也", "姨母，思虑再三，我们还是各自为政最好。")
avg_talk("南宫燕", "笑话！我仙竹门岂是你想来就来，想走就走的？")
avg_talk("南宫燕", "我们不是盟友，便是敌人。")

local diplomatic = require("Common/diplomatic")
diplomatic.declare_war("仙竹门", "player")
set_flag("完成退盟仙竹门")
