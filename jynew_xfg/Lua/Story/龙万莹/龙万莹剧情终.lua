
show_stage("龙万莹的房间.png", "龙万莹的房间")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("龙万莹")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1100, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(800), situ:daze())

situ:say("夫人，我与六哥探讨了一番，大约知晓夫人每诞下一子，功力便大增的原因了。")
npc:say("(player:fname)掌门费心了，这是何故？")
situ:say("常人练功，以气为本，而夫人之体质，似是以血为根。")
npc:say("我与他人不同？")
situ:say("若无差池，夫人功力大增，应是体内壬癸之血所致。此血旺盛者，多性格妖娆，体态丰腴。")
npc:say("这…不正是形容我吗？")
situ:say("女子生育前后，壬癸之血尤为旺盛，因此夫人每至此时，功力便显著提升。")
npc:say("原来如此。")
situ:say("除孕育期间，夫人还有何时觉得功力提升迅速？")
npc:say("还有一次，就是去年，我再次见到了宋郎。")
situ:say("哦？")
npc:say("宋郎在外流浪二十载，重逢后，因龙湾门势力庞大，他只能以厨子身份潜伏，暗中守护我。")
npc:say("我们只能在夜间私会，那段时间，我感到功力迅速提升。")
situ:say("这就对了！")
npc:say("对了？")
situ:say("遇到心悦之人，也会激发体内壬癸之血。")
npc:say("原来如此。")
situ:say("夫人，试试这个。")
npc:say("这是什么？")
situ:say("葛根。")
npc:say("有何用途？")
situ:say("夫人尝尝便知。")
situ:say("感觉如何？")
npc:say("通体舒畅…感觉血液在体内流动得极快。")
situ:say("这里还有许多，夫人可以常服此物，或许能助夫人内功更上一层楼。")
npc:say("太好了！多谢掌门的关心！")
situ:say("夫人客气了，您身体几近恢复，但仍需静养，我便不过多打扰了")
npc:say("掌门稍等，妾身仍有一事相求。")
hide_all_stage_bubble()
wait_twn(npc:flip(), npc:offsetX(2000),npc:daze(), npc:flip(), npc:offsetX(-2000) )

stage_narration("龙万莹自呷了一口酒，剩了大半盏")
npc:say("不知，(player:fname)掌门，可愿吃我这半盏儿残酒？")
hide_all_stage_bubble()
local options = {
  "一饮而尽",
  "拒绝饮酒",
}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    situ:say("夫人这酒，甘之如饴。")
    npc:say("妾身以后就仰仗(player:fname)掌门了。")
    role_add_affix("龙万莹", "蛇舞情浓")
    role_add_affix("司徒来也", "媚蛇之吻")
    pop_tip("龙万莹与你产生了新的羁绊!")
    change_favor_by_id("龙万莹", 1)
  end,
  ["2"] = function()
    situ:say("抱歉，夫人，我并不擅长饮酒。")
    npc:say("既如此，那妾身便独饮此酒好了")
    role_add_affix("龙万莹", "孑然一身")
    change_favor_by_id("龙万莹", 1)
    pop_tip("龙万莹似乎放下了许多心结")
    return
  end
}


hide_all_stage_bubble()

restore_api.add_fire_point(5)

black_scene(0.25)
hide_stage()
set_flag("完成龙万莹剧情终")
light_scene(0.25)
