local Drawing = {}

function Drawing.new(objectType)
    local object
    if objectType == "Square" then
        object = Instance.new("Frame")
        object.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        object.BorderSizePixel = 0
    elseif objectType == "Circle" then
        object = Instance.new("Frame")
        object.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        object.BorderSizePixel = 0
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(8, 8)
        corner.Parent = object
    elseif objectType == "Text" then
        object = Instance.new("TextLabel")
        object.BackgroundTransparency = 1
        object.BorderSizePixel = 0
        object.TextColor3 = Color3.fromRGB(255, 255, 255)
    elseif objectType == "Line" then
        object = Instance.new("Frame")
        object.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        object.BorderSizePixel = 0
    elseif objectType == "Triangle" then
        object = Instance.new("ImageLabel")
        object.Image = "rbxassetid://1114469371"
        object.BackgroundTransparency = 1
    elseif objectType == "Hexagon" then
        object = Instance.new("ImageLabel")
        object.Image = "rbxassetid://2718828198"
        object.BackgroundTransparency = 1
    elseif objectType == "Ellipse" then
        object = Instance.new("ImageLabel")
        object.Image = "rbxassetid://4292970420"
        object.BackgroundTransparency = 1
    elseif objectType == "Pentagon" then
        object = Instance.new("ImageLabel")
        object.Image = "rbxassetid://4975806418"
        object.BackgroundTransparency = 1
    end
    return object
end

function Drawing.setPosition(object, x, y)
    object.Position = UDim2.new(0, x, 0, y)
end

function Drawing.setSize(object, width, height)
    object.Size = UDim2.new(0, width, 0, height)
end

function Drawing.setColor(object, color)
    if object:IsA("Frame") then
        object.BackgroundColor3 = color
    elseif object:IsA("TextLabel") then
        object.TextColor3 = color
    elseif object:IsA("ImageLabel") then
        object.ImageColor3 = color
    end
end

function Drawing.setText(object, text)
    if object:IsA("TextLabel") then
        object.Text = text
    end
end

function Drawing.addToParent(object, parent)
    object.Parent = parent
end

return Drawing
