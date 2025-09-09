-- LocalScript (StarterPlayerScripts)
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Funciones seguras
local function getHumanoid()
    if character and character.Parent then
        local h = character:FindFirstChild("Humanoid")
        if h and h.Health > 0 then
            return h
        end
    end
    return nil
end

local function getTorso()
    if character and character.Parent then
        return character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
    end
    return nil
end

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CoolTricksGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0,400,0,350)
mainFrame.Position = UDim2.new(0.5,-200,0.5,-175)
mainFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(0,255,0)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0,15)
frameCorner.Parent = mainFrame

-- Title RGB
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Cool tricks!!!11"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = mainFrame

spawn(function()
    while true do
        local r = math.sin(tick()*2)*0.5+0.5
        local g = math.sin(tick()*2 + math.pi*2/3)*0.5+0.5
        local b = math.sin(tick()*2 + math.pi*4/3)*0.5+0.5
        title.TextColor3 = Color3.new(r,g,b)
        task.wait(0.03)
    end
end)

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0,30,0,30)
closeButton.Position = UDim2.new(1,-35,0,5)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextScaled = true
closeButton.BackgroundColor3 = Color3.fromRGB(255,0,0)
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0,10)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Scroll frame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1,-20,1,-40)
scrollFrame.Position = UDim2.new(0,10,0,35)
scrollFrame.BackgroundTransparency = 1
scrollFrame.CanvasSize = UDim2.new(0,0,0,0)
scrollFrame.ScrollBarThickness = 8
scrollFrame.Parent = mainFrame

local uiLayout = Instance.new("UIListLayout")
uiLayout.Padding = UDim.new(0,10)
uiLayout.FillDirection = Enum.FillDirection.Vertical
uiLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiLayout.VerticalAlignment = Enum.VerticalAlignment.Top
uiLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiLayout.Parent = scrollFrame

-- Click sound
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://18755588842"
clickSound.Volume = 1
clickSound.Parent = scrollFrame

-- ==============================
-- Funciones de animaciones
-- ==============================
local function do360NS()
    local h = getHumanoid()
    local t = getTorso()
    if not h or not t then return end
    h:ChangeState(Enum.HumanoidStateType.Jumping)
    task.wait(0.1)
    local originalCFrame = t.CFrame
    local rotateTime = 0
    local duration = 0.5
    local connection
    connection = RunService.RenderStepped:Connect(function(dt)
        rotateTime = rotateTime + dt
        local perc = rotateTime / duration
        if perc >= 1 or not t.Parent or not h or h.Health <= 0 then connection:Disconnect() return end
        t.CFrame = originalCFrame * CFrame.Angles(0, math.rad(720*perc), 0)
    end)
end

local function fallDown()
    local h = getHumanoid()
    local t = getTorso()
    if not h or not t then return end
    pcall(function()
        h.PlatformStand = true
        local originalCFrame = t.CFrame
        local duration = 2
        local elapsed = 0
        while elapsed < duration and h.Health > 0 and t.Parent do
            elapsed = elapsed + RunService.RenderStepped:Wait()
            local progress = elapsed/duration
            t.CFrame = originalCFrame * CFrame.Angles(math.rad(-90*progress),0,0)
        end
        h.PlatformStand = false
    end)
end

local function backFlip()
    local h = getHumanoid()
    local t = getTorso()
    if not h or not t then return end
    h:ChangeState(Enum.HumanoidStateType.Jumping)
    task.wait(0.1)
    local originalCFrame = t.CFrame
    local rotateTime = 0
    local duration = 0.5
    local connection
    connection = RunService.RenderStepped:Connect(function(dt)
        rotateTime = rotateTime + dt
        local perc = rotateTime / duration
        if perc >= 1 or not t.Parent or not h or h.Health <=0 then connection:Disconnect() return end
        t.CFrame = originalCFrame * CFrame.Angles(math.rad(-360*perc),0,0)
    end)
end

local function superJump()
    local h = getHumanoid()
    if not h then return end
    pcall(function()
        h.JumpPower = 150
        h:ChangeState(Enum.HumanoidStateType.Jumping)
        task.wait(0.5)
        h.JumpPower = 50
    end)
end

local function spinTorso()
    local h = getHumanoid()
    local t = getTorso()
    if not h or not t then return end
    local originalCFrame = t.CFrame
    for i=1,36 do
        if not t.Parent or not h or h.Health<=0 then break end
        t.CFrame = originalCFrame * CFrame.Angles(0, math.rad(i*10),0)
        task.wait(0.02)
    end
end

local function crazySpinJump()
    local h = getHumanoid()
    local t = getTorso()
    local r = rootPart
    if not h or not t or not r then return end
    pcall(function()
        h.PlatformStand = true
        r.Velocity = Vector3.new(0,120,0)
        local originalCFrame = t.CFrame
        local duration = 1
        local elapsed = 0
        while elapsed < duration and h.Health > 0 and t.Parent do
            elapsed = elapsed + RunService.RenderStepped:Wait()
            local progress = elapsed / duration
            t.CFrame = originalCFrame * CFrame.Angles(math.rad(30*math.sin(progress*math.pi*2)), math.rad(360*progress), 0)
        end
        h.PlatformStand = false
    end)
end

local function crazyCombo()
    do360NS()
    task.wait(0.5)
    superJump()
    task.wait(0.5)
    backFlip()
end

-- ==============================
-- Botones y acciones (sin "Cool tricks")
-- ==============================
local actions = {
    {name="360 No Scope", func=do360NS},
    {name="Fall face down slowly for no fucking reason, im going insane help", func=fallDown},
    {name="Backflip!!!!", func=backFlip},
    {name="jump high", func=superJump},
    {name="Spin slowly", func=spinTorso},
    {name="3d cube ass spin", func=crazySpinJump},
    {name="ts crazy click me", func=crazyCombo}
}

for i, action in ipairs(actions) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0,350,0,40)
    button.BackgroundColor3 = Color3.fromRGB(0,170,0)
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.Font = Enum.Font.GothamBold
    button.TextScaled = true
    button.Text = action.name
    button.Parent = scrollFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,10)
    corner.Parent = button

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(0,255,0)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(0,170,0)
    end)

    button.MouseButton1Click:Connect(function()
        clickSound:Play()
        action.func()
    end)
end

RunService.RenderStepped:Connect(function()
    scrollFrame.CanvasSize = UDim2.new(0,0,0, uiLayout.AbsoluteContentSize.Y + 10)
end)
