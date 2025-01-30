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
    return {X = X, Y = Y}
end

local function Update()
    local DeltaTime = tick() - LastTick
    local PreviousObjects = {}
    for _, Object in ipairs(InstructionObjects) do
        local Label, Delta, Done = Object[1], Object[2], Object[3]
        if not Done then
            Object[2] = math.clamp(Delta + DeltaTime, 0, 1)
            Object[3] = Delta >= TweenTime
        end
        local NewValue = TweenService:GetValue(Object[2], TweenStyle, TweenDirection)
        local TargetPos = UDim2.new(1, -320, 0, CalculateBounds(PreviousObjects).Y + (Padding * #PreviousObjects))
        Label.Position = Label.Position:Lerp(TargetPos, NewValue)
        table.insert(PreviousObjects, Label)
    end
    LastTick = tick()
end

RunService.Heartbeat:Connect(Update)

local function Notify(Params)
    local Text = Params.Text
    local IconID = Params.IconID

    local NewNotif = Instance.new("Frame")
    NewNotif.Size = UDim2.new(0, 300, 0, 60)
    NewNotif.BackgroundTransparency = 1
    NewNotif.Parent = Container

    local Shadow = Shadow2px()
    Shadow.Parent = NewNotif

    local Background = Round2px()
    Background.Parent = NewNotif

    local IconArea = Instance.new("Frame")
    IconArea.Size = UDim2.new(0, 40, 0, 40)
    IconArea.Position = UDim2.new(0, Padding, 0, Padding)
    IconArea.BackgroundTransparency = 1
    IconArea.Parent = NewNotif

    local Icon = Image(IconID, false)
    Icon.Size = UDim2.fromOffset(40, 40)
    Icon.Parent = IconArea

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.Position = UDim2.new(0, 50, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 16
    Label.TextWrapped = true
    Label.Parent = NewNotif

    local Bound = CalculateBounds({IconArea, Label})
    NewNotif.Size = UDim2.new(0, Bound.X + 10, 0, Bound.Y)

    table.insert(InstructionObjects, {NewNotif, 0, false})

    return {
        Notify = Notify
    }
end

return {
    Notify = function(Text, IconID)
        return Notify({
            Text = Text,
            IconID = IconID
        })
    end
}
