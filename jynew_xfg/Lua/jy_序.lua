black_scene(0)
light_scene(0.25)


-- local menpai = show_avg_select("小虾米", "选择你要扮演的门派", {"华山", "武当", "少林", "魔教"})

-- if(menpai == 1) then
--     avg_talk("", "选择了华山")
-- end

-- --解锁门派的所有地块
unlock_menpai(get_player_menpai().BeanId)
for k,v in pairs(get_other_menpais(get_player_menpai())) do
    unlock_menpai(v.BeanId)
end

local function game_begin_story()
    avg_talk("小虾米", "唔…… 这是哪里？")
    avg_talk("小虾米", "我不是在玩一款叫<color=red>息风谷战略</color>的游戏吗…… 这怎么又穿上这身土鳖的装扮了……")
    avg_talk("南贤", "欢迎再次来到金庸乱斗的世界！")
    avg_talk("小虾米", "（啊……又是这身打扮，又是这个可恶的糟老头！）")
    avg_talk("小虾米", "快说吧，这次又要我击败谁？")
    avg_talk("小虾米", "还有我的<color=red>野球拳</color>是不是仍有10级？让我打遍天下无敌手？")
    avg_talk("南贤", "额，很抱歉，为了游戏的体验，您又被回档到1级了。")
    avg_talk("南贤", "这次的任务仍旧是收集十四本天书，给你个更难的挑战，你需要击败这世上所有的门派，一统武林。")
    avg_talk("小虾米", "好吧，也没得选择。既然游戏设定是如此，那就开始吧！")
    avg_talk("小虾米", "喂喂，怎么别的门派都是如此庞大，我这就我孤零零一个人啊！")
    avg_talk("南贤", "英雄的旅途总是寂寞的，慢慢寻找你的小伙伴吧~ 你想在哪里开始发展你的门派？")

    local ret = show_avg_select("小虾米", "我希望将我的门派设立在", {"塞北", "江南", "西南", "随便吧"})
    
    if(ret == 1) then
        avg_talk("南贤", "好的，那就从[塞北]开始吧，附近的门派有<color=red> 灵鹫宫、华山、日月神教</color>，恭喜你选择了本MOD的困难模式！")
        occupy_area(get_player_menpai(), "塞北")
        occupy_area("丐帮", "牛家村")
    elseif(ret == 2) then
        avg_talk("南贤", "好的，从[云梦泽]开始吧，附近的门派有<color=red> 丐帮、河洛帮、衡山派</color>，请谨慎发展！")
        occupy_area(get_player_menpai(), "云梦泽")
        occupy_area("丐帮", "牛家村")
    elseif(ret == 3) then
        avg_talk("南贤", "好的，从[无量山]开始吧，附近的门派有<color=red> 段家、日月神教、神农帮</color>，请谨慎发展！")
        occupy_area(get_player_menpai(), "无量山")
        occupy_area("丐帮", "牛家村")
    else
        --牛家村
        avg_talk("南贤", "那就牛家村了，你与丐帮、全真教、河洛帮接轨, 请谨慎发展！")
    end

    avg_talk("南贤", "我走了，人老了脑子不中用了，来看我的话记得带智慧果。喏，这是你的启动资金，好好利用吧。")
    add_player_money(2000)
    avg_talk("小虾米", "……")

    avg_talk("", "提示：发展自身势力，击败武林中所有门派！")
    avg_talk("", "提示：占领不同地块，执行<color=red>[探索]</color>指令，可以触发一些隐藏剧情，获得队友、绝世武学、神兵。")
end


game_begin_story()

black_scene(0.25)
hide_stage()
light_scene(0.25)
