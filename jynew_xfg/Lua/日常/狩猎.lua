local area = current_area

local function hunt()
    local options =
    {
        [1] = "熊之战",
        [2] = "野猪之战",
        [3] = "羊之战",
        [4] = "狼之战"
    }
    
    --战斗
    local battle = table.pick_random(options)
    local ret = start_preset_battle(battle)
    return ret
end


local function sale()

    if has_flag("已解锁狩猎") then
        avg_talk("齐六哥", "掌门，此次狩猎我们颇有收获，这是我前往市集变卖猎物所得的银两。")
        avg_talk("司徒来也", "六哥，你此举甚佳，这些银两将为我们提供助力。")
    end
    local economy = require 'Common/economy'
    local income = economy.income_of_hunt(area)
    add_player_money(income)
end


if has_flag("已解锁狩猎") then
    local ret = hunt()
    if ret == 1 then
      sale()
    end
    return
end

show_stage("虎焰山树林.png", "山林")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
situ:face_right()
qiliuge:setPos(-700, 75)
qiliuge:face_right()

--先一起走过去
situ:movetoX(1100)
wait_twn(qiliuge:movetoX(800), qiliuge:daze())

situ:flip()
situ:say("六哥，虎焰山曾是江湖中一颗璀璨的明珠，如今却成了野兽的天下，百姓不得安宁。")
qiliuge:say("江湖险恶，野兽横行，百姓饱受其苦。")
situ:say("正是。今日我们便开始狩猎，除去这些祸害。所获猎物还可换取银两。")
hide_all_stage_bubble()

local ret = hunt()
if ret == 1 then
    situ:say("六哥，今日我们猎获颇丰，这些猎物换成银两，日后我们便能购置兵刃甲胄。")
    qiliuge:say("正是，我将这些猎物带回市集，定能换取一笔不错的价钱。")
else
    situ:say("虽然此次未能击败野兽，但我们不可灰心，下次出征，务必更加谨慎。")
    qiliuge:say("不错，我们江湖儿女，不畏失败，下次再战，定能凯旋而归！")
end

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
light_scene(0.25)

if ret == 1 then
    sale()
end

set_flag("已解锁狩猎")