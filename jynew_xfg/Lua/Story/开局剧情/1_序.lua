hide_world_map()
stop_bgm(0.5)


local is_veteran = is_ach_unlock("开局灭门")
local is_resist = is_ach_unlock("抵抗偷袭")

if is_veteran then
    local options = {
        "是，直接开门见山吧。",
        "否, 我还想再体验下灭门。"
    }
    light_scene(0.25)
    local idx = show_avg_select("", "是否跳过开场剧情?", options)
    if idx == 1 then
        black_scene(0.25)
        light_scene(0.5)
        set_flag("完成调虎离山")
        set_flag("完成尾随其后")
        unlock_menpai("虎焰门", false)
        set_flag("完成夜访佳人")
        set_flag("完成暗度陈仓")
        if is_resist then
            set_flag("完成抵抗偷袭")
        else
            occupy_area("豪猪长垄", "虎苇地")
            occupy_area("豪猪长垄", "火神树林")
            occupy_area("豪猪长垄", "酒香亭")
        end
        set_flag("完成豪猪长垄偷袭")
        set_flag("完成潘麻子趁火打劫")
        set_flag("完成立志复仇")
        set_flag("完成埋葬悲伤")
        role_add_affix("司徒来也", "身负血仇")
        pop_tip(string.i18_format("(player:fullname)惨遭灭门，{0}！", affix_tip_link("身负血仇", "身负血仇", "#00A5FF")))
        player_add_disciple("刘明")
        player_add_disciple("朱三娘")
        unlock_menpai("豪猪长垄", true)
        black_scene(0.25)
        show_world_map()
        light_scene(0.5)
    else
        local ret = show_video("cg.mp4")
        if ret then
            role_add_affix("司徒来也", "开智启蒙")
            pop_tip(string.i18_format("(player:fullname)获得{0}！", affix_tip_link("开智启蒙", "开智启蒙", "#FF7A00")))
        end
    end
else
    local ret = show_video("cg.mp4")
    if ret then
        role_add_affix("司徒来也", "开智启蒙")
        pop_tip(string.i18_format("(player:fullname)获得{0}！", affix_tip_link("开智启蒙", "开智启蒙", "#FF7A00")))
    end
end