show_stage("bg_166.png", "虎焰门大堂")
set_bg_mat("ImgPaperFold")
-- local filter = add_camera_filter("CameraFilterPack_AAA_BloodOnScreen")
light_scene(0.2)


local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local liuming = actor("刘明")
local zsniang = actor("朱三娘")
local panmazi = actor("潘麻子")
local suyanyan = actor("苏嫣嫣")
local dizi1 = actor("豪猪长垄弟子")
local dizi2 = actor("豪猪长垄弟子二")
local dizi3 = actor("豪猪长垄弟子三")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-200, 75)
situ:face_right()
qiliuge:setPos(-400, 75)
qiliuge:face_right()
liuming:setPos(-200, 75)
liuming:face_right()
zsniang:setPos(-400, 75)
zsniang:face_right()
panmazi:setPos(1100, 75)
panmazi:face_left()
suyanyan:setPos(1300, 75)
suyanyan:face_left()
dizi1:setPos(1500, 75)
dizi1:face_left()
dizi2:setPos(1700, 75)
dizi2:face_left()
dizi3:setPos(1900, 75)
dizi3:face_left()

play_bgm("Music/山雨欲来风满楼.wav")
panmazi:flip()
panmazi:say("臭娘们，快带路，把你的老相好叫出来！")
suyanyan:say("快放开我！")

situ:movetoX(800)
qiliuge:movetoX(600)
liuming:movetoX(400)
wait_twn(zsniang:movetoX(200), zsniang:daze())

situ:emotion("JingYa")
situ:say("是你们！")
panmazi:flip()
panmazi:say("(player:fname)小少爷，你手段厉害！竟然还说动了得月楼施美人计帮你做局，还伤了我兄弟梁胜。还是老天开眼，报应了不是？哈哈哈哈哈！")
situ:say("门中之劫……原来是你们！我跟你们拼了！")
panmazi:say("慢！今时可不同往日，你还是先看清看清状况！")
wait_twn(suyanyan:movetoX(1150), panmazi:jumpTo(1300, 75))
suyanyan:say("畜生！放开我！")
panmazi:say("臭娘们儿，给老子老实点！")
situ:emotion("BeiShang")
situ:say("苏姑娘？")
suyanyan:say("公子！公子离开他们便……得月楼的姐妹全被他们糟蹋了……")
situ:emotion("NaoHuo")
situ:jump()
situ:say("你们这些畜生！")
panmazi:say("先前伤了我兄弟梁胜，这笔债不也得好好清算清算？如今想救人，你们也得拿出个态度不是？")
situ:emotion("LengKu")
situ:say("虎焰门如今遭难，你们满意了？")
panmazi:say("遭难？虎焰门这又是惹了哪座寺的佛爷了？")
situ:emotion("NaoHuo")
situ:say("狗贼！别不认账！")
panmazi:say("呸！我豪猪长垄的兄弟们，向来不玩阴的！")
situ:say("你还想怎么样？！")
panmazi:say("血债血偿！你当着所有人的面，心甘情愿挨我们弟兄几个一刀，这事儿便罢了。如何？")
suyanyan:jump()
suyanyan:say("公子！公子不必顾忌奴家，定要严惩这些恶人才是！")
situ:emotion()
situ:shake()
situ:say("你们最好言而守信！")
panmazi:flip()
panmazi:say("动手！")
panmazi:flip()
wait_for_seconds(0.5)
shake_stage(20, 3)
panmazi:jumpTo(1000, 75)
wait_for_seconds(0.5)
suyanyan:jumpTo(850, 75)
suyanyan:flip()
shake_stage(20, 3)
wait_twn(suyanyan:offsetY(-150), suyanyan:standfront())

stop_bgm()
play_sfx("Skills/Wuxia/TY_JianXue1.mp3")
suyanyan:say("公子！")
stage_narration("苏嫣嫣挡在(player:fullname)面前，一刀刺中胸口。")

situ:say("苏姑娘！你何苦……")
suyanyan:say("奴家不想因自己一人拖累这么多好人……公子之恩，奴家偿还了……")
hide_all_stage_bubble()
black_scene(1)
wait_twn(suyanyan:offsetY(-50)) 
-- remove_camera_filter("CameraFilterPack_AAA_BloodOnScreen")

suyanyan:hide()

wait_for_seconds(1)
light_scene(1)
play_bgm("Music/ThunderRain.mp3")
situ:emotion("KuQi")
situ:say("……")
qiliuge:say("可恶！")
liuming:say("你们这帮王八蛋！")
zsniang:say("怎么能容你们如此嚣张！")
dark_all_actors()
hide_all_stage_bubble()

--战斗
local startParam = {
    Team2 = {
        { Pos = 0, Role = create_temp_role("豪猪土匪_新手关") },
        { Pos = 3, Role = create_temp_role("豪猪堂主_新手关") },
        { Pos = 5, Role = create_temp_role("潘麻子_新手关") },
        { Pos = 7, Role = create_temp_role("豪猪土匪_新手关") },
    },
    MaxTurn = 99,
    BattleName = "潘麻子趁火打劫",
    IsQuick = false,
    PlayerTeam = 0,
    DisableJoinBattleCount = true,
    Scene = "BatteMaps/BattleScenes/HuYanMen_0.unity",
    BattleTriggers = {"委托战斗教学"}
}
local ret = start_battle(startParam)
if ret == 1 then
    local filter = add_camera_filter("CameraFilterPack_Atmosphere_Rain_Pro")
    filter.Fade = 0.6
    --潘麻子逃跑
    panmazi:say("哼，三十六计走为上计，兄弟们，撤！")
    hide_all_stage_bubble()
    panmazi:flip()
    dizi1:flip()
    dizi2:flip()
    dizi3:flip()
    wait_twn(panmazi:movetoX(3000), dizi1:movetoX(3000), dizi2:movetoX(3000), dizi3:movetoX(3000))
    situ:say("追！")
    liuming:movetoX(1500)
    wait_twn(zsniang:movetoX(1200))
    situ:emotion("BeiShang")
    situ:say("我……快看看嫣嫣姑娘。")
    hide_all_stage_bubble()
    situ:standfront()
    wait_twn(situ:offsetY(-200))
    qiliuge:say("大少爷！醒醒！")
    liuming:flip()
    liuming:movetoX(1100)
    wait_twn(zsniang:flip(), zsniang:movetoX(1300))
    black_scene(0.25)
    remove_camera_filter("CameraFilterPack_Atmosphere_Rain_Pro")
    hide_stage()
    set_flag("完成潘麻子趁火打劫")

    executefile("Story/开局剧情/8_立志复仇")
else
    black_scene(0.25)
    hide_stage()
    game_over()
end
