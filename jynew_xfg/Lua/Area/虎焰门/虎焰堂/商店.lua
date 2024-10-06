local shoplogic = require 'Area/商店进入逻辑'

shoplogic.enter_shop("虎焰堂商店", 
function()
    avg_talk("司徒来也", "六哥，你蒙面在这商行摆摊是？")
    avg_talk("齐六哥", "嘘——, 掌门，我这是在为我虎焰门复兴大业添砖加瓦。")
    avg_talk("齐六哥", "现下我虎焰门新招大量门人，这新入门者，想必是急需药物、兵器、修武心得之人。这可是一大商机呀！")
    avg_talk("司徒来也", "那你这都卖些啥，我也瞅瞅。")
    avg_talk("齐六哥", "好嘞~")
 end)