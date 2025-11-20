-- Лоадер для скриптов на основе Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Проверка загрузки Rayfield
if not Rayfield then
    warn("❌ Не удалось загрузить Rayfield UI!")
    return
end

-- Базовый URL репозитория
local BaseURL = "https://raw.githubusercontent.com/Cubicplay471lm/scripti/refs/heads/main/"

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

-- Проверка создания окна
if not LoaderWindow then
    warn("❌ Не удалось создать окно лоадера!")
    return
end

-- Создаем вкладку для скриптов
local ScriptsTab = LoaderWindow:CreateTab("📜 Скрипты", 4483362458)

-- Функция для безопасной загрузки скриптов
local function loadScript(scriptName, scriptURL)
    local success, errorMessage = pcall(function()
        loadstring(game:HttpGet(scriptURL))()
    end)
    return success, errorMessage
end

-- Секция: Основные скрипты
ScriptsTab:CreateSection("Основные скрипты")

-- Отдельные кнопки для каждого скрипта
ScriptsTab:CreateButton({
    Name = "🎯 RFmy.lua",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю RFmy.lua...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "RFmy.lua"
        local success, errorMessage = loadScript("RFmy.lua", scriptURL)
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
                Content = "Не удалось загрузить RFmy.lua",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

ScriptsTab:CreateButton({
    Name = "📜 myScript.lua",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю myScript.lua...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "myScript.lua"
        local success, errorMessage = loadScript("myScript.lua", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "myScript.lua успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить myScript.lua",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

ScriptsTab:CreateButton({
    Name = "🎮 99 ночей",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю 99 ночей...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "99nights.lua"
        local success, errorMessage = loadScript("99 ночей", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "99 ночей успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить 99 ночей",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

ScriptsTab:CreateButton({
    Name = "🎮 99 ночей 2",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю 99 ночей 2...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "99nigga2.lua"
        local success, errorMessage = loadScript("99 ночей 2", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "99 ночей 2 успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить 99 ночей 2",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

ScriptsTab:CreateButton({
    Name = "🎯 Aim",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю Aim...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "aim.lua"
        local success, errorMessage = loadScript("Aim", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "Aim успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить Aim",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

-- Секция: Дополнительные скрипты
ScriptsTab:CreateSection("Дополнительные скрипты")

ScriptsTab:CreateButton({
    Name = "📦 All Scripts",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю All Scripts...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "allscr.lua"
        local success, errorMessage = loadScript("All Scripts", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "All Scripts успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить All Scripts",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

ScriptsTab:CreateButton({
    Name = "🏝️ Alone",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю Alone...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "alone.lua"
        local success, errorMessage = loadScript("Alone", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "Alone успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить Alone",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

ScriptsTab:CreateButton({
    Name = "🖱️ Auto Click",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю Auto Click...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "autoclick.lua"
        local success, errorMessage = loadScript("Auto Click", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "Auto Click успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить Auto Click",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

ScriptsTab:CreateButton({
    Name = "🧱 Blox",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю Blox...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "blox.lua"
        local success, errorMessage = loadScript("Blox", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "Blox успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить Blox",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

ScriptsTab:CreateButton({
    Name = "🏝️ Booga Booga",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю Booga Booga...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "booga%20booga.lua"
        local success, errorMessage = loadScript("Booga Booga", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "Booga Booga успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить Booga Booga",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

-- Продолжение для остальных скриптов...
ScriptsTab:CreateButton({
    Name = "⚔️ BSS",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю BSS...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "bss.lua"
        local success, errorMessage = loadScript("BSS", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "BSS успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить BSS",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

ScriptsTab:CreateButton({
    Name = "🚜 Build Tractor",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю Build Tractor...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "buildtractor.lua"
        local success, errorMessage = loadScript("Build Tractor", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "Build Tractor успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить Build Tractor",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

-- Секция: Игровые скрипты
ScriptsTab:CreateSection("Игровые скрипты")

ScriptsTab:CreateButton({
    Name = "🎨 CB Скин",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю CB Скин...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "cbсикин.lua"
        local success, errorMessage = loadScript("CB Скин", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "CB Скин успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить CB Скин",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

ScriptsTab:CreateButton({
    Name = "🎨 CB Сиси",
    Callback = function()
        Rayfield:Notify({
            Title = "Загрузка",
            Content = "Загружаю CB Сиси...",
            Duration = 2,
            Image = 4483362458
        })
        local scriptURL = BaseURL .. "cbсиси.lua"
        local success, errorMessage = loadScript("CB Сиси", scriptURL)
        if success then
            Rayfield:Notify({
                Title = "Успех",
                Content = "CB Сиси успешно загружен!",
                Duration = 3,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Не удалось загрузить CB Сиси",
                Duration = 5,
                Image = 4483362458
            })
        end
    end,
})

-- Информационная секция
ScriptsTab:CreateSection("Информация")

ScriptsTab:CreateButton({
    Name = "ℹ️ О лоадере",
    Callback = function()
        Rayfield:Notify({
            Title = "О лоадере",
            Content = "Лоадер скриптов на основе Rayfield UI\nВсего доступно скриптов: 30",
            Duration = 5,
            Image = 4483362458
        })
    end,
})

-- Уведомление о загрузке
task.spawn(function()
    task.wait(1)
    Rayfield:Notify({
        Title = "Лоадер готов",
        Content = "Выберите скрипт для загрузки",
        Duration = 3,
        Image = 4483362458
    })
end)