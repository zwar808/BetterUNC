local modules = {}

local function loadModule(modulePath)
    local module = script:FindFirstChild(modulePath)
    if not module or not module:IsA("ModuleScript") then
        error("Module not found or invalid: " .. modulePath)
    end

    local moduleFunction, err = loadstring(module.Source)
    if not moduleFunction then
        error("Failed to compile module script: " .. (err or "Unknown error"))
    end

    local success, result = pcall(moduleFunction)
    if not success then
        error("Failed to execute module function: " .. result)
    end

    return result
end

local function require(modulePath)
    if modules[modulePath] then
        return modules[modulePath]
    end

    local module = loadModule(modulePath)
    modules[modulePath] = module
    return module
end

return require
