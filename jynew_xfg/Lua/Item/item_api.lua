local cs_add_item_to_player = game_api.AddItemToPlayer
local cs_add_item_to_menpai = game_api.AddItemToMenpai

---玩家门派获取道具
---@param string itemId 道具id
---@param int itemNum 道具数量
---@param string affixformula 词缀公式
function add_player_item(itemid, itemNum, affixformula)
    itemNum = itemNum or 1
    affixformula = affixformula or ""
    cs_add_item_to_player(itemid, itemNum, affixformula)
end

--门派获取道具
---@param MenpaiInstance menpai 门派
---@param string itemId 道具id
---@param int itemNum 道具数量
---@param string affixformula 词缀公式
function add_menpai_item(menpai, itemid, itemNum, affixformula)
    itemNum = itemNum or 1
    affixformula = affixformula or ""
    cs_add_item_to_menpai(menpai, itemid, itemNum, affixformula)
end

---玩家门派道具数量
---@param string itemId 道具id
---@return int itemCount 道具数量
get_player_item_count = game_api.GetPlayerItemCount

--尝试让一个角色从所属门派仓库里装备第一个匹配指定Id的道具
---@param RoleInstance role 角色实例
---@param string itemId 道具表id
---@return bool success 是否成功
try_equip_item = game_api.TryEquipItemFromBag

--判断角色是否装备道具
---@param roleId string 角色Id
---@param itemId string 道具Id
function is_equip_item(roleId, itemId)
    local role = get_role_by_id(roleId)
    return role:IsEquipItem(itemId)
end
