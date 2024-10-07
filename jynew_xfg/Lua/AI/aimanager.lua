
reloadModule 'AI/formation/ai_formation'
reloadModule 'AI/battleTriggers/ai_battle_triggers'

local aiManager = { allAI = {} }

function aiManager:getAI(aiName)
    return self.allAI[aiName]
end

function aiManager:addAIFromPath(aiFilePath)
   local ai = require(aiFilePath).new()
   if ai then
        self:addAI(aiFilePath, ai)
   end
end

function aiManager:addAI(aiName, aiData)
    self.allAI[aiName] = aiData
end

function aiManager:removeAI(aiName)
    self.allAI[aiName] = nil
end

aiManager:addAIFromPath("AI/Menpai/jy_menpai_ai")
return aiManager
