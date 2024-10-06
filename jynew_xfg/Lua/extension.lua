
local mathf = CS.UnityEngine.Mathf

local cs_debug = CS.UnityEngine.Debug

function table.merge_from(to, from)
    assert(type(to) == 'table', 'to is not a table, cannot duplicate')
    assert(type(from) == 'table', 'from is not a table, cannot duplicate')
    for  k, _ in pairs(from) do
        to[k] = from[k]
    end
end

function table.duplicate(t)
    assert(type(t) == 'table', 't is not a table, cannot duplicate')
    local res = {}
    for  k, v in pairs(t) do
        res[k] = v
    end
    return res
end

function table.cslist_2_table(list)
    local res = {}
    for i = 0, list.Count - 1 do
        res[i + 1] = list[i]
    end
    return res
end

function table.pick_random(t)
    assert(type(t) == 'table', 't is not a table, cannot pick random element')
    assert(#t > 0 , "table is empty, cannot get random element")
    local idx = math.random(1, #t)
    return t[idx], idx
end

function table.pick_random_many(t, pickNum)
    assert(type(t) == 'table', 't is not a table, cannot pick random element')
    assert(math.type(pickNum) == 'integer', 'pickNum is not an integer')
    local picks = table.duplicate(t)
    if #t <= pickNum then
        return picks
    end
    local res = {}
    for i = 1, pickNum do
        local idx = math.random(1, #picks)
        res[#res + 1] = picks[idx]
        table.remove(picks, idx)
    end
    return res
end

function table.where(t, predicate)
    assert(type(predicate) == 'function', 'predicate is not a function')
    local res = {}
    for k, v in pairs(t) do
        if predicate(v) then
            res[#res + 1] = v
        end
    end
    return res
end

function table.select(t, predicate)
    assert(type(predicate) == 'function', 'predicate is not a function')
    local res = {}
    for k, v in pairs(t) do
        if predicate(v) then
            res[#res + 1] = predicate(v)
        end
    end
    return res
end

function table.first_or_nil(t, predicate)
    local res = nil
    for _, v in pairs(t) do
        if predicate == nil or predicate(v) then
            res = v
            break
        end
    end
    return res
end

function table.find(t, predicate)
    assert(type(predicate) == 'function', 'predicate is not a function')
    for k, v in pairs(t) do
        if predicate(v) then
            return v
        end
    end
    return nil
end

function table.erase(t, element)
    if element == nil then
        return
    end
    local idx = nil
    for i, v in pairs(t) do
        if element == v then
            idx = i
            break
        end
    end
    if idx then
        table.remove(t, idx)
    end
end

function table.clear(t)
    if type(t) ~= "table" then
        return
    end
    for k in pairs(t) do
        t[k] = nil
    end
end

function switch(val)
    local case = tostring(val)
    return function(t)
        assert(type(t) == 'table', "switch statement needs a table for case selection")
        if t[case] and type(t[case]) == 'function' then
            t[case]()
        elseif t["default"] then
            t["default"]()
        end
    end
end

function reloadModule(moduleName)
    assert(type(moduleName) == 'string', "invalid arg#1 for moduleName!!")
    if(package.loaded[moduleName]) then
        package.loaded[moduleName] = nil
    end
    return safe_require(moduleName)
end

function safe_require(moduleName)
    local success, result = pcall(require, moduleName)
    if success then
        return result
    else
        print_error("加载模块失败:" .. tostring(moduleName))
        print_error(result)  
        return nil
    end
end

function math.is_nan(v)
   local ret = v ~= v
   --print("is NaN:", ret)
   return ret
end

function math.clamp(v, min, max)
    assert(min < max, "min should not be larger than max")
    return math.max(min, math.min(v, max))
end

function math.round(n)
    return mathf.Round(n)
end

function math.random_float(lower, greater)
    return lower + math.random()  * (greater - lower);
end

function print_warning(msg)
    cs_debug.LogWarning(msg)
end

function print_error(msg)
    cs_debug.LogError(msg)
end

local maxStackCount = 10
function debug.is_called_from(funcName)
    local level = 2
    while level <= maxStackCount do
      local info = debug.getinfo(level, "n")
      if not info then 
        break 
      end
      --print("called from:" .. tostring(info.name))
      if info.namewhat == funcName then
        return true
      end
      level = level + 1
    end
    return false
end
