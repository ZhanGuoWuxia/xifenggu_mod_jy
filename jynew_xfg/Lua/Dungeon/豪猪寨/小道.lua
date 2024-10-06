avg_talk("", "草丛里，蜿蜒着一条小道。")

if has_flag("完成小道") then
    return
end

local options = {
    "上前开路",
    "离开",
}

local idx = show_avg_select("", "竟是一群野兽阻挡了前路！", options)
switch(idx) {
    ["1"] = function()
        avg_talk("司徒来也", "狭路相逢，退无可退，倒不如与这些利齿獠牙的畜生搏一搏。")
        local ret = dungeon_battle("豪猪寨", "小道之战")
        if ret == 1 then
            avg_talk("", "野兽四散而逃。")
            set_flag("完成小道")
        else
            dungeon_fail("豪猪寨")
        end
    end,
    ["2"] = function()
        return
    end
} 