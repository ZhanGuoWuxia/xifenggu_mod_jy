local function tip_link(prefix, id, labelText, hexColor)
    hexColor = hexColor or "white"
    labelText = i18n_text(labelText)
    return string.i18_format("<link=\"{0}:{1}\"><u><color={2}>{3}</color></u></link>", prefix, id, hexColor, labelText)
end

function affix_tip_link(affixId, labelText, hexColor)
    return tip_link("affix", affixId, labelText, hexColor)
end

function item_tip_link(itemId, labelText, hexColor)
    return tip_link("item", itemId, labelText, hexColor)
end

api_util = {}

function api_util.area_api_import(api_function)
    return function(area, ...)
        if type(area) == 'string' then
            area = get_area_by_id(area)
        end
        return api_function(area, ...)
    end
end

function api_util.menpai_area_api_import(api_function)
    return function(menpai, area, ...)
        if type(menpai) == 'string' then
            menpai = get_menpai_by_id(menpai)
        end
        if type(area) == 'string' then
            area = get_area_by_id(area)
        end
        return api_function(menpai, area, ...)
    end
end

function api_util.menpai_api_import(api_function)
    return function(menpai, ...)
        if type(menpai) == 'string' then
            menpai = get_menpai_by_id(menpai)
        end
        return api_function(menpai, ...)
    end
end

function api_util.role_api_import(api_function)
    return function(role, ...)
        if type(role) == 'string' then
            role = get_role_by_id(role)
        end
        return api_function(role, ...)
    end
end

function api_util.menpai_role_api_import(api_function)
    return function(menpai, role, ...)
        if type(menpai) == 'string' then
            menpai = get_menpai_by_id(menpai)
        end
        if type(role) == 'string' then
            role = get_role_by_id(role)
        end
        return api_function(menpai, role, ...)
    end
end

function api_util.role_menpai_api_import(api_function)
    return function(role, menpai, ...)
        if type(role) == 'string' then
            role = get_role_by_id(role)
        end
        if type(menpai) == 'string' then
            menpai = get_menpai_by_id(menpai)
        end
        return api_function(role, menpai, ...)
    end
end