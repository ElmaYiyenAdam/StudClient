local RS = game:GetService("ReplicatedStorage")

_G.FarmStates = {
    GodlyStud = false,
    Points = false,
    Rebirth = false,
    Token = false,
    Blocks = false
}

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "⚡ StudClient",
   LoadingTitle = "Loading StudClient...",
   LoadingSubtitle = "by ElmaYiyenAdam",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "StudClient"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true 
   },
   KeySystem = false
})

local FarmTab = Window:CreateTab("Auto Farm", 4483362458) 
local SettingsTab = Window:CreateTab("Settings", 10734950309)

FarmTab:CreateToggle({
   Name = "Godly Stud Farm",
   CurrentValue = false,
   Flag = "Toggle_GodlyStud", 
   Callback = function(Value)
        _G.FarmStates.GodlyStud = Value
        if Value then
            task.spawn(function()
                while _G.FarmStates.GodlyStud do
                    RS:WaitForChild("Area1"):WaitForChild("CurrencyGain"):FireServer("GodlyStud")
                    task.wait()
                end
            end)
        end
   end,
})

FarmTab:CreateToggle({
   Name = "Points Multiplier",
   CurrentValue = false,
   Flag = "Toggle_Points",
   Callback = function(Value)
        _G.FarmStates.Points = Value
        if Value then
            task.spawn(function()
                while _G.FarmStates.Points do
                    RS:WaitForChild("Area2"):WaitForChild("PointsGain"):FireServer(1)
                    task.wait()
                end
            end)
        end
   end,
})

FarmTab:CreateToggle({
   Name = "Auto Rebirth System",
   CurrentValue = false,
   Flag = "Toggle_Rebirth",
   Callback = function(Value)
        _G.FarmStates.Rebirth = Value
        if Value then
            task.spawn(function()
                while _G.FarmStates.Rebirth do
                    RS:WaitForChild("Area1"):WaitForChild("Rebirth"):FireServer(2)
                    task.wait()
                end
            end)
        end
   end,
})

FarmTab:CreateToggle({
   Name = "Token Generator",
   CurrentValue = false,
   Flag = "Toggle_Token",
   Callback = function(Value)
        _G.FarmStates.Token = Value
        if Value then
            task.spawn(function()
                while _G.FarmStates.Token do
                    RS:WaitForChild("Area5"):WaitForChild("TokenGain"):FireServer("BLOSSOM_K3_OMEGA_88", "Pot3")
                    task.wait()
                end
            end)
        end
   end,
})

FarmTab:CreateToggle({
   Name = "Blocks Generator",
   CurrentValue = false,
   Flag = "Toggle_Blocks",
   Callback = function(Value)
        _G.FarmStates.Blocks = Value
        if Value then
            task.spawn(function()
                while _G.FarmStates.Blocks do
                    RS:WaitForChild("Area3"):WaitForChild("BlocksGain"):FireServer()
                    task.wait()
                end
            end)
        end
   end,
})

SettingsTab:CreateSection("UI Control")

SettingsTab:CreateButton({
   Name = "🚨 Unload Panel",
   Callback = function()
        for farmName, _ in pairs(_G.FarmStates) do
            _G.FarmStates[farmName] = false
        end
        Rayfield:Destroy()
   end,
})

Rayfield:Notify({
   Title = "StudClient Ready",
   Content = "Multi-Farm panel loaded successfully! You can hide/show the panel using Right CTRL or K.",
   Duration = 5,
   Image = 4483362458,
})
