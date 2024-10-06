local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("万雀溪谷温泉师_模板", i18n_text("我以温泉之灵，抚慰每一颗疲惫的心。")) then
    return 0
else
    return -1
end