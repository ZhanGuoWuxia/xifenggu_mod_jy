reloadModule 'Attr/attr_template_formula'
reloadModule 'Attr/attr_display'

--获取一个角色的属性值
---@param roleId string 角色id或者RoleInstance均可
---@param statName string 数据key
function role_attr(roleId, statName)
    local role = nil
    if type(roleId) == 'userdata' then
        role = roleId
    else
        role = get_role_by_id(roleId)
    end
    if not role then
        return 0
    end
    return role.Attrs:GetFloat(statName)
end

--永久增加一个角色的属性值
---@param roleId string 角色id或者RoleInstance均可
---@param statName string 数据key
---@param value number 增加的数据值
function add_role_attr(roleId, statName, value)
    local role = nil
    if type(roleId) == 'userdata' then
        role = roleId
    else
        role = get_role_by_id(roleId)
    end

    if not role then
        return
    end
    local prevAttr = role.AttrsSelf:GetFloat(statName)
    role.AttrsSelf:SetFloat(statName, prevAttr + value)
    role:RefreshAttr()
end

--设置一个角色的属性值
---@param roleId string 角色id或者RoleInstance均可
---@param statName string 数据key
---@param value number 数据值
function set_role_attr(roleId, statName, value)
    local role = nil
    if type(roleId) == 'userdata' then
        role = roleId
    else
        role = get_role_by_id(roleId)
    end

    if not role then
        return
    end
    role.Attrs:SetFloat(statName, value)
    role:RefreshAttr()
end
