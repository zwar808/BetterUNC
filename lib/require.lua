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

function require(modulePath: ModuleScript)
    if modules[modulePath] then
        return modules[modulePath]
    end

    local module = loadModule(modulePath)
    modules[modulePath] = module
    return module
end

function byte_require(ms: ModuleScript)
 if ms and ms:IsDescendantOf(game) then
        return loadstring("local script = game."..ms:GetFullName().."\n\n\n"..ms.Source)()
    elseif ms then
        return loadstring(ms.Source)()
    else
        return nil
    end
end

function fast_require(msl: ModuleScript)
    return loadstring(msl.Source)
end

function hexrequire(ms: ModuleScript)
    local x = {{0x2}}
    x.s = x[1]
    return x.s .. " not finished"
end
return require
