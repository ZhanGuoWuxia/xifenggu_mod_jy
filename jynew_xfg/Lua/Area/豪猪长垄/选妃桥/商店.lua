local shoplogic = require 'Area/商店进入逻辑'

shoplogic.enter_shop("选妃桥商店", 
function()
    avg_talk("","桥边小镇在驱离豪猪的土匪后，逐渐变得欣欣向荣，你瞧见镇上似乎新开张了一家商铺，遂走了进去……")

    avg_talk("[speaker:被解救的女子][img:ai2_female_11]", "(player:fname)公子？欢迎光临(惊喜道)！")

    avg_talk("[speaker:被解救的女子][img:ai2_female_11]", "多亏了(player:fname)公子的救助，让我从豪猪土匪的魔掌中重获自由，这份恩情没齿难忘！如今，我决心经营这家店铺，为这片江湖贡献一份绵薄之力。")
    
    avg_talk("司徒来也", "店主客气了，我只是尽了一份绵薄之力。")

    avg_talk("司徒来也", "对了，我想购置一些杂货奇物，不知店主可有推荐？")
    
    avg_talk("[speaker:被解救的女子][img:ai2_female_11]", "当然，(player:fname)公子，（手指着摆放在货架上的一些商品）你且看这边。")
 end)