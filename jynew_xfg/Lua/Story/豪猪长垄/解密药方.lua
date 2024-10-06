
show_stage("bg_158.png", "虎焰堂郊外")
light_scene(0.2)

local situ = actor("司徒来也")
local tangbainiu = actor("汤白牛")
local doctor = actor("老郎中")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-300, 75)
situ:face_right()
tangbainiu:setPos(-700, 75)
doctor:setPos(1300, 75)
doctor:face_left()
tangbainiu:face_right()

situ:movetoX(900)
wait_twn(tangbainiu:movetoX(600), tangbainiu:daze())

situ:say("老先生，我们偶得一方，然药性奇特，令人费解，特来请教。")
doctor:say("但将药方示我。")
tangbainiu:say("三七、半夏、夜交藤、豪猪刺。")
doctor:say("此方奇特，药性相冲，非但无法治病，恐反增其害。非老夫妄言，此方非药方也。")
situ:say("难道这并非药方？")
doctor:say("以老夫医术，断无差错。")
situ:say("多谢老先生。")
hide_all_stage_bubble()
tangbainiu:flip()
tangbainiu:movetoX(-500)
situ:flip()
wait_twn(situ:movetoX(-500))
hide_all_stage_bubble()
black_scene(0.25)
hide_stage()

show_stage("bg_15.png", "虎焰堂")
light_scene(0.2)

local situ = actor("司徒来也")
local tangbainiu = actor("汤白牛")
local qiliuge = actor("齐六哥")
local liuming = actor("刘明")
local zsniang = actor("朱三娘")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-300, 75)
situ:face_right()
tangbainiu:setPos(-700, 75)
tangbainiu:face_right()
qiliuge:setPos(-500, 75)
qiliuge:face_right()
liuming:setPos(2500, 75)
liuming:face_left()
zsniang:setPos(2800, 75)
zsniang:face_left()

situ:movetoX(900)
wait_twn(tangbainiu:movetoX(600), tangbainiu:daze())

--环视四周
for i = 1, 3 do
  wait_twn(situ:flip(0.2), situ:daze(), situ:say("兄弟姐妹们，一起过来吧！"))
end

qiliuge:movetoX(300)
liuming:movetoX(1200)
wait_twn(zsniang:movetoX(1600), zsniang:daze())

qiliuge:say("掌门，找我们有何急事？")
situ:say("彩蝶仙子留下的药方：“三七、半夏、夜交藤、豪猪刺”——众位兄弟姐妹能否参透其中奥秘？")
liuming:say("让俺好好思虑一番。")
qiliuge:say("豪猪刺，自是直指豪猪。此乃主语。")
situ:flip()
zsniang:say("半夏、夜交藤，取其首字，乃“半夜”之意！")
liuming:say("三七？俺只知道夜半三更，是这个意思么？")
situ:flip()
tangbainiu:say("夜半三更刺杀豪猪！")
situ:say("就是这个意思。")
hide_all_stage_bubble()
local options = {
  "戌时(19点到21点)",
  "亥时(21点到23点)",
  "子时(23点到1点)"
}
local idx = show_avg_select("", "既是如此，该选何时辰动手？", options)
switch(idx) {
  ["1"] = function()
  end,
  ["2"] = function()
  end,
  ["3"] = function()
    set_flag("选对时辰")
  end,
}
situ:say("就选定此时辰，我等潜入豪猪寨，一举成功！")
qiliuge:say("毕其功于一役。")
liuming:say("看俺老刘的厉害！")
tangbainiu:say("阿姊我来救你了。")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成解密药方")
light_scene(0.25)