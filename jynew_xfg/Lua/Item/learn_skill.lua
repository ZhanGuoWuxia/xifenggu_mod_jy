--使用秘籍道具学习技能
local roleToReadBook = current_role
local skillId = table.first_or_nil(item_param.Keys)

local function get_students(teacher, skillId)
    local allRoles = roles_of_menpai(get_player_menpai())
    local results = table.where(allRoles, 
    function(student) 
        return teacher ~= student and can_learn_skill(student, skillId)
    end)
    return results
end

if string.is_null_or_empty(skillId) then
    print_error("技能Id为空，无法学习技能")
    return false
end

local ret = false

local teacherLevel = roleToReadBook:LevelOfSkill(skillId)
local skillName = game_api.NameOfSkillId(skillId)
local MaxTeachNum = 5 + teacherLevel // 2

if roleToReadBook:IsSkillLearned(skillId) and teacherLevel > 0 then
    local msg = string.i18_format("[{0}]已学会{1}，是否让其讲授给能够学习的其他人？", roleToReadBook.Name, skillName)
    local isOk = yes_or_no(msg)
    if not isOk then
        return false
    end

    local students = get_students(roleToReadBook, skillId)
    if #students <= 0 then
        pop_tip(string.i18_format("没有尚未学习[{0}]且符合资质的门人", skillName))
        return false
    end

    local isConfirm, selectedRoles = multi_role_select(students, MaxTeachNum)
    if not isConfirm then
        return false
    end
    
    local count = 0
    for _, student in pairs(selectedRoles) do
        if learn_skill(student, skillId) then
            count = count + 1
        end
    end
    local teachResultMsg = string.i18_format("有{0}人在[{1}]的教导下学会了[{2}]", count, roleToReadBook.Name, skillName)
    pop_tip(teachResultMsg)
    ret = true
else
    ret = learn_skill(roleToReadBook, skillId, 1, false, true)
end

return ret


