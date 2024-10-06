
show_stage("门派宫殿.png", "飞星云顶")
play_bgm("Music/.mp3", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local shibing = actor("石冰")

--初始化位置和朝向
bright_all_actors()

situ:setPos(500, 75)
situ:face_right()
shibing:setPos(800, 75)
shibing:face_left()

shibing:say("该来的……终究还是来了。")
situ:say("不错，以往的帐，总是要清算的。")
shibing:say("只是，终究不是他来……")
situ:say("石掌门害了家父却还要说这种话？未免太过分了些！")
shibing:say("害？呵呵，我只问你，在令尊口中，我石冰是一个什么样的人？")
situ:say("印象之中，父亲可从未提及掌门半字。")
shibing:say("哼，既然如此，他便非死不可了！")
situ:say("这话什么意思？")
shibing:say("什么意思？你父亲的命本就是我给的！我曾经用这条命换了他的活路，而他呢？视我如无物，在你面前，我这个救命恩人的事竟是半句也不提！")
situ:say("那你就要害死我爹？就要整个虎焰门灭门？")
shibing:say("哈哈哈，你这胡搅蛮缠的模样，倒是跟他如出一辙！虎焰门同我何干？我所做的，不过是看着一个寡义的人如何受尽折磨罢了。")
situ:say("你就这么眼睁睁看着夜鸦为非作歹？勾连夜鸦，你于心何忍？")
shibing:say("我又何必为了这样一个薄情之人去得罪夜鸦？他根本不值得我用性命去换！")
situ:say("少废话！夜鸦究竟在哪里？")
shibing:say("你算什么，我石冰又凭什么告诉你？")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成冷血换薄情")
light_scene(0.25)
