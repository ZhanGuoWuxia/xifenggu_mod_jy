local actor = class("stageactor")

local bubble_speak = util.async_to_sync(game_api.Stage_SpeakBubble)

local shake_current_bubble = game_api.Stage_ShakeCurrentBubble

function actor:ctor(roleId, actor_obj)
    self.roleId = roleId
    self.actor_obj = actor_obj
end

function actor:is_actor_obj_valid()
    if self.actor_obj == nil then
        return false
    end
    return not self.actor_obj:IsNull()
end

--以聊天气泡方式说话
function actor:say(text)
    --翻译
    text = i18n_text(text)
    bubble_speak(self.roleId, text)
    return self
end

--以旁白方式说话
function actor:say_narration(text)
    stage_narration(text, self.roleId)
end

--抖动当前聊天气泡
function actor:shake_bubble(strength, duration)
    strength = strength or 30
    duration = duration or 0.3
    shake_current_bubble(duration, strength)
    return self
end

--设置人物图片
function actor:setPic(imgId)
    if self:is_actor_obj_valid() then
        self.actor_obj:SetPic(imgId)
    end
end

--设置一个随机的人物立绘 true代表女性, false男性
function actor:setRandomPic(isFemale)
    isFemale = isFemale or false
    if self:is_actor_obj_valid() then
        self.actor_obj:SetRandomPic(isFemale)
    end
end

--设置人物覆盖名(下句话生效)
function actor:setOverrideName(newName)
    if self:is_actor_obj_valid() then
       self.actor_obj:SetOverrideName(newName)
    end
end

--设置人物立绘大小
function actor:setScale(scale)
    if self:is_actor_obj_valid() then
       self.actor_obj:SetScale(scale)
    end
end

--设置人物屏幕坐标
function actor:setPos(x, y)
   if self:is_actor_obj_valid() then
        return self.actor_obj:SetPosition(x, y)
    end
end

--让人物前往指定屏幕坐标
function actor:moveTo(x, y, spd)
    spd = spd or 1000
   if self:is_actor_obj_valid() then
        return self.actor_obj:Move(x, y, false, spd)
    end
end

--让人物水平位移到指定位置x
function actor:movetoX(x, spd)
    x = x or 100
    spd = spd or 1000
   if self:is_actor_obj_valid() then
        return self.actor_obj:MoveX(x, false, spd)
    end
end

--让人物垂直位移到指定位置y
function actor:movetoY(y, spd)
    y = y or 100
    spd = spd or 1000
   if self:is_actor_obj_valid() then
        return self.actor_obj:MoveY(y, false, spd)
    end
end

--让人物相对于当前位置进行偏移移动
function actor:offset(x, y, spd)
    spd = spd or 1000
   if self:is_actor_obj_valid() then
        return self.actor_obj:Move(x, y, true, spd)
    end
end

--让人物相对于当前位置进行水平移动
function actor:offsetX(x, spd)
    x = x or 100
    spd = spd or 1000
   if self:is_actor_obj_valid() then
        return self.actor_obj:MoveX(x, true, spd)
    end
end

--让人物相对于当前位置进行水平移动
function actor:offsetY(y, spd)
    y = y or 100
    spd = spd or 1000
   if self:is_actor_obj_valid() then
        return self.actor_obj:MoveY(y, true, spd)
    end
end

--让人物抖动
function actor:shake(strength, duration, vibrato)
    strength = strength or 20
    duration = duration or 0.25
    vibrato = vibrato or 30
   if self:is_actor_obj_valid() then
        return self.actor_obj:Shake(duration, strength, vibrato)
    end
end

--让人物向后转的动画
function actor:flip(duration)
    duration = duration or 0.3
   if self:is_actor_obj_valid() then
        return self.actor_obj:Flip(duration)
    end
end

--让人物缩放
function actor:scale(scale, duration)
    duration = duration or 0.3
   if self:is_actor_obj_valid() then
        return self.actor_obj:Scale(scale, duration)
    end
end

--让人物做一次来回拉伸
function actor:spring_scale(x, y, z, duration)
    duration = duration or 0.3
   if self:is_actor_obj_valid() then
        return self.actor_obj:SpringScale({x = x, y = y, z = z}, duration)
    end
end

--让人物x轴方向上弹簧效果
function actor:punch_x(duration)
    duration = duration or 1
   if self:is_actor_obj_valid() then
        return self.actor_obj:PunchX(duration)
    end
end

--让人物y轴方向上弹簧效果
function actor:punch_y(duration)
    duration = duration or 1
   if self:is_actor_obj_valid() then
        return self.actor_obj:PunchY(duration)
    end
end

--设置人物朝向左面
function actor:face_left()
   if self:is_actor_obj_valid() then
        return self.actor_obj:SetFace(true)
    end
end

--设置人物朝向右面
function actor:face_right()
   if self:is_actor_obj_valid() then
        return self.actor_obj:SetFace(false)
    end
end

--让人物跳跃n次
function actor:jump(force, numjumps, duration)
    force = force or 150
    numjumps = numjumps or 1
    duration = duration or 0.5
   if self:is_actor_obj_valid() then
        return self.actor_obj:Jump(force, numjumps, duration)
    end
end

--让人物跳到屏幕某个位置
function actor:jumpTo(x, y, power, speed)
    power = power or 50
    speed = speed or 1000
   if self:is_actor_obj_valid() then
        return self.actor_obj:JumpTo(x, y, power, speed)
    end
end

--让人物发呆一会
function actor:daze(duration)
    duration = duration or 0.5
   if self:is_actor_obj_valid() then
        return self.actor_obj:Daze(duration)
    end
end

function actor:stylize(material)
    material = material or "Default"
   if self:is_actor_obj_valid() then
        return self.actor_obj:Stylize(material)
    end
end

function actor:rotatetoX(x, duration)
    duration = duration or 0.5
   if self:is_actor_obj_valid() then
        return self.actor_obj:RotateX(x, duration)
    end
end

function actor:rotatetoY(y, duration)
    duration = duration or 0.5
   if self:is_actor_obj_valid() then
        return self.actor_obj:RotateY(y, duration)
    end
end

function actor:rotatetoZ(z, duration)
    duration = duration or 0.5
   if self:is_actor_obj_valid() then
        return self.actor_obj:RotateZ(z, duration)
    end
end

--暗化角色
function actor:dark()
   if self:is_actor_obj_valid() then
        return self.actor_obj:Dark()
    end
end

--亮化角色
function actor:bright()
   if self:is_actor_obj_valid() then
        return self.actor_obj:Bright()
    end
end

--显示角色
function actor:show()
   if self:is_actor_obj_valid() then
        return self.actor_obj:Show()
    end
end

--隐藏角色
function actor:hide()
   if self:is_actor_obj_valid() then
        return self.actor_obj:Hide()
    end
end

--让角色做表情
function actor:emotion(emoName)
    emoName = emoName or ""
   if self:is_actor_obj_valid() then
        self.actor_obj:Emotion(emoName)
    end
end

--让人物站到舞台最后面（UI渲染层级最低)
function actor:standback()
   if self:is_actor_obj_valid() then
        self.actor_obj:FirstSibling()
    end
end

--让人物站到舞台最前面（UI渲染层级最高)
function actor:standfront()
   if self:is_actor_obj_valid() then
        self.actor_obj:LastSibling()
    end
end

return actor
