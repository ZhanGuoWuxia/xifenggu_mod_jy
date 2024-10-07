print("mod init !!!!!!!!!!!!!!!")


open_prison = function()
    pop_tip("此功能在本MOD不可用")
end


ask_player_create_role = function ()
    player_role = get_player_role()
    player_role.CustomFamilyName = "小"
    player_role.CustomGivenName = "虾米"
    runtime.CurrentSave.PlayerFamilyName = "小"
    runtime.CurrentSave.PlayerGivenName = "虾米"
    -- 本MOD跳过创角
    trigger_event(0)
end


function getRandomElement(t)
    local key = math.random(#t)
    -- 返回键对应的值
    return t[key]
end