avg_talk("", "一面古朴的木雕花纹的告示牌。")

if has_flag("获得失踪线索") then
    local options = {
        "寻人启事",
        "寻人启事",
        "招聘启事",
        "广而告之",
        "离开",
    }

    local idx = show_avg_select("", "告示牌上贴着一长串告示纸，在微风中摇曳。", options)

    switch(idx) {
        ["1"] = function()
            avg_talk("[speaker:寻人启事]", "姓名：白花\n失踪时间：三天前\n失踪地点：祠堂\n特征：长发，身穿淡蓝色裙子，手捧一本书\n如有线索请联系族长")
            avg_talk("司徒来也", "此间也有姑娘失踪？不会这么巧吧？")
            set_flag("获得白花线索")
            set_dungeon_task_result("女儿村", "寻找白花", false)
        end,
        ["2"] = function()
            avg_talk("[speaker:寻人启事]", "姓名：小红\n失踪时间：一周前\n失踪地点：民居\n特征：双辫，身着一件红色花裙，双眸明亮如星\n如有线索请联系村长")
            avg_talk("司徒来也", "果然小红失踪了！村长一直在瞒着我？！")
            if not has_flag("完成告示牌") then
                local flag = get_flag_int("获得小红线索")
                set_flag_int("获得小红线索", flag + 1)
                set_flag("完成告示牌")
            end
        end,
        ["3"] = function()
            avg_talk("[speaker:招聘启事]", "招聘：医馆学徒\n要求：年龄在十六至二十之间，聪慧机灵，勤劳好学者为佳\n待遇：每月一百文\n如有意者请联系医馆")
        end,
        ["4"] = function()
            avg_talk("[speaker:广而告之]", "清风客栈：欢迎您的到来！\n位于村口近旁，清净、安宁、交通便利。\n店面整洁舒适，菜肴有口皆碑。打尖住店皆是上上之选！\n期待各路侠士莅临！")
        end,
        ["5"] = function()
            return
        end,
    }
else
    local options = {
        "招聘启事",
        "广而告之",
        "离开",
    }

    local idx = show_avg_select("", "告示牌上贴着一长串告示纸，在微风中摇曳。", options)
    
    switch(idx) {
        ["1"] = function()
            avg_talk("[speaker:招聘启事]", "招聘：医馆学徒\n要求：年龄在十六至二十之间，聪慧机灵，勤劳好学者为佳\n待遇：每月一百文\n如有意者请联系医馆")
        end,
        ["2"] = function()
            avg_talk("[speaker:广而告之]", "清风客栈：欢迎您的到来！\n位于村口近旁，清净、安宁、交通便利。\n店面整洁舒适，菜肴有口皆碑。打尖住店皆是上上之选！\n期待各路侠士莅临！")
        end,
        ["3"] = function()
            return
        end,
    }
    set_flag("完成告示牌")
end