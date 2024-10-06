avg_talk("", "这是一间残破的陋室，断壁残垣般在这风沙中诉说着寂寞。")
if not is_in_dungeon("赖三", "远古遗迹") then
  local options = {
    "打扰一下",
    "离开",
  }
  
  local idx = show_avg_select("", "前面有一个熟悉的背影，是否上前打招呼？", options)
  switch(idx) {
    ["1"] = function()
        avg_talk("司徒来也", "打扰一下，这位兄台……咦！你不是酒香亭的店小二赖三兄吗？")
        avg_talk("赖三", "原来是(player:fname)掌门。怎么，掌门也是闻得宝藏消息，前来这远古遗迹寻宝的吗？")
        avg_talk("司徒来也", "赖兄误会了，我等乃是听到此处有地动异响，担心有何不测，特来查看。至于宝藏，倒是未曾听闻。")
        avg_talk("赖三", "哈哈，(player:fname)兄真是快人快语。不过，这遗迹之中确有传说中的一笔宝藏。")
        avg_talk("赖三", "我赖三虽然不才，却也知道独木不成林，愿与各位一同探寻，不知(player:fname)兄意下如何？")
        avg_talk("司徒来也", "好，既然赖兄如此慷慨，我等若再推辞，倒是显得小气了。便让我们携手共探这远古遗迹的秘密吧！")
        role_join_dungeon("赖三", "远古遗迹")
    end,
    ["2"] = function()
        return
    end,
  }  
end

set_flag("完成房间")