local modules = {}

local function loadModule(moduleName)
    local module = game:GetService("ReplicatedStorage"):FindFirstChild(moduleName)
    if module and module:IsA("ModuleScript") then
        local moduleFunction, err = loadstring(module.Source)
        if moduleFunction then
            return moduleFunction()
        else
            error("Failed to load module function: " .. (err or "Unknown error"))
        end
    else
        error("Module not found or invalid: " .. moduleName)
    end
end

local function require(moduleName)
    if not modules[moduleName] then
        modules[moduleName] = loadModule(moduleName)
    end
    return modules[moduleName]
end

return require
