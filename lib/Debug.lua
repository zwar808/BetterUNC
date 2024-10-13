local debug = {}
local upvaluesRegistry = {}

function debug.getupvalue(func, index)
    if type(func) ~= "function" then
        error("Argument must be a function")
    end

    local upvalues = {}
    local function captureUpvalues()
        local dummy = 1
        upvalues[1] = dummy
        return function() end
    end

    local originalFunc = func
    func = captureUpvalues()
    originalFunc()

    for i = 1, #upvalues do
        upvalues[i] = upvalues[i]
    end

    if index then
        return upvalues[index]
    end

    return upvalues
end

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

return debug
