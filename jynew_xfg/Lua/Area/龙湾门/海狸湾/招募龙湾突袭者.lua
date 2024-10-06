local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("龙湾突袭者_模板", i18n_text("愿为掌门鞍前马后")) then
    return 0
else
    return -1
end