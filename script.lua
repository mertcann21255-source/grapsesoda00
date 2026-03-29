-- 🔑 KEY
local KEY = "harununannesininayaklarınıyalıyorum01_KEY"

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- KEY GUI
local keyGui = Instance.new("ScreenGui", playerGui)

local frame = Instance.new("Frame", keyGui)
frame.Size = UDim2.new(0,200,0,120)
frame.Position = UDim2.new(0.4,0,0.4,0)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Instance.new("UICorner", frame)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.8,0,0,30)
box.Position = UDim2.new(0.1,0,0.3,0)
box.PlaceholderText = "Enter Key..."

local enter = Instance.new("TextButton", frame)
enter.Size = UDim2.new(0.8,0,0,30)
enter.Position = UDim2.new(0.1,0,0.65,0)
enter.Text = "ENTER"

-- DOĞRU KEY GİRİLİNCE SCRIPT AÇ
enter.MouseButton1Click:Connect(function()
    if box.Text == KEY then
        keyGui:Destroy()

        -- ORİJİNAL SCRIPT (DOKUNULMADI)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"))()

        local UIS = game:GetService("UserInputService")

        -- GUI BUL
        local targetGui
        repeat
            for _, v in pairs(playerGui:GetChildren()) do
                if v:IsA("ScreenGui") and v.Name ~= "Chat" then
                    targetGui = v
                end
            end
            task.wait(0.5)
        until targetGui

        -- KENDİ GUI
        local gui = Instance.new("ScreenGui", playerGui)

        -- BUTON
        local btn = Instance.new("TextButton", gui)
        btn.Size = UDim2.new(0,45,0,45)
        btn.Position = UDim2.new(0.8,0,0.4,0)
        btn.Text = "-"
        btn.BackgroundColor3 = Color3.fromRGB(15,15,15)
        btn.TextColor3 = Color3.new(1,1,1)
        btn.TextScaled = true

        Instance.new("UICorner", btn).CornerRadius = UDim.new(1,0)

        local stroke = Instance.new("UIStroke", btn)
        stroke.Thickness = 2
        stroke.Color = Color3.fromRGB(0,170,255)

        -- DRAG
        local dragging, dragInput, startPos, startInputPos

        btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                startPos = btn.Position
                startInputPos = input.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        btn.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)

        UIS.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - startInputPos
                btn.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)

        -- TOGGLE
        local enabled = true

        btn.MouseButton1Click:Connect(function()
            enabled = not enabled
            
            if enabled then
                btn.Text = "-"
                targetGui.Enabled = true
            else
                btn.Text = "+"
                targetGui.Enabled = false
            end
        end)
    end
end)
