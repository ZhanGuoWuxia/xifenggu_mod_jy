avg_talk("", "尝试随机从一个门派抓一个人")
local allSects = runtime.CurrentSave.Menpais
for _, sect in pairs(allSects) do
    if not is_player_menpai(sect) then
        print(sect.Roles.Count)
        if sect.Roles.Count > 0 and chance(99) then
            local roleId = sect.Roles[math.random(0, sect.Roles.Count - 1)]
            local role = get_role_by_instanceId(roleId)
            print("尝试抓" .. role.Name)
            if player_capture_prisoner(role) then
                avg_talk(role, "可恶，竟然被你抓到了")
                return
            end
        end
    end
end

avg_talk("", "没抓到任何人")
