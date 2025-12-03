-- // Servicios
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- // Variables locales
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local playerGui = player:WaitForChild("PlayerGui")

-- // Creación de la GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 200)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1) -- Blanco
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true

-- // Botón de cierre
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 24, 0, 24)
closeButton.Position = UDim2.new(1, -30, 0, 6)
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextColor3 = Color3.new(0, 0, 0)
closeButton.BackgroundColor3 = Color3.new(1, 1, 1)
closeButton.BorderSizePixel = 0
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
end)

-- // Botón de minimizar
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 24, 0, 24)
minimizeButton.Position = UDim2.new(1, -55, 0, 6)
minimizeButton.AnchorPoint = Vector2.new(1, 0)
minimizeButton.Text = "-"
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextColor3 = Color3.new(0, 0, 0)
minimizeButton.BackgroundColor3 = Color3.new(1, 1, 1)
minimizeButton.BorderSizePixel = 0
minimizeButton.Parent = mainFrame

local floatingButton = Instance.new("ImageButton")
floatingButton.Size = UDim2.new(0, 30, 0, 30)
floatingButton.Position = UDim2.new(0.9, 0.9, 0, 0)
floatingButton.BackgroundTransparency = 0.5
floatingButton.Image = "rbxassetid://11644581963" -- Reemplaza con el ID de tu imagen
floatingButton.Visible = false
floatingButton.Draggable = true
floatingButton.Parent = screenGui

local isMinimized = false

local function toggleMinimize()
    isMinimized = not isMinimized
    if isMinimized then
        -- Ocultar la GUI principal
        TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -100, 2, 0)}):Play()
        floatingButton.Visible = true
    else
        -- Mostrar la GUI principal
        TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -100, 0.5, -100)}):Play()
        floatingButton.Visible = false
    end
end

minimizeButton.MouseButton1Click:Connect(toggleMinimize)
floatingButton.MouseButton1Click:Connect(toggleMinimize)

-- // Botón de boost de velocidad
local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0, 80, 0, 30)
speedButton.Position = UDim2.new(0.25, 0, 0.7, 0)
speedButton.AnchorPoint = Vector2.new(0.5, 0)
speedButton.Text = "Velocidad"
speedButton.Font = Enum.Font.SourceSansBold
speedButton.TextColor3 = Color3.new(1, 1, 1)
speedButton.BackgroundColor3 = Color3.new(0, 0.7, 0.7) -- Verde azulado
speedButton.BorderSizePixel = 0
speedButton.Parent = mainFrame
speedButton.Shape = Enum.ButtonShape.Round

local defaultWalkSpeed = humanoid.WalkSpeed
local speedBoostAmount = 30
local speedBoostDuration = 5

speedButton.MouseButton1Click:Connect(function()
    humanoid.WalkSpeed = speedBoostAmount
    wait(speedBoostDuration)
    humanoid.WalkSpeed = defaultWalkSpeed
end)

-- // Botón de boost de salto
local jumpButton = Instance.new("TextButton")
jumpButton.Size = UDim2.new(0, 80, 0, 30)
jumpButton.Position = UDim2.new(0.75, 0, 0.7, 0)
jumpButton.AnchorPoint = Vector2.new(0.5, 0)
jumpButton.Text = "Salto"
jumpButton.Font = Enum.Font.SourceSansBold
jumpButton.TextColor3 = Color3.new(1, 1, 1)
jumpButton.BackgroundColor3 = Color3.new(0.5, 0, 0.5) -- Morado
jumpButton.BorderSizePixel = 0
jumpButton.Parent = mainFrame
jumpButton.Shape = Enum.ButtonShape.Round

local defaultJumpPower = humanoid.JumpPower
local jumpBoostAmount = 80
local jumpBoostDuration = 5

jumpButton.MouseButton1Click:Connect(function()
    humanoid.JumpPower = jumpBoostAmount
    wait(jumpBoostDuration)
    humanoid.JumpPower = defaultJumpPower
end)
