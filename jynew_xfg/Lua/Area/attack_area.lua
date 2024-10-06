local area = current_area
if not area then
    return
end

local playerMenpai = get_player_menpai()
if not playerMenpai then
    return
end

--有可能的话展示下路线动画
local neibors = get_neighbors(area)
for i, a in pairs(neibors) do
    if menpai_of_area(a) == playerMenpai then
        show_battle_route(a.Id, area.Id)
        break
    end
end



local ret = menpai_battle_by_area(playerMenpai, area)
switch(ret)
{
    ["1"] = function()
        pop_tip("已成功占领一个据点建筑")
        player_occupy_building(area)
    end,
    ["default"] = function()
        pop_tip("攻击据点建筑失败")
    end
}