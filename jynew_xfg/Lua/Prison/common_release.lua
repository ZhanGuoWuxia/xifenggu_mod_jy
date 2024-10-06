local role = current_role
if not role then
    return
end

local questions = {
    "看看谁来了, 找我这阶下囚有何贵干",
    "有本事就放了我",
    "要杀要剐给个痛快话",
}
local content = table.pick_random(questions)
avg_talk(role, content)
local options = {
    "让你的亲朋好友交钱赎人",
    "交出你身上的金银首饰，我可以给你一条生路",
    "你走吧，下次我可不会这么好说话了",
    "继续在牢里呆着吧"
}

math.randomseed(os.time())
local selectIdx = show_avg_select("", "你组织了下语言, 然后说道：", options)
local ret = false
switch(selectIdx) {
    ["1"] = function()
        local baseMoney = 100
        local growMoney = 50
        local maxMoney = math.floor(baseMoney + growMoney * (role.Level - 1))
        local minMoney = math.floor(maxMoney / 2)
        local finalMoney = math.random(minMoney, maxMoney)
        avg_talk(role, "我会写信让他们准备好赎金: 银两x" .. finalMoney)
        add_player_item("银两", finalMoney)
        ret = player_release_prisoner(role)
        change_favor(role, -1)
    end,
    ["2"] = function()
        avg_talk(role, "这是我身上仅有的东西了。")
        local itemCount = math.random(1, 2)
        local favorItemId = table.pick_random({"手镯", "金项链", "青玉壁"})
        add_player_item(favorItemId, itemCount)
        local favor = -math.random(2, 4)
        change_favor(role, favor)
        ret = player_release_prisoner(role)
    end,
    ["3"] = function()
        avg_talk(role, "胜者为王，败者为寇，下次见面我也不会手下留情。")
        local favor = math.random(2, 5)
        change_favor(role, favor)
        ret = player_release_prisoner(role)
    end,

    ["4"] = function()
        print("不释放")
    end,
}

return ret
