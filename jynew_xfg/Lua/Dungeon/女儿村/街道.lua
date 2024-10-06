avg_talk("", "街道并不算热闹，但不时有些儿童追逐玩耍，也有年纪大些的村民看着这些嬉戏的孩童。")
set_flag("完成街道")

if has_flag("开始捉迷藏") then
    if not has_flag("找到小女孩丙") then
        local opts = {
            "小女孩丙",
            "离开",
        }

        local i = show_avg_select("", "街道旁的角落里站着小女孩丙，歪着头并不多话。", opts)
        
        switch(i){
            ["1"] = function() 
                avg_talk("司徒来也", "你为什么不藏起来？")
                avg_talk("[speaker:小女孩丙]", "本想站在街道中装作路人的，谁成想失败了……")
                avg_talk("司徒来也", "你躲得很好，只可惜哪有路人是你这般年纪的？")
                avg_talk("[speaker:小女孩丙]", "哈哈，也是，那我先回去了！")
                set_flag("找到小女孩丙")
                add_dungeon_task_progress("女儿村", "捉迷藏", 1)
            end,
            ["2"] = function()
                return
            end
        }
        
    end
end