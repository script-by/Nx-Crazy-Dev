for i,v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "LynXGui" then
        v:Destroy()
    end
end

local TweenService = game:GetService("TweenService")
local pagecooldown = false
local Library = {}

function Library:Window(titletext,MainColor)
    local LynXGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local MainFrameUIGradient = Instance.new("UIGradient")
    local UpperFrame = Instance.new("Frame")
    local Line = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Pages = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local PagesFolder = Instance.new("Folder")
    local BestFrame = Instance.new("Frame")
    
    local TimeChanger = Instance.new("TextButton")
    local TimeTitle = Instance.new("TextLabel")
    local Time = Instance.new("TextLabel")

    TimeChanger.Name = "TimeChanger"
    TimeChanger.Parent = UpperFrame
    TimeChanger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TimeChanger.BackgroundTransparency = 1.000
    TimeChanger.Position = UDim2.new(0.865999997, 0, -0.03125, 0)
    TimeChanger.Size = UDim2.new(0, 67, 0, 33)
    TimeChanger.AutoButtonColor = false
    TimeChanger.Font = Enum.Font.SourceSans
    TimeChanger.Text = ""
    TimeChanger.TextColor3 = Color3.fromRGB(0, 0, 0)
    TimeChanger.TextSize = 14.000

    TimeTitle.Name = "TimeTitle"
    TimeTitle.Parent = UpperFrame
    TimeTitle.AnchorPoint = Vector2.new(0, 0.5)
    TimeTitle.BackgroundColor3 = Color3.fromRGB(255, 66, 66)
    TimeTitle.BackgroundTransparency = 1.000
    TimeTitle.Position = UDim2.new(0.865999997, 0, 0.296875, 0)
    TimeTitle.Size = UDim2.new(0, 67, 0, 14)
    TimeTitle.Font = Enum.Font.GothamMedium
    TimeTitle.Text = "Game Time:"
    TimeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TimeTitle.TextScaled = true
    TimeTitle.TextSize = 14.000
    TimeTitle.TextWrapped = true

    Time.Name = "Time"
    Time.Parent = UpperFrame
    Time.AnchorPoint = Vector2.new(0, 0.5)
    Time.BackgroundColor3 = Color3.fromRGB(255, 66, 66)
    Time.BackgroundTransparency = 1.000
    Time.Position = UDim2.new(0.865999997, 0, 0.75390625, 0)
    Time.Size = UDim2.new(0, 67, 0, 14)
    Time.Font = Enum.Font.GothamMedium
    Time.Text = tostring(game.Lighting.TimeOfDay)
    Time.TextColor3 = Color3.fromRGB(255, 255, 255)
    Time.TextScaled = true
    Time.TextSize = 14.000
    Time.TextWrapped = true

    local time = 0

    game.Lighting:GetPropertyChangedSignal("TimeOfDay"):Connect(function()
        if time == 0 then
            Time.Text = tostring(game.Lighting.TimeOfDay)
        end
    end)



    game:GetService("RunService").RenderStepped:Connect(function()
        if time == 1 then
            local m = os.date("*t")["min"]
            local h = os.date("*t")["hour"]
            local s = os.date("*t")["sec"]

            if m <= 9 then
                m = "0"..m
            end
        
            if h<= 9 then
                h = "0"..h
            end
        
            if s<= 9 then
                s = "0"..s
            end
            Time.Text = h..":"..m..":"..s
        end
    end)

    local cooldowntime = false

    TimeChanger.MouseButton1Down:Connect(function()
        if cooldowntime == false then
            if time == 0 then
                cooldowntime = true
                TweenService:Create(TimeTitle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
                TweenService:Create(Time, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
                wait(0.1)
                TimeTitle.Text = "Real Time:"
                Time.Text = os.date("*t")["hour"]..":"..os.date("*t")["min"]..":"..os.date("*t")["sec"]
                wait(0.1)
                TweenService:Create(TimeTitle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 0}):Play()
                TweenService:Create(Time, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 0}):Play()
                time = 1
                cooldowntime = false
            elseif time == 1 then
                cooldowntime = true
                time = 0
                TweenService:Create(TimeTitle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
                TweenService:Create(Time, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
                wait(0.1)
                TimeTitle.Text = "Game Time:"
                Time.Text = game.Lighting.TimeOfDay
                wait(0.1)
                TweenService:Create(TimeTitle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 0}):Play()
                TweenService:Create(Time, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 0}):Play()
                cooldowntime = false
            end
        end
    end)


    BestFrame.Name = "BestFrame"
    BestFrame.Parent = MainFrame
    BestFrame.BackgroundColor3 = MainColor
    BestFrame.BorderSizePixel = 0
    BestFrame.BackgroundTransparency = 1
    BestFrame.Size = UDim2.new(0, 500, 0, 0)
    BestFrame.ZIndex = 3

    PagesFolder.Name = "Pages"
    PagesFolder.Parent = MainFrame

    UIListLayout.Parent = Pages
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout.Padding = UDim.new(0, 6)

    LynXGui.Name = "LynXGui"
    LynXGui.Parent = game.CoreGui
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = LynXGui
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 500, 0, 300)

    MainFrameUIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 24, 24)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 17, 17))}
    MainFrameUIGradient.Rotation = 45
    MainFrameUIGradient.Name = "MainFrameUIGradient"
    MainFrameUIGradient.Parent = MainFrame

    UpperFrame.Name = "UpperFrame"
    UpperFrame.Parent = MainFrame
    UpperFrame.AnchorPoint = Vector2.new(0.5, 0)
    UpperFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UpperFrame.BackgroundTransparency = 1.000
    UpperFrame.BorderSizePixel = 0
    UpperFrame.Position = UDim2.new(0.5, 0, 0, 0)
    UpperFrame.Size = UDim2.new(0, 500, 0, 32)

    Line.Name = "Line"
    Line.Parent = UpperFrame
    Line.AnchorPoint = Vector2.new(0.5, 0)
    Line.BackgroundColor3 = MainColor
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0.5, 0, 1, 0)
    Line.Size = UDim2.new(0, 500, 0, 2)

    Title.Name = "Title"
    Title.Size = UDim2.new(0,200,0,27)
    Title.Parent = UpperFrame
    Title.AnchorPoint = Vector2.new(0, 0.5)
    Title.BackgroundColor3 = Color3.fromRGB(255, 66, 66)
    Title.BackgroundTransparency = 1.000
    Title.Text = titletext
    Title.Position = UDim2.new(0.01, 0, 0.5, 0)
    Title.Font = Enum.Font.GothamBold
    Title.TextColor3 = MainColor
    Title.TextScaled = true
    Title.TextSize = 14
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Size = UDim2.new(0,Title.TextBounds.X,0,27)

    Title.MouseEnter:Connect(function()
        TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)

    Title.MouseLeave:Connect(function()
        TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainColor}):Play()
    end)

    Pages.Name = "Pages"
    Pages.Parent = UpperFrame
    Pages.AnchorPoint = Vector2.new(0.5, 0.5)
    Pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Pages.BackgroundTransparency = 1.000
    Pages.Position = UDim2.new(0.499000013, 0, 0.50390625, 0)
    Pages.Size = UDim2.new(0, 185, 0, 26)

    local PageX = {}

    function PageX:Page(Name,ImageId)
        local Page = Instance.new("Frame")
        local PageUIListLayout = Instance.new("UIListLayout")
        local ImageButton = Instance.new("ImageButton")

        ImageButton.Name = Name.."_PageIcon"
        ImageButton.Parent = Pages
        ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageButton.BackgroundTransparency = 1.000
        ImageButton.Size = UDim2.new(0, 24, 0, 24)
        ImageButton.AutoButtonColor = false
        ImageButton.Image = "rbxassetid://"..ImageId

        Page.Name = Name.."_Page"
        Page.Parent = PagesFolder
        Page.AnchorPoint = Vector2.new(0.5, 0.5)
        Page.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
        Page.BackgroundTransparency = 1.000
        Page.BorderSizePixel = 0
        Page.Position = UDim2.new(0.5, 0, 0.556666672, 0)
        Page.Size = UDim2.new(0, 490, 0, 256)

        PageUIListLayout.Name = "PageUIListLayout"
        PageUIListLayout.Parent = Page
        PageUIListLayout.FillDirection = Enum.FillDirection.Horizontal
        PageUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        PageUIListLayout.Padding = UDim.new(0, 6)

        ImageButton.MouseButton1Down:Connect(function()
            if pagecooldown == false and Page.Visible == false then
                pagecooldown = true
                TweenService:Create(BestFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 500, 0, 300),Transparency = 0}):Play()
                wait(0.21)
                for i,v in next, PagesFolder:GetChildren() do
                    if v:IsA("Frame") then
                    v.Visible = false
                end
            end
            Page.Visible = true
                wait(0.1)
                for i,v in next, Pages:GetChildren() do
                    if v:IsA("ImageButton") then
                        TweenService:Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
                    end
                end
                wait(0.1)
                TweenService:Create(BestFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 500, 0, 0),Transparency = 1}):Play()
                TweenService:Create(ImageButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = MainColor}):Play()
                pagecooldown = false
            end
        end)

        local SectionX = {}

        function SectionX:Section(Name)
            local Section = Instance.new("Frame")
            local SectionUICorner = Instance.new("UICorner")
            local SectionTitle = Instance.new("TextLabel")
            local Things = Instance.new("ScrollingFrame")
            local UIListLayout_2 = Instance.new("UIListLayout")
            local Line_2 = Instance.new("Frame")

            Section.Name = Name
            Section.Parent = Page
            Section.AnchorPoint = Vector2.new(0, 0.5)
            Section.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            Section.BorderSizePixel = 0
            Section.Position = UDim2.new(-0.00204081624, 0, 0.04296875, 0)
            Section.Size = UDim2.new(0, 242, 0, 250)

            SectionUICorner.CornerRadius = UDim.new(0, 5)
            SectionUICorner.Name = "SectionUICorner"
            SectionUICorner.Parent = Section

            SectionTitle.Name = "SectionTitle"
            SectionTitle.Parent = Section
            SectionTitle.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            SectionTitle.BorderSizePixel = 0
            SectionTitle.Size = UDim2.new(0, 242, 0, 13)
            SectionTitle.Font = Enum.Font.GothamMedium
            SectionTitle.Text = Name
            SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SectionTitle.TextScaled = true
            SectionTitle.TextSize = 14.000
            SectionTitle.TextWrapped = true

            Things.Name = "Things"
            Things.Parent = Section
            Things.AnchorPoint = Vector2.new(0.5, 0.5)
            Things.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Things.BackgroundTransparency = 1.000
            Things.Position = UDim2.new(0.5, 0, 0.536000013, 0)
            Things.Size = UDim2.new(0, 230, 0, 222)
            Things.ScrollBarThickness = 0
            Things.CanvasSize = UDim2.new(0,0,0,0)
            
            UIListLayout_2.Parent = Things
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 5)

            Line_2.Name = "Line"
            Line_2.Parent = Section
            Line_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Line_2.BorderSizePixel = 0
            Line_2.Position = UDim2.new(0, 0, 0, 15)
            Line_2.Size = UDim2.new(0, 242, 0, 1)

            local ThingsX = {}

            function ThingsX:Slider(text,minvalue,maxvalue,currentvalue,callback)
                minvalue = minvalue or 0
                maxvalue = maxvalue or 100

                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
                local Value = currentvalue
                

                callback = callback or function() end

                local Slider = Instance.new("Frame")
                local SliderTitle = Instance.new("TextLabel")
                local TextButton = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local Frame = Instance.new("Frame")
                local UICorner_22 = Instance.new("UICorner")
                local Number = Instance.new("TextLabel")

                Slider.Name = text.."_Slider"
                Slider.Parent = Things 
                Slider.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                Slider.BorderSizePixel = 0
                Slider.Position = UDim2.new(0, 0, 0.234234229, 0)
                Slider.Size = UDim2.new(0, 230, 0, 28)

                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0304347817, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0.482608706, 0, 1, 0)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.TextSize = 16
                SliderTitle.TextWrapped = true
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

                TextButton.Parent = Slider
                TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                TextButton.Position = UDim2.new(0.671739101, 0, 0.5, 0)
                TextButton.Size = UDim2.new(0, 97, 0, 7)
                TextButton.AutoButtonColor = false
                TextButton.Font = Enum.Font.SourceSans
                TextButton.Text = ""
                TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton.TextSize = 14.000
                TextButton.TextWrapped = true

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = TextButton

                Frame.Parent = TextButton
                Frame.BorderSizePixel = 0
                Frame.BackgroundColor3 = MainColor
                Frame.Size = UDim2.new(0, 48, 0, 7)

                UICorner_22.CornerRadius = UDim.new(0, 5)
                UICorner_22.Parent = Frame

                Number.Name = "Number"
                Number.Parent = Slider
                Number.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Number.BackgroundTransparency = 1.000
                Number.Position = UDim2.new(0.882608712, 0, 0, 0)
                Number.Size = UDim2.new(0.11304348, 0, 1, 0)
                Number.Font = Enum.Font.Gotham
                Number.Text = tostring(currentvalue)
                Number.TextColor3 = Color3.fromRGB(68, 68, 68)
                Number.TextSize = 12.000
                Number.TextWrapped = true

                TextButton.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 97) * Frame.AbsoluteSize.X) + tonumber(minvalue)) or 0
                if Value ~= nil then
                    Number.Text = tostring(Value)
                end
                pcall(function()
                    callback(Value)
                end)
                Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 97), 0, 7)
                moveconnection = mouse.Move:Connect(function()
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 97) * Frame.AbsoluteSize.X) + tonumber(minvalue))
                    if Value ~= nil then
                        Number.Text = tostring(Value)
                    end
                    pcall(function()
                        callback(Value)
                    end)
                    Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 97), 0, 7)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 97) * Frame.AbsoluteSize.X) + tonumber(minvalue))
                        if Value ~= nil then
                            Number.Text = tostring(Value)
                        end
                        pcall(function()
                            callback(Value)
                        end)
                        Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 97), 0, 7)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
            end

            function ThingsX:Label(Text)
                local Label = Instance.new("Frame")
                local TextLabel = Instance.new("TextLabel")
    
                Label.Name = Text.."_Label"
                Label.Parent = Things
                Label.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                Label.BorderSizePixel = 0
                Label.Size = UDim2.new(0, 230, 0, 25)
    
                TextLabel.Parent = Label
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Font = Enum.Font.Gotham
                TextLabel.Text = Text
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextSize = 16.000
                TextLabel.TextWrapped = true
            end

            function ThingsX:TinyLabel(Text)
                local TinyLabel = Instance.new("Frame")
                local TextLabel_2 = Instance.new("TextLabel")

                TinyLabel.Name = Text.."_TinyLabel"
                TinyLabel.Parent = Things
                TinyLabel.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                TinyLabel.BorderSizePixel = 0
                TinyLabel.Position = UDim2.new(0, 0, 0.140909091, 0)
                TinyLabel.Size = UDim2.new(0, 230, 0, 17)

                TextLabel_2.Parent = TinyLabel
                TextLabel_2.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                TextLabel_2.BackgroundTransparency = 1.000
                TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
                TextLabel_2.Font = Enum.Font.Gotham
                TextLabel_2.Text = Text
                TextLabel_2.TextColor3 = Color3.fromRGB(68, 68, 68)
                TextLabel_2.TextSize = 12.000
                TextLabel_2.TextWrapped = true
            end

            function ThingsX:Dropdown(dropdownname,drtable,callback)
                callback = callback or function() end
                drtable = drtable or {}
                opened = false

                local Dropdown = Instance.new("Frame")
                local DropdownTitle = Instance.new("TextLabel")
                local ScrollingDropDown = Instance.new("ScrollingFrame")
                local UIListLayout = Instance.new("UIListLayout")
                local CloseDropdown = Instance.new("TextButton")

                Dropdown.Name = dropdownname.."_Dropdown"
                Dropdown.Parent = Things
                Dropdown.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                Dropdown.BorderSizePixel = 0
                Dropdown.Position = UDim2.new(0, 0, 0.418918908, 0)
                Dropdown.Size = UDim2.new(0, 230, 0, 26)

                DropdownTitle.Name = "DropdownTitle"
                DropdownTitle.Parent = Dropdown
                DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownTitle.BackgroundTransparency = 1.000
                DropdownTitle.Position = UDim2.new(0.0304347817, 0, 0, 0)
                DropdownTitle.Size = UDim2.new(0.800000012, 0, 0, 28)
                DropdownTitle.Font = Enum.Font.Gotham
                DropdownTitle.Text = dropdownname
                DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                DropdownTitle.TextSize = 16.000
                DropdownTitle.TextWrapped = true
                DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

                ScrollingDropDown.Name = "ScrollingDropDown"
                ScrollingDropDown.Parent = Dropdown
                ScrollingDropDown.Active = true
                ScrollingDropDown.CanvasSize = UDim2.new(0,0,5,0)
                ScrollingDropDown.AnchorPoint = Vector2.new(0.5, 0)
                ScrollingDropDown.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                ScrollingDropDown.BorderSizePixel = 0
                ScrollingDropDown.Position = UDim2.new(0.5, 0, 0.289999992, 0)
                ScrollingDropDown.Size = UDim2.new(0.949999988, 0, 0, 0)
                ScrollingDropDown.ScrollBarThickness = 0

                UIListLayout.Parent = ScrollingDropDown
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 5)

                CloseDropdown.Name = "CloseDropdown"
                CloseDropdown.Parent = Dropdown
                CloseDropdown.AnchorPoint = Vector2.new(1, 0)
                CloseDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CloseDropdown.BackgroundTransparency = 1.000
                CloseDropdown.Position = UDim2.new(1, 0, -3.7252903e-09, 0)
                CloseDropdown.Rotation = 90.000
                CloseDropdown.Size = UDim2.new(0, 27, 0, 27)
                CloseDropdown.AutoButtonColor = false
                CloseDropdown.Font = Enum.Font.GothamMedium
                CloseDropdown.Text = "v"
                CloseDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
                CloseDropdown.TextSize = 18.000

                
                local Choosed = Instance.new("TextLabel")
                
                Choosed.Name = "Choosed"
                Choosed.Parent = Dropdown
                Choosed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Choosed.BackgroundTransparency = 1.000
                Choosed.Position = UDim2.new(0.556521714, 0, 0.0869565234, 0)
                Choosed.Size = UDim2.new(0.326086998, 0, -0.184782609, 28)
                Choosed.Font = Enum.Font.Gotham
                Choosed.Text = ""
                Choosed.TextColor3 = Color3.fromRGB(68, 68, 68)
                Choosed.TextSize = 12.000
                Choosed.TextWrapped = true
                Choosed.TextXAlignment = Enum.TextXAlignment.Right
                local cooldown = false
                CloseDropdown.MouseButton1Down:Connect(function()
                    if cooldown == false then
                        opened = not opened
                        cooldown = true
                        if opened then
                            TweenService:Create(Dropdown, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 230, 0, 92)}):Play()
                            TweenService:Create(CloseDropdown, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 0}):Play()
                            wait(0.2)
                            TweenService:Create(ScrollingDropDown, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0.95, 0,0.674, 0)}):Play()
                        elseif opened == false then
                            TweenService:Create(ScrollingDropDown, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0.949999988, 0, 0, 0)}):Play()
                            TweenService:Create(CloseDropdown, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 90}):Play()
                            wait(0.2)
                            TweenService:Create(Dropdown, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 230, 0, 26)}):Play()
                        end
                        wait(0.4)
                        cooldown = false
                    end
                end)

                for i,v in next,drtable do
                    local TextButton = Instance.new("TextButton")
                    TextButton.Parent = ScrollingDropDown
                    TextButton.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
                    TextButton.BorderSizePixel = 0
                    TextButton.Size = UDim2.new(1, 0, 0.04, 0)
                    TextButton.AutoButtonColor = false
                    TextButton.Font = Enum.Font.GothamMedium
                    TextButton.Text = v
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 14.000
                    TextButton.TextWrapped = true

                    TextButton.MouseButton1Down:Connect(function()
                        TweenService:Create(TextButton, TweenInfo.new(0.13, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainColor}):Play()
                        Choosed.Text = v
                        callback(v)
                    end)
    
                    TextButton.MouseButton1Up:Connect(function()
                        TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(21, 21, 21)}):Play()
                    end)

                    TextButton.MouseEnter:Connect(function()
                        IsDown = false
                        TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
                    end)
    
                    TextButton.MouseLeave:Connect(function()
                        IsDown = false
                        TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(17, 17, 17)}):Play()
                    end)

                end

            end

            function ThingsX:Button(text, callback)
                local callback = callback or function() end

                local Buttonn = Instance.new("Frame")
                local TextButton = Instance.new("TextButton")

                Buttonn.Name = text.."_Button"
                Buttonn.Parent = Things
                TextButton.Parent = Buttonn

                Buttonn.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                Buttonn.BorderSizePixel = 0
                Buttonn.Size = UDim2.new(0, 230, 0, 25)


                TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                TextButton.BorderSizePixel = 0
                TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton.Size = UDim2.new(0, 222, 0, 17)
                TextButton.AutoButtonColor = false
                TextButton.Font = Enum.Font.GothamMedium
                TextButton.Text = text
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 18.000
                TextButton.TextWrapped = true

                IsDown = nil

                TextButton.MouseButton1Down:Connect(function()
                    IsDown = true
                    TweenService:Create(TextButton, TweenInfo.new(0.13, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainColor}):Play()
                    pcall(callback)
                end)

                TextButton.MouseButton1Up:Connect(function()
                    if IsDown then
                        IsDown = not IsDown
                        TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(29, 29, 29)}):Play()
                    end
                end)

                TextButton.MouseEnter:Connect(function()
                    IsDown = false
                    TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(36, 36, 36)}):Play()
                end)

                TextButton.MouseLeave:Connect(function()
                    IsDown = false
                    TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(29, 29, 29)}):Play()
                end)
            end

            function ThingsX:KeyBind(text, callback)
                local callback = callback or function() end
                keyb = keyb or nil

                local KeyBind = Instance.new("Frame")
                local TextLabel = Instance.new("TextLabel")
                local Box = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")

                KeyBind.Name = text.."_KeyBind"
                KeyBind.Parent = Things
                KeyBind.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                KeyBind.BorderSizePixel = 0
                KeyBind.Size = UDim2.new(0, 230, 0, 28)

                TextLabel.Parent = KeyBind
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.Position = UDim2.new(0.0304347817, 0, 0, 0)
                TextLabel.Size = UDim2.new(0.630434811, 0, 1, 0)
                TextLabel.Font = Enum.Font.Gotham
                TextLabel.Text = text
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextSize = 15.000
                TextLabel.TextWrapped = true
                TextLabel.TextXAlignment = Enum.TextXAlignment.Left

                Box.Name = "Box"
                Box.Parent = KeyBind
                Box.AnchorPoint = Vector2.new(0.5, 0.5)
                Box.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Box.Position = UDim2.new(0.89200002, 0, 0.5, 0)
                Box.Size = UDim2.new(0, 39, 0, 20)
                Box.AutoButtonColor = false
                Box.Font = Enum.Font.Gotham
                Box.Text = "None"
                Box.TextColor3 = Color3.fromRGB(255, 255, 255)
                Box.TextSize = 13.000

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Box

                Box.MouseButton1Down:Connect(function()
                    Box.Text = "..."
                    keyb = nil
                    keybinding = game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
                        if key ~= nil or key ~= "" then
                            keyb = key
                            Box.Text = tostring(key)
                            keybinding:Disconnect()
                        end
                    end)
                end)

                game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
                    if key == keyb then
                        callback()
                    end
                end)

            end

            function ThingsX:TextBox(textboxtext,placeholder,callback)
                textboxtext = textboxtext or ""
                placeholder = placeholder or ""
                callback = callback or function() end
                local val

                local TextBox = Instance.new("Frame")
                local TextLabel_4 = Instance.new("TextLabel")
                local Box = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")
                
                TextBox.Name = textboxtext.."_TextBox"
                TextBox.Parent = Things
                TextBox.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                TextBox.BorderSizePixel = 0
                TextBox.Size = UDim2.new(0, 230, 0, 28)
                
                TextLabel_4.Parent = TextBox
                TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_4.BackgroundTransparency = 1.000
                TextLabel_4.Position = UDim2.new(0.0304347817, 0, 0, 0)
                TextLabel_4.Size = UDim2.new(0.630434811, 0, 1, 0)
                TextLabel_4.Font = Enum.Font.Gotham
                TextLabel_4.Text = textboxtext
                TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_4.TextSize = 15.000
                TextLabel_4.TextWrapped = true
                TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
                
                Box.Name = "Box"
                Box.Parent = TextBox
                Box.AnchorPoint = Vector2.new(0.5, 0.5)
                Box.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Box.Position = UDim2.new(0.819565237, 0, 0.5, 0)
                Box.Size = UDim2.new(0, 73, 0, 20)
                Box.Font = Enum.Font.Gotham
                Box.PlaceholderColor3 = Color3.fromRGB(68, 68, 68)
                Box.PlaceholderText = placeholder
                Box.Text = ""
                Box.TextColor3 = Color3.fromRGB(255, 255, 255)
                Box.TextSize = 11.000
                Box.TextWrapped = true
                
                UICorner_2.CornerRadius = UDim.new(0, 5)
                UICorner_2.Parent = Box

                Box.MouseEnter:Connect(function()
                    IsDown = false
                    TweenService:Create(Box, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                end)

                Box.MouseLeave:Connect(function()
                    IsDown = false
                    TweenService:Create(Box, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}):Play()
                end)


                Box.FocusLost:Connect(function()
                    callback(Box.Text)
                end)

            end

            function ThingsX:Toggle(text,value,callback)
                callback = callback or function() end
                local toggled = value

                local Toggle = Instance.new("Frame")
                local TextLabel_3 = Instance.new("TextLabel")
                local TextButton = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = TextButton

                Toggle.Name = text.."_Toggle"
                Toggle.Parent = Things
                Toggle.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                Toggle.BorderSizePixel = 0
                Toggle.Position = UDim2.new(0, 0, 0.234234229, 0)
                Toggle.Size = UDim2.new(0, 230, 0, 28)

                TextLabel_3.Parent = Toggle
                TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_3.BackgroundTransparency = 1.000
                TextLabel_3.Position = UDim2.new(0.0304347817, 0, 0, 0)
                TextLabel_3.Size = UDim2.new(0.852173924, 0, 1, 0)
                TextLabel_3.Font = Enum.Font.Gotham
                TextLabel_3.Text = text
                TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_3.TextSize = 16.000
                TextLabel_3.TextWrapped = true
                TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

                TextButton.Parent = Toggle
                TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
                if value then
                    TextButton.BackgroundColor3 = MainColor
                elseif value == false then
                    TextButton.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                end
                TextButton.Position = UDim2.new(0.932608724, 0, 0.5, 0)
                TextButton.Size = UDim2.new(0, 23, 0, 23)
                TextButton.AutoButtonColor = false
                TextButton.Font = Enum.Font.SourceSans
                TextButton.Text = ""
                TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton.TextSize = 14.000
                TextButton.TextWrapped = true

                TextButton.MouseButton1Down:Connect(function()
                    toggled = not toggled
                    pcall(callback,toggled)
                    
                    if toggled == false then
                        TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}):Play()
                    elseif toggled == true then
                        TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = MainColor}):Play()
                    end
                end)
            end

            function LoadPage(PageName)
                for i,v in pairs(PagesFolder:GetChildren()) do
                    if v.Name == PageName.."_Page" then
                        v.Visible = true
                    end
                end
                for i,v in pairs(Pages:GetChildren()) do
                    if v.Name == PageName.."_PageIcon" then
                        TweenService:Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = MainColor}):Play()
                    end
                end
            end

            return ThingsX

        end

        for i,v in next, PagesFolder:GetChildren() do
            if v:IsA("Frame") then
               v.Visible = false
           end
        end

        --DRAGGABLE NOT BY ME!
            dragToggle = nil
            dragSpeed = .5 
            dragInput = nil
            dragStart = nil
            dragPos = nil
    
            function updateInput(input)
                Delta = input.Position - dragStart
                Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
                game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(.25), {Position = Position}):Play()
            end
    
            MainFrame.InputBegan:Connect(function(input)
                if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                    dragToggle = true
                    dragStart = input.Position
                    startPos = MainFrame.Position
                    input.Changed:Connect(function()
                        if (input.UserInputState == Enum.UserInputState.End) then
                            dragToggle = false
                        end
                    end)
                end
            end)
    
            MainFrame.InputChanged:Connect(function(input)
                if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    dragInput = input
                end
            end)
    
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if (input == dragInput and dragToggle) then
                    updateInput(input)
                end
            end)

        return SectionX

    end
    
    return PageX

end

function Library:Notify(title,notifytext,waiting)

    local LynXNotify = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local NTitle = Instance.new("TextLabel")
    local NText = Instance.new("TextLabel")
    local UIGradient = Instance.new("UIGradient")
    local Image = Instance.new("ImageLabel")

    LynXNotify.Name = "LynXNotify"
    LynXNotify.Parent = game.CoreGui
    LynXNotify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = LynXNotify
    Frame.AnchorPoint = Vector2.new(0, 1)
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0, 5, 1, -5)
    Frame.Size = UDim2.new(0, 0, 0, 44)
    Frame.ZIndex = 10

    UICorner.CornerRadius = UDim.new(0, 3)
    UICorner.Parent = Frame

    NTitle.Name = "NTitle"
    NTitle.Parent = Frame
    NTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NTitle.BackgroundTransparency = 1.000
    NTitle.Position = UDim2.new(0, 24, 0, 5)
    NTitle.Size = UDim2.new(0, 162, 0, 15)
    NTitle.Font = Enum.Font.GothamBold
    NTitle.Text = title
    NTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NTitle.TextScaled = true
    NTitle.TextSize = 14.000
    NTitle.TextWrapped = true
    NTitle.TextTransparency = 1
    NTitle.TextXAlignment = Enum.TextXAlignment.Left

    NText.Name = "NText"
    NText.Parent = Frame
    NText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NText.BackgroundTransparency = 1.000
    NText.Position = UDim2.new(0, 5, 0, 22)
    NText.Size = UDim2.new(0, 209, 0, 15)
    NText.Font = Enum.Font.GothamMedium
    NText.Text = notifytext
    NText.TextColor3 = Color3.fromRGB(255, 255, 255)
    NText.TextScaled = true
    NText.TextSize = 14.000
    NText.TextWrapped = true
    NText.TextTransparency = 1
    NText.TextXAlignment = Enum.TextXAlignment.Left

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(29, 29, 29)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(13, 13, 13))}
    UIGradient.Rotation = 5
    UIGradient.Parent = Frame

    Image.Name = "Image"
    Image.Parent = Frame
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1.000
    Image.Position = UDim2.new(0, 5, 0, 5)
    Image.Size = UDim2.new(0, 15, 0, 15)
    Image.Image = "rbxassetid://7072978559"
    Image.ImageTransparency = 1

    TweenService:Create(Frame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 221, 0, 44)}):Play()
    wait(0.3)
    TweenService:Create(NTitle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 0}):Play()
    TweenService:Create(NText, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 0}):Play()
    TweenService:Create(Image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageTransparency = 0}):Play()
    wait(waiting)
    TweenService:Create(NTitle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
    TweenService:Create(NText, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
    TweenService:Create(Image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
    wait(0.3)
    TweenService:Create(Frame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 44)}):Play()
    wait(0.2)
    LynXNotify:Destroy()
end

return Library
