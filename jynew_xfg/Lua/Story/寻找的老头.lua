show_stage("bg_219.png", "虎焰门大堂")
set_bg_mat("ImgPaperFold")
light_scene(0.2)

local situ = actor("司徒来也")
local nvzi= actor("[speaker:求助的少女][img:ai2_female_18]")
local laotou = actor("[speaker:老头][img:npc_LaoTou_1]")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(900, 75)
situ:face_right()
if has_flag("完成阻止梁胜抢劫少女") then
    nvzi:setPos(700, 75)
    nvzi:face_right()
else
    nvzi:hide()
end
laotou:setPos(2400, 75)
laotou:face_left()

wait_twn(laotou:movetoX(1400), laotou:daze())
if has_flag("完成阻止梁胜抢劫少女") then
    play_bgm("Music/回忆.wav")
    wait_twn(nvzi:offsetX(400), nvzi:daze())
    nvzi:say("爷爷！爷爷！")
    laotou:say("小伢子！爷爷终于找到你了！幸好你没事！")
    nvzi:say("爷爷！多亏了恩人援手，可是爹娘和酒香亭的乡亲们……")
    laotou:say("唉，造孽啊……")
    laotou:say("掌门，感谢你救了我家小伢子！")
    situ:say("老人家，别见外，我们都是一家人呀。")
    laotou:say("早年我在外地从商，偶得一件宝甲，现在交付与你！希望掌门赶紧把这些坏人赶走吧。")
    add_player_item("麒麟甲", 1)
    laotou:say("酒香亭素来与世无争，如何会遭遇此等灾祸！")
    situ:say("老人家请宽心！虎焰门绝不会坐视豪猪长垄的暴行不管！")
else
    play_bgm("Music/山雨欲来风满楼.wav")
    laotou:say("几位大侠，可看见一个半大的女娃娃了？")
    situ:say("老人家，您说的是酒香亭来的小姑娘？")
    laotou:say("正是啊！大侠！您看见了？那是我孙女啊！")
    situ:say("老人家，都怪我无能，没能从豪猪长垄的人手里救下您孙女。")
    laotou:say("小伢子！老天啊！那孩子爹娘都……如今你也不知去向，我们一家究竟为何得罪了这些人啊！")
    laotou:say("我来陪你们——")
    hide_all_stage_bubble()
    laotou:rotatetoZ(90)
    wait_twn(laotou:offsetY(-100))
    situ:say("老人家，何必自寻短见，做这种亲者痛仇者快的事情。")
    hide_all_stage_bubble()
    local options = {"收敛尸身", "离开"}
    local idx = show_quick_selections(options)
    if idx == 1 then
        wait_twn(situ:movetoX(1200), situ:offsetY(-100))
        add_player_item("血麒麟甲", 1)
        wait_twn(situ:offsetY(100), situ:daze())
        situ:say("老人家请宽心！虎焰门绝不会坐视豪猪长垄的暴行不管！")
    else        
        wait_twn(situ:movetoX(3500))
        add_player_item("龟岩气功", 1)
    end
    set_flag("开启收复失地")
end

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("完成寻找的老头")
if not has_flag("完成抵抗偷袭") and not has_flag("完成阻止梁胜抢劫少女") then
    pop_tip("你现在可以通过 <color=red>收复失地</color> 快速占领地块了")
end
light_scene(0.25)
