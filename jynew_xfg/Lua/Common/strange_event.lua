--一些特殊事件


--奇遇商人事件
local merchant_chance = chance(15)
if merchant_chance then
    set_flag("奇遇商人出现")
    remove_flag("该回合已经购买过奇遇商人")
else
    remove_flag("奇遇商人出现")
end

--拍卖雇佣事件
local auction_chance = chance(50)
if auction_chance then
    set_flag("拍卖雇佣出现")
    remove_flag("该回合已经参加过拍卖雇佣")
else
    remove_flag("拍卖雇佣出现")
end

--收徒事件
local disciple_chance = chance(15)
if disciple_chance then
    set_flag("收徒出现")
    remove_flag("该回合已经收徒")
else
    remove_flag("收徒出现")
end

--踢馆事件
local challenge_chance = chance(15)
if challenge_chance then
    set_flag("踢馆出现")
    remove_flag("该回合已经踢馆")
else
    remove_flag("踢馆出现")
end

--计策
remove_flag("该回合已经恐吓威胁")
remove_flag("该回合已经设置陷阱机关")
remove_flag("该回合已经潜入刺杀")
remove_flag("该回合已经勒索抢劫")
