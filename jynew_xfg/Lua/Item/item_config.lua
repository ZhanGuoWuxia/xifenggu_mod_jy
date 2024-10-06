local Csharp_get_random_items = game_api.GetRandomPoolItems

local function get_random_items(poolId, count)
    count = count or 1
    local csharp_list = Csharp_get_random_items(poolId, count)
    return table.cslist_2_table(csharp_list)
end

local function get_seller_items()
    local current_round = get_game_round()
    if current_round <= 25 then
        return get_random_items("奇遇商人前期", 3)
    elseif current_round <= 50 then
        return get_random_items("奇遇商人中期", 4)
    elseif current_round <= 75 then
        return get_random_items("奇遇商人后期", 4)
    else
        return get_random_items("奇遇商人后期", 5)
    end
end

return {
    get_seller_items = get_seller_items,
}