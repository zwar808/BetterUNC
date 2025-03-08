local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local x = Instance.new("UICorner")
x.Name = "CornerEdgeController"
x.Parent = game:GetService("ReplicatedStorage")
x.CornerRadius = UDim.new(0,10)
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

local function FadeProperty(Object)
    local PropertyMap = {
        TextLabel = "TextTransparency",
        TextButton = "TextTransparency",
        Frame = "BackgroundTransparency",
        ImageLabel = "ImageTransparency",
        ImageButton = "ImageTransparency"
    }
    local Property = PropertyMap[Object.ClassName]
    if Property then
        local Tween = TweenService:Create(Object, TweenInfo.new(0.25, TweenStyle, TweenDirection), {[Property] = 1})
        Tween:Play()
    end
end

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

local function FadeOutAfter(Object, Seconds)
    task.wait(Seconds)
    FadeProperty(Object)
    for _, SubObj in ipairs(Object:GetDescendants()) do
        FadeProperty(SubObj)
    end
    task.wait(0.25)
    table.remove(InstructionObjects, table.find(InstructionObjects, Object))
end

return {
    Notify = function(Properties)
        local Title = Properties.Title
        local Description = Properties.Description
        local Duration = Properties.Duration or 5
        local Color = Properties.Color or Color3.fromRGB(30, 30, 30)
        
        if Title or Description then
            local Y = Title and 26 or 0
            if Description then
                local TextSize = TextService:GetTextSize(Description, 14, Enum.Font.Gotham, Vector2.new(0, 0))
                for i = 1, math.ceil(TextSize.X / (Container.AbsoluteSize.X - Padding - DescriptionPadding)) do
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
                local NewTitle = Instance.new("TextLabel")
                NewTitle.Text = Title
                NewTitle.Font = Enum.Font.GothamSemibold
                NewTitle.TextSize = 14
                NewTitle.BackgroundTransparency = 1
                NewTitle.TextColor3 = Color3.new(1, 1, 1)
                NewTitle.Size = UDim2.new(1, -10, 0, 26)
                NewTitle.Position = UDim2.fromOffset(10, 0)
                NewTitle.Parent = NewLabel
            end

            if Description then
                local NewDescription = Instance.new("TextLabel")
                NewDescription.Text = Description
                NewDescription.Font = Enum.Font.Gotham
                NewDescription.TextSize = 14
                NewDescription.BackgroundTransparency = 1
                NewDescription.TextWrapped = true
                NewDescription.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(-DescriptionPadding, Title and -26 or 0)
                NewDescription.Position = UDim2.fromOffset(10, Title and 26 or 0)
                NewDescription.TextColor3 = Color3.new(1, 1, 1)
                NewDescription.Parent = NewLabel
            end

            local ProgressBar = Instance.new("Frame")
            ProgressBar.Size = UDim2.new(1, 0, 0, 4)
            ProgressBar.Position = UDim2.new(0, 0, 1, -4)
            ProgressBar.BackgroundColor3 = Color
            ProgressBar.BorderSizePixel = 0
            ProgressBar.Parent = NewLabel

            TweenService:Create(ProgressBar, TweenInfo.new(Duration, TweenStyle, TweenDirection), {Size = UDim2.new(0, 0, 0, 4)}):Play()
            coroutine.wrap(FadeOutAfter)(NewLabel, Duration)
            table.insert(InstructionObjects, {NewLabel, 0, false})
        end
    end,
}
