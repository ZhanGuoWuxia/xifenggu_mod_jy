local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("龙湾门下人_模板", i18n_text("(player:fname)老爷, 有什么要求你尽管提，小的绝无二心")) then
    return 0
else
    return -1
end