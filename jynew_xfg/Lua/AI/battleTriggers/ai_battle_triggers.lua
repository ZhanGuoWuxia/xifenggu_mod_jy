function get_menpai_ai_battle_triggers(menpai, team)
  local ai = aiManager:getAI(menpai.AIName)
  if ai and ai.getbattleTriggers then
      return ai:getbattleTriggers(menpai, team)
  else
    return {}
  end
end