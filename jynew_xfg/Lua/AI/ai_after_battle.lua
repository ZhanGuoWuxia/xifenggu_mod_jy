local battle_param = current_battle_param
local win_ret = current_win_ret

local Team1 = 0
local Team2 = 1
local baseCapture = 20
local plusCaptureChance = get_float(restore_modifer_key.prisoner_chance)
local finalCaptureChance = baseCapture + plusCaptureChance



if battle_param.PlayerTeam < 0 then
    return
end

print("俘虏概率:" .. tostring(finalCaptureChance) .. "%")

if win_ret == 1 and battle_param.PlayerTeam == Team1 then
    local roles = battle_param:GetTeam2CaptureableRoles()
    for _, role in pairs(roles) do
        if chance(finalCaptureChance) then
            if not has_flag("第一次俘虏") then
                set_flag("第一次俘虏")
            end
            player_capture_prisoner(role)
        end
    end
elseif win_ret == 2 and battle_param.PlayerTeam == Team2 then
    local roles = battle_param:GetTeam1CaptureableRoles()
    for _, role in pairs(roles) do
        if chance(finalCaptureChance) then
            if not has_flag("第一次俘虏") then
                set_flag("第一次俘虏")
            end
            player_capture_prisoner(role)
        end
    end
else
    set_flag_int("据点战失败次数", get_flag_int("据点战失败次数") + 1)
end
