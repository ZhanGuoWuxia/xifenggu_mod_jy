
show_stage("大门.png", "训练场")
play_bgm("Music/西门香.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("西门香")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

--西门香练武中
play_sfx("Skills/Wuxia/blade_2.mp3")
wait_twn(npc:movetoX(500, 4000), npc:offsetX(-300, 4000), npc:offsetX(500, 4000), npc:offsetX(300, 4000), npc:movetoX(1200, 4000), npc:daze())
npc:say("呵！")

situ:shake()
situ:say("好……好快的剑法，我竟未能察觉。")
npc:say("哈哈，若这柳枝换作宝剑，(player:fname)掌门恐怕就没命来“重燃虎焰”了。")

situ:say("（万幸啊万幸，西门姑娘是友非敌~）")
npc:say("想什么呢？")

situ:say("“水上漂赵让，铁布衫韩恭”，两位前辈的威名，我们自幼便已耳熟能详。香儿你隐隐约约已经有你师父赵让先生当年的风范。")
npc:say("我爹当上掌门后，请了赵让师父来教我剑法，弟弟则拜了韩恭为师。")
situ:say("西门坡掌门在江湖人脉上做得可真是无可挑剔啊！")
npc:say("哼，精致的利己主义者罢了。我和弟弟不是他的傀儡，小时候还懵懂不知道，现在算是彻底明白了。")

situ:say("（香儿的父亲虽然势利得很，但香儿似乎完全没有被自己的原生家庭影响，属实难得。）")
situ:say("（多么好的妹子啊！）")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成师承高手")
light_scene(0.25)

