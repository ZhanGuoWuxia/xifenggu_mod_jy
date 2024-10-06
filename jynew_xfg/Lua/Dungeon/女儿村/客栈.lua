avg_talk("", "村中唯一的客栈，门梁上悬挂着雕花木金线箍匾额，上书“清风客栈”。")

local function avg_select()
    local options = {
        "进入客栈",
        "离开",
    }

    local idx = show_avg_select("", "门口的小二倒是有些眼力见，行动利落，显然是习惯了成日里迎来送往。", options)

    switch(idx) {
        ["1"] = function()
            local opts = {
                "掌柜",
                "短衣男、长衫男",
                "斗笠客",
                "离开",
            }

            local i = show_avg_select("", "待走进客栈，只见厅堂中坐着几个人。", opts)

            switch(i) {
                ["1"] = function()
                    avg_talk("[speaker:掌柜]", "客官，不知是打尖儿还是住店？")
                    avg_talk("司徒来也", "掌柜的，劳驾请问有没见过一个梳双髻，身着红色花裙的姑娘？")
                    avg_talk("[speaker:掌柜]", "听着怎么像是前些日子小红姑娘来时的装扮？莫非客官是问小红姑娘？")
                    avg_talk("司徒来也", "正是。")
                    avg_talk("[speaker:掌柜]", "几天前，小红姑娘同一位穿着黑衣的男子一同来过，只是小红姑娘的形神慌张，当时我还有些担心。")
                    avg_talk("[speaker:掌柜]", "所以留了心眼儿，悄悄观察他们好一阵子，最后看到他们往街道以北的方向去了。")
                    avg_talk("司徒来也", "多谢掌柜！")
                    set_flag("完成客栈")
                    avg_select()
                end,
                ["2"] = function()
                    if not has_flag("客栈教训") then
                        avg_talk("短衣男", "最近这女儿村怎么来了这么多道上的人？")
                        avg_talk("长衫男", "你还不知道？这女儿村中好多女儿都下落不明，这些人应当是来找人的。")
                        avg_talk("短衣男", "……原来是这样？我还以为这事儿与虎焰门有关呢。")
                        avg_talk("长衫男", "虎焰门？什么意思？")
                        avg_talk("短衣男", "前阵子虎焰门也是这么闹哄哄的，后来听说被灭了门！这些是非之地，难说不是干了什么坏事遭了报应。")
                        avg_talk("", "(player:fullname)听到这里，脸色铁青，狠狠地拍了一下桌子。")
                        avg_talk("司徒来也", "哪里来的宵小？胆敢信口雌黄！")
                        avg_talk("短衣男", "你是何人？")
                        avg_talk("长衫男", "你要作甚？")
                        avg_talk("司徒来也", "虎焰门现任掌门，想请二位品品茶！")

                        local ret = dungeon_battle("女儿村", "客栈之战")
                        if ret == 1 then
                            avg_talk("司徒来也", "若再胆敢胡乱造谣，定不饶恕！")
                            avg_talk("短衣男", "是是是……我们再不敢了！")
                            avg_talk("长衫男", "不敢再嚼舌头了。")
                            set_flag("客栈教训")
                            avg_select()
                        else
                            dungeon_fail("女儿村")
                        end
                    else
                        avg_talk("", "两个人看到你，立刻闭上了嘴。")
                        avg_select()
                    end
                end,
                ["3"] = function()
                    avg_talk("", "斗笠客的目光如剑一般扫来,不由让人心生寒颤，哪里来的高手？")
                    if is_equip_item("司徒来也", "紫电坠") then
                        if not has_flag("获得追风步法") then
                            avg_talk("[speaker:斗笠客]", "虎焰门的(player:fname)雷是你什么人？")
                            avg_talk("司徒来也", "阁下既然知道虎焰门有老掌门，便该知道虎焰门现下还有新掌门。")
                            avg_talk("[speaker:斗笠客]", "好！好！好！虎焰门果然还没有亡！")
                            avg_talk("司徒来也", "阁下是谁？")
                            avg_talk("[speaker:斗笠客]", "与虎焰门有些旧交之人！你既然是新掌门，相见也算因缘，这本《追风步法》就送给你吧。")
                            avg_talk("司徒来也", "多谢阁下！")
                            add_player_item("追风步法", 1)
                            set_flag("获得追风步法")
                        else
                            avg_talk("[speaker:斗笠客]", "你总盯着我做什么？")
                            avg_talk("司徒来也", "见阁下气度不凡，故而敢问阁下何门何派？")
                            avg_talk("[speaker:斗笠客]", "哼，打听我的事情，你还不够资格！")
                            avg_talk("司徒来也", "这……失礼了。")
                        end
                    end
                    avg_select()
                end,
                ["4"] = function()
                    return
                end
            }

        end,
        ["2"] = function()
            return
        end,
    }
end

avg_select()