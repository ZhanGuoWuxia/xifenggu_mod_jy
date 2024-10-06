local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("被解救的女子_模板", i18n_text("(player:fname)公子，请让小女子跟随您，我愿意为您效力直到生命最后一刻。")) then
    return 0
else
    return -1
end