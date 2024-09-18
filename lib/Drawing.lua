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
        corner.CornerRadius = UDim.new(0.5, 0)
        corner.Parent = object
    elseif objectType == "Text" then
        object = Instance.new("TextLabel")
        object.BackgroundTransparency = 1
        object.BorderSizePixel = 0
        object.TextColor3 = Color3.fromRGB(255, 255, 255)
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
