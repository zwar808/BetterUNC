-- Gui to Lua
-- Version: 3.2

-- Instances:

local CleanGui = Instance.new("ScreenGui")
local BlurDarkThemedFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local key = Instance.new("ImageLabel")
local title2 = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local title3 = Instance.new("TextLabel")
local lib = {}
--Properties:
function lib.c(k,c)
CleanGui.Name = "CleanGui"
CleanGui.Parent = game.CoreGui
CleanGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

BlurDarkThemedFrame.Name = "BlurDarkThemedFrame"
BlurDarkThemedFrame.Parent = CleanGui
BlurDarkThemedFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BlurDarkThemedFrame.BackgroundTransparency = 0.450
BlurDarkThemedFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
BlurDarkThemedFrame.BorderSizePixel = 0
BlurDarkThemedFrame.Position = UDim2.new(0.402902126, 0, 0.413223147, 0)
BlurDarkThemedFrame.Size = UDim2.new(0, 263, 0, 105)

UICorner.Parent = BlurDarkThemedFrame

title.Name = "title"
title.Parent = BlurDarkThemedFrame
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0
title.Position = UDim2.new(0.278961539, 0, 0.373809516, 0)
title.Size = UDim2.new(0, 200, 0, 25)
title.Font = Enum.Font.Montserrat
title.Text = "Key System"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.TextSize = 14.000
title.TextWrapped = true

key.Name = "key"
key.Parent = BlurDarkThemedFrame
key.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
key.BackgroundTransparency = 1.000
key.BorderColor3 = Color3.fromRGB(0, 0, 0)
key.BorderSizePixel = 0
key.Position = UDim2.new(0.064638786, 0, 0.216190591, 0)
key.Size = UDim2.new(0, 100, 0, 59)
key.Image = "rbxassetid://10723416652"
key.ScaleType = Enum.ScaleType.Fit

title2.Name = "title2"
title2.Parent = BlurDarkThemedFrame
title2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title2.BackgroundTransparency = 1.000
title2.BorderColor3 = Color3.fromRGB(0, 0, 0)
title2.BorderSizePixel = 0
title2.Position = UDim2.new(0.278961539, 0, 0.602380931, 0)
title2.Size = UDim2.new(0, 200, 0, 18)
title2.Font = Enum.Font.Montserrat
title2.Text = "by cr1tcal3"
title2.TextColor3 = Color3.fromRGB(255, 255, 255)
title2.TextScaled = true
title2.TextSize = 14.000
title2.TextWrapped = true

TextBox.Parent = BlurDarkThemedFrame
TextBox.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.110266156, 0, 0.526712298, 0)
TextBox.Size = UDim2.new(0, 205, 0, 22)
TextBox.Font = Enum.Font.Montserrat
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextTransparency = 1.000
TextBox.TextWrapped = true

UICorner_2.Parent = TextBox

title3.Name = "title3"
title3.Parent = BlurDarkThemedFrame
title3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title3.BackgroundTransparency = 1.000
title3.BorderColor3 = Color3.fromRGB(0, 0, 0)
title3.BorderSizePixel = 0
title3.Position = UDim2.new(0.119265713, 0, 0.821428597, 0)
title3.Size = UDim2.new(0, 200, 0, 18)
title3.Font = Enum.Font.Montserrat
title3.Text = "by cr1tcal3"
title3.TextColor3 = Color3.fromRGB(255, 255, 255)
title3.TextScaled = true
title3.TextSize = 14.000
title3.TextTransparency = 1.000
title3.TextWrapped = true

-- Scripts:

local function KBZQD_fake_script() -- BlurDarkThemedFrame.BlurCreator 
	local script = Instance.new('LocalScript', BlurDarkThemedFrame)

	_=[[

	]]
	local Lighting          = game:GetService("Lighting")
local camera			= workspace.CurrentCamera

local BLUR_SIZE         = Vector2.new(10, 10)
local PART_SIZE         = 0.01
local PART_TRANSPARENCY = 1 - 1e-7
local START_INTENSITY	= 0.25

script.Parent:SetAttribute("BlurIntensity", START_INTENSITY)

local BLUR_OBJ          = Instance.new("DepthOfFieldEffect")
BLUR_OBJ.FarIntensity   = 0
BLUR_OBJ.NearIntensity  = script.Parent:GetAttribute("BlurIntensity")
BLUR_OBJ.FocusDistance  = 0.25
BLUR_OBJ.InFocusRadius  = 0
BLUR_OBJ.Parent         = Lighting

local PartsList         = {}
local BlursList         = {}
local BlurObjects       = {}
local BlurredGui        = {}

BlurredGui.__index      = BlurredGui

function rayPlaneIntersect(planePos, planeNormal, rayOrigin, rayDirection)
	local n = planeNormal
	local d = rayDirection
	local v = rayOrigin - planePos

	local num = n.x*v.x + n.y*v.y + n.z*v.z
	local den = n.x*d.x + n.y*d.y + n.z*d.z
	local a = -num / den

	return rayOrigin + a * rayDirection, a
end

function rebuildPartsList()
	PartsList = {}
	BlursList = {}
	for blurObj, part in pairs(BlurObjects) do
		table.insert(PartsList, part)
		table.insert(BlursList, blurObj)
	end
end

function BlurredGui.new(frame, shape)
	local blurPart        = Instance.new("Part")
	blurPart.Size         = Vector3.new(1, 1, 1) * 0.01
	blurPart.Anchored     = true
	blurPart.CanCollide   = false
	blurPart.CanTouch     = false
	blurPart.Material     = Enum.Material.Glass
	blurPart.Transparency = PART_TRANSPARENCY
	blurPart.Parent       = workspace.CurrentCamera

	local mesh
	if (shape == "Rectangle") then
		mesh        = Instance.new("BlockMesh")
		mesh.Parent = blurPart
	elseif (shape == "Oval") then
		mesh          = Instance.new("SpecialMesh")
		mesh.MeshType = Enum.MeshType.Sphere
		mesh.Parent   = blurPart
	end
	
	local ignoreInset = false
	local currentObj  = frame
	
	while true do
		currentObj = currentObj.Parent

		if (currentObj and currentObj:IsA("ScreenGui")) then
			ignoreInset = currentObj.IgnoreGuiInset
			break
		elseif (currentObj == nil) then
			break
		end
	end

	local new = setmetatable({
		Frame          = frame;
		Part           = blurPart;
		Mesh           = mesh;
		IgnoreGuiInset = ignoreInset;
	}, BlurredGui)

	BlurObjects[new] = blurPart
	rebuildPartsList()

	game:GetService("RunService"):BindToRenderStep("...", Enum.RenderPriority.Camera.Value + 1, function()
		blurPart.CFrame = camera.CFrame * CFrame.new(0,0,0)
		BlurredGui.updateAll()
	end)
	return new
end

function updateGui(blurObj)
	if (not blurObj.Frame.Visible) then
		blurObj.Part.Transparency = 1
		return
	end
	
	local camera = workspace.CurrentCamera
	local frame  = blurObj.Frame
	local part   = blurObj.Part
	local mesh   = blurObj.Mesh
	
	part.Transparency = PART_TRANSPARENCY
	
	local corner0 = frame.AbsolutePosition + BLUR_SIZE
	local corner1 = corner0 + frame.AbsoluteSize - BLUR_SIZE*2
	local ray0, ray1

	if (blurObj.IgnoreGuiInset) then
		ray0 = camera:ViewportPointToRay(corner0.X, corner0.Y, 1)
		ray1 = camera:ViewportPointToRay(corner1.X, corner1.Y, 1)
	else
		ray0 = camera:ScreenPointToRay(corner0.X, corner0.Y, 1)
		ray1 = camera:ScreenPointToRay(corner1.X, corner1.Y, 1)
	end

	local planeOrigin = camera.CFrame.Position + camera.CFrame.LookVector * (0.05 - camera.NearPlaneZ)
	local planeNormal = camera.CFrame.LookVector
	local pos0 = rayPlaneIntersect(planeOrigin, planeNormal, ray0.Origin, ray0.Direction)
	local pos1 = rayPlaneIntersect(planeOrigin, planeNormal, ray1.Origin, ray1.Direction)

	local pos0 = camera.CFrame:PointToObjectSpace(pos0)
	local pos1 = camera.CFrame:PointToObjectSpace(pos1)

	local size   = pos1 - pos0
	local center = (pos0 + pos1)/2

	mesh.Offset = center
	mesh.Scale  = size / PART_SIZE
end

function BlurredGui.updateAll()
	BLUR_OBJ.NearIntensity = tonumber(script.Parent:GetAttribute("BlurIntensity"))
	
	for i = 1, #BlursList do
		updateGui(BlursList[i])
	end

	local cframes = table.create(#BlursList, workspace.CurrentCamera.CFrame)
	workspace:BulkMoveTo(PartsList, cframes, Enum.BulkMoveMode.FireCFrameChanged)

	BLUR_OBJ.FocusDistance = 0.25 - camera.NearPlaneZ
end

function BlurredGui:Destroy()
	self.Part:Destroy()
	BlurObjects[self] = nil
	rebuildPartsList()
end

BlurredGui.new(script.Parent, "Rectangle")

BlurredGui.updateAll()
return BlurredGui
end
coroutine.wrap(KBZQD_fake_script)()
local function DYHD_fake_script() -- BlurDarkThemedFrame.Animation 
	local script = Instance.new('LocalScript', BlurDarkThemedFrame)

	local TweenService = game:GetService("TweenService")
	
	function tweenUI(element, property, goal, duration)
		local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
		local tweenProperties = {}
		tweenProperties[property] = goal
	
		local tween = TweenService:Create(element, tweenInfo, tweenProperties)
		tween:Play()
		return tween
	end
	
	_G.Key = k
	wait(3)
	
	-- Adjust these positions based on your ScreenGui's new center position
	local centerX = 0.5 -- Center X coordinate
	local centerY = 0.5 -- Center Y coordinate
	local halfWidth = 263 / 2 -- Half width of the UI
	local halfHeight = 292 / 2 -- Half height of the UI
	local f = false
	-- Center the script.Parent
	tweenUI(script.Parent, "Size", UDim2.new(0, 263, 0, 292), 3)
	tweenUI(script.Parent, "Position", UDim2.new(centerX, -halfWidth, centerY, -halfHeight), 4) -- Centered position
	
	-- Ensure 'key', 'title', and other elements exist in the hierarchy
	tweenUI(script.Parent:WaitForChild("key"), "Position", UDim2.new(0.335, 0, 0.077, 0), 5)
	tweenUI(script.Parent:WaitForChild("title"), "Position", UDim2.new(0.119, 0, 0.319, 0), 6)
	tweenUI(script.Parent:WaitForChild("title2"), "TextTransparency", 1, 2)
	tweenUI(script.Parent:WaitForChild("TextBox"), "BackgroundTransparency", 0.55, 2)
	tweenUI(script.Parent:WaitForChild("TextBox"), "TextTransparency", 0, 2)
	
	wait(1)
	script.Parent.TextBox.Interactable = true
	script.Parent.TextBox.TextEditable = true
	
	script.Parent.TextBox.InputEnded:Connect(function(input: InputObject)
		if script.Parent.TextBox then
			local enteredText = script.Parent.TextBox.Text:match("^%s*(.-)%s*$")
			if enteredText == "" then
				return
			end
	
			if enteredText == _G.Key then
				tweenUI(script.Parent.title3, "TextTransparency", 0, 2)
				script.Parent.TextBox.Text = " "
				script.Parent.title3.Text = "Hello, " .. game.Players.LocalPlayer.DisplayName
				wait(1.8)
				tweenUI(script.Parent.title3, "TextTransparency", 1, 2)
				wait(1)
				tweenUI(script.Parent.TextBox, "Size", UDim2.new(0, 0, 0, 22), 4)
				tweenUI(script.Parent.TextBox, "Position", UDim2.new(0.483, 0, 0.527, 0), 4)
				wait(0.6)
				tweenUI(script.Parent, "Size", UDim2.new(0, 263, 0, 105), 3)
				tweenUI(script.Parent, "Position", UDim2.new(centerX, -halfWidth, centerY, -52.5), 4) -- Adjusted position for the smaller size
				tweenUI(script.Parent:WaitForChild("key"), "Position", UDim2.new(0.065, 0, 0.216, 0), 5)
				tweenUI(script.Parent:WaitForChild("title"), "Position", UDim2.new(0.279, 0, 0.374, 0), 6)
				wait(0.3)
				script.Parent.title.Text = "Please Wait."
				wait(2)
				tweenUI(script.Parent, "BackgroundTransparency", 1, 3)
	
				for _, child in ipairs(script.Parent:GetChildren()) do
					if child:IsA("TextLabel") or child:IsA("TextButton") then -- Only tween UI elements
						tweenUI(child, "TextTransparency", 1, 3)
						tweenUI(script.Parent.key, "ImageTransparency", 1, 3)
						game.Workspace.CurrentCamera:WaitForChild("BlurSnox"):Destroy()
                        f = true
						wait(1)
					end
				end
				loadstring(c)()
                game.CurrentCamera.BlurSnox:Destroy()
			else
				tweenUI(script.Parent.title3, "TextTransparency", 0, 3)
				script.Parent.title3.Text = "Incorrect Key"
				script.Parent.TextBox.Text = " "
				wait(3)
				tweenUI(script.Parent.title3, "TextTransparency", 1, 3)
			end
		end
	end)
	while f do
        wait(0.01)
        game.Workspace.CurrentCamera:WaitForChild("BlurSnox"):Destroy()
    end
end
coroutine.wrap(DYHD_fake_script)()
end

return lib
