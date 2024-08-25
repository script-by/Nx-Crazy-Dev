-- Script externo que utiliza la configuración global
local settings = getgenv().Camlock_Settings

-- Definir valores esperados para evitar modificaciones
local expectedVersion = "2.5.1"
local expectedCredits = "nxcrazy.dev"
local expectedDiscordServer = "discord.gg/ZmEYzHgttd"

-- Verificar si los valores de configuración son correctos
if settings.Version ~= expectedVersion or
   settings.Credits ~= expectedCredits or
   settings.DiscordServer ~= expectedDiscordServer then

    -- Expulsar al jugador si la configuración ha sido modificada
    game.Players.LocalPlayer:Kick("Configuración modificada. No se permite el uso del aimbot.")
    return
end

-- Obtener el jugador local y la cámara
local player = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local aimbotEnabled = false
local targetPlayer = nil

-- Crear la GUI para el aimbot
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AimbotGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui

-- Crear el ImageButton con esquinas redondeadas
local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 150, 0, 50)
toggleButton.Position = UDim2.new(1, -160, 0, 10)
toggleButton.Image = "rbxassetid://82986318131079"  -- Imagen cuando está desactivado
toggleButton.BackgroundTransparency = 1
toggleButton.BorderSizePixel = 0
toggleButton.Parent = screenGui

-- Crear un marco para aplicar el redondeo
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10) -- Ajusta el radio del redondeo
buttonCorner.Parent = toggleButton

-- Función para encontrar el jugador en el centro de la pantalla
local function getPlayerInCenterOfScreen()
    local centerScreenPosition = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild(settings.AimPart) then
            local pos = camera:WorldToViewportPoint(v.Character[settings.AimPart].Position)
            local distance = (Vector2.new(pos.X, pos.Y) - centerScreenPosition).magnitude
            if distance < shortestDistance then
                closestPlayer = v
                shortestDistance = distance
            end
        end
    end

    return closestPlayer
end

-- Función para calcular la posición predicha del objetivo
local function predictTargetPosition(target)
    if target and target.Character and target.Character:FindFirstChild(settings.AimPart) then
        local humanoidRootPart = target.Character[settings.AimPart]
        local velocity = humanoidRootPart.Velocity
        local currentPos = humanoidRootPart.Position
        local predictionFactor = settings.Prediction
        local futurePos = currentPos + (velocity * predictionFactor)
        return futurePos
    end
    return nil
end

-- Función para activar o desactivar el aimbot con el botón de toggle
toggleButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        targetPlayer = getPlayerInCenterOfScreen()
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild(settings.AimPart) then
            print("Target acquired: " .. targetPlayer.Name)
            toggleButton.Image = "rbxassetid://131591401438878"  -- Imagen cuando está activado
        else
            print("No target found.")
        end
    else
        toggleButton.Image = "rbxassetid://82986318131079"  -- Imagen cuando está desactivado
    end
end)

-- Actualización de la posición de la cámara para simular el CAM Look con predicción
game:GetService("RunService").RenderStepped:Connect(function()
    if aimbotEnabled then
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild(settings.AimPart) then
            local predictedPos = predictTargetPosition(targetPlayer)
            if predictedPos then
                -- Ajustar la cámara para mirar hacia la posición predicha del objetivo
                camera.CFrame = CFrame.lookAt(camera.CFrame.Position, predictedPos)
            end
        end
    end
end)
