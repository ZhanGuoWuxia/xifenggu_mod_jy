-- 金庸乱斗探索行为

--[[
    探索是本MOD核心行为，本质是抽卡：
    1. 地点可以根据发展度，设置随机池
    2. 不同地点达成条件后可配置不同的随机事件，可设置该随机事件的触发系数

    最终在所有随机事件中进行抽取
]]

local economy = require 'Common/economy'
local db = CS.ZhanGuoWuxia.Backend.Beans.BeanManagerCore.Instance

local area = current_area
if not area then
    return
end

local activeEvents = {}

local evt = {
    prob = 5,
    name = "两手空空",
    exec = function()
        avg_talk("小虾米", "一番探索，但什么都没获得...两手空空的回来了")
    end
}
table.insert(activeEvents, evt)


if(area.Develop >= 10) then
    local evt = {
        prob = 10,
        name = "碎银两",
        exec = function()
            local money = math.random(1,100) * (area.Develop / 5)
            avg_talk("小虾米", "一番探索，获得了一点碎银两...")
            add_player_money(math.ceil(money))
        end
    }
    table.insert(activeEvents, evt)
end

if(area.Develop >= 15) then
    local evt = {
        prob = 20,
        name = "获得药物",
        exec = function()

            --所有可以消耗的道具
            local randomItems = {}
            for _, itemBean in pairs(db:GetAll(typeof(CS.ZhanGuoWuxia.Backend.Beans.ItemBean))) do
                if( itemBean.UseType == CS.ZhanGuoWuxia.Backend.Beans.UseType.Consume
                    and itemBean.ItemType == CS.ZhanGuoWuxia.Backend.Beans.ItemType.Consume 
                    and itemBean.CanSell 
                    and itemBean.SellPrice > 0) then
                    table.insert(randomItems, itemBean)
                end
            end

            avg_talk("小虾米", "找到了一些有用的道具！")

            local pickItem = getRandomElement(randomItems)
            local count = math.random(1,math.max(1,math.ceil(area.Develop * 3 / pickItem.SellPrice))) --发展度越高则获得的可能越多
            add_player_item(pickItem.Id, count)
        end
    }
    table.insert(activeEvents, evt)
end

if(area.Develop >= 20) then
    local evt = {
        prob = 30,
        name = "获得一些有用的装备",
        exec = function()
            local randomItems = {}
            if(area.Develop < 30) then
                randomItems = {"精良剑", "精良刀", "精良棍", "精良手套", "精良轻甲", "精良中甲", "精良重甲", "精良项链", "精良戒指", "精良手镯", "精良护腕"}
            elseif(area.Develop < 45) then
                randomItems = {"稀有剑", "稀有刀", "稀有棍", "稀有手套", "稀有轻甲", "稀有中甲", "稀有重甲", "稀有项链", "稀有戒指", "稀有手镯", "稀有护腕"}
            elseif(area.Develop < 60) then
                randomItems = {"史诗剑", "史诗刀", "史诗棍", "史诗手套", "史诗轻甲", "史诗中甲", "史诗重甲", "史诗项链", "史诗戒指", "史诗手镯", "史诗护腕"}
            else
                randomItems = {"传说剑", "传说刀", "传说棍", "传说手套", "传说轻甲", "传说中甲", "传说重甲", "传说项链", "传说戒指", "传说手镯", "传说护腕"}
            end

            avg_talk("小虾米", "发现一件装备！")
            add_player_item(getRandomElement(randomItems), 1, "#(2-4)")
        end
    }
    table.insert(activeEvents, evt)
end

if(area.Develop >= 10) then
    local evt = {
        prob = 20,
        name = "获得秘籍",
        exec = function()
            local randomItems = {}

            local pool = {"少林棍法", "乞丐棍法", "昆仑剑法", "华山剑法", "全真剑法", "松风剑法", "泰山十八盘", "西瓜刀法", 
            "血刀刀法", "河洛刀法", "毒砂掌", "华山拳法", "灵蛇掌法", "武当掌法", "乞丐拳法", "罗汉拳法", "江湖心法", "江湖身法"}
            for i = 1, #pool do
                table.insert(randomItems, pool[i])
            end


            if(area.Develop >= 55) then
                local pool = {"罗汉棍法", "千钧棍法", "天山杖法", "一字电剑", "夺命连环三仙剑", "重阳剑法", "回风落雁剑", "柔云剑法", "狂风刀法", "金乌刀法",
                "霹雳刀法",
                "绵掌",
                "伏虎掌法",
                "铜锤手",
                "般若掌",
                "五毒掌法",
                "龙虎心法",
                "恒山心法",
                "铁布衫",
                "寒冰心法",
                "游龙身法",
                "云雾十三式",
                }
                for i = 1, #pool do
                    table.insert(randomItems, pool[i])
                end
            end

            if(area.Develop >= 70) then
                local pool = {
                "罗汉伏魔棍法",
                "韦陀杵",
                "达摩剑法",
                "玉箫剑法",
                "太极剑法",
                "玄虚刀法",
                "燃木刀法",
                "七伤拳",
                "四象掌",
                "降龙十八缺三掌",
                "太极拳",
                "天山六阳掌",
                "混元掌",
                "寂灭爪",
                "大力金刚指",
                "少林九阳功",
                "神照功",
                "紫霞神功",
                "罗汉伏魔神功",
                "纯阳无极功",
                "逍遥游身法",
                "梯云纵",
                }
                for i = 1, #pool do
                    table.insert(randomItems, pool[i])
                end
            end
            
            if(area.Develop >= 75) then
                local pool = {
                    "打狗棒法",
                    "独孤九剑",
                    "血魔刀法",
                    "降龙十八掌",
                    "九阳神功",
                    "九阴神功",
                    "神行百变",
                }
                for i = 1, #pool do
                    table.insert(randomItems, pool[i])
                end
            end

            avg_talk("小虾米", "发现一件秘籍！")
            add_player_item(getRandomElement(randomItems), 1)
        end
    }
    table.insert(activeEvents, evt)
end


--分配触发系数
local max = 0
local count = 0
local allEventsName = ""
for i,evt in ipairs(activeEvents) do
    evt.min = max
    evt.max = max + evt.prob
    max = evt.max
    count = count + 1
    allEventsName = allEventsName .. " " .. evt.name
end

print("activeEvents数量:" .. count .. ":" .. allEventsName)

--随机挑选一个
local rnd = math.random(0, max - 1)
for i,evt in ipairs(activeEvents) do
    print (string.format("rnd:%d min:%d max:%d", rnd, evt.min, evt.max))
    if(evt.min <= rnd and rnd < evt.max) then
        print(evt.name .. " 满足随机条件！")
        evt.exec()
        return
    end
end

