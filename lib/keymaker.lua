-- Gui to Lua
-- Version: 3.2

-- Instances:
local lib = {}
local CleanGui = Instance.new("ScreenGui")
local BlurDarkThemedFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local key = Instance.new("ImageLabel")
local title2 = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local title3 = Instance.new("TextLabel")

--Properties:
function lib:Createkeysys(key, callback)
CleanGui.Name = "CleanGui"
CleanGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
CleanGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CleanGui.IgnoreGuiInset = true

BlurDarkThemedFrame.Name = "BlurDarkThemedFrame"
BlurDarkThemedFrame.Parent = CleanGui
BlurDarkThemedFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BlurDarkThemedFrame.BackgroundTransparency = 0.450
BlurDarkThemedFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
BlurDarkThemedFrame.BorderSizePixel = 0
BlurDarkThemedFrame.Position = UDim2.new(0.360255063, 0, 0.413223147, 0)
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

local function HYJBO_fake_script() -- BlurDarkThemedFrame.BlurCreator 
	local script = Instance.new('LocalScript', BlurDarkThemedFrame)

	_=[[
	
	⣿⣿⣿⣿⡿⠟⠛⠋⠉⠉⠉⠉⠉⠛⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	⣿⣿⠟⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠈⠙⠾⣿⣾⣿⣾⣿⣾⣿⣾⣿
	⠋⡁⠀⠀⠀⠀⠀⢀⠔⠁⠀⠀⢀⠠⠐⠈⠁⠀⠀⠁⠀⠈⠻⢾⣿⣾⣿⣾⣟⣿
	⠊⠀⠀⠀⠀⢀⠔⠃⠀⠀⠠⠈⠁⠀⠀⠀⠀⠀⠀⠆⠀⠀⠄⠀⠙⣾⣷⣿⢿⣿
	⠀⠀⠀⠀⡠⠉⠀⠀⠀⠀⠠⢰⢀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠈⡀⠀⠈⢿⣟⣿⣿
	⠀⠀⢀⡜⣐⠃⠀⠀⠀⣠⠁⡄⠰⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠰⠀⠀⠈⢿⣿⣿
	⠀⢠⠆⢠⡃⠀⠀⠀⣔⠆⡘⡇⢘⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿
	⢀⡆⠀⡼⢣⠀⢀⠌⢸⢠⠇⡇⢘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿
	⣼⣃⠀⠁⢸⢀⠎⠀⢸⠎⠀⢸⢸⡄⠀⠀⠀⠀⠀⠂⢀⠀⠀⠀⠀⠀⠀⠀⠀⣿
	⠃⡏⠟⣷⣤⠁⠀⠀⠸⠀⠀⡾⢀⢇⠀⠀⠀⠀⠀⠄⠸⠀⠀⠀⠀⠄⠀⠀⠀⣿
	⠀⠀⣀⣿⣿⣿⢦⠀⠀⠀⠀⡧⠋⠘⡄⠀⠀⠀⠀⡇⢸⠀⠀⠠⡘⠀⠀⠀⢠⣿
	⠈⠀⢿⢗⡻⠃⠀⠀⠀⠀⠀⠀⠀⠀⠱⡀⠀⠀⢰⠁⡇⠀⠀⢨⠃⡄⢀⠀⣸⣿
	⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣱⠀⠀⡎⠸⠁⠀⢀⠞⡸⠀⡜⢠⣿⣿
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣺⣿⣧⢰⣧⡁⡄⠀⡞⠰⠁⡸⣠⣿⣿⣿
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡿⠏⣿⠟⢁⠾⢛⣧⢼⠁⠀⠀⢰⣿⡿⣷⣿
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠡⠄⠀⡠⣚⡷⠊⠀⠀⠀⣿⡿⣿⡿⣿
	⡀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠁⢸⠁⠀⠀⠀⢰⣿⣿⡿⣿⣿
	⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠊⠀⠀⠀⡞⠀⠀⠀⠀⢸⣿⣷⣿⣿⣿
	⠀⠙⢦⣀⠀⠀⠀⠀⠀⢀⣀⣠⠖⠁⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⣸⣿⣾⡿⣷⣿
	⠀⠀⠀⠀⠉⠉⣩⡞⠉⠁⠀⢸⡄⠀⠀⠀⠀⠀⢰⠇⠀⠀⠀⠀⣿⣿⣷⣿⣿⣿
	⡆⠀⠀⣀⡠⠞⠁⣧⢤⣀⣀⣀⡇⠀⠀⠀⠀⠀⣸⠀⠀⠀⠀⠀⣿⣷⣿⣷⣿⣿
	⣿⣷⠊⠁⠀⠀⡰⠁⠀⠀⠀⠀⣹⠶⢦⡀⠀⠀⡇⠀⠀⠀⠀⠀⢸⣿⣷⣿⣷⣿
	⣿⢿⠀⠀⠀⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡄⡇⠀⠀⠀⠀⠀⠈⣿⣾⣷⣿⣿
	⠋⠈⠀⢀⠜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠈⣧⠀⠀⠀⠀⠀⠀⠻⣿⣽⣾⣿
	⢀⡄⡠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠁⠀⠀⠀⣸⠀⠀⠀⠀⠀⠀⠀⣿⣿⣻⣿
	⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠐⠀⠀⠀⠀⣀⡿⠀⠀⠀⠀⠀⠀⠀⢹⣿⣻⣿
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀⠀⠀⠀⠀⢀⣃⡇⠀⠲⡀⠀⠀⠀⠀⠈⣿⡿⣿
	⣀⠤⠤⠤⡀⠀⠀⠀⠀⡴⠃⠀⠀⠀⠀⠀⢬⠞⡇⠀⠀⠇⠀⠀⠀⠀⠀⣿⣿⣿
	⡁⢀⠀⠀⡇⠀⠀⠀⡼⠁⠀⠀⠀⠀⠀⣸⠁⠀⠇⠀⠀⡇⠀⠀⠀⠀⠀⣿⣿⣿
	⠔⠃⠀⠀⡇⠀⠀⡼⠁⠀⠀⠀⠀⠀⢀⡇⠀⠀⡃⠀⠀⠙⢄⠀⠀⠀⠀⣿⣷⣿
	⠒⠊⠀⠀⢸⠀⣸⠃⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⢅⠀⠀⡂⠸⡄⠀⠀⠀⣿⣟⣿
	⠓⠀⠉⠀⢸⣰⠃⠀⠀⠀⠀⠀⠀⡜⡆⠀⠀⠀⢸⠀⠀⡇⢀⠇⠀⠀⠀⣿⣿⣿
	⠉⠁⠀⢠⠞⠀⠀⠀⠀⠀⠀⠀⣰⠁⡇⠀⠀⠀⡇⠀⠀⡇⢸⠀⠀⠀⠀⣿⣷⣿
	⡀⠀⢀⢿⣥⡤⠤⠤⠤⣀⣀⢠⠇⠀⢸⠀⠀⢰⠁⠀⢨⠀⢸⠀⠀⠀⠀⣿⣟⣿
	
	Hey There!
	Don't ask why I'm here.
	
	But if you see me, This is the correct
	module and not a fake one :D
	
	By @ImSnox
	
	]]
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	local RunService = game:GetService('RunService')
	local camera = workspace.CurrentCamera
	local MTREL = "Glass"
	local binds = {}
	local root = Instance.new('Folder', camera)
	root.Name = 'BlurSnox'
	
	local gTokenMH = 99999999
	local gToken = math.random(1, gTokenMH)
	
	local DepthOfField = Instance.new('DepthOfFieldEffect', game:GetService('Lighting'))
	DepthOfField.FarIntensity = 0
	DepthOfField.FocusDistance = 51.6
	DepthOfField.InFocusRadius = 50
	DepthOfField.NearIntensity = 1
	DepthOfField.Name = "DPT_"..gToken
	
	local frame = Instance.new('Frame')
	frame.Parent = script.Parent
	frame.Size = UDim2.new(0.95, 0, 0.95, 0)
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.BackgroundTransparency = 1
	
	local GenUid; do -- Generate unique names for RenderStepped bindings
		local id = 0
		function GenUid()
			id = id + 1
			return 'neon::'..tostring(id)
		end
	end
	
	do
		local function IsNotNaN(x)
			return x == x
		end
		local continue = IsNotNaN(camera:ScreenPointToRay(0,0).Origin.x)
		while not continue do
			RunService.RenderStepped:wait()
			continue = IsNotNaN(camera:ScreenPointToRay(0,0).Origin.x)
		end
	end
	
	local DrawQuad; do
		local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
		local sz = 0.2
	
		function DrawTriangle(v1, v2, v3, p0, p1) -- I think Stravant wrote this function
			local s1 = (v1 - v2).magnitude
			local s2 = (v2 - v3).magnitude
			local s3 = (v3 - v1).magnitude
			local smax = max(s1, s2, s3)
			local A, B, C
			if s1 == smax then
				A, B, C = v1, v2, v3
			elseif s2 == smax then
				A, B, C = v2, v3, v1
			elseif s3 == smax then
				A, B, C = v3, v1, v2
			end
	
			local para = ( (B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z ) / (A-B).magnitude
			local perp = sqrt((C-A).magnitude^2 - para*para)
			local dif_para = (A - B).magnitude - para
	
			local st = CFrame.new(B, A)
			local za = CFrame.Angles(pi/2,0,0)
	
			local cf0 = st
	
			local Top_Look = (cf0 * za).lookVector
			local Mid_Point = A + CFrame.new(A, B).lookVector * para
			local Needed_Look = CFrame.new(Mid_Point, C).lookVector
			local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z
	
			local ac = CFrame.Angles(0, 0, acos(dot))
	
			cf0 = cf0 * ac
			if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
			end
			cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))
	
			local cf1 = st * ac * CFrame.Angles(0, pi, 0)
			if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
			end
			cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)
	
			if not p0 then
				p0 = Instance.new('Part')
				p0.FormFactor = 'Custom'
				p0.TopSurface = 0
				p0.BottomSurface = 0
				p0.Anchored = true
				p0.CanCollide = false
				p0.CastShadow = false
				p0.Material = MTREL
				p0.Size = Vector3.new(sz, sz, sz)
				local mesh = Instance.new('SpecialMesh', p0)
				mesh.MeshType = 2
				mesh.Name = 'WedgeMesh'
			end
			p0.WedgeMesh.Scale = Vector3.new(0, perp/sz, para/sz)
			p0.CFrame = cf0
	
			if not p1 then
				p1 = p0:clone()
			end
			p1.WedgeMesh.Scale = Vector3.new(0, perp/sz, dif_para/sz)
			p1.CFrame = cf1
	
			return p0, p1
		end
	
		function DrawQuad(v1, v2, v3, v4, parts)
			parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
			parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
		end
	end
	
	if binds[frame] then
		return binds[frame].parts
	end
	
	local uid = GenUid()
	local parts = {}
	local f = Instance.new('Folder', root)
	f.Name = frame.Name
	
	local parents = {}
	do
		local function add(child)
			if child:IsA'GuiObject' then
				parents[#parents + 1] = child
				add(child.Parent)
			end
		end
		add(frame)
	end
	
	local function UpdateOrientation(fetchProps)
		local properties = {
			Transparency = 0.98;
			BrickColor = BrickColor.new('Institutional white');
		}
		local zIndex = 1 - 0.05*frame.ZIndex
	
		local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
		local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
		do
			local rot = 0;
			for _, v in ipairs(parents) do
				rot = rot + v.Rotation
			end
			if rot ~= 0 and rot%180 ~= 0 then
				local mid = tl:lerp(br, 0.5)
				local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
				local vec = tl
				tl = Vector2.new(c*(tl.x - mid.x) - s*(tl.y - mid.y), s*(tl.x - mid.x) + c*(tl.y - mid.y)) + mid
				tr = Vector2.new(c*(tr.x - mid.x) - s*(tr.y - mid.y), s*(tr.x - mid.x) + c*(tr.y - mid.y)) + mid
				bl = Vector2.new(c*(bl.x - mid.x) - s*(bl.y - mid.y), s*(bl.x - mid.x) + c*(bl.y - mid.y)) + mid
				br = Vector2.new(c*(br.x - mid.x) - s*(br.y - mid.y), s*(br.x - mid.x) + c*(br.y - mid.y)) + mid
			end
		end
		DrawQuad(
			camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin, 
			camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin, 
			camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin, 
			camera:ScreenPointToRay(br.x, br.y, zIndex).Origin, 
			parts
		)
		if fetchProps then
			for _, pt in pairs(parts) do
				pt.Parent = f
			end
			for propName, propValue in pairs(properties) do
				for _, pt in pairs(parts) do
					pt[propName] = propValue
				end
			end
		end
	end
	
	UpdateOrientation(true)
	RunService:BindToRenderStep(uid, 2000, UpdateOrientation)
end
coroutine.wrap(HYJBO_fake_script)()
local function SXMEGFD_fake_script() -- BlurDarkThemedFrame.Animation 
	local script = Instance.new('LocalScript', BlurDarkThemedFrame)

	local TweenService = game:GetService("TweenService")
	
	function tweenUI(element, property, goal, duration)
		local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
		local tweenProperties = {}
	
		tweenProperties[property] = goal
	
		TweenService:Create(element, tweenInfo, tweenProperties):Play()
	end
	
	_G.Key = key
	wait(3)
	
	tweenUI(script.Parent, "Size", UDim2.new(0, 263, 0, 292), 3)
	tweenUI(script.Parent, "Position", UDim2.new(0.36, 0, 0.258, 0), 4)
	tweenUI(script.Parent.key, "Position", UDim2.new(0.335, 0, 0.077, 0), 5)
	tweenUI(script.Parent.title, "Position", UDim2.new(0.119, 0, 0.319, 0), 6)
	tweenUI(script.Parent.title2, "TextTransparency", 1, 2)
	tweenUI(script.Parent.TextBox, "BackgroundTransparency", 0.55, 2)
	tweenUI(script.Parent.TextBox, "TextTransparency", 0, 2)
	
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
				tweenUI(script.Parent, "Position", UDim2.new(0.36, 0, 0.413, 0), 4)
				tweenUI(script.Parent.key, "Position", UDim2.new(0.065, 0, 0.216, 0), 5)
				tweenUI(script.Parent.title, "Position", UDim2.new(0.279, 0, 0.374, 0), 6)
				wait(0.3)
				script.Parent.title.Text = "Please Wait."
				wait(2)
	
				for _, child in ipairs(script.Parent:GetChildren()) do
					tweenUI(child, "TextTransparency", 1, 2)
					wait(2)
					child.Visible = false
					wait(1)
				end
				loadstring(callback)()
			else
				tweenUI(script.Parent.title3, "TextTransparency", 0, 2)
				script.Parent.title3.Text = "Incorrect Key"
				script.Parent.TextBox.Text = " "
				wait(1.8)
				tweenUI(script.Parent.title3, "TextTransparency", 1, 2)
				
			end
		end
	end)
	
end
coroutine.wrap(SXMEGFD_fake_script)()
end

return lib
