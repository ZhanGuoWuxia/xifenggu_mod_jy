show_stage("厨房.png", "厨房")
play_bgm("[override_map]:Music/抒情_柔情似水.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local zsniang = actor("朱三娘")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
zsniang:setPos(1300, 75)
situ:face_right()
zsniang:face_left()

wait_twn(situ:movetoX(800), situ:daze())
situ:say("三娘一直都起得这么早？")
zsniang:say("伙房的事，不早些预备下怎么行？若说早起，掌门不也是？")
situ:say("勤能补拙，我就是先前耽搁的太多了。若非如此，才能早日让虎焰门……")
zsniang:say("瞧我，大早上说这些，没得让掌门不开心。")
situ:say("三娘哪里的话，当下门中就咱们几个，作为掌门，怎能不多担当些？")
zsniang:say("可惜三娘只擅长烧火做饭，旁的事也帮不上忙。")
situ:say("三娘能留在虎焰门，便已经是雪中送炭了。")
zsniang:say("送炭？那不该是明哥的活计？")
situ:emotion("DaXiao")
situ:say("哈哈哈，正是正是！")
zsniang:say("明哥同我一样都是粗人，江湖上那些高深功夫是半点也不懂，能不拖累大家就好……")
situ:say("三娘哪里的话？刘明可是有些功夫在身上的。")
zsniang:say("掌门，三娘有一事相求。原也不该说的，可这心中就是放不下。")
situ:say("什么事？")
zsniang:say("明哥的学问功夫，烦请掌门多提点些？这生死无常或许是命，可未必就要认命。")
hide_all_stage_bubble()
local options = {
    "三娘放心！",
    "一切有我！",
}
local id = show_quick_selections(options)
switch(id) {
    ["1"] = function() 
        change_favor_by_id("朱三娘", 1)
    end,
    ["2"] = function()
        change_favor_by_id("司徒来也", 1)
    end
}

situ:flip()
wait_twn(situ:jump(), situ:movetoX(-500))
add_player_item("三娘的肉包", 1)
add_player_item("鸡腿", 1)
add_player_item("肉排", 1)

black_scene(0.25)
hide_stage()
set_flag("完成早晨的厨房")
light_scene(0.25)
