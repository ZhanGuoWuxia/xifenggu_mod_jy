local role = current_role
if not role then
    return
end

local isFemale = role.IsFemale

local questions = nil
math.randomseed(os.time())

if isFemale then
    questions =
    {
        "你这淫贼，我宁死也不会屈服！",
        "嘤哼, 你这登徒子，无耻混蛋……",
        "咕, 杀了我吧……",
    }
else
    questions =
    {
        "你这败类，你想作甚？",
        "放马过来吧, 我要是哼一声就算输……",
        "啊啊啊啊, 你不要过来啊……",
    }
end

local content = table.pick_random(questions)
avg_talk(role, content)


local function tortment_result(role, ...)

    --特殊词缀带来的互动
    if role:HasAffix("受虐狂") then
        avg_talk(role, "哈哈哈哈, 还不够, 我还要更多……")
        change_favor(role, 1)
    elseif role:HasAffix("施虐狂") then
        avg_talk(role, "你这该死的败类, 等你落到我手里我会让你生不如死！")
        change_favor(role, -2)
    else
        avg_talk(role, "可恶啊……")
        change_favor(role, -1)
    end

    --玩家觉醒的特性
    local player = get_player_role()
    if player then
        if not player:HasAffix("受虐狂") and chance(1) then
            role_add_affix(player,"受虐狂")
            avg_talk("", "你似乎觉醒了什么奇怪的特性……")
        elseif not player:HasAffix("施虐狂") and chance(1) then
            role_add_affix(player,"虐待狂")
            avg_talk("","你似乎觉醒了什么可怕的特性……")
        end
    end


    --可能造成的附加词缀
    if chance(10) then
        local affix = {...}
        if #affix > 0 then
            local randomAffix = table.pick_random(affix)
            if randomAffix and not role:HasAffix(randomAffix) then
                avg_talk(role, "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊!!!!")
                avg_talk("", "你的行为好像对囚犯产生了不可预估的后果……")
                role_add_affix(role, randomAffix)
            end
        end
    end


    if chance(5) then
        avg_talk("", string.i18_format("[{0}]在忍辱负重一段时间后，寻找机会逃出了地牢。", role.Name) )
        change_favor(role, -3)
        player_release_prisoner(role)
    end
end


local options = {
    "用语言羞辱此人",
    "严刑拷打此人",
    "把此人丢进伸手不见五指的黑井",
    "算了，离开地牢"
}

local selectIdx = show_avg_select("", "你接下来打算：", options)
switch(selectIdx) {
    ["1"] = function()
        tortment_result(role, "虐待狂", "复仇者")
    end,

    ["2"] = function()
        tortment_result(role, "木头人", "独腿之人", "独臂之人", "独眼龙", "受虐狂")
    end,

    ["3"] = function()
        tortment_result(role, "盲人", "受虐狂")
    end,

    ["4"] = function()
        if role:HasAffix("受虐狂") then
            avg_talk(role, "可恶，我明明充满了期待……")
            change_favor(role, -1)
        end
    end,
}

return true

