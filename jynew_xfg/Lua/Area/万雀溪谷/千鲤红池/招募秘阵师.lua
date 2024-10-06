local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("万雀溪谷秘阵师_模板", i18n_text("我，秘法师，携着古老的咒文，与你们探寻天地奥秘。")) then
    return 0
else
    return -1
end