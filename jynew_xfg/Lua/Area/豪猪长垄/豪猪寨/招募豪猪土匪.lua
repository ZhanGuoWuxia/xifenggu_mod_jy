local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("豪猪土匪_模板", i18n_text("小的愿为(player:fname)老大效犬马之劳!")) then
    return 0
else
    return -1
end