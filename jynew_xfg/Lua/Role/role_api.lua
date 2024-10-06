--判断角色是否装备技能
---@param roleId string 角色Id
---@param skillId string 技能Id
function is_equip_skill(roleId, skillId)
    local role = get_role_by_id(roleId)
    return role:IsEquipSkill(skillId)
end
