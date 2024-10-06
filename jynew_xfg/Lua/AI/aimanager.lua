
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

aiManager:addAIFromPath("AI/template/attacker_ai")
aiManager:addAIFromPath("AI/template/defender_ai")
aiManager:addAIFromPath("AI/template/evener_ai")
aiManager:addAIFromPath("AI/Menpai/豪猪长垄")
aiManager:addAIFromPath("AI/Menpai/鹤岭门")
aiManager:addAIFromPath("AI/Menpai/龙湾门")
aiManager:addAIFromPath("AI/Menpai/万雀溪谷")
aiManager:addAIFromPath("AI/Menpai/仙竹门")
aiManager:addAIFromPath("AI/Menpai/灵猹仙洞")
return aiManager
