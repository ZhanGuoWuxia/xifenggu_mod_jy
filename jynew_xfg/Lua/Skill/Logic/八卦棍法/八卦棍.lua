--一次猛烈而又灵活的击打，对目标造成{{[stat:atk] * 0.75}}点外伤。
--并为自身添加一层八卦之一的增益(<color=yellow>[乾][坤][坎][离][震][艮][巽][兑]</color>其中一种，优先添加未拥有的)。
local skill = simple_damage_skill_template("八卦棍", stat_key.Attack, 0.75)

local BaguaBuffs = {"乾","坤","坎","离","震","艮","巽","兑"}

local function next_buff_id(ownerID)
    local buffs_not_existed = {}
    local buffs_existed = {}
    for _, buffId in pairs(BaguaBuffs) do
        local cnt = role_buff_pile(ownerID, buffId)
        if cnt <= 0 then
            table.insert(buffs_not_existed, buffId)
        else
            table.insert(buffs_existed, buffId)
        end
    end
    
    if #buffs_not_existed > 0 then
        return table.pick_random(buffs_not_existed)
    elseif #buffs_existed > 0 then
        return table.pick_random(buffs_existed)
    else
        return nil
    end
end

function skill:OnCast(args)
    local ownerId = args.CasterId
    local buffId = next_buff_id(ownerId)
    if buffId then
        add_buff( buffId, ownerId, ownerId, 1) 
    end
    self:TryDoSkillDamage(args)
end


return skill