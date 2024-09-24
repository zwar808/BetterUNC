local Debug = {}

function Debug.getupvalues(func)
    if type(func) ~= "function" then
        error("Argument must be a function")
    end
    local upvalues = {}
    local index = 1
    while true do
        local name, value = debug.getupvalue(func, index)
        if not name then break end
        upvalues[name] = value
        index = index + 1
    end
    return upvalues
end

function Debug.getupvalue(func, index)
    if type(func) ~= "function" then
        error("Argument must be a function")
    end
    local name, value = debug.getupvalue(func, index)
    return value
end

function Debug.requireUpvalue(path, functionName, upvalueIndex)
    local module = require(path)
    local func = module[functionName]

    if not func or type(func) ~= "function" then
        error("The function " .. tostring(functionName) .. " is not valid in the required module")
    end

    return Debug.getupvalue(func, upvalueIndex)
end

return Debug
