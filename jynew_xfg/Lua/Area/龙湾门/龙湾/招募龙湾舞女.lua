local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("龙湾舞女_模板", i18n_text("小女子愿投入贵派，尽力为门派增光添彩。")) then
    return 0
else
    return -1
end