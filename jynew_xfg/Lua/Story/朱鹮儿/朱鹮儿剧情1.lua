
show_stage("酒香亭.png", "酒家")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("朱鹮儿")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_right()

npc:spring_scale(1.5, 1.03, 1.03)
wait_twn(situ:movetoX(800), situ:daze())
npc:flip()
npc:say("喂，你偷偷瞧我射箭呢。")
situ:say("“喂”这是什么江湖礼数，见了我，难道不应称呼一声掌门吗？")
npc:say("我朱鹮儿投身虎焰门，是为了共谋大业，而非来低头哈腰。若你硬是要如此，那我便此告辞。")
hide_all_stage_bubble()
local options = {
    "称呼之事，随你心意便是。",
    "江湖之中，必要的礼数还是要有。"
}
local idx = show_quick_selections(options)
if idx == 1 then
    npc:say("这才有些掌门的气度，理应大气磅礴。")
    situ:say("我(player:fullname)倒也不是什么拘泥小节之人。")
else
    npc:say("“掌门”二字，我偏偏不叫，哈哈。")
    situ:say("你这姑娘……")
end
npc:say("喂，你觉得我箭法如何？")
situ:say("难道真的要一直这样称呼我“喂”吗？我年长你几岁，叫声哥哥也是应当。")
npc:say("我哥哥早逝，这个称呼，我是不愿轻易给人的。")
situ:say("罢了罢了，既然如此，掌门便赐你特权，随意称呼，但总得有个名号。")
npc:say("好，那就叫你小(player:gname)吧。")

hide_all_stage_bubble()

change_favor_by_id("朱鹮儿", 1)

black_scene(0.25)
hide_stage()
set_flag("完成朱鹮儿剧情1")
light_scene(0.25)
