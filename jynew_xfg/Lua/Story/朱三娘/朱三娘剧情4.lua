
show_stage("厨房.png", "厨房")
play_bgm("[override_map]:Music/抒情_柔情似水.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("朱三娘")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(800), situ:daze())

situ:say("近来咱们虎焰门的厨房，怎么越来越像花园了？")
npc:say("掌门说笑了，不过是我种了些青菜瓜果，现下正是长成的时节。")
situ:say("外面那片空地还不够种？瞧这厨房里这一片一片的，咱们虎焰门吃得了这么多？")
npc:say("掌门有所不知，这外面的跟里面的，并不是同一品种，这味道、成色差别很大的。")
situ:say("原来还有这样的学问？")
npc:say("可不？这菜肴中的学问，头一样便是选材和用料了，那是当真不能有一点马虎的。")
situ:say("这我倒有些明白，就像是习武练功，身强力壮之人确是会更有些优势。")
npc:say("正是这个道理！再说这前后场院，空着倒当真可惜，想着种些东西看着也热闹不是？")
situ:say("哈哈哈，咱虎焰门到了稻谷瓜果收获时，反而有种归农的惬意。")
npc:say("惬不惬意我不懂，掌门只要不嫌弃这些便好。")
situ:say("只是这样倒是辛苦了三娘了，为了虎焰门里上下的吃食，岂不都要三娘亲自种植？")
npc:say("没什么，都习惯了。")
situ:say("寻常还好，莫非这生火炒饭，还要专门去烧炭做锅？哈哈哈哈……")
npc:say("掌门如何知道？")
situ:say("哎？当真？我说笑的。")
npc:say("若非如此，又怎么会认识刘明那个冤家呢？")

hide_all_stage_bubble()

change_favor_by_id("朱三娘", 1)
add_player_item("三娘的肉包", 1)
add_player_item("肉排", 1)

black_scene(0.25)
hide_stage()
set_flag("完成朱三娘剧情4")
light_scene(0.25)
