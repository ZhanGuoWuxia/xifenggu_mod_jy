--重新夺回据点中的一个建筑
local area = current_area
if not area then
    return
end

local attackedMenpai = building_attacker_of_area(area)
if not attackedMenpai then
    return
end

local playerMenpai = get_player_menpai()
if not playerMenpai then
    return
end

--有可能的话展示下路线动画
show_battle_route(area.Id, area.Id)

local ret = menpai_battle_recapture(playerMenpai, attackedMenpai)
switch(ret)
{
    ["1"] = function()
        player_recapture_building(area)
    end,
    ["default"] = function()
        pop_tip("夺回据点建筑失败")
    end
}