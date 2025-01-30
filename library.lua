local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local x = Instance.new("UICorner")
x.Name = "CornerEdgeController"
x.Parent = game:GetService("ReplicatedStorage")
x.CornerRadius = UDim.new(0,7)
local ccc = x:Clone()
local Player = game:GetService("Players").LocalPlayer
local NotifGui = Instance.new("ScreenGui")
NotifGui.Name = "AkaliNotif"
NotifGui.Parent = RunService:IsStudio() and Player.PlayerGui or game:GetService("CoreGui")
local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Position = UDim2.new(1, -320, 0.5, -20)
Container.Size = UDim2.new(0, 300, 0.5, 0)
Container.BackgroundTransparency = 1
Container.Parent = NotifGui

local Padding = 10
local DescriptionPadding = 10
local InstructionObjects = {}
local TweenTime = 1
local TweenStyle = Enum.EasingStyle.Sine
local TweenDirection = Enum.EasingDirection.Out
local LastTick = tick()
local function CalculateBounds(TableOfObjects)
    local X, Y = 0, 0
    for _, Object in ipairs(TableOfObjects) do
        X += Object.AbsoluteSize.X
        Y += Object.AbsoluteSize.Y
    end
    return {X = X, Y = Y, x = X, y = Y}
end

local CachedObjects = {}

local function Update()
    local DeltaTime = tick() - LastTick
    local PreviousObjects = {}

    for _, Object in ipairs(InstructionObjects) do
        local Label, Delta, Done = Object[1], Object[2], Object[3]
        if not Done then
            if Delta < TweenTime then
                Object[2] = math.clamp(Delta + DeltaTime, 0, 1)
                Delta = Object[2]
            else
                Object[3] = true
            end
        end

        local NewValue = TweenService:GetValue(Delta, TweenStyle, TweenDirection)
        local CurrentPos = Label.Position
        local PreviousBounds = CalculateBounds(PreviousObjects)
        local TargetPos = UDim2.new(0, 0, 0, PreviousBounds.Y + (Padding * #PreviousObjects))
        Label.Position = CurrentPos:Lerp(TargetPos, NewValue)
        table.insert(PreviousObjects, Label)
    end
    CachedObjects = PreviousObjects
    LastTick = tick()
end

RunService:BindToRenderStep("UpdateList", 0, Update)

local TitleSettings = {
    Font = Enum.Font.GothamSemibold,
    Size = 14
}

local DescriptionSettings = {
    Font = Enum.Font.Gotham,
    Size = 14
}

local MaxWidth = (Container.AbsoluteSize.X - Padding - DescriptionPadding)

local function Label(Text, Font, Size, Button)
    local Label = Instance.new(Button and "TextButton" or "TextLabel")
    Label.Text = Text
    Label.Font = Font
    Label.TextSize = Size
    Label.BackgroundTransparency = 1
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.RichText = true
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    return Label
end

local function TitleLabel(Text)
    return Label(Text, TitleSettings.Font, TitleSettings.Size)
end

local function DescriptionLabel(Text)
    return Label(Text, DescriptionSettings.Font, DescriptionSettings.Size)
end

local PropertyTweenOut = {
    Text = "TextTransparency",
    Fram = "BackgroundTransparency",
    Imag = "ImageTransparency"
}
local function FadeProperty(Object)
    local Prop = PropertyTweenOut[string.sub(Object.ClassName, 1, 4)]
    TweenService:Create(Object, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
        [Prop] = 1
    }):Play()
end
local function SearchTableFor(Table, For)
    for _, v in ipairs(Table) do
        if v == For then
            return true
        end
    end
    return false
end
local function FindIndexByDependency(Table, Dependency)
    for Index, Object in ipairs(Table) do
        if typeof(Object) == "table" then
            local Found = SearchTableFor(Object, Dependency)
            if Found then
                return Index
            end
        else
            if Object == Dependency then
                return Index
            end
        end
    end
end
local function ResetObjects()
    for _, Object in ipairs(InstructionObjects) do
        Object[2] = 0
        Object[3] = false
    end
end
local function FadeOutAfter(Object, Seconds)
    wait(Seconds)
    FadeProperty(Object)
    for _, SubObj in ipairs(Object:GetDescendants()) do
        FadeProperty(SubObj)
    end
    wait(0.25)
    table.remove(InstructionObjects, FindIndexByDependency(InstructionObjects, Object))
    ResetObjects()
end
local x = {
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
                local TextSize = TextService:GetTextSize(Description, DescriptionSettings.Size, DescriptionSettings.Font, Vector2.new(0, 0))
                for i = 1, math.ceil(TextSize.X / MaxWidth) do
                    Y += TextSize.Y
                end
                Y += 8
            end
            local NewLabel = Instance.new("Frame")
            NewLabel.Size = UDim2.new(1, 0, 0, Y)
            NewLabel.Position = UDim2.new(1, -320, 0, CalculateBounds(CachedObjects).Y + (Padding * #CachedObjects))
            NewLabel.BackgroundColor3 = Color
            NewLabel.BackgroundTransparency = 0.5
            NewLabel.Parent = Container
			ccc.Parent = NewLabel
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
                NewDescription.TextYAlignment = Enum.TextYAlignment[Title and "Top" or "Center"]
                NewDescription.Parent = NewLabel
            end
            local ProgressBar = Instance.new("Frame")
            ProgressBar.Size = UDim2.new(1, 0, 0, 4)
            ProgressBar.Position = UDim2.new(0, 0, 1, -4)
            ProgressBar.BackgroundColor3 = Color
            ProgressBar.BorderSizePixel = 0
            ProgressBar.Parent = NewLabel
            if RGBShift then
                coroutine.wrap(function()
                    local function ShiftRGB()
                        while true do
						local newColor = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                            local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
							  local tween = game:GetService("TweenService"):Create(ProgressBar, tweenInfo, { BackgroundColor3 = newColor })
							tween:Play()
							task.wait(0.2)
                        end
                    end
                    ShiftRGB()
                end)()
            end
            TweenService:Create(ProgressBar, TweenInfo.new(Duration, TweenStyle, TweenDirection), { Size = UDim2.new(0, 0, 0, 4) }):Play()
            coroutine.wrap(FadeOutAfter)(NewLabel, Duration)
            table.insert(InstructionObjects, { NewLabel, 0, false })
        end
    end,
}
