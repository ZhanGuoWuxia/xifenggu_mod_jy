local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("万雀溪谷风水师_模板", i18n_text("作为风水师，我得说，这地方风水真不错。")) then
    return 0
else
    return -1
end