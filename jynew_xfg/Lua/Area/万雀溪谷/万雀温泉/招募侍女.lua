local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("万雀溪谷侍女_模板", i18n_text("小女子会照顾好大家的。")) then
    return 0
else
    return -1
end