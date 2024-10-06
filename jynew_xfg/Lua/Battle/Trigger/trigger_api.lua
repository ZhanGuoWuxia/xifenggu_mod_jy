tgr_api = {}
local NewAvgResult = CS.ZhanGuoWuxia.Backend.Battle.Data.RolePerform_AvgResult
local NewBubbleResult = CS.ZhanGuoWuxia.Backend.Battle.Data.RolePerform_BubbleResult

---@enum BattleRet
---@field UnFinished enum 未完成
---@field Draw enum 平局
---@field Team1 enum 队伍1获胜
---@field Team2 enum 队伍2获胜
local BattleRet = CS.ZhanGuoWuxia.Backend.Battle.BattleRet
tgr_api.battle_ret = BattleRet

function tgr_api:tgr_bubble_text(roleId, text)
    local bf = current_battle()
    if not bf then
        return
    end
    if type(roleId) == 'string' then
        roleId = str_to_battlerole_id(roleId)
    end
    text = i18n_text(text)
    local rst = NewBubbleResult()
    rst.PerformRoleId = roleId
    rst.ReceiveRoleId = roleId
    rst.Text = text
    bf:RecordRolePerfomAction(rst)
end

function tgr_api:tgr_avg_text(roleBeanId, text)
    local bf = current_battle()
    if not bf then
        return
    end
    text = i18n_text(text)
    local rst = NewAvgResult()
    rst.Talker = roleBeanId
    rst.Text = text
    bf:RecordRolePerfomAction(rst)
end

function tgr_api:set_battle_premature_ret(ret)
    local bf = current_battle()
    if not bf then
        return
    end
    bf.PrematureRet = ret
end

function tgr_api:player_battle_win()
    self:set_player_is_win(true)
end

function tgr_api:player_battle_lose()
    self:set_player_is_win(false)
end

function tgr_api:set_player_is_win(is_win)
    local player_team = team_of_player()
    if player_team == -1 then
        return
    end

    local bf = current_battle()
    if not bf then
        return
    end

    if player_team == 0 then
        --玩家是队伍1
        bf.PrematureRet = is_win and BattleRet.Team1 or BattleRet.Team2
    else
        --玩家是队伍2
        bf.PrematureRet = is_win and BattleRet.Team2 or BattleRet.Team1
    end
end

function tgr_api:add_buff_to_role(buffId, roleId, pile, leftRound)
    if type(roleId) == 'string' then
        roleId = str_to_battlerole_id(roleId)
    end
    add_buff(buffId, roleId, -1, pile, leftRound)
end

function tgr_api:remove_buff_from_role(buffId, roleId)
    if type(roleId) == 'string' then
        roleId = str_to_battlerole_id(roleId)
    end
    remove_buff(buffId, roleId, -1)
end

return tgr_api