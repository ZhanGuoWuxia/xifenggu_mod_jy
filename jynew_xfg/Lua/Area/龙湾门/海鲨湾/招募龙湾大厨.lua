local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("龙湾大厨_模板", i18n_text("我愿向(player:fname)掌门效忠，为门派复兴添砖加瓦")) then
    return 0
else
    return -1
end