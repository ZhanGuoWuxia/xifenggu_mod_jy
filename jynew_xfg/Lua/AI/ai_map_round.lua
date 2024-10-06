print("大地图各势力的AI行动")
local allSects = runtime.CurrentSave.Menpais
for _, sect in pairs(allSects) do
    if is_game_over() then
        print("游戏结束, 退出过回合逻辑")
        return
    end
    if not is_player_menpai(sect) then
        local ai = aiManager:getAI(sect.AIName)
        if ai then
            ai:think(sect)
        else
            print("[ " .. tostring(sect.Name) .. " ]这门派没有ai，只能发呆")
        end
    end
end

executefile("Common/round_cure_role")
executefile("Common/round_recover_action")
executefile("Common/strange_event")
