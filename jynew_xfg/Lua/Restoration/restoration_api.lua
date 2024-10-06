
local change_fire_point = game_api.ChangeFirePoint

local function add_fire_point(num)
    assert(math.type(num) == "integer", "fire point should be an integer")
    change_fire_point(num)
end

local function add_round_action_count(num)
    assert(math.type(num) == "integer", "action count should be an integer")
    assert(num > 0, "action count should be larger than 0")
    local save = runtime.CurrentSave
    if not save then
        print_error("当前没有合法的存档数据")
        return false
    end
    save.MaxActionCount = save.MaxActionCount + num
    save.CurrentActionCount = save.CurrentActionCount + num
    return true
end

restore_modifer_key = {
    income = "收入加成",
    build_cost_discount = "领地建设费用减免",
    prisoner_chance = "俘虏概率提升",
    add_exp_percent = AdditionExpKey,
}

restore_api =
{
    add_fire_point = add_fire_point,
    add_round_action_count = add_round_action_count,
}

return restore_api
