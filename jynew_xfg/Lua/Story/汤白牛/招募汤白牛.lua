show_stage("酒香亭.png", "酒家")
light_scene(0.2)
play_bgm("Music/回忆.wav")

local qiliuge = actor("齐六哥")
local tangbainiu = actor("汤白牛")
local situ = actor("司徒来也")

--初始化位置和朝向
dark_all_actors()
situ:bright()
situ:setPos(600, 75)
situ:face_right()
qiliuge:setPos(1700, -600)
qiliuge:face_left()
tangbainiu:setPos(3000, 75)
tangbainiu:face_left()


wait_twn(qiliuge:movetoY(75), qiliuge:movetoX(900), qiliuge:daze())

qiliuge:say("掌门，就是这位少侠想要见您。")
wait_twn(tangbainiu:movetoX(1200), tangbainiu:daze())

tangbainiu:say("汤白牛拜见(player:fname)掌门！")
situ:say("哈哈哈！白牛，白壮纯刚，如牛轩然。少侠果然人如其名！")
tangbainiu:say("掌门过奖了！实不相瞒，其实在下此番是有一事相求。")
situ:say("少侠请说。")
if has_flag("完成灭亡豪猪长垄") then
    tangbainiu:say("在下听说(player:fname)掌门已经打败了豪猪长垄！")
    situ:say("不错，确有此事。汤少侠如此问，有何事情？")
    tangbainiu:say("阿姊被豪猪长垄的掌门何猛所挟持，不知掌门可否见过阿姊？")
    situ:say("这个好说，现下也解救了不少被困的可怜女子，不知令姊姓名长相，也好留意。")
    tangbainiu:say("阿姊名叫汤彩蝶，行医为业。")
    qiliuge:flip()
    qiliuge:say("莫非就是人称“彩蝶仙子”的汤神医？")
    situ:say("我亦听闻汤神医秀外慧中，医者仁心。汤神医已经得救，现下应该已经回到家中了。")
    tangbainiu:say("若是如此，虎焰门的这份大恩，汤白牛同阿姊一定结草衔环为报！")
    situ:say("施恩不图报，图得是侠义为先！")
    qiliuge:say("正是！搭救神医！侠义为先！")
    tangbainiu:say("虽然我武功平平，也愿意加入虎焰门报答掌门的大恩！")
else
    tangbainiu:say("在下听说(player:fname)掌门正在与豪猪长垄作战。")
    situ:say("不错，确有此事。汤少侠如此问，莫非此番是来做豪猪长垄的说客？")
    tangbainiu:say("非也非也！在下的阿姊被豪猪长垄的掌门何猛所挟持，还望掌门搭救！")
    situ:say("这个好说，现下也解救了不少被困的可怜女子，不知令姊姓名长相，也好留意。")
    tangbainiu:say("阿姊名叫汤彩蝶，行医为业。")
    qiliuge:flip()
    qiliuge:say("莫非就是人称“彩蝶仙子”的汤神医？")
    situ:say("我亦听闻汤神医秀外慧中，医者仁心。汤神医有难，自当竭尽全力相救！")
    tangbainiu:say("若是如此，虎焰门的这份大恩，汤白牛同阿姊一定结草衔环为报！")
    situ:say("施恩不图报，图得是侠义为先！")
    qiliuge:say("正是！搭救神医！侠义为先！")
    tangbainiu:say("虽然我武功平平，也愿意随掌门一起去救阿姊！")
end
hide_all_stage_bubble()

player_add_disciple("汤白牛")

black_scene(0.25)
set_flag("完成招募汤白牛")
hide_stage()
light_scene(0.25)