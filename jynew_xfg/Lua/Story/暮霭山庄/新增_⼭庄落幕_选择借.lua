local subtitles = {"几番打斗过后……"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("bg_15.png", "暮霭⼭庄")
set_bg_mat("ImgPaperFold")
light_scene(0.2)
play_bgm("Music/日常_烟火人间.wav", 0.2)

--初始化人物
local situ = actor("司徒来也")
local luzhui = actor("鹿追")

local subanjian = actor("苏半见")

--初始化位置和朝向
dark_all_actors()
situ:setPos(1600, 75)
situ:face_left()
luzhui:setPos(1800, 75)
luzhui:face_left()
subanjian:setPos(1100, 75)
subanjian:face_right()

--剧情
situ:say("吃我一招！")
play_sfx("Voice/Male2_Attack_1.wav")
hide_all_stage_bubble()
situ:rotatetoZ(20)
situ:movetoX(1200,5000)
shake_stage()
play_sfx("Story/Fist.mp3")
wait_twn(subanjian:rotatetoZ(45),situ:rotatetoZ(-20),subanjian:movetoX(300,5000))
wait_twn(subanjian:rotatetoZ(-45),subanjian:daze())
subanjian:say("咳咳……")
subanjian:jump()
subanjian:say("还说什么⻁焰⻔全都是⼤⽓之⼈，简直是虚⾔！⼏⽚叶⼦⽽已，给你，给你便是了！")
hide_all_stage_bubble()
situ:flip()
wait_twn(situ:movetoX(1600),situ:daze())
situ:say("可是⻬了？")
luzhui:jump()
wait_twn(play_sfx("Voice/Female2_Laugh_2.wav"),luzhui:say("是⼗九⽚！⼀⽚不少，只是有⼏⽚沾染了酒⽔，得赶快擦拭⼲净。"))
subanjian:say("⿅姑娘还真是如此宝⻉这⼏⽚叶⼦。")
situ:flip()
hide_all_stage_bubble()
wait_twn(situ:movetoX(1200),situ:daze())
situ:say("既然还了，时间虽是晚了些，却也是守了承诺。")
subanjian:shake()
subanjian:say("……哈哈，⽼⼦好久没有还过东西了，也从来没有⼈说我信守承诺，这感觉还真是异样……")
subanjian:say("不过倒也……挺舒坦的…… ")
situ:say("……不愧是借⽆还，居然能在这样平平⽆奇的事情上寻得快感，还真是让⼈⽆法理解……")
subanjian:jump()
subanjian:say("你这⼩⼦倒是有趣，⽼⼦也是服了你了，为了信守与这⿅姑娘的承诺，不惜与我苏半⻅⽃个你死我活。")
subanjian:say("⽼⼦混迹江湖这么久，还从未⻅过你这样的⼩⼦。 ")
situ:say("信守承诺，是息⻛⾕侠⼠应有之道。")
subanjian:say("好！我也不占你便宜，这两瓶拿岁炙叶泡过的酒也给你。")
hide_all_stage_bubble()
wait_twn(subanjian:movetoX(1000,5000),subanjian:daze())
wait_twn(subanjian:movetoX(300,5000))
--需要补充道具岁炙酒
add_player_item("高粱酒", 1)
situ:say("你这⽼酒⻤，居然舍得将这岁炙叶泡制的酒⽔给我？真是太阳打西边出来了。")
subanjian:jump()
subanjian:say("这天物你若不要便还给我。 ")
wait_twn(situ:offsetY(-70),situ:daze())
situ:say("那便谢过苏掌⻔了。 ")
hide_all_stage_bubble()
situ:offsetY(70)
subanjian:jump()
subanjian:say("哼，掌⻔？我这暮霭⼭庄的⻔都被你拆了，还掌什么⻔？")
subanjian:say("望眼看去，这江湖后⽣可畏，已经没有我什么位置了。 ")
situ:say("苏掌⻔这是打算退隐江湖？ ")
subanjian:flip()
subanjian:shake()
subanjian:say("唉……我还是回到我⼉时的⽥间")
subanjian:say("⻩粱还是⻩粱，布⾕还是布⾕，没有什么鸿鹄之志，也没有什么你争我夺，只有⼀壶⽶酒，伴我⼀醉⽅休。 ")
situ:say("那之后有空定要去找你饮酒。 ")
subanjian:say("⾏啊……只是我可更想与我那已经过世的好兄弟饮酒作乐啊。")
subanjian:say("可惜⼈到暮年，却只剩我这点念想了。 ")
situ:say("有些东西与⼈，藏于梦中并⾮是⼀件坏事。")
subanjian:flip()
subanjian:say("是啊，昨夜我还梦⻅我已故的兄弟了，我梦⻅他把那棉布⾐还给我了。 ")
wait_twn(luzhui:movetoX(1450),luzhui:daze())
luzhui:jump()
luzhui:say("是不是你之前跟我们说的那件红⾊棉布⾐啊？")
subanjian:say("…… ")
subanjian:say("那⾐裳，好像⽐我借给他的更宽，更⻓，摸上去更舒服，只不过，是⿊⾊的…… ")

black_scene(0.5)
hide_stage()
light_scene(0.25)
