
show_stage("禁地.png", "训练场")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("朱鹮儿")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(800), situ:daze())

situ:say("小鹮儿，今日就让我们比一比，看看谁的箭法更加精准！")
npc:say("比箭法？小也儿，你恐怕不是我的对手。")
situ:say("那我们就来赌一赌，看看谁才是虎焰门真正的第一射手！")
npc:say("等等，你先说说赌注是什么？")
situ:say("如果我赢了，你就把你这把亲手做的弓送给我，我想挂哪儿就挂哪儿。")
npc:say("好！那如果你输了，你得送我一把比这个好十倍的弓！")
situ:say("一言为定！你可别后悔。")
npc:flip()
npc:say("看到那些麻雀了吗？你一箭，我一箭，谁先射中就算谁赢，怎么样？")
situ:say("好！让你见识见识掌门的厉害。")
hide_all_stage_bubble()
local options = {
    "枝头有一只肥麻雀，努力瞄准。",
    "枝头有一只肥麻雀，故意瞄偏。"
}
local idx = show_quick_selections(options)
if idx == 1 then
    situ:spring_scale(1.5, 1.03, 1.03)
    situ:say("（弯弓搭箭，瞄准了枝头，嗖！）看箭！")
    stage_narration("一只肥雀噗噗坠地，利箭是从它翅下穿过的。")
    situ:say("这下好，本掌门大人一击即中，小鹮儿若不是一箭双雕，那可算是我赢了。")
else
    situ:spring_scale(1.5, 1.03, 1.03)
    situ:say("（弯弓搭箭，故意瞄偏了一点点，嗖！）看箭。")
    stage_narration("箭擦了一下麻雀翅膀上的羽毛，惊得麻雀扑扑飞走了。")
    situ:say("可惜可惜，差一点点，看你的了。")
end
npc:say("拿弓来。")
npc:spring_scale(1.5, 1.03, 1.03)
situ:say("你这是瞄哪呢？")
stage_narration("朱鹮儿一声不吭，一支箭离弦而出。“咚！！”，那箭直中树干最硬处，发出一声巨响。")
situ:say("哈哈哈哈，你这声音倒是响得狠，可以不见中一只雀啊。")
npc:say("你看看地上。")
stage_narration("地上躺着三只麻雀，显然是被朱鹮儿的箭声吓破了胆，从枝头跌落了下来。")
situ:emotion("KunHuo")
situ:say("还有这种玩法？")
npc:say("我赢了！请叫我虎焰门第一射手。")

hide_all_stage_bubble()

change_favor_by_id("朱鹮儿", 1)
roleId_change_affix("朱鹮儿", "亲昵无间_朱鹮儿", "风流灵巧")
role_add_affix("司徒来也", "亲昵无间_司徒来也")

black_scene(0.25)
hide_stage()
set_flag("完成朱鹮儿剧情4")
light_scene(0.25)
