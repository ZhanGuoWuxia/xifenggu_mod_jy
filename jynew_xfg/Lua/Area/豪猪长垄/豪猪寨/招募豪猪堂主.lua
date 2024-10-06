local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("豪猪堂主_模板", i18n_text("我对(player:gname)老大的实力甘拜下风，愿为老大两肋插刀!")) then
    return 0
else
    return -1
end