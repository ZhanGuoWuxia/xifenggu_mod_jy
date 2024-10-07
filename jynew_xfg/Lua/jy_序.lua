black_scene(0)
show_stage("虎焰山山洞.png", "虎焰山山洞")
light_scene(0.25)


-- local menpai = show_avg_select("小虾米", "选择你要扮演的门派", {"华山", "武当", "少林", "魔教"})

-- if(menpai == 1) then
--     avg_talk("", "选择了华山")
-- end

-- --解锁门派的所有地块
unlock_menpai(get_player_menpai().BeanId)
for k,v in pairs(get_other_menpais(get_player_menpai())) do
    unlock_menpai(v.BeanId)
end

avg_talk("小虾米", "唔…… 这是哪里？")



black_scene(0.25)
hide_stage()
light_scene(0.25)
