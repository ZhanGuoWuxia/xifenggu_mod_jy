show_stage("虎焰山山洞.png", "虎焰山山洞")
set_bg_mat("ImgPaperFold")
play_bgm("Music/血魔老祖.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local xuemolaozu = actor("血魔老祖")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-400, 75)
situ:face_right()
xuemolaozu:setPos(1200, 75)
xuemolaozu:face_left()

wait_twn(situ:movetoX(800), situ:daze())
xuemolaozu:say("小娃娃，我就料到你会来。")
situ:say("血魔前辈，晚辈心中有一事不明，还望前辈指点迷津。")
xuemolaozu:say("无妨，且说来看看。")
hide_all_stage_bubble()
local ops = {
    "前辈，你到底是何来历？",
}

show_quick_selections(ops)
xuemolaozu:say("那还得从四十年前说起……")

play_bgm("Music/密谋_夜郎.wav")

stage_narration("息风谷中原有一门派，武功诡异，为上百年前流入的西域教派一支。")
stage_narration("因武功威力霸道、招式极其狠辣，行事乖张，被外人称为“血魔教”")
stage_narration("久而久之，该教由于行事任性妄为，得罪了许多迁入的名门正派。后被外来江湖人士联手围剿，几乎全灭。")

play_bgm("Music/血魔老祖.wav")

xuemolaozu:say("老夫便是当年幸存的“血魔教”成员了。")
situ:say("那前辈是如何逃过此劫的？")
xuemolaozu:flip()
xuemolaozu:say("在那场战役中，我身受重伤，幸而被虎焰门的掌门(player:fname)玦所救。")
xuemolaozu:say("不过后来我也看淡了，什么劳什子江湖，劳什子教派，打打杀杀都是浮云哪。")
xuemolaozu:say("我便在虎焰门内休养生息，修习武艺，直到我有了自保之力，便开始游历江湖，后收了一个徒儿。")

situ:say("虎焰门？原来前辈与虎焰门有此渊源。")
xuemolaozu:flip()
xuemolaozu:say("正是，虎焰门掌门(player:fname)玦，也就是你的爷爷，是我的救命恩人。此恩此情，无以回报。")
situ:say("为何我从未听祖父提起过前辈？")
xuemolaozu:say("你祖父为保我周全，严令门下不得泄露我的身份。你父亲与我交情甚好，也未曾透露分毫。")
hide_all_stage_bubble()
local ops = {
    "前辈此行前来虎焰山有何要事？",
}
 
show_quick_selections(ops)
xuemolaozu:say("老夫接飞鸽传书：听闻虎焰门可能遭遇袭击，老夫急忙赶来，却终究未能见到你父亲最后一面。")
if has_flag("恭维血魔") then
    situ:say("前辈，既然是故人，自是不分你我。")
    xuemolaozu:say("哈哈，小娃娃，果真符合我脾性！")
    situ:say("前辈，晚辈愿拜您为师，传承前辈武学。")
    xuemolaozu:say("哈哈，好，好，好！你有此心，老夫自是欣慰。今日能得你佳子弟，实乃老夫生平一大快事。也算报答你祖父的救命之恩。")
    wait_twn(situ:offsetY(-80), situ:daze())
    situ:say("师父在上，请受弟子一拜。")
    xuemolaozu:say("起来吧，乖徒儿。从今日起，你便是我的传人。我必将我一生所学，倾囊相授于你。")
    wait_twn(situ:offsetY(80), situ:daze())
    situ:say("弟子谨记师父教诲，必定勤学苦练，不负师父期望。")
    xuemolaozu:say("此物名为“紫电坠”，乃是一件难得的宝物，内含玄机。你拿去好好研究，必有所得。")
    hide_all_stage_bubble()
    show_card{"紫电坠"}
    add_player_item("紫电坠", 1)
    set_flag("答应拜师血魔")
else
    situ:say("前辈，能否请您放下过去的恶行，不要再做奸淫妇女这等恶事？")
    xuemolaozu:say("小娃娃，“食色性也”，除了武学，也只有此般乐趣了。不过这次是老夫酒后乱性。")
    xuemolaozu:say("既然你是故人之孙，老夫自当有所收敛。")
    situ:say("前辈，江湖路远，行恶必遭报应。")
    situ:say("我虎焰门虽遭劫难，但我深信，唯有正义才能光大门楣，传承祖父遗志。")
    xuemolaozu:say("哈哈，小娃娃，你真有你祖父的风范。")
    xuemolaozu:say("你祖父当日救我，也是希望我有朝一日能够改邪归正，成为真正的武林中人。")
    hide_all_stage_bubble()
    local options = {
        "前辈，晚辈愿拜您为师。",
        "前辈，道不同不相为谋。",
    }
    local idx = show_quick_selections(options)
    switch(idx) {
        ["1"] = function()
            situ:say("前辈，晚辈对你的武学造诣心生敬仰。")
            situ:say("武学本无善恶，关键在于修行者本身。晚辈愿拜您为师，传承前辈武学。")
            xuemolaozu:say("哈哈，好，好，好！你有此心，老夫自是欣慰。今日能得你佳子弟，实乃老夫生平一大快事。也算报答你祖父的救命之恩。")
            wait_twn(situ:offsetY(-80), situ:daze())
            situ:say("师父在上，请受弟子一拜。")
            xuemolaozu:say("起来吧，乖徒儿。从今日起，你便是我的传人。我必将我一生所学，倾囊相授于你。")
            wait_twn(situ:offsetY(80), situ:daze())
            situ:say("弟子谨记师父教诲，必定勤学苦练，不负师父期望。")
            xuemolaozu:say("此物名为“紫电坠”，乃是一件难得的宝物，内含玄机。你拿去好好研究，必有所得。")
            hide_all_stage_bubble()
            show_card{"紫电坠"}
            add_player_item("紫电坠", 1)
            set_flag("答应拜师血魔")
        end,
        ["2"] = function()
            situ:say("前辈，道不同不相为谋。")
            xuemolaozu:say("哈哈，小娃娃，你有自己的信念，老夫也不会强求。")
        end
    }
end

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("完成拜师血魔")
light_scene(0.25)
