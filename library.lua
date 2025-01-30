return {
    Notify = function(Properties)
        local Title, Description, Duration = Properties.Title, Properties.Description, Properties.Duration or 5
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
            
            local ProgressBar = Instance.new("Frame")
            ProgressBar.Size = UDim2.new(1, 0, 0, 4)
            ProgressBar.Position = UDim2.new(0, 0, 1, -4)
            ProgressBar.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
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
