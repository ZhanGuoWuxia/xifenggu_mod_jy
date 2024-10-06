local gameruntime = runtime

DIFFICULT_PARAM_KEY =
{
    EnemyBuffs = "EnemyBuffs",
    PlayerBuffs = "PlayerBuffs",
    BattleExpAddition = "BattleExpAddition",
    BattleFailKeepExpFactor = "BattleFailKeepExpFactor",
    DeathRoleKeepExpFactor = "DeathRoleKeepExpFactor",
    RoundRecoverStatus = "RoundRecoverStatus",
    CureStatus = "CureStatus",
    IgnoreJoinBattleCount = "IgnoreJoinBattleCount",
    AdditionJoinBattleCount = "AdditionJoinBattleCount",
    AreaIncomePlus = "AreaIncomePlus",
    EnableRoleDeath = "EnableRoleDeath",
    StrategyAddition = "StrategyAddition"
}

--难度控制
local config = {
    Casual = {
        [DIFFICULT_PARAM_KEY.EnemyBuffs] = {"休闲敌人"},
        [DIFFICULT_PARAM_KEY.PlayerBuffs] = {"休闲玩家"},
        [DIFFICULT_PARAM_KEY.BattleExpAddition] = 0.25,
        [DIFFICULT_PARAM_KEY.BattleFailKeepExpFactor] = 1,
        [DIFFICULT_PARAM_KEY.DeathRoleKeepExpFactor] = 1,
        [DIFFICULT_PARAM_KEY.RoundRecoverStatus] = 50,
        [DIFFICULT_PARAM_KEY.CureStatus] = 10,
        [DIFFICULT_PARAM_KEY.IgnoreJoinBattleCount] = true,
        [DIFFICULT_PARAM_KEY.AdditionJoinBattleCount] = 10,
        [DIFFICULT_PARAM_KEY.AreaIncomePlus] = 0.5,
        [DIFFICULT_PARAM_KEY.EnableRoleDeath] = false,
        [DIFFICULT_PARAM_KEY.StrategyAddition] = 0.5,
    },
    Simple = {
        [DIFFICULT_PARAM_KEY.EnemyBuffs] = {"简单敌人"},
        [DIFFICULT_PARAM_KEY.PlayerBuffs] = {"简单玩家"},
        [DIFFICULT_PARAM_KEY.BattleExpAddition] = 0.1,
        [DIFFICULT_PARAM_KEY.BattleFailKeepExpFactor] = 0.5,
        [DIFFICULT_PARAM_KEY.DeathRoleKeepExpFactor] = 1,
        [DIFFICULT_PARAM_KEY.RoundRecoverStatus] = 25,
        [DIFFICULT_PARAM_KEY.CureStatus] = 20,
        [DIFFICULT_PARAM_KEY.IgnoreJoinBattleCount] = false,
        [DIFFICULT_PARAM_KEY.AdditionJoinBattleCount] = 1,
        [DIFFICULT_PARAM_KEY.AreaIncomePlus] = 0.25,
        [DIFFICULT_PARAM_KEY.EnableRoleDeath] = false,
        [DIFFICULT_PARAM_KEY.StrategyAddition] = 0.3,
    },
    Normal = {
        [DIFFICULT_PARAM_KEY.EnemyBuffs] = {},
        [DIFFICULT_PARAM_KEY.PlayerBuffs] = {},
        [DIFFICULT_PARAM_KEY.BattleExpAddition] = 0,
        [DIFFICULT_PARAM_KEY.BattleFailKeepExpFactor] = 0.0,
        [DIFFICULT_PARAM_KEY.DeathRoleKeepExpFactor] = 0.5,
        [DIFFICULT_PARAM_KEY.RoundRecoverStatus] = 10,
        [DIFFICULT_PARAM_KEY.CureStatus] = 30,
        [DIFFICULT_PARAM_KEY.IgnoreJoinBattleCount] = false,
        [DIFFICULT_PARAM_KEY.AdditionJoinBattleCount] = 0,
        [DIFFICULT_PARAM_KEY.AreaIncomePlus] = 0,
        [DIFFICULT_PARAM_KEY.EnableRoleDeath] = false,
        [DIFFICULT_PARAM_KEY.StrategyAddition] = 0.2,
    },
    Hard = {
        [DIFFICULT_PARAM_KEY.EnemyBuffs] = {"困难敌人"},
        [DIFFICULT_PARAM_KEY.PlayerBuffs] = {},
        [DIFFICULT_PARAM_KEY.BattleExpAddition] = 0,
        [DIFFICULT_PARAM_KEY.BattleFailKeepExpFactor] = 0,
        [DIFFICULT_PARAM_KEY.DeathRoleKeepExpFactor] = 0,
        [DIFFICULT_PARAM_KEY.RoundRecoverStatus] = 5,
        [DIFFICULT_PARAM_KEY.CureStatus] = 40,
        [DIFFICULT_PARAM_KEY.IgnoreJoinBattleCount] = false,
        [DIFFICULT_PARAM_KEY.AdditionJoinBattleCount] = 0,
        [DIFFICULT_PARAM_KEY.AreaIncomePlus] = 0,
        [DIFFICULT_PARAM_KEY.EnableRoleDeath] = false,
        [DIFFICULT_PARAM_KEY.StrategyAddition] = 0,
    },
    Expert = {
        [DIFFICULT_PARAM_KEY.EnemyBuffs] = {"专家敌人"},
        [DIFFICULT_PARAM_KEY.PlayerBuffs] = {},
        [DIFFICULT_PARAM_KEY.BattleExpAddition] = 0,
        [DIFFICULT_PARAM_KEY.BattleFailKeepExpFactor] = 0,
        [DIFFICULT_PARAM_KEY.DeathRoleKeepExpFactor] = 0,
        [DIFFICULT_PARAM_KEY.RoundRecoverStatus] = 0,
        [DIFFICULT_PARAM_KEY.CureStatus] = 50,
        [DIFFICULT_PARAM_KEY.IgnoreJoinBattleCount] = false,
        [DIFFICULT_PARAM_KEY.AdditionJoinBattleCount] = 0,
        [DIFFICULT_PARAM_KEY.AreaIncomePlus] = 0,
        [DIFFICULT_PARAM_KEY.EnableRoleDeath] = true,
        [DIFFICULT_PARAM_KEY.StrategyAddition] = 0,
    },
}


local function get_difficult_param(difficultType, paramKey)
    if type(difficultType) ~= 'string' then
        difficultType = tostring(difficultType)
    end
    local params = config[difficultType]
    if not params then
        params = config.Normal
    end
    return params[paramKey]
end

function current_difficult_param(key)
    local difficulty = current_difficulty()
    return get_difficult_param(difficulty, key)
end

function current_difficulty()
    local res = "Normal"
    if gameruntime and gameruntime.CurrentSave then
        res = gameruntime.CurrentSave.Difficulty:ToString()
    end
    return res
end