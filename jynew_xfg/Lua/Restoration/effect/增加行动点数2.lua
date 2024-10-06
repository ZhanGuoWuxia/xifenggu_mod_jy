--剧情待补充
local restore_api = require 'Restoration/restoration_api'
local isOk = restore_api.add_round_action_count(1)
if isOk then
    play_sfx("Tip/Tip1.wav")
    pop_msg_box("回合行动次数增加了1点")
end
