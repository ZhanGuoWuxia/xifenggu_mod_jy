avg_talk("", "山路走到悬崖边就断了，脚下崖底是一片深不见底的黑暗。")

if has_flag("完成断崖") then
    return
end

local options = {
    "跳下去（轻功>20）",
    "离开",
}

local idx = show_quick_selections(options)

switch(idx) {
    ["1"] = function()
        local stat = role_attr("司徒来也", stat_key.qinggong)
        if stat > 20 then
            avg_talk("", "(player:fullname)施展轻功跳下崖壁，幸而悬崖并没想象中那么深。")
            avg_talk("司徒来也", "想不到这万丈悬崖之下，竟是别有洞天。")
            avg_talk("司徒来也", "咦，好像是块石碑，上面的文字似乎是武功秘籍，先记下来。")
            add_player_item("降魔心法", 1)
            set_flag("完成断崖")
        else
            avg_talk("", "(player:fullname)本想跳下山崖一探究竟，不料一时大意将腿摔断。")
            role_add_affix("司徒来也", "摔断腿")
            pop_tip(string.i18_format("(player:fullname)获得了{0}", affix_tip_link("摔断腿", "摔断腿", "#00DA2E")))
            avg_talk("司徒来也", "略微行动便疼得厉害，别是摔断腿了。")
        end
    end,
    ["2"] = function()
        return
    end
}