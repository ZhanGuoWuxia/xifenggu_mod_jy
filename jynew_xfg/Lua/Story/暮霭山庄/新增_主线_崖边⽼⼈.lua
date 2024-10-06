local subtitles = {"暮霭⼭庄-望尘崖"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("bg_60.png", "暮霭⼭庄-望尘崖")
set_bg_mat("ImgPaperFold")
light_scene(0.2)
play_bgm("Music/抒情_柔情似水.wav", 0.2)

--初始化人物
local situ = actor("司徒来也")
local chuanxi = actor("[speaker:川西][img:hero_LaoSong]")

--初始化位置和朝向
dark_all_actors()
situ:setPos(2500, 75)
situ:face_left()
chuanxi:setPos(700, 85)
chuanxi:face_left()




--剧情
wait_twn(situ:movetoX(1250),situ:daze())
chuanxi:say("司徒掌⻔，现在不只望尘崖是⻁焰⻔的，暮霭⼭庄都是⻁焰⻔的了。")
situ:say("我和⼤叔的约定依然有效，您如果愿意，可以⼀直留在望尘崖边。")
chuanxi:flip()
chuanxi:say("那太感谢不过了，⽼夫这⼀辈⼦，也没有别的愿望，只愿能帮更多的⼈看到穿过雾霾的光。")
chuanxi:say("不过…说来也怪，⾃从⾃这⼀块由⻁焰⻔掌管之后，还没有出现过轻⽣的⼈。")
situ:say("看来这“借⽆还”的苏半⻅在这⾥称王称霸时，欺压了不少⽣活不易的⼈。")
chuanxi:jump()
chuanxi:say("哈哈，你这么⼀说，还真是有可能。")
situ:say("那我就先回了，我还有很多事情要处理。")
situ:flip()
situ:movetoX(1500)
chuanxi:say("等等，司徒掌⻔，还有⼀件事情，⽼夫想与你分享。")
hide_all_stage_bubble()
wait_twn(chuanxi:movetoX(1000),chuanxi:daze())
situ:flip()
situ:say("哦？⼤叔请说。")
chuanxi:shake()
chuanxi:say("就在前⼏⽇，他回来了…")
situ:say("你说的这个他，是…？")
chuanxi:shake()
chuanxi:say("⼆⼗年前，我救下的那个书⽣。")
situ:jump()
situ:say("哇，那是⼤叔救的第⼀个⼈吧，他特意来感谢你了？")
chuanxi:say("我当时在屋内，他只在这崖边站了⼀会⼉，就离去了…")
situ:say("他没有和⼤叔⻅⾯吗？")
wait_twn(chuanxi:movetoX(700),chuanxi:daze(),chuanxi:flip())

chuanxi:say("没有，我只⻅到他离去的背影…")
situ:say("⼆⼗年了，你这么确定是他吗？")
chuanxi:flip()
chuanxi:say("他已完全不是当年的装扮，他着⼀⾝⿊⾐，步伐变得⾮常轻盈，时间仿佛让他从⼀个挣扎的蝼蚁，化成了超脱的仙⼈…")
chuanxi:say("但我知道，那就是他…⼀定是他…")
situ:jump()
situ:say("超脱的…仙⼈？")
chuanxi:flip()
chuanxi:say("也许是为了感谢我，他在崖边留下了这束⽉⻅草，我想把他送给司徒掌⻔。")
situ:say("虽然…我不知这草有什么⽤，但这个对你意义很⼤吧？为何要送给我呢…？")
chuanxi:flip()
chuanxi:shake()
chuanxi:say("我想，是我让他挽回了⽣的希望，他也开启了我的⽣命寄托。")
chuanxi:say("⽽司徒掌⻔，是你延续了我这份寄托…所以，我想把这束⽉⻅草献给你。")
situ:jump()
situ:say("那…我就不客⽓的收下了。")
--需要补充道具 月见草
add_player_item("高粱酒", 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
