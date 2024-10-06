
local translations = {}

--获取多语言文本
---@param langKey string 多语言映射key
local csharp_i18 = game_api.GetI18Text


local cs_format = CS.System.String.Format

function merge_translation(moduleName)
    local newTranslations = safe_require(moduleName)
    if type(newTranslations) == 'table' then
        table.merge_from(translations, newTranslations)
    end
end

function string.i18_format(str, ...)
    str = i18n_text(str)
    return cs_format(str, ...)
end

function string.is_null_or_empty(str)
    if str == nil or str == '' then
        return true
    end
    return false
end

function i18n_text(content)
    if string.is_null_or_empty(content) then
        return content
    end

    local key = translations[content]
    if string.is_null_or_empty(key) then
        print_warning("not_found_translation:" .. content)
        return content
    end

    local result = csharp_i18(key, content)
    if not result then
        return content
    end

    return result
end

function translate_options(options)
    if type(options) ~= 'table' then
        return
    end
    for i = 1, #options do
        if type(options[i]) == 'string' then
            options[i] = i18n_text(options[i])
        end
    end
end


merge_translation("i18_map/i18n_lua_dialogue")
merge_translation("i18_map/i18n_luaconst")
merge_translation("i18_map/i18n_default")