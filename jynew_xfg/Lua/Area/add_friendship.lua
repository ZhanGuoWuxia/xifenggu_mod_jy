local addFriendshipPoint = math.random(10,40)

local area = current_area
if not area then
    return
end

local targetMenpai = menpai_of_area(area)

local economy = require("Common/economy")
local cost = targetMenpai.Areas.Count * 100

if(show_avg_select("小虾米", "改善与"..targetMenpai.Name .. "的关系需要银两 x "..cost, {"是","否"}) == 1) then
    local money = get_player_money()
    if money < cost then
        pop_tip(string.i18_format("银两不足, 需要 <color=red>银两 x {0}</color>", cost))
        runtime.CurrentSave.CurrentActionCount = runtime.CurrentSave.CurrentActionCount + 1
        return
    end
    avg_talk("小虾米", "这是我派特意为贵派准备的一点心意，请笑纳！")
    add_player_money(-cost)

    local leader = get_role_by_instanceId(targetMenpai.Leader)
    avg_talk(leader.Id, "那我就不客气了。")
    
    change_both_friendship("player", targetMenpai, addFriendshipPoint)
    
    pop_tip("提升了好感度" .. tostring(addFriendshipPoint))
else
    runtime.CurrentSave.CurrentActionCount = runtime.CurrentSave.CurrentActionCount + 1
end

