local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("豪猪刺客_模板", i18n_text("(player:fname)老大愿意给我机会洗心革面, 以后老大有啥不方便的脏活放心交给我吧!")) then
    return 0
else
    return -1
end