-- Лоадер для скриптов на основе Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Базовый URL репозитория
local BaseURL = "https://raw.githubusercontent.com/Cubicplay471lm/scripti/refs/heads/main/"

-- Список скриптов
local Scripts = {
    {Name = "🎯 RFmy.lua", File = "RFmy.lua"},
    {Name = "📜 myScript.lua", File = "myScript.lua"},
    {Name = "🎮 99 ночей", File = "99nights.lua"},
    {Name = "🎮 99 ночей 2", File = "99nigga2.lua"},
    {Name = "🎯 Aim", File = "aim.lua"},
    {Name = "📦 All Scripts", File = "allscr.lua"},
    {Name = "🏝️ Alone", File = "alone.lua"},
    {Name = "🖱️ Auto Click", File = "autoclick.lua"},
    {Name = "🧱 Blox", File = "blox.lua"},
    {Name = "🏝️ Booga Booga", File = "booga%20booga.lua"},
    {Name = "⚔️ BSS", File = "bss.lua"},
    {Name = "🚜 Build Tractor", File = "buildtractor.lua"},
    {Name = "🎨 CB Скин", File = "cbсикин.lua"},
    {Name = "🎨 CB Сиси", File = "cbсиси.lua"},
    {Name = "🚂 Dead Rails", File = "dead%20rails.lua"},
    {Name = "⚔️ Forsaken", File = "forsaken.lua"},
    {Name = "💡 Full Bright", File = "fuulbright.lua"},
    {Name = "🎯 Hyper Shot", File = "hypershot.lua"},
    {Name = "♾️ Inf Yield", File = "inf%20yield.lua"},
    {Name = "🖋️ Ink", File = "ink.lua"},
    {Name = "⚔️ MTD", File = "MTD.lua"},
    {Name = "⚔️ PVB", File = "pvb.lua"},
    {Name = "🏃 Roams", File = "roams.lua"},
    {Name = "⚔️ Rost Alpha", File = "rostalpha.lua"},
    {Name = "💰 Steal", File = "steal.lua"},
    {Name = "💰 Steal 20", File = "steal20.lua"},
    {Name = "🔱 Trident", File = "trident.lua"},
    {Name = "🎯 Trident AIM", File = "tridentAIM.lua"},
    {Name = "👁️ Wallhack", File = "wh.lua"},
    {Name = "🔪 MM2", File = "мм2.lua"},
    {Name = "🔵 Си", File = "си.lua"}
}

-- Создание окна лоадера с ключ-системой
local LoaderWindow = Rayfield:CreateWindow({
    Name = "📦 Script Loader",
    LoadingTitle = "Загрузчик скриптов",
    LoadingSubtitle = "Выберите скрипт для загрузки",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "LoaderConfig",
        FileName = "LoaderSettings"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Script Loader Auth",
        Subtitle = "Key System",
        Note = "Введите ключ для доступа",
        FileName = "LoaderKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Admin12", "SaBplyr67", "MCplyr64", "11Li-20_dA"}
    }
})

-- Создаем вкладку для скриптов
local ScriptsTab = LoaderWindow:CreateTab("📜 Скрипты", 4483362458)

ScriptsTab:CreateSection("Основные скрипты")

-- Создаем кнопки для каждого скрипта
for _, script in ipairs(Scripts) do
    ScriptsTab:CreateButton({
        Name = script.Name,
        Callback = function()
            Rayfield:Notify({
                Title = "Загрузка",
                Content = "Загружаю " .. script.Name .. "...",
                Duration = 2,
                Image = 4483362458
            })
            
            local scriptURL = BaseURL .. script.File
            loadstring(game:HttpGet(scriptURL))()
            
            Rayfield:Notify({
                Title = "Успех",
                Content = script.Name .. " успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        end,
    })
end

-- Информационная секция
ScriptsTab:CreateSection("Информация")

local InfoButton = ScriptsTab:CreateButton({
    Name = "ℹ️ О лоадере",
    Callback = function()
        Rayfield:Notify({
            Title = "О лоадере",
            Content = "Лоадер скриптов на основе Rayfield UI.\nВыберите скрипт из списка для загрузки.",
            Duration = 5,
            Image = 4483362458
        })
    end,
})

-- Уведомление о загрузке
task.spawn(function()
    wait(1)
    Rayfield:Notify({
        Title = "Лоадер готов",
        Content = "Выберите скрипт для загрузки",
        Duration = 3,
        Image = 4483362458
    })
end)
