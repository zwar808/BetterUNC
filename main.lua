local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local DataStoreService = game:GetService("DataStoreService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local PlayerGui = game:GetService("PlayerGui")
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local BetterUnc = {}
local cache = {}
local Drawing = loadstring(game:HttpGet("https://raw.githubusercontent.com/zwar808/BetterUNC/main/lib/Drawing.luahttps://raw.githubusercontent.com/zwar808/BetterUNC/main/lib/Drawing.lua"))()
function BetterUnc.GetExecutorVersion()
	return tostring(identifyexecutor())
end

function BetterUnc.GetLibraryVersion()
	return "BetterUNC F2.1"
end
function BetterUnc.Get(url)
    local success, response = pcall(function()
        return HttpService:GetAsync(url)
    end)
    return success and response or nil
end

function BetterUnc.Post(url, data, contentType, headers)
    local success, response = pcall(function()
        return HttpService:PostAsync(url, HttpService:JSONEncode(data), contentType, headers)
    end)
    return success and response or nil
end

function BetterUnc.Put(url, data, contentType, headers)
    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = url,
            Method = "PUT",
            Headers = headers or {},
            Body = HttpService:JSONEncode(data),
            ContentType = contentType
        })
    end)
    return success and response or nil
end

function BetterUnc.Delete(url, headers)
    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = url,
            Method = "DELETE",
            Headers = headers or {}
        })
    end)
    return success and response or nil
end

function BetterUnc.Patch(url, data, contentType, headers)
    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = url,
            Method = "PATCH",
            Headers = headers or {},
            Body = HttpService:JSONEncode(data),
            ContentType = contentType
        })
    end)
    return success and response or nil
end

function BetterUnc.Head(url, headers)
    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = url,
            Method = "HEAD",
            Headers = headers or {}
        })
    end)
    return success and response or nil
end

function BetterUnc.Options(url, headers)
    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = url,
            Method = "OPTIONS",
            Headers = headers or {}
        })
    end)
    return success and response or nil
end

function BetterUnc.Trace(url, headers)
    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = url,
            Method = "TRACE",
            Headers = headers or {}
        })
    end)
    return success and response or nil
end

function BetterUnc.WebSocketConnect(url)
    local success, connection = pcall(function()
        return HttpService:WebSocket(url)
    end)
    return success and connection or nil
end

function BetterUnc.WebSocketSend(connection, message)
    local success, result = pcall(function()
        return connection:Send(message)
    end)
    return success and result or nil
end

function BetterUnc.WebSocketReceive(connection)
    local success, message = pcall(function()
        return connection:Receive()
    end)
    return success and message or nil
end

function BetterUnc.WebSocketClose(connection)
    local success, result = pcall(function()
        return connection:Close()
    end)
    return success and result or nil
end

function BetterUnc.GetPlayerByName(name)
    return Players:FindFirstChild(name)
end

function BetterUnc.GetAllPlayers()
    return Players:GetPlayers()
end

function BetterUnc.KickPlayer(player, reason)
    local success, message = pcall(function()
        player:Kick(reason)
    end)
    return success or message
end

function BetterUnc.ChangePlayerTeam(player, teamName)
    local team = Teams:FindFirstChild(teamName)
    if team then
        player.Team = team
    end
end

function BetterUnc.SetPlayerName(player, newName)
    local success, message = pcall(function()
        player.Name = newName
    end)
    return success or message
end

function BetterUnc.GetPlayerData(player)
    return {
        Name = player.Name,
        UserId = player.UserId,
        Team = player.Team and player.Team.Name or "None"
    }
end

function BetterUnc.SetPlayerWalkSpeed(player, speed)
    local character = player.Character
    if character and character:FindFirstChildOfClass("Humanoid") then
        character.Humanoid.WalkSpeed = speed
    end
end

function BetterUnc.SetPlayerJumpPower(player, power)
    local character = player.Character
    if character and character:FindFirstChildOfClass("Humanoid") then
        character.Humanoid.JumpPower = power
    end
end

function BetterUnc.SetGlobalData(key, value)
    local success, message = pcall(function()
        DataStoreService:GetDataStore("GlobalDataStore"):SetAsync(key, value)
    end)
    return success or message
end

function BetterUnc.GetGlobalData(key)
    local success, value = pcall(function()
        return DataStoreService:GetDataStore("GlobalDataStore"):GetAsync(key)
    end)
    return success and value or nil
end

function BetterUnc.TeleportPlayer(player, position)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

function BetterUnc.PlaySound(soundId, position)
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Position = position
    sound.Parent = Workspace
    sound:Play()
end

function BetterUnc.CreatePart(size, color, position)
    local part = Instance.new("Part")
    part.Size = size
    part.BrickColor = BrickColor.new(color)
    part.Position = position
    part.Parent = Workspace
    return part
end

function BetterUnc.CreateMeshPart(size, color, meshId, position)
    local meshPart = Instance.new("MeshPart")
    meshPart.Size = size
    meshPart.BrickColor = BrickColor.new(color)
    meshPart.MeshId = meshId
    meshPart.Position = position
    meshPart.Parent = Workspace
    return meshPart
end

function BetterUnc.CreateModel(name, parts)
    local model = Instance.new("Model")
    model.Name = name
    for _, partInfo in ipairs(parts) do
        local part = Instance.new("Part")
        part.Size = partInfo.size
        part.BrickColor = BrickColor.new(partInfo.color)
        part.Position = partInfo.position
        part.Parent = model
    end
    model.Parent = Workspace
    return model
end

function BetterUnc.TweenPart(part, properties, time)
    local tweenInfo = TweenInfo.new(time)
    local tween = TweenService:Create(part, tweenInfo, properties)
    tween:Play()
end

function BetterUnc.SetAmbientColor(color)
    Lighting.Ambient = color
end

function BetterUnc.SetBrightness(brightness)
    Lighting.Brightness = brightness
end

function BetterUnc.SetFogColor(color)
    Lighting.FogColor = color
end

function BetterUnc.SetGlobalShadows(enabled)
    Lighting.GlobalShadows = enabled
end

function BetterUnc.SetOutdoorAmbient(color)
    Lighting.OutdoorAmbient = color
end

function BetterUnc.SetGravity(gravity)
    Workspace.Gravity = gravity
end

function BetterUnc.ClearAllParts()
    for _, object in ipairs(Workspace:GetChildren()) do
        if object:IsA("BasePart") then
            object:Destroy()
        end
    end
end

function BetterUnc.FindPartByName(name)
    return Workspace:FindFirstChild(name)
end

function BetterUnc.CreateTeam(name, color)
    local team = Instance.new("Team")
    team.Name = name
    team.TeamColor = BrickColor.new(color)
    team.Parent = Teams
    return team
end

function BetterUnc.RemoveTeam(name)
    local team = Teams:FindFirstChild(name)
    if team then
        team:Destroy()
    end
end

function BetterUnc.SetTeamColor(name, color)
    local team = Teams:FindFirstChild(name)
    if team then
        team.TeamColor = BrickColor.new(color)
    end
end

function BetterUnc.FindInReplicatedStorage(name)
    return ReplicatedStorage:FindFirstChild(name)
end

function BetterUnc.StoreInReplicatedStorage(instance)
    instance.Parent = ReplicatedStorage
end

function BetterUnc.FindGuiElement(player, name)
    return player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(name)
end

function BetterUnc.SetGuiVisibility(player, name, visible)
    local guiElement = player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(name)
    if guiElement then
        guiElement.Visible = visible
    end
end

function BetterUnc.RemoveGuiElement(player, name)
    local guiElement = player:FindFirstChildOfClass("PlayerGui"):FindFirstChild(name)
    if guiElement then
        guiElement:Destroy()
    end
end

function BetterUnc:Geticon(type1)
	local HeaderIcons = {
		Check = "✓",
		ArrowRight = "▶",
		Pound = "£",
		Bell = "⌂",
		ArrowLeft = "↪",
		ArrowRightReturn = "↩",
		ArrowDown = "↰",
		ArrowUp = "↮",
		ArrowUpRight = "↭",
		ArrowRightDouble = "↨",
		ArrowUpDouble = "↣",
		ArrowDownDouble = "↢",
		ArrowLeftDouble = "↜",
		ArrowDownRight = "↟",
		ArrowUpRightDouble = "↝",
		Plus = "+",
		Minus = "−",
		Star = "★",
		Heart = "♥",
		Square = "■",
		Circle = "●",
		Diamond = "♦",
		Cross = "✗",
		Checkmark = "✔",
		Exclamation = "!",
		Question = "？",
		Dollar = "$",
		Percent = "%",
		At = "@",
		Hash = "#",
		Ampersand = "&",
		Tilde = "~",
		Degree = "°",
		Infinity = "∞",
		RightArrow = "→",
		LeftArrow = "←",
		UpArrow = "↑",
		DownArrow = "↓",
		ForwardSlash = "/",
		Backslash = "\\",
		VerticalBar = "|",
		DegreeCelsius = "℃",
		DegreeFahrenheit = "℉",
		Section = "§",
		Copyright = "©",
		Registered = "®",
		Trademark = "™",
		Micro = "µ",
		Paragraph = "¶",
		NotEqual = "≠",
		LessThan = "＜",
		GreaterThan = "＞",
		Approximate = "≈",
		Pi = "π",
		Sigma = "Σ",
		Delta = "Δ",
		Omega = "Ω",
		Alpha = "α",
		Beta = "β",
		Gamma = "γ",
		Theta = "θ",
		Lambda = "λ",
		Phi = "φ",
		Psi = "ψ",
		Chi = "χ",
		OmegaSmall = "ω",
		Sum = "∑",
		Integral = "∫",
		ForAll = "∀",
		Exists = "∃",
		EmptySet = "∅",
		ElementOf = "∈",
		NotElementOf = "∉",
		SubsetOf = "⊂",
		SupersetOf = "⊃",
		Intersection = "∩",
		Union = "∪",
		CirclePlus = "⊕",
		CircleMinus = "⊝",
		CircleTimes = "⊗",
		CircleDivide = "⊘",
		Nabla = "∇",
		PartialDifferential = "∂",
		Angle = "∠",
		Multiplication = "×",
		Division = "÷",
		Proportional = "∝",
		SquareRoot = "√",
		CubeRoot = "∛",
		FourthRoot = "∜"
	}
	return HeaderIcons[type1] or "Icon not found"
end

function BetterUnc.DetailedTestRun(Callback)
	local startTime = os.clock()
	local success, result = pcall(Callback)
	local endTime = os.clock()
	local duration = (endTime - startTime) * 1000
	local environment = (game:GetService("RunService"):IsServer() and "Server" or "Client")

	if success then
		return true, {
			result = result,
			duration = duration,
			environment = environment
		}
	else
		local errorDetails = {
			message = result,
			stackTrace = debug.traceback(),
			duration = duration,
			environment = environment
		}
		return false, errorDetails
	end
end

function BetterUnc.UncTest()
	pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/unified-naming-convention/NamingStandard/main/UNCCheckEnv.lua"))()
	end)
end

function BetterUnc.HttpGetLoad(s)
	pcall(function()
		loadstring(game:HttpGet(s))()
	end)
end

function BetterUnc.UnofficialDarkDex()
	pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterX404/DarkDEX-V5/main/DarkDEX-V5"))()
	end)
end

function BetterUnc.DarkDex()
	pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/SpeedSterKawaii/Dark-Dex/main/dex.lua"))()
	end)
end

function BetterUnc.GetGameName()
	return GameName or "Unknown Game"
end

function BetterUnc.rng()
	return math.random(1, 1e10)
end

function hookfunction(targetFunction, newFunction)
    originalFunctionStorage[targetFunction] = originalFunctionStorage[targetFunction] or targetFunction

    return setmetatable({}, {
        __call = function(_, ...)
            return newFunction(originalFunctionStorage[targetFunction], ...)
        end
    })
end

local function newcclosure(f)
    return function(...)
        return f(...)
    end
end

function cache_replace(obj, t_obj)
    cache[obj] = t_obj
end

function cache_invalidate(obj)
    cache[obj] = nil
end

return BetterUnc
