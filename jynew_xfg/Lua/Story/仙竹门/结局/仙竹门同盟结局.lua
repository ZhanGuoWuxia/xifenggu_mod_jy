show_stage("仙竹门.png", "仙竹门")
play_bgm("Music/山雨欲来风满楼.wav")
light_scene(0.2)

local lvpaoni = actor("绿袍尼")
local alasuo = actor("阿拉索")
local shaoyao = actor("芍药")
local mudan = actor("牡丹")

--初始化位置和朝向
dark_all_actors()
alasuo:setPos(300, 75)
alasuo:face_right()
lvpaoni:setPos(700, 75)
lvpaoni:face_right()
shaoyao:setPos(1000, 75)
shaoyao:face_left()
mudan:setPos(1400, 75)
mudan:face_left()

lvpaoni:say("掌门已逝，仙竹门的恩怨让我一人承担。众人何去何从，你们自己决定。")
alasuo:say("主人既去，我亦无牵挂。让我去九泉之下，继续服侍她。")
play_sfx("Skills/Wuxia/TY_JianXue1.mp3")
alasuo:movetoY(-600, 5000)
kill_disciple("阿拉索")
mudan:say("啊——")
shaoyao:say("这！")
lvpaoni:say("你们好自为之，贫尼去了。")
hide_all_stage_bubble()
lvpaoni:flip()
wait_twn(lvpaoni: movetoX(-500))
if leave_menpai("绿袍尼") then
  pop_tip("<color=#ff7a00>绿袍尼</color>归隐山林")
  play_sfx("Tip/Tip1.wav")
end
shaoyao:flip()
shaoyao:say("牡丹妹妹，江湖上的威胁步步紧逼，我们不能坐以待毙。")
mudan:say("芍药姐姐，我们该如何是好？")
shaoyao:say("不如投靠虎焰门，换取一丝喘息之地。")
mudan:say("芍药姐姐，好计策。我们还要跟着(player:fname)掌门为我们报仇！")

black_scene(0.25)
hide_stage()

show_stage("bg_192.png", "虎焰堂")
play_bgm("Music/日常_烟火人间.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local shaoyao = actor("芍药")
local mudan = actor("牡丹")

--初始化位置和朝向
bright_all_actors()

situ:setPos(1100, 75)
situ:face_left()
shaoyao:setPos(-500, 75)
shaoyao:face_right()
mudan:setPos(-900, 75)
mudan:face_right()

shaoyao:movetoX(800, 75)
wait_twn(mudan:movetoX(400, 75), mudan:daze())

shaoyao:say("(player:fname)掌门，仙竹门遭逢巨变，现下只剩我们两人……")
shaoyao:say("能否让我们在虎焰门寻得一处庇护之地？")
hide_all_stage_bubble()
local idx = show_quick_selections({"同意", "不同意"})
if idx == 1 then
    situ:say("姨母的遭遇，我也很同情。更何况虎焰门和仙竹门本是盟友，自当守望相助。")
    shaoyao:say("(player:fname)掌门，我们就当你答应了。")
    mudan:say("(player:fname)掌门，你还要保证为我们报仇。")
    situ:say("那是当然！")
    hide_all_stage_bubble()
    --分地了
    local areas = areas_of_menpai("仙竹门")
    for _, area in pairs(areas) do
        player_occupy_area(area)
        wait_for_seconds(1.5)
    end
    destroy_menpai("仙竹门")
    player_add_disciple("芍药")
    player_add_disciple("牡丹")
else
    situ:say("江湖险恶，万事还需谨慎。你且先回，此事还需从长计议。")
    mudan:say("牡丹姐姐，走吧，我们还是人微言轻。")
    shaoyao:say("想不到仙竹门灭亡之日竟在今日……")
    hide_all_stage_bubble()
    shaoyao:flip()
    shaoyao:movetoX(-500)
    mudan:flip()
    mudan:movetoX(-500)
    hide_all_stage_bubble()
    --分地了
    local areas = areas_of_menpai("仙竹门")
    for _, area in pairs(areas) do
      occupy_area("灵猹仙洞", area)
      wait_for_seconds(1.5)
    end
    destroy_menpai("仙竹门")
end


hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成仙竹门同盟结局")
light_scene(0.25)
