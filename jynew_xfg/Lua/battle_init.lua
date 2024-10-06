reloadModule 'Battle/battle_config'
reloadModule 'Battle/battle_formula'
reloadModule 'Battle/battle_api'
reloadModule 'Buff/buff_api'
reloadModule 'Skill/skill_api'
reloadModule 'Battle/Trigger/trigger_api'

print("战斗脚本初始化")
---具体的技能和buff逻辑在编辑器模式下每次调用逻辑时都会重新reload对应的lua文件，不需要挨个再去热加载了