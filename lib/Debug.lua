local Debug = {}

function Debug.getupvalues(func)
    if type(func) ~= "function" then
        return {}
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
        return nil
    end
    local name, value = debug.getupvalue(func, index)
    if name then
        return value
    else
        return nil
    end
end

return Debug
