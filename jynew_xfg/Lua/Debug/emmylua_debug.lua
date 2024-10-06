


local cPath = package.cpath
local unityAssetPath = CS.UnityEngine.Application.dataPath
local debugPath = string.gsub(unityAssetPath, "Assets", "Tool/?.dll")
print(debugPath)
package.cpath = cPath .. ";" .. debugPath

function connect_emmylua_debugger()
    local function do_connect()
        local dbg = require("emmy_core")
        dbg.tcpConnect('localhost', 9966)
    end

    local function onError()
       print_error("无法链接emmylua调试器")
    end

    xpcall(do_connect,onError)
end

connect_emmylua_debugger()