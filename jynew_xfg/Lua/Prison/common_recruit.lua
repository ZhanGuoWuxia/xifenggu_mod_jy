local role = current_role
if not role then
    return
end

local favor_to_recruit = 0

avg_talk("", "你循循善诱，询问对方是否愿意加入你的门派？")

local isOk = role.Menpai == -1 or chance((role.Favor / MaxRoleFavor) * 100)
if isOk then
    if role.IsFemale then
        avg_talk(role, "(player:fname)公子若不弃，小女子愿以身相许。")
    else
        avg_talk(role, "我对(player:fname)少侠的大名早有耳闻，今日得以一见，今生虽死无憾。某不才，愿效犬马之劳。")
    end
    change_favor(role, 1)
    return player_recruit_prisoner(role)
else
    if role.Favor < 0 then
        if role.IsFemale then
            avg_talk(role, "望(player:fname)公子自重, 小女子不愿与恶徒同流合污。")
        else
            avg_talk(role, "(player:fname)公子，你的恶名从西陲莽荒到极东汪洋无人不知无人不晓, 我不会效力于你。")
        end
        change_favor(role, -1)
    elseif role.Favor < -7 then
        if role.IsFemale then
            avg_talk(role, "你这登徒子, 休要强迫于我。如今身陷囹圄，我愿以贞狱守心，待明月高悬，守望缘定情长!!!")
        else
            avg_talk(role, "生亦何欢，死亦何苦，我宁愿死于你这恶棍之手也不会屈服。")
        end
        change_favor(role, -1)
    elseif role.Favor < -14 then
        if role.IsFemale then
            avg_talk(role, "你这恶贯满盈、好色无耻之徒, 我就算是被辣手摧花的豪猪土匪摧残也不会委身于你!!")
        else
            avg_talk(role, "heeeee~tui, 你这该死的小畜生, 野蛮的杂种, 给你大爷舔鞋我都嫌脏。")
        end
        change_favor(role, -1)
    else
        if role.IsFemale then
            avg_talk(role, "小女子愿守心之所念，亦不愿离弃心之所系。望(player:fname)公子勿再相劝。")
        else
            avg_talk(role, "忠臣不事二主，少侠请回吧。")
        end
        if chance(50) then
            change_favor(role, -1)
        else
            change_favor(role, 1)
        end
    end
end

return true
