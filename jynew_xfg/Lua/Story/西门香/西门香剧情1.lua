
show_stage("写意室内.png", "虎焰门东厢房")
play_bgm("Music/西门香.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("西门香")

--初始化位置和朝向
bright_all_actors()
npc:setPos(-400, 75)
npc:face_right()
situ:setPos(1200, 75)
situ:face_left()

wait_twn(npc:movetoX(900), npc:daze())

npc:say("喂，(player:fullname)。关于我俩的婚约，你什么想法？")
stage_narration("(player:fullname)与西门香是从小的青梅竹马，早就已定了娃娃亲，但如今因为变故已被悔婚。")
situ:flip()
situ:say("香儿，等你养伤好了，我还是差人送你回去吧，不然西门掌门他们该担心了。")
npc:say("我不回去，长辈们亲口定下的婚约，岂能言而无信、说毁就毁。我虽是女子，也知行走江湖要有信义。")
npc:say("喂，(player:fullname)，你到底娶不娶我？")
situ:say("香儿，你……")
npc:say("我算看明白我爹，他趋炎附势、欺软怕硬、见风使舵。这次，说什么我也不会听从他的安排。")
situ:flip()
situ:say("我明白，自从虎焰门遭此变故，又多方树敌，前途未明。此危机关头，你爹自然要为你的将来考虑。")
npc:say("那也不由得他西门坡一人说了算。我只知道江湖人要守信义，救人于危难，何况我们俩家还有如此故交，自然得相助。")

situ:jump()
situ:say("香儿！你真是深明大义！有你真是太好了……")
situ:say("那就……请你助我一起复兴虎焰门。")

npc:flip()
wait_twn(npc:movetoX(400))
npc:say("哼，(player:fullname)，别误会了，我可不是非你不嫁。")

situ:say("（哈哈，但愿香儿没有生气。）")
npc:say("（哼，呆子！）")

hide_all_stage_bubble()

change_favor_by_id("西门香", 1)

black_scene(0.25)
hide_stage()
set_flag("完成西门香剧情1")
light_scene(0.25)
