show_stage("禁地.png", "训练场")
set_bg_mat("ImgPaperFold")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(700, 75)
situ:face_right()
qiliuge:setPos(2200, 75)
qiliuge:face_left()

wait_twn(qiliuge:offsetX(-900), qiliuge:daze())
qiliuge:say("掌门，仙竹门送来一封邀请函。")
situ:say("仙竹门的宴请？这……到底何意啊……")
qiliuge:say("这位仙竹门的南宫掌门确实是夫人的亲姐姐。如今现在下帖，确实有些琢磨不透。")
situ:say("兴许是因为前时段小年的事情……可我这位姨母葫芦里卖的什么药？")
qiliuge:say("这也是听夫人曾经提起过，南宫掌门性情泼辣，手上用毒的功夫更是厉害。接管仙竹门之后，更是手段了得。")
situ:say("看来我这位姨母可是个厉害角色了……那还是不去为好，毕竟爹娘在世时，若关系亲密，如何从未提起过？")
qiliuge:say("虽说南宫掌门为人凌厉，但我们既没有过多往来，更不曾与仙竹门有过节，又有着这层关系，尽量还是不要轻易得罪为好。")
situ:say("如此说来，这去与不去，倒是个问题了……")
hide_all_stage_bubble()
local options = {
  "兴许只是因为前时的事情，想要修好。",
  "算了，这仙竹门还是少招惹为好……"
}
local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
        situ:say("无论如何，前时也算是打过交道。兴许这位姨母也是想要与咱们修好也说不定？")
        qiliuge:say("那依照掌门的意思……")
        situ:say("既然都下了请帖，便是“鸿门宴”，也得去看看了。")
        qiliuge:say("那掌门此行还需小心才是！ ")
        set_flag("接受结盟")
    end,
    ["2"] = function()
        situ:say("如此看来，若赴约岂不是危险重重？")
        qiliuge:say("是啊……还是谨慎些比较好。")
        situ:say("既然如此，那还要辛苦齐六哥从中斡旋，小心回绝了便是。")
        qiliuge:say("这个自然。")
    end
}

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()

show_stage("仙竹门.png", "仙竹门")
play_bgm("Music/回忆.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local nangongyan = actor("南宫燕")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-500, 75)
situ:face_right()
nangongyan:setPos(1100, 75)
nangongyan:face_left()

local diplomatic = require("Common/diplomatic")

switch(idx) {
  ["1"] = function()
      wait_twn(situ:movetoX(800), situ:daze())

      situ:say("姨母在上，小侄这厢有礼了！")
      nangongyan:say("想不到我这侄子竟凭一己之力使得门派重振旗鼓，可真当是后生可畏。")
      situ:say("姨母过奖了！姨母这仙竹门，才是江湖中令人敬畏之大派呢！")
      nangongyan:say("令人敬畏？若当真如此，又怎会出了那叛逃的段小年？")
      situ:say("不过是个叛徒而已，姨母何必如此耿耿于怀？")
      nangongyan:say("哼，只怕那叛徒另有目的……万一这段小年是……")
      situ:say("姨母会不会多虑了？江湖之中又有谁敢与仙竹门作对？")
      nangongyan:say("这倒是，仙竹门在江湖之中颇有些名声，便是圣剑门之流，也得掂量掂量！")
      situ:say("那姨母您的意思是……")
      nangongyan:say("与其重用外姓之人，我自然更信任侄儿你了。")
      nangongyan:say("你是紫妹的血脉，我们两派虽然不常走动，但到底也算血亲。侄儿啊，你可愿协助姨母？")
      situ:say("姨母的意思是……")
      nangongyan:say("侄儿放心，虎焰门若是归顺仙竹门，姨母怎么会不照看自家小辈？")
      nangongyan:say("这江湖之中纷争不断，其他门派若是见虎焰门势单力薄，到时……哈哈，姨母也是关心侄儿呀。")
      situ:say("可小侄才疏学浅，只怕……")
      nangongyan:say("无妨无妨！先前我看那豪猪长垄、龙湾门等等那些门派频频挑衅，虎焰门不是也能应对从容？")
      nangongyan:say("侄儿只需要制衡那些宵小，剩下的，姨母自会处理，如何？")
      situ:say("那就依了姨母之意。")
      nangongyan:say("好孩子。姨母不会亏待你！")
      set_both_friendship("仙竹门", "player", 100)
      diplomatic.make_ally("仙竹门", "player")
  end,
  ["2"] = function()
      nangongyan:say("哼，果然是那两个教出来的好儿子！既然那小子如此推三阻四，那便别怪我这个做姨母的不讲情面了！")
      diplomatic.declare_war("仙竹门", "player")
  end
}

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成邀请结盟")
light_scene(0.25)
