local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("万雀溪谷祭司_模板", i18n_text("我以祭司之名，接受虎焰门的召唤。")) then
    return 0
else
    return -1
end