local debug = {}

local upvaluesRegistry = {}

function debug.setupvalues(func, upvalues)
    if type(func) ~= "function" then
        error("Argument must be a function")
    end
    upvaluesRegistry[func] = upvalues
end

function debug.getupvalues(func)
    if type(func) ~= "function" then
        error("Argument must be a function")
    end
    return upvaluesRegistry[func] or {}
end

function debug.getupvalue(modulePath, funcName, index)
    local status, module = pcall(require, modulePath)
    if not status then
        error("Failed to require module: " .. tostring(modulePath))
    end

    local func = module[funcName]
    if not func or type(func) ~= "function" then
        error("The function " .. tostring(funcName) .. " is not valid in the required module")
    end

    local upvalues = debug.getupvalues(func)
    if index and index > 0 and index <= #upvalues then
        return upvalues[index]
    end
    error("Invalid index or upvalue does not exist")
end

return debug
