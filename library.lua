local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
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

local function Image(ID, Button)
    local NewImage = Instance.new(Button and "ImageButton" or "ImageLabel")
    NewImage.Image = "http://www.roblox.com/asset/?id=" .. ID
    NewImage.BackgroundTransparency = 1
    return NewImage
end

local function Round2px()
    local NewImage = Image("5761488251")
    NewImage.ScaleType = Enum.ScaleType.Slice
    NewImage.SliceCenter = Rect.new(2, 2, 298, 298)
    NewImage.ImageColor3 = Color3.fromRGB(30, 30, 30)
    return NewImage
end

local function Shadow2px()
    local NewImage = Image("5761498316")
    NewImage.ScaleType = Enum.ScaleType.Slice
    NewImage.SliceCenter = Rect.new(17, 17, 283, 283)
    NewImage.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30)
    NewImage.Position = -UDim2.fromOffset(15, 15)
    NewImage.ImageColor3 = Color3.fromRGB(30, 30, 30)
    return NewImage
end

local Padding, DescriptionPadding = 10, 10
local InstructionObjects, CachedObjects = {}, {}
local TweenTime, TweenStyle, TweenDirection = 1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out
local LastTick = tick()

local function CalculateBounds(TableOfObjects)
    local X, Y = 0, 0
    for _, Object in ipairs(TableOfObjects) do
        X += Object.AbsoluteSize.X
        Y += Object.AbsoluteSize.Y
    end
    return { X = X, Y = Y }
end

local function Update()
    local DeltaTime = tick() - LastTick
    local PreviousObjects = {}
    local RemovedObjects = {}

    for _, Object in ipairs(InstructionObjects) do
        local Label, Delta, Done = Object[1], Object[2], Object[3]
        if not Done then
            Object[2] = math.clamp(Delta + DeltaTime, 0, 1)
            Object[3] = Delta >= TweenTime
        end
        local NewValue = TweenService:GetValue(Object[2], TweenStyle, TweenDirection)
        local TargetPos = UDim2.new(1, -320, 0, CalculateBounds(PreviousObjects).Y + (Padding * #PreviousObjects))
        Label.Position = Label.Position:Lerp(TargetPos, NewValue)

        if Object[3] then
            table.insert(RemovedObjects, Object)
        else
            table.insert(PreviousObjects, Label)
        end
    end

    for _, Removed in ipairs(RemovedObjects) do
        table.remove(InstructionObjects, table.find(InstructionObjects, Removed))
    end

    CachedObjects = PreviousObjects
    LastTick = tick()
end

RunService:BindToRenderStep("UpdateList", 0, Update)

local TitleSettings, DescriptionSettings = { Font = Enum.Font.GothamSemibold, Size = 14 }, { Font = Enum.Font.Gotham, Size = 14 }
local MaxWidth = Container.AbsoluteSize.X - Padding - DescriptionPadding

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

local function TitleLabel(Text) return Label(Text, TitleSettings.Font, TitleSettings.Size) end
local function DescriptionLabel(Text) return Label(Text, DescriptionSettings.Font, DescriptionSettings.Size) end

local function FadeProperty(Object)
    local Prop = ({Text = "TextTransparency", Fram = "BackgroundTransparency", Imag = "ImageTransparency"})[string.sub(Object.ClassName, 1, 4)]
    TweenService:Create(Object, TweenInfo.new(0.25, TweenStyle, TweenDirection), { [Prop] = 1 }):Play()
end

local function ResetObjects()
    for _, Object in ipairs(InstructionObjects) do
        Object[2], Object[3] = 0, false
    end
end

local function FadeOutAfter(Object, Seconds)
    wait(Seconds)
    FadeProperty(Object)
    for _, SubObj in ipairs(Object:GetDescendants()) do FadeProperty(SubObj) end
    wait(0.25)
    table.remove(InstructionObjects, table.find(InstructionObjects, Object))
    ResetObjects()
end

return {
    Notify = function(Properties)
        local Title, Description, Duration, IconID = Properties.Title, Properties.Description, Properties.Duration or 5, Properties.IconID
        if Title or Description then
            local Y = Title and 26 or 0
            if Description then
                local TextSize = TextService:GetTextSize(Description, DescriptionSettings.Size, DescriptionSettings.Font, Vector2.new(0, 0))
                for i = 1, math.ceil(TextSize.X / MaxWidth) do Y += TextSize.Y end
                Y += 8
            end
            local NewLabel = Round2px()
            NewLabel.Size = UDim2.new(1, 0, 0, Y)
            NewLabel.Position = UDim2.new(1, 20, 0, CalculateBounds(CachedObjects).Y + (Padding * #CachedObjects))
            
            -- Add the icon if available
            if IconID then
                local Icon = Image(IconID, false)
                Icon.Size = UDim2.new(0, 32, 0, 32)
                Icon.Position = UDim2.new(0, 10, 0, 10)
                Icon.Parent = NewLabel
            end
            
            local ProgressBar = Instance.new("Frame")
            ProgressBar.Size = UDim2.new(1, 0, 0, 4)
            ProgressBar.Position = UDim2.new(0, 0, 1, -4)
            ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 120, 212) -- Windows 11 blue
            ProgressBar.BorderSizePixel = 0
            ProgressBar.Parent = NewLabel
            
            TweenService:Create(ProgressBar, TweenInfo.new(Duration, TweenStyle, TweenDirection), { Size = UDim2.new(0, 0, 0, 4) }):Play()
            
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
            Shadow2px().Parent = NewLabel
            NewLabel.Parent = Container
            table.insert(InstructionObjects, { NewLabel, 0, false })
            coroutine.wrap(FadeOutAfter)(NewLabel, Duration)
        end
    end,
}
