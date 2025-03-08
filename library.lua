local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
--init idk
warn("[LuaNotif 2.2]: Calculating Bounds..")
warn("[LuaNotif 2.2]: LuaNotif 2.2 by cr1tcal3 ")
task.wait(0.5) -- idk fuckatry stuff
warn("[LuaNotif 2.2]: Bounds Found")
local NotifGui = Instance.new("ScreenGui")
NotifGui.Name = "ModernNotif"
NotifGui.Parent = RunService:IsStudio() and Player:WaitForChild("PlayerGui") or game:GetService("CoreGui")
local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Position = UDim2.new(1, -320, 0.5, -20)
Container.Size = UDim2.new(0, 300, 0.5, 0)
Container.BackgroundTransparency = 1
Container.Parent = NotifGui
local Padding = 10
local DescriptionPadding = 10
local InstructionObjects = {}
local RepositionTweenTime = 1
local FadeTweenTime = 1
local TweenStyle = Enum.EasingStyle.Quint
local TweenDirection = Enum.EasingDirection.Out
local TitleSettings = { Font = Enum.Font.GothamSemibold, Size = 14 }
local DescriptionSettings = { Font = Enum.Font.Gotham, Size = 14 }
local MaxWidth = (Container.AbsoluteSize.X - Padding - DescriptionPadding)
local function RepositionNotifications()
	local yOffset = 0
	for _, notif in ipairs(InstructionObjects) do
		local targetPos = UDim2.new(0, 0, 0, yOffset)
		TweenService:Create(notif, TweenInfo.new(RepositionTweenTime, TweenStyle, TweenDirection), { Position = targetPos }):Play()
		yOffset = yOffset + notif.AbsoluteSize.Y + Padding
	end
end
local function CreateLabel(Text, Font, Size, isButton)
	local element = Instance.new(isButton and "TextButton" or "TextLabel")
	element.Text = Text
	element.Font = Font
	element.TextSize = Size
	element.BackgroundTransparency = 1
	element.TextXAlignment = Enum.TextXAlignment.Left
	element.RichText = true
	element.TextColor3 = Color3.new(1, 1, 1)
	return element
end
local function TitleLabel(Text)
	return CreateLabel(Text, TitleSettings.Font, TitleSettings.Size)
end
local function DescriptionLabel(Text)
	return CreateLabel(Text, DescriptionSettings.Font, DescriptionSettings.Size)
end
local function FadeProperty(Object)
	local PropertyMap = {
		TextLabel = "TextTransparency",
		TextButton = "TextTransparency",
		Frame = "BackgroundTransparency",
		ImageLabel = "ImageTransparency",
		ImageButton = "ImageTransparency",
		UIStroke = "Transparency"
	}
	local Property = PropertyMap[Object.ClassName]
	if Property then
		TweenService:Create(Object, TweenInfo.new(FadeTweenTime, TweenStyle, TweenDirection), { [Property] = 1 }):Play()
	end
end
local function FindIndex(tbl, dependency)
	for index, object in ipairs(tbl) do
		if object == dependency then
			return index
		end
	end
end
local function FadeOutAfter(Object, Seconds)
	local remainingTime = Seconds
	while remainingTime > 0 do
		if Object:GetAttribute("Hovered") then
			wait(0.1)
		else
			local dt = wait(0.1)
			remainingTime = remainingTime - dt
		end
	end
	FadeProperty(Object)
	for _, subObj in ipairs(Object:GetDescendants()) do
		FadeProperty(subObj)
	end
	wait(FadeTweenTime)
	local idx = FindIndex(InstructionObjects, Object)
	if idx then
		table.remove(InstructionObjects, idx)
	end
	RepositionNotifications()
	Object:Destroy()
end
return {
	Notify = function(Properties)
		local Properties = typeof(Properties) == "table" and Properties or {}
		local Title = Properties.Title
		local Description = Properties.Description
		local Duration = Properties.Duration or 5
		local RGBShift = Properties.RGBShift or false
		local Color = Properties.Color or Color3.fromRGB(30, 30, 30)
		if Title or Description then
			local Y = Title and 26 or 0
			if Description then
				local textSize = TextService:GetTextSize(
					Description,
					DescriptionSettings.Size,
					DescriptionSettings.Font,
					Vector2.new(MaxWidth, math.huge)
				)
				local lines = math.ceil(textSize.X / MaxWidth)
				Y = Y + (textSize.Y * lines) + 8
			end
			local NewLabel = Instance.new("Frame")
			NewLabel.Size = UDim2.new(1, 0, 0, Y)
			NewLabel.Position = UDim2.new(0, 0, 0, -Y)
			NewLabel.BackgroundColor3 = Color
			NewLabel.BackgroundTransparency = 0.223254
			NewLabel.Active = true
			NewLabel:SetAttribute("Hovered", false)
			NewLabel.Parent = Container
			local uicorner = Instance.new("UICorner")
			uicorner.CornerRadius = UDim.new(0, 10)
			uicorner.Parent = NewLabel
			local uistroke = Instance.new("UIStroke")
			uistroke.Thickness = 2
			uistroke.Transparency = 0.5
			uistroke.Color = Color3.new(0, 0, 0)
			uistroke.Parent = NewLabel
			if Title then
				local NewTitle = TitleLabel(Title)
				NewTitle.Size = UDim2.new(1, -10, 0, 26)
				NewTitle.Position = UDim2.fromOffset(10, 0)
				NewTitle.Parent = NewLabel
			end
			if Description then
				local NewDescription = DescriptionLabel(Description)
				NewDescription.TextWrapped = true
				NewDescription.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(-DescriptionPadding, Title and -26 or 0)
				NewDescription.Position = UDim2.fromOffset(10, Title and 26 or 0)
				NewDescription.TextYAlignment = Title and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
				NewDescription.Parent = NewLabel
			end
			local ProgressBar = Instance.new("ImageLabel")
			ProgressBar.Size = UDim2.new(1, 0, 0, 4)
			ProgressBar.Position = UDim2.new(0, 0, 1, -4)
			ProgressBar.BackgroundColor3 = Color
			ProgressBar.BorderSizePixel = 0
			ProgressBar.Parent = NewLabel
			if RGBShift then
				coroutine.wrap(function()
					while true do
						local newColor = Color3.fromRGB(
							math.random(0, 255),
							math.random(0, 255),
							math.random(0, 255)
						)
						local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
						local tween = TweenService:Create(ProgressBar, tweenInfo, { BackgroundColor3 = newColor })
						tween:Play()
						task.wait(0.3)
					end
				end)()
			end
			TweenService:Create(
				ProgressBar,
				TweenInfo.new(Duration, TweenStyle, TweenDirection),
				{ Size = UDim2.new(0, 0, 0, 4) }
			):Play()
			NewLabel.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					NewLabel:SetAttribute("Hovered", true)
					TweenService:Create(NewLabel, TweenInfo.new(0.5, TweenStyle, TweenDirection), {
						BackgroundTransparency = 0.1,
						Size = UDim2.new(1, 0, 0, Y + 10)
					}):Play()
				end
			end)
			NewLabel.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					NewLabel:SetAttribute("Hovered", false)
					TweenService:Create(NewLabel, TweenInfo.new(0.5, TweenStyle, TweenDirection), {
						BackgroundTransparency = 0.223254,
						Size = UDim2.new(1, 0, 0, Y)
					}):Play()
				end
			end)
			table.insert(InstructionObjects, NewLabel)
			RepositionNotifications()
			coroutine.wrap(FadeOutAfter)(NewLabel, Duration)
		end
	end,
}


