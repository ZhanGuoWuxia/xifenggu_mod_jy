

local function enter_shop(shopId, OnEnter)
    local key = "首次进入" .. tostring(shopId)
    if not has_flag(key) then
        set_flag(key, "true")
        if OnEnter then
            OnEnter()
        end
    end
    open_shop(shopId)
end

return 
{
    enter_shop = enter_shop
}