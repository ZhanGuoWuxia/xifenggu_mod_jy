local faction_destroy_achivement = {
    ["龙湾门"] = "屠龙",
    ["虎焰门"] = "虎落息风",
    ["万雀溪谷"] = "灭雀",
    ["豪猪长垄"] = "杀猪",
    ["仙竹门"] = "伐竹",
    ["灵猹仙洞"] = "灭猹",
    ["鹤岭门"] = "伏鹤",
    ["飞星云顶"] = "摘星",
    ["圣剑门"] = "断剑",
    ["暮霭山庄"] = "雾散",
    ["摇舟半岛"] = "登岛",
    ["画桥书苑"] = "焚书",
    ["夜鸦"] = nil,
    ["圣剑门探索者"] = nil,
}

local RoleGenType = CS.ZhanGuoWuxia.Backend.Beans.RoleGenType

local function destroy_faction(targetMenpai)

    if type(targetMenpai) == "string" then
        targetMenpai = get_menpai_by_id(targetMenpai)
    end

    if not targetMenpai then
        return
    end

    local menpaiId = targetMenpai.BeanId
    set_flag("完成灭亡" .. menpaiId)
    remove_flag("攻打".. menpaiId .."阵型")

    remove_all_disciples(targetMenpai)
    local msg = string.i18_format("{0}灭亡了！", targetMenpai.Name)
    pop_tip(msg)

    if faction_destroy_achivement[menpaiId] then
        tgr_achivement(faction_destroy_achivement[menpaiId])
    end
end

local function is_faction_of_area(menpai, area)

    if type(menpai) == 'string' then
        menpai = get_menpai_by_id(menpai)
    end

    if type(area) == 'string' then
        area = get_area_by_id(area)
    end

    if menpai == nil or area == nil then
        return false
    end

    return area.Owner == menpai.InstanceId
end 

local function only_last_building_left(menpai)
    if type(menpai) == 'string' then
        menpai = get_menpai_by_id(menpai)
    end
    if menpai == nil then
        return false
    end
    local areas = areas_of_menpai(menpai)
    local areaCount =#areas
    if areaCount ~= 1 then
        return false
    end
    local area = areas[1]
    if area == nil then
        return false
    end
    local mybuildings = table.where(area.Buildings, function(building)
        return building.Owner == menpai.InstanceId 
    end)
    return #mybuildings == 1
end

local function  is_template_role(role)
    return role.RoleGenType == RoleGenType.Template
end

local function pick_random_template_roles(menpai, minNum, maxNum)
    local result = {}
    if type(menpai) == 'string' then
        menpai = get_menpai_by_id(menpai)
    end
    if menpai == nil then
        return result
    end
    minNum = minNum or 1
    maxNum = maxNum or 6
    local pickNum = math.random(minNum, maxNum)
    local rolesForPick = table.where( roles_of_menpai(menpai), is_template_role)
    if #rolesForPick <= 0 then
        return result
    end
    result = table.pick_random_many(rolesForPick, pickNum)
    return result
end

local function has_menpai_flag(targetMenpai, flag)
    if type(targetMenpai) == "string" then
        targetMenpai = get_menpai_by_id(targetMenpai)
    end

    if not targetMenpai then
        return
    end

    local menpaiId = targetMenpai.BeanId
    return has_flag(menpaiId .. flag)
end

local function set_menpai_flag_int(targetMenpai, flag, num)
    if type(targetMenpai) == "string" then
        targetMenpai = get_menpai_by_id(targetMenpai)
    end

    if not targetMenpai then
        return
    end

    local menpaiId = targetMenpai.BeanId
    set_flag_int(menpaiId .. flag, num)
end

local function get_menpai_flag_int(targetMenpai, flag)
    if type(targetMenpai) == "string" then
        targetMenpai = get_menpai_by_id(targetMenpai)
    end

    if not targetMenpai then
        return
    end

    local menpaiId = targetMenpai.BeanId
    return get_flag_int(menpaiId .. flag)
end

local function remove_menpai_flag(targetMenpai, flag)
    if type(targetMenpai) == "string" then
        targetMenpai = get_menpai_by_id(targetMenpai)
    end

    if not targetMenpai then
        return
    end

    local menpaiId = targetMenpai.BeanId
    remove_flag(menpaiId .. flag)
end

return 
{
    destroy_faction = destroy_faction,
    is_faction_of_area = is_faction_of_area,
    only_last_building_left = only_last_building_left,
    pick_random_template_roles = pick_random_template_roles,
    has_menpai_flag = has_menpai_flag,
    set_menpai_flag_int = set_menpai_flag_int,
    get_menpai_flag_int = get_menpai_flag_int,
    remove_menpai_flag = remove_menpai_flag,
}