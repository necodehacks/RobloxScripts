--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Load the library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/noowtf31-ui/Arcylic/refs/heads/main/src.lua.txt"))()

-- Create the main window
local window = Library.new("Astroma Mobile", "MyHubConfigs")

-- Set toggle key (optional, default is RightControl)
window:SetToggleKey(Enum.KeyCode.RightControl)
local pl = game.Players.LocalPlayer
-- Show welcome notification
window:Notify({
    Title = "Welcome!",
    Description = "Astroma Hub loaded successfully",
    Duration = 3,
    Icon = "rbxassetid://10709775704"
})

-- Create sections
local CombatSection = window:CreateSection("Combat")
local PlayerSection = window:CreateSection("Player")

-- Create tabs within sections
local AimbotTab = CombatSection:CreateTab("SpongeBob", "rbxassetid://10723407389")
local AimbotTab2 = CombatSection:CreateTab("Squidward", "rbxassetid://10723407389")
local MovementTab = PlayerSection:CreateTab("Movement", "rbxassetid://10734898355")

-- Add section headers
AimbotTab:CreateSection("Exploits")


local lagserver = false
AimbotTab:CreateToggle({
Name = "Lag Server",
    Default = false,
    Flag = "LagServer", 
    Callback = function(enabled)
        lagserver = enabled
if enabled then
    task.spawn(function()
    while lagserver do
        task.wait()
game:GetService("ReplicatedStorage").Remotes.Taunt:FireServer()
    end
end)
end
end
})

MovementTab:CreateSlider({
    Name = "Move Speed",
    Min = 1,
    Max = 100,
    Default = 50,
    Flag = "sped",
    Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value

    end
})
AimbotTab2:CreateButton({
    Name = "Kill-All",
    Callback = function()
    pcall(function()
     for _, plrs in next, (game.Players:GetPlayers()) do
         if plrs ~= pl and plrs.Character then
             local hrp = pl.Character:FindFirstChild("HumanoidRootPart")
             local hrp_enemy = plrs.Character:FindFirstChild("HumanoidRootPart")
             local wat = game.workspace.InRound.Squidward:FindFirstChild(pl.Name)
if not wat then warn("ASTROMA - You NOT a Squidward wait") return end
hrp_enemy.CFrame = hrp.CFrame
    end
    end
    end)
    end
})
