-- CELESTIAL SYNDICATE | Black Hole Aura UI
-- Cosmetic-only LocalScript. OWNER tag is shown only on your own character
-- when your account username is SUPERMONKXSCRIPTS. No chat spam, kicks, or exploit actions.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("CelestialBlackHoleUI")
if old then old:Destroy() end

local BLACK = Color3.fromRGB(5, 5, 12)
local PURPLE = Color3.fromRGB(145, 75, 255)
local SILVER = Color3.fromRGB(220, 225, 245)
local DEEP = Color3.fromRGB(20, 12, 35)

local gui = Instance.new("ScreenGui")
gui.Name = "CelestialBlackHoleUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(330, 235)
main.Position = UDim2.new(0.5, -165, 0.5, -117)
main.BackgroundColor3 = BLACK
main.BorderSizePixel = 0
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)
local stroke = Instance.new("UIStroke", main)
stroke.Color = PURPLE
stroke.Thickness = 2

local grad = Instance.new("UIGradient", main)
grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 8, 35)),
    ColorSequenceKeypoint.new(0.55, BLACK),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 22))
})
grad.Rotation = 25

local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, -55, 0, 38)
header.Position = UDim2.fromOffset(14, 8)
header.BackgroundTransparency = 1
header.Text = "✦ CELESTIAL SYNDICATE"
header.TextColor3 = SILVER
header.Font = Enum.Font.GothamBlack
header.TextSize = 16
header.TextXAlignment = Enum.TextXAlignment.Left
header.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.new(1, -39, 0, 10)
close.BackgroundColor3 = DEEP
close.Text = "×"
close.TextColor3 = SILVER
close.Font = Enum.Font.GothamBold
close.TextSize = 22
close.Parent = main
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -28, 0, 22)
subtitle.Position = UDim2.fromOffset(14, 46)
subtitle.BackgroundTransparency = 1
subtitle.Text = "BLACK HOLE AURA  •  COSMETIC MODE"
subtitle.TextColor3 = PURPLE
subtitle.Font = Enum.Font.GothamBold
subtitle.TextSize = 10
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = main

local orb = Instance.new("Frame")
orb.Size = UDim2.fromOffset(78, 78)
orb.Position = UDim2.new(0.5, -39, 0, 78)
orb.BackgroundColor3 = Color3.fromRGB(1, 1, 4)
orb.BorderSizePixel = 0
orb.Parent = main
Instance.new("UICorner", orb).CornerRadius = UDim.new(1, 0)
local orbStroke = Instance.new("UIStroke", orb)
orbStroke.Color = PURPLE
orbStroke.Thickness = 3
orbStroke.Transparency = 0.1

local core = Instance.new("Frame")
core.Size = UDim2.fromOffset(45, 45)
core.Position = UDim2.new(0.5, -22, 0.5, -22)
core.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
core.BorderSizePixel = 0
core.Parent = orb
Instance.new("UICorner", core).CornerRadius = UDim.new(1, 0)
local coreStroke = Instance.new("UIStroke", core)
coreStroke.Color = Color3.fromRGB(90, 35, 180)
coreStroke.Thickness = 2

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -24, 0, 26)
status.Position = UDim2.new(0, 12, 1, -38)
status.BackgroundTransparency = 1
status.Text = "◉ AURA VISUAL: ACTIVE"
status.TextColor3 = SILVER
status.Font = Enum.Font.GothamBold
status.TextSize = 12
status.Parent = main

local dragging, dragStart, startPos = false, nil, nil
header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
close.Activated:Connect(function() gui:Destroy() end)

task.spawn(function()
    while gui.Parent do
        TweenService:Create(orb, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.fromOffset(86, 86),
            Position = UDim2.new(0.5, -43, 0, 74)
        }):Play()
        TweenService:Create(orbStroke, TweenInfo.new(1.2), {Transparency = 0.45}):Play()
        task.wait(1.2)
        if not gui.Parent then break end
        TweenService:Create(orb, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.fromOffset(78, 78),
            Position = UDim2.new(0.5, -39, 0, 78)
        }):Play()
        TweenService:Create(orbStroke, TweenInfo.new(1.2), {Transparency = 0.1}):Play()
        task.wait(1.2)
    end
end)

-- Cosmetic owner tag: only the actual matching local account gets this title.
local function addOwnerTitle(character)
    if string.lower(player.Name) ~= "supermonkxscripts" then return end
    local head = character:WaitForChild("Head", 8)
    if not head then return end
    local prior = head:FindFirstChild("CelestialOwnerTitle")
    if prior then prior:Destroy() end

    local bill = Instance.new("BillboardGui")
    bill.Name = "CelestialOwnerTitle"
    bill.Size = UDim2.fromOffset(190, 54)
    bill.StudsOffset = Vector3.new(0, 3.1, 0)
    bill.AlwaysOnTop = true
    bill.MaxDistance = 120
    bill.Parent = head

    local title = Instance.new("TextLabel")
    title.Size = UDim2.fromScale(1, 1)
    title.BackgroundColor3 = Color3.fromRGB(5, 3, 12)
    title.BackgroundTransparency = 0.12
    title.Text = "🕳 OWNER • CELESTIAL"
    title.TextColor3 = SILVER
    title.TextStrokeColor3 = Color3.fromRGB(90, 35, 180)
    title.TextStrokeTransparency = 0.15
    title.Font = Enum.Font.GothamBlack
    title.TextScaled = true
    title.Parent = bill
    Instance.new("UICorner", title).CornerRadius = UDim.new(0, 9)
    local edge = Instance.new("UIStroke", title)
    edge.Color = PURPLE
    edge.Thickness = 1.5
end

if player.Character then task.spawn(addOwnerTitle, player.Character) end
player.CharacterAdded:Connect(addOwnerTitle)
