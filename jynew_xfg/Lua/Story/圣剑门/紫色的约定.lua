
local subtitles = {"深夜 虎焰堂"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("bg_219.png", "虎焰堂")
play_bgm("Music/抒情_柔情似水.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local jiyeman = actor("姬野蔓")

--初始化位置和朝向
bright_all_actors()

situ:setPos(2400, 75)
situ:face_left()
jiyeman:setPos(2500, 75)
jiyeman:face_left()

--剧情
wait_twn(situ:movetoX(700),situ:daze())
situ:flip()
situ:say("出来吧")
situ:say("这半夜三更圣剑门的阁主莅临我虎焰门，不知所谓何事？")
stage_narration("只见远处走来一人……")
wait_twn(jiyeman:movetoX(1500),jiyeman:daze())
jiyeman:say("果然逃不过虎焰门主的眼睛…")
jiyeman:say("不过不必担心，只有我一人前来，来送信。")
jiyeman:say("此信世间少有，还望斟酌慎重。")
situ:say("阁主所送的这朵紫色玫瑰虽然极其罕见，不知算什么信？不妨有话直说。")
jiyeman:say("倒也直率，我想与你做个交易……")
situ:say("交易？")
jiyeman:flip()
jiyeman:say("圣剑门执剑人百里烟波闭关修炼多年，又有磨剑阁朗自归、观剑阁王珑、亮剑阁范道平，还有我，抚剑阁姬野蔓。")
jiyeman:say("如今，门中打算从四阁中选出一个临时执剑人……")
situ:say("可这与虎焰门何干？")
jiyeman:flip()
jiyeman:say("如今，你们虎焰门势头正旺，我没猜错的话，你们下一步计划就是圣剑门了吧？")
situ:say("这……")
jiyeman:say("弱肉强食本也无妨，只是若他日与圣剑门为敌时，先攻亮剑、观剑、磨剑三阁可好？")
situ:say("意思就是避开抚剑阁？")
jiyeman:say("倒也不必如此疑惑，以虎焰门实力也未必吃下圣剑门。可若给三阁添些麻烦，我便又把握当上临时执剑人，当这圣剑门的二当家。")
situ:say("可若虎焰门不愿与圣剑门为敌呢？")
jiyeman:say("哈哈哈，你也不必诈我，我知道你的那些恩怨。可报仇何必你死我活？你的仇人又何必是整个圣剑门？你我联手，岂不双赢？")
situ:say("如此看来，阁主当真心思缜密啊……")
jiyeman:say("我阁中也非无人可用，我也不过只是看你也算一表人才，这才有意拉拢。说到底，这紫色玫瑰收与不收，全由你。")
local options = {
  "与阁主强强联手，我岂会拒绝？",
  "圣剑门之事，我并不想参与其中。",
}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    jiyeman:say("不愧是我姬野蔓看中的人。")
    situ:say("我可以先不扰抚剑阁，助阁主稳固地位，但也希望阁主能信守诺言，许我两件事。")
    jiyeman:say("哦？先说来听听。")
    situ:say("一，虎焰门人秋与朗自归乃是灭门之仇，我自当为门人出头；二，江湖传说，百里烟波与夜鸦有牵连，而我必须找到夜鸦。")
    jiyeman:say("只要我当上二当家，这两件事，易如反掌！")
  end,
  ["2"] = function()
    situ:flip()
    situ:say("我虎焰门无意掺和圣剑门之事，阁主未免太看轻我虎焰门的决意了。")
    wait_twn(jiyeman:movetoX(1300),jiyeman:daze())
    jiyeman:say("哦？这倒奇了，难道你不想报仇了？")
    situ:flip()
    situ:say("门人与朗自归的仇我自然会出手，可圣剑门我也迟早会拿下。不，就连这息风谷，都必会被我虎焰门的烈焰点燃！")
    jiyeman:shake()
    jiyeman:say("口气不小，只是有没有这个实力呢？")
    situ:jump()
    situ:say("若不将整块地毡掀翻，又怎能找出其下隐藏的秘密呢？我自是要做那动手之人！")
    jiyeman:say("好一个动手之人，你这小子倒是让人越来越着迷了……")
  end,
}

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成紫色的约定")
light_scene(0.25)
