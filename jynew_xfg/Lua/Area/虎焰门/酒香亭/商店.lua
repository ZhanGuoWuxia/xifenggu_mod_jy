local shoplogic = require 'Area/商店进入逻辑'

shoplogic.enter_shop("酒香亭商店", 
function()
    avg_talk("赖三", "(player:fname)掌门光临，蓬荜生辉。小店虽小，却应有尽有，不知有何需要？")
 end)