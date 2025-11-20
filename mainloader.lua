-- Лоадер для RFmy.lua на основе Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Основные сервисы
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Создание окна лоадера
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
    KeySystem = false
})

-- Создаем вкладку для скриптов
local ScriptsTab = LoaderWindow:CreateTab("📜 Скрипты", 4483362458)

ScriptsTab:CreateSection("Основные скрипты")

-- Кнопка загрузки RFmy.lua
local RFmyButton = ScriptsTab:CreateButton({
    Name = "🎯 Загрузить RFmy.lua",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю RFmy.lua...",
            Duration = 2,
            Image = 4483362458
        })
        
        -- Загружаем скрипт
        local success, err = pcall(function()
            -- Если скрипт на GitHub или другом хостинге, используйте:
            -- loadstring(game:HttpGet("YOUR_URL_TO_RFmy.lua"))()
            
            -- Если скрипт локально, можно использовать:
            -- Для локального файла через executor обычно используется другой метод
            -- Здесь предполагаем, что скрипт доступен через URL
            
            -- ВАРИАНТ 1: Если скрипт на GitHub/хостинге
            -- loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/RFmy.lua"))()
            
            -- ВАРИАНТ 2: Если скрипт в папке executor'а (зависит от executor)
            -- Для Xeno и подобных executor'ов может потребоваться другой метод
            
            -- ВАРИАНТ 3: Прямая загрузка через loadstring с содержимым файла
            -- Это работает если executor поддерживает чтение локальных файлов
            
            -- Для примера используем загрузку через HTTP (нужно указать ваш URL)
            -- Если у вас есть URL к файлу, раскомментируйте следующую строку:
            -- loadstring(game:HttpGet("YOUR_URL_HERE"))()
            
            -- Если файл локальный и executor поддерживает file:read(), используйте:
            local scriptContent = readfile("RFmy.lua")
            if scriptContent then
                loadstring(scriptContent)()
            else
                error("Не удалось прочитать файл RFmy.lua")
            end
        end)
        
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "RFmy.lua успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Ошибка загрузки: " .. tostring(err),
                Duration = 5,
                Image = 4483362458
            })
            warn("Ошибка загрузки RFmy.lua:", err)
        end
    end,
})

-- Альтернативная кнопка с загрузкой через URL (если файл на хостинге)
ScriptsTab:CreateSection("Загрузка через URL")

local URLInput = ScriptsTab:CreateInput({
    Name = "URL скрипта",
    PlaceholderText = "Вставьте URL к скриptу",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        -- Сохраняем URL для использования
    end,
})

local LoadFromURLButton = ScriptsTab:CreateButton({
    Name = "🌐 Загрузить по URL",
    Callback = function()
        local url = URLInput:Get()
        if url and url ~= "" then
            Rayfield:Notify({
                Title = "Загрузка",
                Content = "Загружаю скрипт по URL...",
                Duration = 2,
                Image = 4483362458
            })
            
            local success, err = pcall(function()
                loadstring(game:HttpGet(url))()
            end)
            
            if success then
                Rayfield:Notify({
                    Title = "Успех",
                    Content = "Скрипт успешно загружен!",
                    Duration = 3,
                    Image = 4483362458
                })
            else
                Rayfield:Notify({
                    Title = "Ошибка",
                    Content = "Ошибка загрузки: " .. tostring(err),
                    Duration = 5,
                    Image = 4483362458
                })
            end
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Введите URL скрипта!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end,
})

-- Информационная секция
ScriptsTab:CreateSection("Информация")

local InfoButton = ScriptsTab:CreateButton({
    Name = "ℹ️ О лоадере",
    Callback = function()
        Rayfield:Notify({
            Title = "О лоадере",
            Content = "Этот лоадер загружает скрипты на основе Rayfield UI.\nИспользуйте кнопку выше для загрузки RFmy.lua",
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

