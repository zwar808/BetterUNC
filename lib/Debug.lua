local debug = {}

local upvaluesRegistry = {}

function debug.setupupvalues(func, upvalues)
    if type(func) ~= "function" then
        error("argument must be a function")
    end
    upvaluesRegistry[func] = upvalues
end

function debug.getupvalues(func)
    if type(func) ~= "function" then
        error("argument must be a function")
    end
    return upvaluesRegistry[func] or {}
end

function debug.getupvalue(modulepath, funcname, index)
    local module = require(modulepath)
    local func = module[funcname]

    if not func or type(func) ~= "function" then
        error("the function " .. tostring(funcname) .. " is not valid in the required module")
    end

    local upvalues = debug.getupvalues(func)
    return upvalues[index]
end

return debug
