local recruitHelper = require 'Area/招募杂鱼角色'

if recruitHelper.recruit_fellow("豪猪弓箭手_模板", "(player:fname)老大，以后你指哪我就射哪!") then
    return 0
else
    return -1
end