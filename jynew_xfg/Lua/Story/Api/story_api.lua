reloadModule 'Story/Api/story_favor_config'

local createactor = game_api.AddStageActor
local WaitForTweenQueueFinish =  util.async_to_sync(game_api.WaitForTweenQueueFinish)
local WaitForTweenFinish = util.async_to_sync(game_api.WaitForTweenFinish)
local StageNarration = util.async_to_sync(game_api.Stage_Narration)
local ShakeStage = game_api.ShakeStage
local BlackScene = util.async_to_sync(game_api.BlackScene)
local LightScene = util.async_to_sync(game_api.LightScene)
local avg_talk_roleid = util.async_to_sync(game_api.AvgTalk)
local avg_talk_roleinstace = util.async_to_sync(game_api.AvgTalk_RoleInstance)
local avg_select_roleid = util.async_to_sync(game_api.AvgSelect)
local avg_select_roleinstace = util.async_to_sync(game_api.AvgSelect_RoleInstance)
local ShowStage = util.async_to_sync(game_api.ShowStage)
local ShowStoryBackground = util.async_to_sync(game_api.ShowStoryBackground)
--对话
---@param roleId string 对话角色(传入RoleInstance实例 或者 角色Id字符串)
---@param content string 对话内容
function avg_talk(role, content)
    content = i18n_text(content)
    if type(role) == 'userdata' then
        avg_talk_roleinstace(role, content) --RoleInstance
    else
        avg_talk_roleid(role, content)
    end
end

--对话选项
---@param roleId string 对话角色(传入RoleInstance实例 或者 角色Id字符串)
---@param content string 对话内容
---@param options LuaTable 选项列表
function show_avg_select(role, content, options)
    content = i18n_text(content)
    translate_options(options)
    if type(role) == 'userdata' then
       return avg_select_roleinstace(role, content, options) --RoleInstance
    else
       return avg_select_roleid(role, content, options)
    end
end

--字幕
---@param subtitles string[] 字幕列表
show_cg = util.async_to_sync(game_api.ShowCg)

--展示视频
---@param videoPath string 视频资源路径
---@return ret bool 是否完成播完
show_video = util.async_to_sync(game_api.ShowVideo)

--词缀选择
local CSHARP_SHOW_ROLE_AFFIX_SELECT = util.async_to_sync(game_api.ShowRoleAffixSelect)
---@param role string|RoleInstance 需要生成词缀的目标角色
---@param affixGenCount number 生成词缀数量
---@param costItemId string 消耗物品Id
---@param costCount number 消耗物品数量
---@return struct IsCancel:bool, AffixId:string 选项结果
show_affix_select = function(role, affixGenCount, costItemId, costCount)

    if(type(role) == 'string') then
        role = get_role_by_id(role)
    end  
    affixGenCount = affixGenCount or 5
    costItemId = costItemId or MoneyItemId
    costCount = costCount or 1000
    return CSHARP_SHOW_ROLE_AFFIX_SELECT(role, affixGenCount, costItemId, costCount)
end

--物品选择
---@param options LuaTable 选项列表
show_item_card_select = util.async_to_sync(game_api.ItemCardSelect)

--搭建演出舞台
---@param picturePath string 图片资源路径
---@param sceneName string 展示的场景名
function show_stage(picturePath, sceneName)
    sceneName = i18n_text(sceneName)
    ShowStage(picturePath, sceneName)
end

--退出演出舞台
hide_stage = util.async_to_sync(game_api.HideStage)

--快速展示几个选项
---@param options LuaTable 选项列表
function show_quick_selections(options)
    translate_options(options)
    return avg_select_roleid("", "……", options)
end

--显示剧情背景图
---@param picturePath string 图片资源路径
---@param sceneName string 展示的场景名
function show_story_bg(picturePath, sceneName)
    sceneName = i18n_text(sceneName)
    ShowStoryBackground(picturePath, sceneName)
end

--隐藏剧情背景图
hide_story_bg = util.async_to_sync(game_api.HideStoryBackground)

--隐藏所有对话气泡
hide_all_stage_bubble = game_api.HideAllStageBubble

--设置所有舞台角色风格化材质（放在actor生成后）
---@param materialPath string 风格化material资源路径
set_all_actors_mat = game_api.SetAllStageActorsMaterial

--设置背景图风格化材质
---@param materialPath string 风格化material资源路径
set_bg_mat = game_api.SetStoryBackgroundMaterial

--设置背景图颜色
---@param color string 颜色16进制字符串 例如 #00da2e
set_bg_color = game_api.SetStoryBackgroundColor

--暗化所有舞台角色
dark_all_actors = game_api.DarkAllStageActors

--亮化所有舞台角色
bright_all_actors = game_api.BrightAllStageActors

--隐藏所有舞台角色
hide_all_actors = game_api.HideAllStageActors

--隐藏指定舞台角色
hide_actor = game_api.HideStageActor

--显示所有舞台角色
show_all_actors = game_api.ShowAllStageActors

--显示指定舞台角色
show_actor = game_api.ShowStageActor

--增加相机滤镜
---@param filterPath string 滤镜路径
add_camera_filter = game_api.AddCameraFilter

--移除相机滤镜
remove_camera_filter = game_api.RemoveCameraFilter

--以旁白方式叙述文本
function stage_narration(content, roleId)
    roleId = roleId or ""
    --翻译
    content = i18n_text(content)
    StageNarration(roleId, content)
end

--震动舞台
function shake_stage(strength, duration)
    strength = strength or 40
    duration = duration or 0.5
    ShakeStage(strength, duration)
end

function actor(roleId)
    local actorClass = require 'Story/Api/actor'
    local actorObj = createactor(roleId)
    return actorClass.new(roleId, actorObj)
end

--将一段或者多段人物动画放到队列中依次执行, 阻塞协程
function wait_twn(...)
    local twns = table.pack(...)
    if #twns == 1 then
        WaitForTweenFinish(twns[1])
    else
        WaitForTweenQueueFinish(twns)
    end
end

--开启黑幕
---@param duration float 过渡时间(秒)
function black_scene(duration)
    duration = duration or 0.25
    BlackScene(duration)
end

--关闭黑幕
---@param duration float 过渡时间(秒)
function light_scene(duration)
    duration = duration or 0.25
    LightScene(duration)
end

--清理之前存储的bgm
clear_saved_prev_bgm = game_api.ClearSavedPrevBgm

