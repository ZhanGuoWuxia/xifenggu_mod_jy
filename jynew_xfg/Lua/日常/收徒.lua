local instructor = require 'Common/instructor'
local player_menpai = get_player_menpai()
if not player_menpai then
    print_error("无法获取玩家门派数据")
    return -1
end

local develop = current_area and current_area.Develop or 0
local medianLevel = player_menpai:MedianOfRoleLevel()
local AdditionLevel = develop // 3
local roleLevel = math.clamp(medianLevel +  AdditionLevel, 1, MaxRoleLevel)

local get_candidates = function (n)
    local candidate_list = {}
    local role_candidates = {"随机坦克", "随机医师", "随机刺客", "随机侠士", "随机游侠"}
    local role = role_candidates[math.random(1, #role_candidates)]
    for i = 1, n do
        local role = create_temp_role(role, roleLevel)
        if role then
            instructor.gen_affix_via_develop_point(role, develop)
            table.insert(candidate_list, role)
        end
    end
    return candidate_list
end

local options = {
    "让我亲自挑选",
    "算了",
}

local msg = "掌门，附近有一些练武之人希望加入我们，你希望挑选怎样的人才？"
local idx = show_avg_select("齐六哥", msg, options)

switch(idx) {
    ["1"] = function()
        -- 随机出现三个徒弟候选人，玩家可以选择其中一个徒弟进行招募
        local candidates = get_candidates(3)
        print("candidates", candidates)
        ::select_candidate::
        local is_confirm, candidate = single_role_select(candidates)
        if not is_confirm then
            return -1
        end
        if not candidate then
            print_error("错误, 无法获取目标徒弟")
            return -1
        end
        local is_ok = yes_or_no(string.i18_format("确定挑选<color=#ff2400>{0}</color>为门人吗？", candidate.Name))
        if not is_ok then
            goto select_candidate
        end
        
        player_add_disciple(candidate)
        set_flag("该回合已经收徒")
        return
    end,
    ["2"] = function()
        return
    end
}