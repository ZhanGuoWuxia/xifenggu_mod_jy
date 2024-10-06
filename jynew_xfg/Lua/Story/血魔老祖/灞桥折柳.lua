show_stage("虎焰山山洞.png", "虎焰山山洞")
set_bg_mat("ImgPaperFold")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local zijinfeng = actor("子瑾风")
zijinfeng:setScale(1.1)
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-500, 75)
situ:face_right()
zijinfeng:setPos(1100, 75)
zijinfeng:face_right()

wait_twn(situ:movetoX(800), situ:daze())
zijinfeng:flip()
situ:say("师兄，师父他老人家何在？那刺杀师父的幕后黑手，可已查明？")
zijinfeng:say("我来此正欲告知你，师父他老人家已留书一封，独自出游了。")
zijinfeng:say("至于刺杀之事，我已调查清楚，与周边武林门派并无干系。")
hide_all_stage_bubble()
local options = {
  "告知师兄夜鸦之事",
  "暂且隐瞒夜鸦之事",
}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    situ:say("师父他老人家走得如此匆忙，可能需探寻虎焰门灭门之事。")
    situ:say("我和师父推测可能是夜鸦所为。")
    zijinfeng:say("夜鸦？那不是早已销声匿迹的上古神兽吗？既然师父如此推测，想必有其道理。")
    zijinfeng:say("夜鸦若真涉此事，必然极为凶险。我需尽快动身，希望还能追上师父的踪迹。")
  end,
  ["2"] = function()
    situ:say("师父他老人家走得如此匆忙，不知究竟有何要事？")
    zijinfeng:say("师弟放心，师父他一生行事谨慎，此次出游必有重要缘由。")
    zijinfeng:say("我等只需安心等待，师父自会归来。师父他武艺高强，料想定能平安无事。")
    situ:say("师兄说得是，我确是有些杞人忧天了。")
    zijinfeng:say("此次我出游，本是为了解决虎焰门存亡之事。如今事情已了，我必须返回<color=red>飞星云顶</color>。途中我也会继续探听师父的下落。")
  end
}
situ:say("师兄也要离开虎焰山？")
zijinfeng:say("我与(player:fname)师弟虽相识不久，但情同手足。他日你若来飞星云顶，我们再好好切磋一番。")
situ:say("师兄……")
zijinfeng:say("我将我随身携带之物留与你，各自珍重。")
situ:say("师兄，保重！")
zijinfeng:say("师弟，不必多言。江湖路远，我们有缘再见。")
hide_all_stage_bubble()
wait_twn(zijinfeng:flip(), zijinfeng:movetoX(2500, 2500))

show_card{"天罡戒"}
add_player_item("天罡戒", 1)

black_scene(0.25)
hide_stage()
set_flag("完成灞桥折柳")
light_scene(0.25)
