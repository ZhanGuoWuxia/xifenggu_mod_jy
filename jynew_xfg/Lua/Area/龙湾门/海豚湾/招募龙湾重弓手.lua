local recruitHelper = require 'Area/招募杂鱼角色'


if recruitHelper.recruit_fellow("龙湾重弓手_模板", i18n_text("我愿肩负重任，为(player:fname)掌门守护门派山河")) then
    return 0
else
    return -1
end