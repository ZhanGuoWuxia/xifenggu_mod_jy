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
qiliuge:say("掌门，不好了！龙湾门东方豚今日便将迎娶西门大小姐。")
situ:say("啊——")
qiliuge:say("请掌门早做打算！")
hide_all_stage_bubble()

local ops = {
  "前往鹤岭门抢亲！",
  "此事需从长计议……"
}
local i = show_quick_selections(ops)

black_scene(0.25)
hide_stage()

if i == 2 then
  light_scene(0.25)
  avg_talk("齐六哥", "掌门，西门大小姐誓死不从，已经香消玉殒了。")
  kill_disciple("西门香")
  set_flag("完成抢亲鹤岭门")
  return
end

show_stage("华丽府内.png", "鹤岭门")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local ximenpo = actor("西门坡")
local hangong = actor("韩恭")
local zhaorang = actor("赵让")
local ximenxiang = actor("西门香")
local dongfangzhouyu = actor("东方骤雨")
local dongfangtun = actor("东方豚")
local situ = actor("司徒来也")

--初始化位置和朝向
dark_all_actors()
ximenpo:setPos(1100, 75)
ximenpo:face_right()
hangong:setPos(800, 75)
hangong:face_right()
zhaorang:setPos(500, 75)
zhaorang:face_right()
ximenxiang:setPos(200, 75)
ximenxiang:face_right()
dongfangzhouyu:setPos(1400, 75)
dongfangzhouyu:face_left()
dongfangtun:setPos(1700, 75)
dongfangtun:face_left()
situ:setPos(1200, 2000)
situ:face_right()


dongfangzhouyu:say("西门兄，今日我们便结成亲家。")
ximenpo:say("东方兄，从此我们两家联手，在息风谷再无敌手。")
wait_twn(dongfangtun:movetoX(1400), dongfangzhouyu:movetoX(1700))
dongfangtun:say("岳父大人，我定将好好对香儿，一生一世，不离不弃！")
ximenpo:say("贤婿，我这便把香儿托付于你。")
ximenxiang:say("……")
wait_twn(situ:flip(), situ:jumpTo(1600, 600, 300, 3000), situ:flip(), situ:jumpTo(1200, 75, 300, 3000), dongfangtun:jumpTo(1500, 75), ximenpo:jumpTo(1000, 75))
situ:say("看来香儿并不愿意……你们又何必逼迫一个女子？")
situ:flip()
ximenxiang:say("(player:gname)，你怎么在这里——")
situ:say("先前说好的，又怎么能食言？")
ximenpo:say("虎焰门的小子，竟然出现在此地，莫不是想破坏香儿的姻缘好事！")
situ:flip()
dongfangtun:say("怎么又是你！每次都是你来搅局！")
ximenpo:say("来人！把他给我叉出去！")
dongfangzhouyu:say("且慢，西门兄，这小子满嘴的油腔滑调，不如交给愚弟，龙湾门正有些公道要同虎焰门算算呢！")
hide_all_stage_bubble()
local options = {
  "来就来！未必就怕了龙湾门！",
  "此行不可挑起矛盾，还得谨慎行事……"
}
local idx = show_quick_selections(options)
if idx == 1 then
    situ:say("东方门主，西门门主，一起来吧。我与香儿已经私定终身，今生今世，永不分离。")
    situ:flip()
    ximenxiang:say("(player:gname)，我们生则同衾，死则同穴。")
    zhaorang:say("好！好！好！不愧是虎焰门的少掌门，行事却有些担当。香儿交给你照顾，我放心了。")
    ximenpo:flip()
    ximenpo:say("赵左使，你竟然公然判门，我要好好清理门户。")
    ximenpo:flip()
    hangong:say("老夫看你们怎么逃出鹤岭门的天罗地网！")
    dongfangtun:say("哼！我堂堂龙湾门，怎么会怕一个灭了门的野小子！爹！让我上！我要亲自教训教训这小子！")
    hide_all_stage_bubble()
    --战斗
    local ai = aiManager:getAI("AI/Menpai/鹤岭门")
    local startParam = {
      Team2 = {
        { Pos = 0, Role = get_role_by_id("东方骤雨") },
        { Pos = 2, Role = get_role_by_id("东方豚") },
        { Pos = 3, Role = get_role_by_id("韩恭") },
        { Pos = 5, Role = get_role_by_id("西门坡") },
      },
      MaxTurn = 99,
      BattleName = "抢亲鹤岭门",
      IsQuick = false,
      PlayerTeam = 0,
      DisableJoinBattleCount = true,
      Scene = "BatteMaps/BattleScenes/HuYanMen_0.unity",
      BGM = "Music/热血_侠肝义胆.wav",
    }
    local ret = start_battle(startParam)
    if ret == 1 then
      dongfangtun:say("怎么可能……我怎么会输！")
      situ:say("我们走吧。")
      hide_all_stage_bubble()
      wait_twn(situ:movetoX(400), zhaorang:movetoX(600), ximenpo:flip())
      situ:flip()
      ximenpo:say("站住！")
      situ:say("西门门主这是何意？")
      ximenpo:say("你们能不能走出这里，终是我说了算！")
      ximenxiang:say("爹？当真连女儿都要牺牲吗？")
      ximenpo:say("哼！你选择虎焰门，又有想过我是你爹？")
      ximenxiang:say("女儿选择虎焰门，是因为虎焰门中有人为女儿挺身而出，让女儿知道世间并非只有算计，这世间，还有真情！")
      ximenpo:say("真情？你是西门家的女儿，身上流着西门家的血，西门家不比什么可笑的真情重要？")
      ximenxiang:say("西门家……我情愿自己不是西门香！")
      zhaorang:flip()
      zhaorang:say("香儿，这些时日你受苦了……")
      ximenxiang:say("师父！香儿这么做从不后悔，唯一对不住的就是您的恩情！")
      zhaorang:flip()
      zhaorang:say("罢了罢了……一日为师，终身为父……你们走吧！这里有我！")
      ximenpo:say("赵让！你这是什么意思？竟敢拦着我？")
      zhaorang:say("对不住了门主！之后赵让自会请罪，要打要罚，绝无怨言……")
      situ:flip()
      situ:say("走——")
      hide_all_stage_bubble()
      ximenxiang:flip()
      situ:movetoX(-500)
      wait_twn(ximenxiang:movetoX(-500))

      player_add_disciple("西门香", false)

      goto story_end
    else
      situ:say("抱歉……是我没能保护好你……")
      ximenxiang:say("(player:gname)，此番你能为我挺身而出，我便知足了！")
    end
else
    dongfangtun:say("哈哈！畏首畏尾！当真是个胆小鬼！")
    situ:say("你少猖狂！不过是顾及大家体面，无意挑起争端！")
    hangong:say("无意？是不敢吧！虎焰门的少掌门做事如此畏首畏尾，可见先前不过是大言不惭！")
    situ:flip()
    ximenxiang:say("抱歉，我不能跟你回虎焰门……")
    situ:say("香儿？")
    ximenxiang:say("(player:gname)，此番你能为我挺身而出，我便知足了！")
end

situ:say("香儿，你这是？")
ximenxiang:say("若是你因我惹上了鹤岭门和龙湾门，日后虎焰门又该如何应对？香儿不能将你……将虎焰门置于险境！")
ximenpo:flip()
ximenpo:say("不愧是西门家的女儿，能认清局势，可比虎焰门的毛头小子可强多了！")
ximenxiang:say("爹，恕女儿不孝，这是我最后一次这样叫您了。今后，西门香就是西门香，再不是谁的棋子或者筹码了……")
ximenpo:say("说什么胡话！与东方家联姻而已，哪里是什么棋子筹码的了！")
dongfangtun:say("是啊！岳父大人说的是！西门小姐，别总想着什么虎焰门了，来龙湾门，我保你每天开开心心，就不会胡思乱想了！")
ximenxiang:say("东方公子不必自欺欺人，你同我一样，不过也是一枚棋子罢了。都是用来维系利益的筹码，总有一天——")
ximenpo:say("放肆！")
ximenxiang:say("啊，原本以为我这一生就会困在这博弈之中。可为什么要让我知道还有另一种选择？")
ximenxiang:say("虎焰门的那些时日真快乐啊！没想到竟还有这样的活法，轻松单纯，没有尔虞我诈……")
zhaorang:flip()
zhaorang:say("香儿，这些时日你受苦了……")
ximenxiang:say("“相见争如不见”，既然纠纷起于我，那就在我这里结束吧！")
play_sfx("Skills/Wuxia/TY_JianXue1.mp3")
ximenxiang:rotatetoZ(-90)
wait_twn(ximenxiang:offsetY(-100))
kill_disciple("西门香")
situ:say("香儿——")
dongfangtun:say("死、死了？怎么会！")
dongfangzhouyu:say("西门兄，令爱竟如此刚烈……不过此番之事，不算我龙湾门背约，贵派家事，我东方家便不插手了……")
hide_all_stage_bubble()
dongfangtun:flip()
dongfangzhouyu:flip()
dongfangtun:movetoX(3000)
wait_twn(dongfangzhouyu:movetoX(3000))
situ:say("“相见争如不见，多情何似无情”，香儿这是怕连累虎焰门……无论如何，我会带你回家……")
hide_all_stage_bubble()
wait_twn(situ:movetoX(400), zhaorang:movetoX(600))
situ:flip()
ximenpo:say("你回来！你夺走香儿的命，难道还要连尸身一起夺走吗？")
zhaorang:flip()
zhaorang:say("门主！难道先前逼大小姐做的还不够吗？就不能遂了她最后的心意吗？")
hangong:say("赵让，你住口！")
ximenpo:say("不，韩右使说得没错……是我一直在逼她，可我这么做，不也是为了让鹤岭门在这江湖之中安身立命……可难道错了吗？")
hangong:say("门主一心都是为了鹤岭门！在场的诸位自然心知肚明！是虎焰门胡搅蛮缠，是虎焰门逼死了大小姐！")
ximenpo:say("没错！我都是为了鹤岭门——是你们不辨大局！是你们蝇营狗苟！虎焰门……还我女儿命来！")
hide_all_stage_bubble()
situ:flip()
wait_twn(situ:offsetY(-60), situ:offsetY(60, 300))
wait_twn(ximenxiang:jumpTo(300, 300))
ximenxiang:standfront()
situ:movetoX(-500, 500)
ximenxiang:movetoX(-500, 500)

::story_end::
local diplomatic = require("Common/diplomatic")
diplomatic.declare_war("鹤岭门", "player")
diplomatic.declare_war("龙湾门", "player")

black_scene(0.25)
hide_stage()
set_flag("完成抢亲鹤岭门")
light_scene(0.25)
avg_talk("齐六哥", "掌门，赵长老大战数人，力竭而亡。")
kill_disciple("赵让")
