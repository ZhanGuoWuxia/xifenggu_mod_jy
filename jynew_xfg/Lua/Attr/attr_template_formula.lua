--AttrTemplate模板引用的公式

--角色的生命成长缩放系数 装备占比+职业占比
local roleHpFactor = 0.4
--角色的大部分属性成长缩放系数
local roleCommonFacter = 0.25
--角色的大部分属性成长缩放系数 装备占比+职业占比
local roleIntFactor = 0.4

--角色生命成长公式
function af_role_hp(level)
    --return math.round((0.071*level*level*level+0.7*level*level+78.71*level+70) * roleHpFactor)
    return math.round((-0.0338*level*level*level+3.6531*level*level+47.834*level+86) * roleHpFactor)
end

--角色大部分属性的成长公式
function af_role_common(level)
    --return math.round((0.096*level*level*level-2.23*level*level+31.14*level+21.62) * roleCommonFacter)
    return math.round((0.04*level*level*level-1.03*level*level+29.37*level+21.62) * roleCommonFacter)
end

--角色内劲属性的成长公式
function af_role_int(level)
    return math.round((0.04*level*level*level-1.03*level*level+29.37*level+21.62) * roleIntFactor)
end

--角色内力成长公式
function af_role_mp(level)
    return level + 1
end

--角色集气成长公式
function af_role_sp(level)
    return math.round((level / 2.5 + 3) * 0.2)
end

--角色职业的武学资质成长
function af_role_skill_p(level)
    return 5 + math.floor(level / 2)
end


-- 10 30 60 150

--武学本身提供的资质成长公式
function af_skill_p1(skillLevel)
    if skillLevel <= 1 then
        return 0
    end
    return skillLevel
end

function af_skill_p2(skillLevel)
    if skillLevel <= 1 then
        return 10
    end
    return 12 + 2 * math.max(0, skillLevel - 1)
end

function af_skill_p3(skillLevel)
    if skillLevel <= 1 then
        return 33
    end
    return 33 + 3 * math.max(0, skillLevel - 1)
end

function af_skill_p4(skillLevel)
    if skillLevel <= 1 then
        return 64
    end
    return 64 + 4 * math.max(0, skillLevel - 1)
end

function af_skill_p5(skillLevel)
    if skillLevel <= 1 then
        return 105
    end
    return 105 + 5 * math.max(0, skillLevel - 1)
end




--武学属性等级公式

--武学的生命成长缩放系数
local skillHpFactor = 0.2
--武学的攻击成长缩放系数
local skillAtkFactor = 0.2


--武学生命成长
function af_skill_hp1(skillLevel)
    return math.round( (137 + math.max(0, skillLevel - 1) * (896-137) / MaxSkillLevel) * skillHpFactor )
    -- 对应角色1-10级  : 上限 164 ：每级成长约 16
end

function af_skill_hp2(skillLevel)
    return math.round( (412 + math.max(0, skillLevel - 1) * (1511-412) / MaxSkillLevel) * skillHpFactor )
    -- 对应角色5-15级  : 上限 280 ：每级成长约 28
end

function af_skill_hp3(skillLevel)
    return math.round( (896 + math.max(0, skillLevel - 1) * (2234-896) / MaxSkillLevel) * skillHpFactor )
    -- 对应角色10-20级  : 上限 420 ：每级成长约 42
end

function af_skill_hp4(skillLevel)
    return math.round( (1511 + math.max(0, skillLevel - 1) * (3037-1511) / MaxSkillLevel) * skillHpFactor )
    -- 对应角色15-25级  : 上限 576 ：每级成长约 57
end

function af_skill_hp5(skillLevel)
    return math.round( (2234 + math.max(0, skillLevel - 1) * (3896-2234) / MaxSkillLevel) * skillHpFactor )
    -- 对应角色20-30级  : 上限 745 ：每级成长约 74
end




--武学内力成长（内功等级达到5级左右时 内力能够释放外功+内功/轻功 以形成搭配，1级可释放对应品质的武学主动技能）
function af_skill_mp1(skillLevel)
    return math.round(6 + skillLevel * 1.4)
    -- 对应角色1-10级  下限 6 : 上限 20 ：每级成长约 1.4
end

function af_skill_mp2(skillLevel)
    return math.round(16 + skillLevel * 1.6)
    -- 对应角色5-15级  下限 16 : 上限 32 ：每级成长约 1.6
end

function af_skill_mp3(skillLevel)
    return math.round(24 + skillLevel * 1.8)
    -- 对应角色10-20级  下限 24 : 上限 42 ：每级成长约 1.8
end

function af_skill_mp4(skillLevel)
    return math.round(32 + skillLevel * 2)
    -- 对应角色15-25级  下限 32 : 上限 52 ：每级成长约 2
end

function af_skill_mp5(skillLevel)
    return math.round(40 + skillLevel * 3)
    -- 对应角色20-30级  下限 40 : 上限 70 ：每级成长约 3
end





--武学攻击成长
function af_skill_c1(skillLevel)
    return math.round( (50 + math.max(0, skillLevel - 1) * (252-50) / MaxSkillLevel) * skillAtkFactor )
    -- 对应角色1-10级  : 上限 46 ：每级成长约 4
end

function af_skill_c2(skillLevel)
    return math.round( (148 + math.max(0, skillLevel - 1) * (365-148) / MaxSkillLevel) * skillAtkFactor )
    -- 对应角色5-15级  : 上限 68 ：每级成长约 6
end

function af_skill_c3(skillLevel)
    return math.round( (252 + math.max(0, skillLevel - 1) * (517-252) / MaxSkillLevel) * skillAtkFactor )
    -- 对应角色10-20级  : 上限 98 ：每级成长约 9
end

function af_skill_c4(skillLevel)
    return math.round( (365 + math.max(0, skillLevel - 1) * (737-365) / MaxSkillLevel) * skillAtkFactor )
    -- 对应角色15-25级  : 上限 139 ：每级成长约 13
end

function af_skill_c5(skillLevel)
    return math.round( (517 + math.max(0, skillLevel - 1) * (1056-517) / MaxSkillLevel) * skillAtkFactor )
    -- 对应角色20-30级  : 上限 200 ：每级成长约 20
end
