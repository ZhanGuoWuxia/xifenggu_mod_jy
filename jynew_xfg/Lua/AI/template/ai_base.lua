local ai = class("ai_base")
local ai_decision = require("AI/decisions")
local ai_formation = require("AI/formation/ai_formation")
local faction_control = require("Common/faction")
local default_action_count = 2

function ai:think(menpai)

    self:recover_battle_join_count(menpai)

    --移除本回合生效flag
    self:remove_menpai_flag(menpai, "阵容上限减少人数")

    --先尝试触发一次剧情
    ai_decision.trigger_story(menpai)

    if is_game_over() then
        return
    end

    if menpai.IsLocked then
        print(menpai.Name .. "处于锁定状态，不行动")
        return
    end
    if menpai.IsDestroyed then
        print(menpai.Name .. "没地已经灭亡了，因此不参与思考")
        return
    end
    local maxActionCount = self.maxActionCount and self.maxActionCount or default_action_count
    local ai_actions = {}
    if type(self.actions) == "function" then
        ai_actions = self.actions()
    else
        ai_actions = table.duplicate(self.actions)
    end
    for i = 1, maxActionCount do
        local next_action = ai_decision.get_max_score_action(ai_actions, menpai)
        if next_action then
            show_menpai_action(menpai, next_action.name)
            next_action.execute(menpai, self)
        end
    end
end

function ai:remove_menpai_flag(menpai, flag)
    faction_control.remove_menpai_flag(menpai, flag)
end

function ai:recover_battle_join_count(menpai)
    local roles = roles_of_menpai(menpai)
    for i, role in pairs(roles) do
        role:ResetJoinBattleCount()
    end
end

function ai:can_role_join_battle(role)
    return role ~= nil and role:CanJoinBattle()
end

function ai:replace_if_cannot_battle(role, replaceRoleId)
    if not self:can_role_join_battle(role) then
        role = create_temp_role(replaceRoleId, self.role_level or 1)
    end
    return role
end

function ai:pop_next_role_for_select(roleId, SubstituteRoleId)
    local role = table.find(self.rolesForSelect, function(r) return r.BeanId == roleId end)
    role = self:replace_if_cannot_battle(role, SubstituteRoleId)
    table.erase(self.rolesForSelect, role)
    return role
end

function ai:initRolesForSelection(menpai)
    self.rolesForSelect = table.where(roles_of_menpai(menpai), function(r) return r:CanJoinBattle() end)
    local level = math.round(menpai:MedianOfRoleLevel() * self:get_difficult_scale_factor())
    self.role_level = math.max(1, level)
end

function ai:get_difficult_scale_factor()
    local round = get_game_round()
    if round <= 5 then
        return 0.6
    elseif round <= 10 then
        return 0.7
    elseif round <= 20 then
        return 0.8
    elseif round <= 30 then
        return 0.9
    elseif round <= 40 then
        return 1
    elseif round <= 50 then
        return 1.05
    elseif round <= 60 then
        return 1.1
    elseif round <= 70 then
        return 1.15
    else
        return 1.2
    end
end

function ai:is_role_in_formation(role, formation)
    if type(formation) ~= "table" then
        return false
    end
    local res = table.find(formation, function(element) return element.Role == role end)
    return res ~= nil
end

--获取可用的阵容
function ai:getformations(menpai, team)
    local picker = table.pick_random(ai_formation)
    if picker then
        return picker(menpai, team)
    end
    return {}
end
return ai
