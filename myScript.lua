-- Основные сервисы
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Загрузка ESP библиотеки
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"))();

-- Функция для уведомлений
local function ShowNotification(title, message, duration)
    duration = duration or 3
    warn("[NOTIFICATION] " .. title .. ": " .. message)
end

-- Простая система меню
local SimpleMenu = {
    Visible = false,
    Frame = nil,
    Elements = {}
}

function SimpleMenu:Create()
    -- Создаем основной фрейм меню
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SimpleMenu"
    screenGui.ResetOnSpawn = false
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 400)
    frame.Position = UDim2.new(0.5, -150, 0.5, -200)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Visible = false
    
    local title = Instance.new("TextLabel")
    title.Text = "Advanced Hack"
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 18
    title.Parent = frame
    
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -10, 1, -40)
    scroll.Position = UDim2.new(0, 5, 0, 35)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 5
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.Parent = frame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 5)
    layout.Parent = scroll
    
    frame.Parent = screenGui
    screenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
    
    self.Frame = frame
    self.Scroll = scroll
    self.Layout = layout
end

function SimpleMenu:AddButton(text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = text
    button.Font = Enum.Font.SourceSans
    button.TextSize = 14
    
    button.MouseButton1Click:Connect(callback)
    button.Parent = self.Scroll
    
    -- Обновляем размер canvas
    self.Scroll.CanvasSize = UDim2.new(0, 0, 0, self.Layout.AbsoluteContentSize.Y)
    
    table.insert(self.Elements, button)
    return button
end

function SimpleMenu:AddToggle(text, default, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, 0, 0, 30)
    toggleFrame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Text = text
    label.Font = Enum.Font.SourceSans
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggleFrame
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.3, 0, 1, 0)
    button.Position = UDim2.new(0.7, 0, 0, 0)
    button.BackgroundColor3 = default and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    button.Text = default and "ON" or "OFF"
    button.TextColor3 = Color3.new(0, 0, 0)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 14
    
    local state = default
    
    button.MouseButton1Click:Connect(function()
        state = not state
        button.BackgroundColor3 = state and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        button.Text = state and "ON" or "OFF"
        if callback then callback(state) end
    end)
    
    button.Parent = toggleFrame
    toggleFrame.Parent = self.Scroll
    
    -- Обновляем размер canvas
    self.Scroll.CanvasSize = UDim2.new(0, 0, 0, self.Layout.AbsoluteContentSize.Y)
    
    table.insert(self.Elements, {frame = toggleFrame, state = state})
    return {SetValue = function(self, value) end}
end

function SimpleMenu:AddLabel(text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Text = text
    label.Font = Enum.Font.SourceSans
    label.TextSize = 12
    label.Parent = self.Scroll
    
    -- Обновляем размер canvas
    self.Scroll.CanvasSize = UDim2.new(0, 0, 0, self.Layout.AbsoluteContentSize.Y)
    
    table.insert(self.Elements, label)
    return label
end

function SimpleMenu:Show()
    if self.Frame then
        self.Frame.Visible = true
        self.Visible = true
        ShowNotification("Menu", "Menu shown", 2)
    end
end

function SimpleMenu:Hide()
    if self.Frame then
        self.Frame.Visible = false
        self.Visible = false
        ShowNotification("Menu", "Menu hidden", 2)
    end
end

function SimpleMenu:Toggle()
    if self.Visible then
        self:Hide()
    else
        self:Show()
    end
end

-- Создаем простое меню
SimpleMenu:Create()

-- Настройки
local Settings = {
    SpeedEnabled = false,
    SpeedValue = 50,
    ESPEnabled = false,
    BoxESP = false,
    NameESP = false,
    HealthESP = false,
    DistanceESP = false,
    TracerESP = false,
    SkeletonESP = false,
    ChamsEnabled = false, -- Новая настройка для Chams
    AimbotEnabled = false,
    NoClipEnabled = false,
    JumpPowerEnabled = false,
    JumpPowerValue = 50,
    WallhackEnabled = false,
    MenuKey = "Insert",
    AimbotSmoothness = 0.3,
    AimbotFOV = 100
}

-- Переменные для Chams
local chamsParts = {}

-- Функции для Chams
local function findCharacterParts()
    local parts = {}
    if LocalPlayer.Character then
        -- Руки
        local leftArm = LocalPlayer.Character:FindFirstChild("Left Arm") or LocalPlayer.Character:FindFirstChild("LeftHand")
        local rightArm = LocalPlayer.Character:FindFirstChild("Right Arm") or LocalPlayer.Character:FindFirstChild("RightHand")
        
        -- Оружие/инструменты в руках
        local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        
        if leftArm then table.insert(parts, leftArm) end
        if rightArm then table.insert(parts, rightArm) end
        if tool then 
            -- Добавляем все части инструмента
            for _, part in ipairs(tool:GetDescendants()) do
                if part:IsA("BasePart") then
                    table.insert(parts, part)
                end
            end
        end
    end
    return parts
end

local function applyChamsEffect(part)
    -- Изменяем материальные свойства
    part.Material = Enum.Material.ForceField -- Полупрозрачный материал
    part.Color = Color3.fromRGB(138, 43, 226) -- Фиолетовый цвет
    part.Transparency = 0.3 -- Прозрачность
    
    -- Добавляем свечение
    local glow = part:FindFirstChild("ChamsGlow") or Instance.new("SurfaceLight")
    glow.Name = "ChamsGlow"
    glow.Color = Color3.fromRGB(138, 43, 226)
    glow.Brightness = 2
    glow.Range = 5
    glow.Parent = part
end

local function removeChamsEffect(part)
    -- Восстанавливаем оригинальные свойства
    part.Material = Enum.Material.Plastic
    part.Transparency = 0
    part.Color = Color3.fromRGB(255, 255, 255)
    
    -- Удаляем свечение
    local glow = part:FindFirstChild("ChamsGlow")
    if glow then
        glow:Destroy()
    end
end

local function enableChams()
    local parts = findCharacterParts()
    for _, part in ipairs(parts) do
        applyChamsEffect(part)
        table.insert(chamsParts, part)
    end
end

local function disableChams()
    for _, part in ipairs(chamsParts) do
        removeChamsEffect(part)
    end
    chamsParts = {}
end

-- Переменные для аимбота
local CurrentTarget = nil
local isAiming = false
local fovCircle

-- Создаем FOV круг для аимбота
local function CreateFOVCircle()
    local success, circle = pcall(function()
        return Drawing.new("Circle")
    end)
    
    if success then
        circle.Visible = false
        circle.Color = Color3.fromRGB(255, 0, 0)
        circle.Thickness = 2
        circle.Transparency = 1
        circle.Filled = false
        circle.Radius = Settings.AimbotFOV
        circle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        return circle
    else
        ShowNotification("Ошибка", "Drawing API недоступно", 5)
        return {
            Visible = false,
            Radius = Settings.AimbotFOV,
            Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        }
    end
end

fovCircle = CreateFOVCircle()

-- Функции аимбота
local function FindTarget()
    local closestPlayer = nil
    local closestDistance = Settings.AimbotFOV
    local mousePos = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local head = player.Character:FindFirstChild("Head")

            if humanoid and humanoid.Health > 0 and head then
                local screenPos, visible = Camera:WorldToViewportPoint(head.Position)

                if visible then
                    local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end
    return closestPlayer
end

local function AimAtTarget()
    if not CurrentTarget or not CurrentTarget.Character then
        CurrentTarget = FindTarget()
        if not CurrentTarget then return false end
    end

    local head = CurrentTarget.Character:FindFirstChild("Head")
    if not head then
        CurrentTarget = nil
        return false
    end

    local humanoid = CurrentTarget.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then
        CurrentTarget = nil
        return false
    end

    local screenPos = Camera:WorldToViewportPoint(head.Position)
    if screenPos.Z < 0 then
        CurrentTarget = nil
        return false
    end

    local mousePos = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    local targetPos = Vector2.new(screenPos.X, screenPos.Y)

    local delta = (targetPos - mousePos) * Settings.AimbotSmoothness

    -- Используем mousemoverel если доступно, иначе альтернативный метод
    local success = pcall(function()
        mousemoverel(delta.X, delta.Y)
    end)
    
    if not success then
        -- Альтернативный метод (может не работать в некоторых окружениях)
        pcall(function()
            UserInputService:MouseMove(mousePos + delta)
        end)
    end
    
    return true
end

-- Добавляем элементы в меню
SimpleMenu:AddLabel("=== ДВИЖЕНИЕ ===")
SimpleMenu:AddToggle("Скорость", false, function(state)
    Settings.SpeedEnabled = state
    ShowNotification("Скорость", state and "Включено: " .. Settings.SpeedValue or "Выключено")
end)

SimpleMenu:AddToggle("Высокий прыжок", false, function(state)
    Settings.JumpPowerEnabled = state
    ShowNotification("Прыжок", state and "Включено: " .. Settings.JumpPowerValue or "Выключено")
end)

SimpleMenu:AddToggle("Сквозь стены", false, function(state)
    Settings.NoClipEnabled = state
    if state then
        EnableNoClip()
        ShowNotification("NoClip", "Включено")
    else
        DisableNoClip()
        ShowNotification("NoClip", "Выключено")
    end
end)

SimpleMenu:AddLabel("=== ВИЗУАЛ ===")
SimpleMenu:AddToggle("ESP игроков", false, function(state)
    Settings.ESPEnabled = state
    ESP.Enabled = state
    ShowNotification("ESP", state and "Включено" or "Выключено")
end)

SimpleMenu:AddToggle("Боксы (ESP)", false, function(state)
    Settings.BoxESP = state
    ESP.ShowBox = state
    ShowNotification("Боксы ESP", state and "Включено" or "Выключено")
end)

SimpleMenu:AddToggle("Имя игрока (ESP)", false, function(state)
    Settings.NameESP = state
    ESP.ShowName = state
    ShowNotification("Имя ESP", state and "Включено" or "Выключено")
end)

SimpleMenu:AddToggle("Здоровье (ESP)", false, function(state)
    Settings.HealthESP = state
    ESP.ShowHealth = state
    ShowNotification("Здоровье ESP", state and "Включено" or "Выключено")
end)

SimpleMenu:AddToggle("Дистанция (ESP)", false, function(state)
    Settings.DistanceESP = state
    ESP.ShowDistance = state
    ShowNotification("Дистанция ESP", state and "Включено" or "Выключено")
end)

SimpleMenu:AddToggle("Трейсеры (ESP)", false, function(state)
    Settings.TracerESP = state
    ESP.ShowTracer = state
    ShowNotification("Трейсеры ESP", state and "Включено" or "Выключено")
end)

SimpleMenu:AddToggle("Скелетоны (ESP)", false, function(state)
    Settings.SkeletonESP = state
    ESP.ShowSkeletons = state
    ShowNotification("Скелетоны ESP", state and "Включено" or "Выключено")
end)

SimpleMenu:AddToggle("Chams (руки/оружие)", false, function(state)
    Settings.ChamsEnabled = state
    if state then
        enableChams()
        ShowNotification("Chams", "Включено - фиолетовое свечение")
    else
        disableChams()
        ShowNotification("Chams", "Выключено")
    end
end)

SimpleMenu:AddToggle("Сквозь стены (X-Ray)", false, function(state)
    Settings.WallhackEnabled = state
    if state then
        EnableWallhack()
        ShowNotification("X-Ray", "Включено")
    else
        DisableWallhack()
        ShowNotification("X-Ray", "Выключено")
    end
end)

SimpleMenu:AddLabel("=== БОЙ ===")
SimpleMenu:AddToggle("Аимбот", false, function(state)
    Settings.AimbotEnabled = state
    if fovCircle then 
        fovCircle.Visible = state 
        fovCircle.Radius = Settings.AimbotFOV
    end
    ShowNotification("Аимбот", state and "Включено (ПКМ)" or "Выключено")
end)

SimpleMenu:AddLabel("=== УПРАВЛЕНИЕ ===")
SimpleMenu:AddLabel("Insert - Меню")
SimpleMenu:AddLabel("N - NoClip")
SimpleMenu:AddLabel("ПКМ - Аимбот")

-- Функции NoClip
function EnableNoClip()
    if LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end

function DisableNoClip()
    if LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

-- Функции Wallhack
function EnableWallhack()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and part.Transparency < 0.5 then
            part.LocalTransparencyModifier = 0.5
        end
    end
end

function DisableWallhack()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.LocalTransparencyModifier = 0
        end
    end
end

-- Обработчики ввода
UserInputService.InputBegan:Connect(function(input)
    -- Переключение меню
    if input.KeyCode == Enum.KeyCode.Insert then
        SimpleMenu:Toggle()
    end

    -- NoClip
    if input.KeyCode == Enum.KeyCode.N then
        Settings.NoClipEnabled = not Settings.NoClipEnabled
        if Settings.NoClipEnabled then
            EnableNoClip()
            ShowNotification("NoClip", "Включено клавишей N")
        else
            DisableNoClip()
            ShowNotification("NoClip", "Выключено клавишей N")
        end
    end

    -- Аимбот
    if Settings.AimbotEnabled and input.UserInputType == Enum.UserInputType.MouseButton2 then
        isAiming = true
        CurrentTarget = FindTarget()
        if CurrentTarget then
            ShowNotification("Аимбот", "Цель: " .. CurrentTarget.Name, 2)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if Settings.AimbotEnabled and input.UserInputType == Enum.UserInputType.MouseButton2 then
        isAiming = false
        CurrentTarget = nil
    end
end)

-- Основной цикл
RunService.Heartbeat:Connect(function()
    -- Speed hack
    if Settings.SpeedEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Settings.SpeedValue
        end
    end

    -- Jump Power
    if Settings.JumpPowerEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.JumpPower = Settings.JumpPowerValue
        end
    end

    -- No Clip
    if Settings.NoClipEnabled and LocalPlayer.Character then
        EnableNoClip()
    end

    -- Аимбот
    if Settings.AimbotEnabled and isAiming then
        local success = AimAtTarget()
        if not success then
            CurrentTarget = FindTarget()
        end
    end

    -- Auto update Chams
    if Settings.ChamsEnabled then
        -- Проверяем, не изменились ли части (например, сменили оружие)
        local currentParts = findCharacterParts()
        for _, part in ipairs(currentParts) do
            if not table.find(chamsParts, part) then
                applyChamsEffect(part)
                table.insert(chamsParts, part)
            end
        end
    end
end)

-- Обновление FOV круга
if RunService.RenderStepped then
    RunService.RenderStepped:Connect(function()
        if fovCircle then
            fovCircle.Visible = Settings.AimbotEnabled
            fovCircle.Radius = Settings.AimbotFOV
            fovCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        end
    end)
end

-- Инициализация ESP библиотеки
ESP.BoxType = "Corner Box Esp"
ESP.Enabled = false
ESP.ShowBox = false
ESP.ShowName = false
ESP.ShowHealth = false
ESP.ShowDistance = false
ESP.ShowTracer = false
ESP.ShowSkeletons = false

-- Инициализация
task.spawn(function()
    wait(2)
    ShowNotification("Скрипт загружен", "Insert - меню, N - NoClip, ПКМ - аимбот", 5)
    ShowNotification("Аимбот", "Включите в меню и зажмите ПКМ для прицеливания", 5)
end)