local shoplogic = require 'Area/商店进入逻辑'

shoplogic.enter_shop("窑洞商店", 
function()
    avg_talk("[speaker:弃暗投明的土匪][img:pawn_HaoZhuChangLong_male_3]", "(player:fname)老大……有啥看上眼的东西你尽管说。")
 end)