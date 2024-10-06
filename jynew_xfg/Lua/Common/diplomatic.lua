local diplomatic = {}

local get_menpai_relation = game_api.MenpaiRelation

--门派外交关系 0: 普通  -1：交战  1：结盟
local RelationType =
{
    Neutral = 0,
    Ally = 1,
    Enemy = -1
}

local function try_get_menpai(target1, target2)
    if not target1 or not target2 then
        return false
    end

    local menpai1, menpai2
    if type(target1) == "string" then
        if target1 == 'player' then
            menpai1 = get_player_menpai()
        else
            menpai1 = get_menpai_by_id(target1)
        end
    elseif type(target1) == "userdata" then
        menpai1 = target1
    end

    if type(target2) == "string" then
        if target2 == 'player' then
            menpai2 = get_player_menpai()
        else
            menpai2 = get_menpai_by_id(target2)
        end
    elseif type(target2) == "userdata" then
        menpai2 = target2
    end

    if not menpai1 or not menpai2 then
        return false
    end

    return true, menpai1, menpai2
end

function diplomatic.try_get_menpai(target1, target2)
    return try_get_menpai(target1, target2)
end

function diplomatic.current_relation(target1, target2)
    local isvalid, menpai1, menpai2 = try_get_menpai(target1, target2)
    if not isvalid then
        return RelationType.Neutral
    end
    return get_menpai_relation(menpai1, menpai2)
end

local get_menpai_friendship = function(menpai1, menpai2)
    return menpai1:GetFriendship(menpai2)
end

function diplomatic.get_friendship(target1, target2)
    local isvalid, menpai1, menpai2 = try_get_menpai(target1, target2)
    if not isvalid then
        return 0
    end
    return get_menpai_friendship(menpai1, menpai2)
end

function diplomatic.set_friendship(target1, target2, point)
    local isvalid, menpai1, menpai2 = try_get_menpai(target1, target2)
    if not isvalid then
        return 0
    end
    return menpai1:SetFriendship(menpai2, point)
end

function diplomatic.give_gift(target1, target2, point)
    local isvalid, menpai1, menpai2 = try_get_menpai(target1, target2)
    if not isvalid then
        return 0
    end
    return change_both_friendship(menpai1, menpai2, point)
end


--宣战
function diplomatic.declare_war(target1, target2)
    local isvalid, menpai1, menpai2 = try_get_menpai(target1, target2)
    if not isvalid then
        return
    end
    local curRelation = diplomatic.current_relation(menpai1, menpai2)
    if curRelation == RelationType.Enemy then
        return
    end

    pop_tip(menpai1.Name .. "对" .. menpai2.Name .. "<color=red>宣战</color>了")
    menpai1:SetRelation(menpai2, RelationType.Enemy)
    set_both_friendship(menpai1, menpai2, -100)
end

--结盟
function diplomatic.make_ally(target1, target2)
    local isvalid, menpai1, menpai2 = try_get_menpai(target1, target2)
    if not isvalid then
        return
    end
    local curRelation = diplomatic.current_relation(menpai1, menpai2)
    if curRelation == RelationType.Ally then
        return
    end

    pop_tip(menpai1.Name .. "与" .. menpai2.Name .. "<color=#00da2e>结盟</color>了")
    menpai1:SetRelation(menpai2, RelationType.Ally)
end


--中立
function diplomatic.neutral(target1, target2)
    local isvalid, menpai1, menpai2 = try_get_menpai(target1, target2)
    if not isvalid then
        return
    end
    local curRelation = diplomatic.current_relation(menpai1, menpai2)
    if curRelation == RelationType.Neutral then
        return
    end

    if curRelation == RelationType.Ally then
        pop_tip(menpai1.Name .. "与" .. menpai2.Name .. "的盟友关系<color=red>已破裂</color>")
    elseif curRelation == RelationType.Enemy then
        pop_tip(menpai1.Name .. "与" .. menpai2.Name .. "已达成<color=red>和平条约</color>")
    end
    menpai1:SetRelation(menpai2, RelationType.Neutral)
    set_both_friendship(menpai1, menpai2, 0)
end


--评估实力
function diplomatic.evaluate(target1, target2)
    local isvalid, menpai1, menpai2 = try_get_menpai(target1, target2)
    if not isvalid then
        return
    end
    local medianLevel1 = menpai1:MedianOfRoleLevel()
    local medianLevel2 = menpai2:MedianOfRoleLevel()
    return medianLevel1 - medianLevel2
end

return diplomatic
