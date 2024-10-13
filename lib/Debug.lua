local debug = {}
local upvalueRegistry = {}
local debugLog = {}

local function logDebug(message)
    table.insert(debugLog, message)
    print("[DEBUG] " .. message)
end

local function getUpvaluePairs(fn)
    logDebug("Retrieving upvalues for function: " .. tostring(fn))
    local upvalues = {}
    local i = 1

    while true do
        local name = "upvalue" .. i
        local value = upvalueRegistry[fn][name]
        if not value then break end
        logDebug("Found upvalue: " .. tostring(name) .. " = " .. tostring(value))
        table.insert(upvalues, {name, value})
        i = i + 1
    end

    return upvalues
end

function debug.getupvalues(modulePath, funcName)
    logDebug("Requiring module: " .. tostring(modulePath))
    local status, module = pcall(require, modulePath)
    if not status then
        error("Failed to require module: " .. tostring(modulePath))
    end

    local originalFn = module[funcName]
    if not originalFn or type(originalFn) ~= "function" then
        error("Function " .. tostring(funcName) .. " not found in module.")
    end

    if not upvalueRegistry[originalFn] then
        upvalueRegistry[originalFn] = {}
    end

    local wrapper = function(...)
        return originalFn(...)
    end

    setmetatable(wrapper, {
        __index = function(t, key)
            return upvalueRegistry[originalFn][key] or rawget(t, key)
        end,
        __newindex = function(t, key, value)
            upvalueRegistry[originalFn][key] = value
            rawset(t, key, value)
        end,
    })

    return getUpvaluePairs(originalFn)
end

function debug.wrap(fn)
    return debug.getupvalues(fn)
end

function debug.setup(func)
    return debug.wrap(func)
end

return debug
