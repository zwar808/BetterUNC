local Debug = {}

function Debug.getUpvalues(func, index)
    if type(func) ~= "function" then
        error("Argument must be a function")
    end
    if index then
        return debug.getupvalue(func, index)
    else
        local upvalues = {}
        local i = 1
        while true do
            local name, value = debug.getupvalue(func, i)
            if not name then break end
            upvalues[name] = value
            i = i + 1
        end
        return upvalues
    end
end

function Debug.requireUpvalue(modulePath, functionName, upvalueIndex)
    local module = require(modulePath)
    local func = module[functionName]
    if not func or type(func) ~= "function" then
        error("The function " .. tostring(functionName) .. " is not valid in the required module")
    end
    return Debug.getUpvalues(func, upvalueIndex)
end

return Debug
