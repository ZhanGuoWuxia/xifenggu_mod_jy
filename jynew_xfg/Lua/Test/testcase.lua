
local another_lua_coroutine = util.async_to_sync(game_api.Test_Co)
local threadId = tostring(coroutine.running())
avg_talk(0, "嵌套协程调用测试开始, 当前协程Id:" .. threadId)
another_lua_coroutine(threadId)
avg_talk(0, "父协程[".. threadId .."]调用测试结束")
