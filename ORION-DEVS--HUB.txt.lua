--[[
    ╔══════════════════════════════════════════╗
    ║      ORION DEVS - COMPACT PREMIUM        ║
    ║   (Limpieza Total al Cerrar la Interfaz) ║
    ╚══════════════════════════════════════════╝
--]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local lplayer = Players.LocalPlayer

local parentGUI = game:GetService("CoreGui")
pcall(function()
    if not parentGUI or #parentGUI:GetChildren() == 0 then
        parentGUI = lplayer:WaitForChild("PlayerGui")
    end
end)

if parentGUI:FindFirstChild("OrionDevs_Premium") then
    parentGUI.OrionDevs_Premium:Destroy()
end

-- ============================================
-- CONFIGURACIÓN
-- ============================================
local ID_DE_TU_IMAGEN = "rbxassetid://112288597370468"
local LINK_DISCORD = "https://discord.gg/a6wgX67Jh"

-- ============================================
-- COLORES PREMIUM
-- ============================================
local THEME = {
    BG_MAIN     = Color3.fromRGB(10, 10, 12),
    BG_PANEL    = Color3.fromRGB(18, 18, 22), 
    BG_ITEM     = Color3.fromRGB(24, 24, 30),
    BG_HOVER    = Color3.fromRGB(35, 35, 42),
    STROKE      = Color3.fromRGB(55, 55, 65),
    TEXT        = Color3.fromRGB(255, 255, 255),
    TEXT_DIM    = Color3.fromRGB(130, 130, 140),
    ACCENT      = Color3.fromRGB(58, 155, 255),
    BLURPLE     = Color3.fromRGB(88, 101, 242),
    ORANGE      = Color3.fromRGB(255, 150, 50),
    PURPLE      = Color3.fromRGB(180, 100, 255)
}

local WIN_W, WIN_H = 460, 320
local SIDEBAR_W = 130
local MIN_W, MIN_H = 240, 36 

-- ============================================
-- CREAR SCREEN GUI
-- ============================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OrionDevs_Premium"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.Parent = parentGUI

-- ============================================
-- VENTANA PRINCIPAL
-- ============================================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, WIN_W, 0, WIN_H)
mainFrame.Position = UDim2.new(0.5, -WIN_W/2, 0.5, -WIN_H/2)
mainFrame.BackgroundColor3 = THEME.BG_MAIN
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = THEME.STROKE
mainStroke.Thickness = 1
mainStroke.Parent = mainFrame

-- IMAGEN DE FONDO
local bgImage = Instance.new("ImageLabel")
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = ID_DE_TU_IMAGEN
bgImage.ImageTransparency = 0.6
bgImage.ScaleType = Enum.ScaleType.Crop
bgImage.Parent = mainFrame

local bgGradient = Instance.new("Frame")
bgGradient.Size = UDim2.new(1, 0, 1, 0)
bgGradient.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bgGradient.BackgroundTransparency = 0.4
bgGradient.BorderSizePixel = 0
bgGradient.Parent = mainFrame

local gradCorner = Instance.new("UICorner")
gradCorner.CornerRadius = UDim.new(0, 16)
gradCorner.Parent = bgGradient

-- ============================================
-- BARRA SUPERIOR
-- ============================================
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 36)
topBar.BackgroundTransparency = 1
topBar.Active = true
topBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.new(0, 16, 0, 0)
title.BackgroundTransparency = 1
title.Text = "ORION DEVS"
title.TextColor3 = THEME.TEXT
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = topBar

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(0, 60, 1, 0)
subtitle.Position = UDim2.new(0, 105, 0, 0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "• Library"
subtitle.TextColor3 = THEME.TEXT_DIM
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 10
subtitle.Parent = topBar

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 24, 0, 24)
minBtn.Position = UDim2.new(1, -60, 0.5, -12)
minBtn.BackgroundColor3 = THEME.BG_ITEM
minBtn.Text = "−"
minBtn.TextColor3 = THEME.TEXT_DIM
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 16
minBtn.AutoButtonColor = false
minBtn.Parent = topBar

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 6)
minCorner.Parent = minBtn

local minStroke = Instance.new("UIStroke")
minStroke.Color = THEME.STROKE
minStroke.Thickness = 1
minStroke.Parent = minBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -32, 0.5, -12)
closeBtn.BackgroundColor3 = THEME.BG_ITEM
closeBtn.Text = "×"
closeBtn.TextColor3 = THEME.TEXT_DIM
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.AutoButtonColor = false
closeBtn.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

local closeStroke = Instance.new("UIStroke")
closeStroke.Color = THEME.STROKE
closeStroke.Thickness = 1
closeStroke.Parent = closeBtn

local searchBar = Instance.new("Frame")
searchBar.Size = UDim2.new(0, 160, 0, 22)
searchBar.Position = UDim2.new(0.5, -80, 0, 7)
searchBar.BackgroundColor3 = THEME.BG_PANEL
searchBar.Parent = topBar

local sCorner = Instance.new("UICorner")
sCorner.CornerRadius = UDim.new(1, 0)
sCorner.Parent = searchBar
local sStroke = Instance.new("UIStroke")
sStroke.Color = THEME.STROKE
sStroke.Parent = searchBar

local sText = Instance.new("TextLabel")
sText.Size = UDim2.new(1, -20, 1, 0)
sText.Position = UDim2.new(0, 12, 0, 0)
sText.BackgroundTransparency = 1
sText.Text = "🔍 Buscar..."
sText.TextColor3 = THEME.TEXT_DIM
sText.Font = Enum.Font.Gotham
sText.TextSize = 10
sText.TextXAlignment = Enum.TextXAlignment.Left
sText.Parent = searchBar

-- ============================================
-- TARJETA DE INFORMACIÓN
-- ============================================
local infoContainer = Instance.new("Frame")
infoContainer.Size = UDim2.new(1, -SIDEBAR_W - 36, 0, 36)
infoContainer.Position = UDim2.new(0, SIDEBAR_W + 24, 0, 40)
infoContainer.BackgroundColor3 = THEME.BG_PANEL
infoContainer.BackgroundTransparency = 0.2
infoContainer.BorderSizePixel = 0
infoContainer.Parent = mainFrame

local icCorner = Instance.new("UICorner")
icCorner.CornerRadius = UDim.new(0, 8)
icCorner.Parent = infoContainer

local icStroke = Instance.new("UIStroke")
icStroke.Color = THEME.STROKE
icStroke.Thickness = 1
icStroke.Parent = infoContainer

local lblInfoValue = Instance.new("TextLabel")
lblInfoValue.Size = UDim2.new(0.8, -10, 0, 16)
lblInfoValue.Position = UDim2.new(0, 10, 0.5, -8)
lblInfoValue.Text = "Creadores: Vexor, Code, Andres, Bydelet"
lblInfoValue.TextColor3 = Color3.fromRGB(46, 204, 113)
lblInfoValue.BackgroundTransparency = 1
lblInfoValue.Font = Enum.Font.GothamBold
lblInfoValue.TextSize = 9
lblInfoValue.TextXAlignment = Enum.TextXAlignment.Left
lblInfoValue.Parent = infoContainer

local lblVersionValue = Instance.new("TextLabel")
lblVersionValue.Size = UDim2.new(0.2, -10, 0, 16)
lblVersionValue.Position = UDim2.new(0.8, 0, 0.5, -8)
lblVersionValue.Text = "v1.22"
lblVersionValue.TextColor3 = THEME.TEXT_DIM
lblVersionValue.BackgroundTransparency = 1
lblVersionValue.Font = Enum.Font.GothamBold
lblVersionValue.TextSize = 10
lblVersionValue.TextXAlignment = Enum.TextXAlignment.Right
lblVersionValue.Parent = infoContainer

-- ============================================
-- SIDEBAR (Pestañas)
-- ============================================
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, SIDEBAR_W, 1, -60)
sidebar.Position = UDim2.new(0, 12, 0, 45)
sidebar.BackgroundColor3 = THEME.BG_PANEL
sidebar.BackgroundTransparency = 0.2
sidebar.Parent = mainFrame

local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 10)
sidebarCorner.Parent = sidebar

local catLayout = Instance.new("UIListLayout")
catLayout.Padding = UDim.new(0, 2)
catLayout.SortOrder = Enum.SortOrder.LayoutOrder
catLayout.Parent = sidebar
local catPad = Instance.new("UIPadding")
catPad.PaddingTop = UDim.new(0, 10)
catPad.Parent = sidebar

-- ============================================
-- PANEL DERECHO
-- ============================================
local rightPanel = Instance.new("Frame")
rightPanel.Size = UDim2.new(1, -SIDEBAR_W - 36, 1, -115)
rightPanel.Position = UDim2.new(0, SIDEBAR_W + 24, 0, 85)
rightPanel.BackgroundTransparency = 1
rightPanel.Parent = mainFrame

local contentTitle = Instance.new("TextLabel")
contentTitle.Size = UDim2.new(1, 0, 0, 24)
contentTitle.BackgroundTransparency = 1
contentTitle.Text = "Información"
contentTitle.TextColor3 = THEME.TEXT
contentTitle.Font = Enum.Font.GothamBold
contentTitle.TextSize = 15
contentTitle.TextXAlignment = Enum.TextXAlignment.Left
contentTitle.Parent = rightPanel

local contentScroll = Instance.new("ScrollingFrame")
contentScroll.Size = UDim2.new(1, 0, 1, -30)
contentScroll.Position = UDim2.new(0, 0, 0, 30)
contentScroll.BackgroundTransparency = 1
contentScroll.BorderSizePixel = 0
contentScroll.ScrollBarThickness = 2
contentScroll.ScrollBarImageColor3 = THEME.TEXT_DIM
contentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
contentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
contentScroll.Parent = rightPanel

local contentLayout = Instance.new("UIListLayout")
contentLayout.Padding = UDim.new(0, 6)
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
contentLayout.Parent = contentScroll

-- ============================================
-- LÓGICA DE MINIMIZAR
-- ============================================
local minimized = false
local originalPos = mainFrame.Position

local function toggleMinimize()
    minimized = not minimized
    
    if minimized then
        originalPos = mainFrame.Position
        sidebar.Visible = false
        rightPanel.Visible = false
        infoContainer.Visible = false
        searchBar.Visible = false
        subtitle.Visible = true
        title.Text = "ORION DEVS"
        minBtn.Text = "+"
        
        TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, MIN_W, 0, MIN_H),
            Position = UDim2.new(originalPos.X.Scale, originalPos.X.Offset + (WIN_W - MIN_W)/2, originalPos.Y.Scale, originalPos.Y.Offset)
        }):Play()
    else
        sidebar.Visible = true
        rightPanel.Visible = true
        infoContainer.Visible = true
        searchBar.Visible = true
        title.Text = "ORION DEVS"
        minBtn.Text = "−"
        
        TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, WIN_W, 0, WIN_H),
            Position = UDim2.new(originalPos.X.Scale, originalPos.X.Offset, originalPos.Y.Scale, originalPos.Y.Offset)
        }):Play()
    end
end

minBtn.MouseButton1Click:Connect(toggleMinimize)

-- ============================================
-- FUNCIÓN CREAR BOTÓN
-- ============================================
local function createCleanButton(parent, titleText, descText, btnColor, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 48)
    btn.BackgroundColor3 = THEME.BG_ITEM
    btn.BackgroundTransparency = 0.2
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.Parent = parent

    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 8)
    bCorner.Parent = btn

    local bStroke = Instance.new("UIStroke")
    bStroke.Color = THEME.STROKE
    bStroke.Thickness = 1
    bStroke.Parent = btn

    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size = UDim2.new(1, -20, 0, 16)
    titleLbl.Position = UDim2.new(0, 12, 0, 6)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = titleText
    titleLbl.TextColor3 = THEME.TEXT
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.TextSize = 11
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left
    titleLbl.Parent = btn

    local descLbl = Instance.new("TextLabel")
    descLbl.Size = UDim2.new(1, -20, 0, 12)
    descLbl.Position = UDim2.new(0, 12, 0, 24)
    descLbl.BackgroundTransparency = 1
    descLbl.Text = descText
    descLbl.TextColor3 = THEME.TEXT_DIM
    descLbl.Font = Enum.Font.Gotham
    descLbl.TextSize = 9
    descLbl.TextXAlignment = Enum.TextXAlignment.Left
    descLbl.Parent = btn

    local colorBar = Instance.new("Frame")
    colorBar.Size = UDim2.new(0, 3, 0, 20)
    colorBar.Position = UDim2.new(0, 0, 0.5, -10)
    colorBar.BackgroundColor3 = btnColor or THEME.ACCENT
    colorBar.BorderSizePixel = 0
    colorBar.Parent = btn
    local cbCorner = Instance.new("UICorner")
    cbCorner.CornerRadius = UDim.new(0, 2)
    cbCorner.Parent = colorBar

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
        TweenService:Create(bStroke, TweenInfo.new(0.2), {Color = THEME.TEXT_DIM}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
        TweenService:Create(bStroke, TweenInfo.new(0.2), {Color = THEME.STROKE}):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        if callback then
            if not minimized then
                toggleMinimize()
            end
            task.spawn(callback)
        end
    end)
end

-- ============================================
-- PESTAÑAS Y CONTENIDO
-- ============================================
local tabs = {
    {name = "Información", title = "Información", items = {}},
    {name = "Scripts Lua", title = "Scripts Lua", items = {}},
}

-- Pestaña 1: Información
table.insert(tabs[1].items, {
    title = "Únete a nuestro Discord", 
    desc = "Novedades y scripts exclusivos.", 
    color = THEME.BLURPLE, 
    callback = function() 
        if setclipboard then setclipboard(LINK_DISCORD) end
        pcall(function() if request then request({Url = LINK_DISCORD, Method = "GET"}) end end)
    end
})

table.insert(tabs[1].items, {
    title = "Scripts en Prueba (Beta)", 
    desc = "Módulos experimentales. Usar con precaución.", 
    color = THEME.ORANGE, 
    callback = function() print("Beta...") end
})

-- Pestaña 2: Scripts Lua
table.insert(tabs[2].items, {
    title = "Volar Carros (CARFLY)", 
    desc = "Ejecuta el script de vuelo.", 
    color = THEME.ACCENT,
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/script-premiu/SCRIPT-ORION-DEVS/refs/heads/main/carfyn%20nuevo.txt"))()
    end
})

table.insert(tabs[2].items, {
    title = "Gráficos - Freecam", 
    desc = "Shaders y cámara libre.", 
    color = THEME.ACCENT,
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/script-premiu/SCRIPT-ORION-DEVS/refs/heads/main/shader-freecam.txt"))()
    end
})

table.insert(tabs[2].items, {
    title = "TP / Ver Jugadores", 
    desc = "Teletransporta y muestra la lista de jugadores.", 
    color = THEME.ACCENT,
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/script-premiu/SCRIPT-ORION-DEVS/refs/heads/main/tp-ver%20jugadores.txt"))()
    end
})

table.insert(tabs[2].items, {
    title = "Plataforma Fantasma", 
    desc = "Atraviesa paredes y vuelvete invisible.", 
    color = THEME.PURPLE,
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/script-premiu/SCRIPT-ORION-DEVS/refs/heads/main/plataforma-fantasma.txt"))()
    end
})

-- ============================================
-- CONSTRUIR PESTAÑAS
-- ============================================
local activeTab = nil
local tabButtons = {}

local function buildTabContent(tabData)
    for _, child in ipairs(contentScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    contentTitle.Text = tabData.title
    for _, item in ipairs(tabData.items) do
        createCleanButton(contentScroll, item.title, item.desc, item.color, item.callback)
    end
end

for i, tab in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1, 0, 0, 30)
    tabBtn.BackgroundTransparency = 1
    tabBtn.Text = "  " .. tab.name
    tabBtn.TextColor3 = THEME.TEXT_DIM
    tabBtn.Font = Enum.Font.GothamMedium
    tabBtn.TextSize = 10
    tabBtn.TextXAlignment = Enum.TextXAlignment.Left
    tabBtn.AutoButtonColor = false
    tabBtn.LayoutOrder = i
    tabBtn.Parent = sidebar

    tabButtons[tab.name] = tabBtn

    tabBtn.MouseEnter:Connect(function()
        if activeTab ~= tab.name then
            TweenService:Create(tabBtn, TweenInfo.new(0.15), {TextColor3 = THEME.TEXT}):Play()
        end
    end)
    tabBtn.MouseLeave:Connect(function()
        if activeTab ~= tab.name then
            TweenService:Create(tabBtn, TweenInfo.new(0.15), {TextColor3 = THEME.TEXT_DIM}):Play()
        end
    end)

    tabBtn.MouseButton1Click:Connect(function()
        activeTab = tab.name
        for name, btn in pairs(tabButtons) do
            local isActive = (name == tab.name)
            TweenService:Create(btn, TweenInfo.new(0.15), {
                TextColor3 = isActive and THEME.TEXT or THEME.TEXT_DIM,
            }):Play()
            if isActive then
                btn.Text = "| " .. name
                btn.Font = Enum.Font.GothamBold
            else
                btn.Text = "  " .. name
                btn.Font = Enum.Font.GothamMedium
            end
        end
        buildTabContent(tab)
    end)
end

activeTab = "Información"
tabButtons["Información"].Text = "| Información"
tabButtons["Información"].TextColor3 = THEME.TEXT
tabButtons["Información"].Font = Enum.Font.GothamBold
buildTabContent(tabs[1])

-- ============================================
-- CIERRE TOTAL (BORRA EL MENÚ Y LIMPIA EFECTOS)
-- ============================================
closeBtn.MouseButton1Click:Connect(function() 
    -- 1. Limpiamos los efectos visuales (como los shaders del Freecam)
    for _, effect in ipairs(Lighting:GetChildren()) do
        if effect:IsA("ColorCorrectionEffect") or effect:IsA("BlurEffect") or effect:IsA("BloomEffect") or effect:IsA("SunRaysEffect") then
            effect:Destroy()
        end
    end
    
    -- 2. Restauramos la cámara por si el Freecam la dejó trabada
    local camera = workspace.CurrentCamera
    if camera then
        camera.CameraType = Enum.CameraType.Custom
        if lplayer.Character and lplayer.Character:FindFirstChild("Humanoid") then
            camera.CameraSubject = lplayer.Character.Humanoid
        end
    end

    -- 3. Borramos el menú principal
    screenGui:Destroy() 
end)

-- ============================================
-- DRAG DE LA VENTANA
-- ============================================
local dragging = false
local dragStart, startPos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("[ORION DEVS] Interfaz lista. La X borra el menú y limpia los efectos.")