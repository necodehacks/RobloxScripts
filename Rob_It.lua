local ReduxV1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sealient/ReduxV1/refs/heads/main/ReduxV1.lua"))()

local UI = ReduxV1:CreateMain("Astroma")
local Player = UI:CreateTab("Player")
local MainTab = UI:CreateTab("Exploits")
local Teleports = UI:CreateTab("Teleports")
local Esp = UI:CreateTab("ESP")
--fnc
local pl = game.Players.LocalPlayer
local chr = pl.Character or pl.CharacterAdded:wait()
local hrp = chr:FindFirstChild("HumanoidRootPart")
local hlight = Instance.new("Highlight")
local sv = hrp.CFrame
local hmd = chr:WaitForChild("Humanoid")
local espB = false
local espG = false
local func = false

MainTab:CreateButton("Anti-Slow", "Anti-Slow Bag...", function()
task.spawn(function()
while task.wait(0.1) do
game.Players.LocalPlayer:SetAttribute("BagScale", -25)
task.wait()
end
end)
end)



MainTab:CreateButton("Auto-Glass", "glass break", function()
task.spawn(function()
while task.wait(0.1) do
game:GetService("ReplicatedStorage").Remotes.Utilities.BreakWindow:FireServer(Part)
task.wait()
end
end)
end)

MainTab:CreateButton("Delete Doors", "Удаляет все двери.", function()
for _, nga2 in pairs(game.Workspace.Map:FindFirstChild("Doors"):GetChildren()) do
nga2:Destroy()
end
end)

MainTab:CreateButton("Delete Cameras", "Удаляет все камеры.", function()
for _, nga22 in pairs(game.Workspace.Map:FindFirstChild("Cameras"):GetChildren()) do
nga22:Destroy()
end
end)

--workspace.Map.Others.Lazers
MainTab:CreateButton("Delete Lasers", "Удаляет все лазеры.", function()
for _, nga223 in pairs(game.Workspace.Map.Others:FindFirstChild("Lazers"):GetChildren()) do
nga223:Destroy()
end
end)

_G.Aura = false
MainTab:CreateToggle("Kill-All", "Вы убьете всю охрану.", function(state)
_G.Aura = state
task.spawn(function()
if task.wait(0.1) then
pcall(function()
if _G.Aura then
while _G.Aura do
game:GetService("ReplicatedStorage").Remotes.Tools.HitNPC:FireServer(game:GetService("Workspace").Map.NPCS[""], "Crowbar")
task.wait()
end
end
end)
end
end)
end)
--teleports
Teleports:CreateButton("Teleport To Truck", "тп к грузовику.", function()
hrp.CFrame = workspace.Map.Truck.PrimaryPart.CFrame + Vector3.new(0,5,0)
end)

Teleports:CreateButton("Rejoin (Play Again)", "начать заново", function()
game:GetService("ReplicatedStorage").Remotes.PlayAgain:FireServer(true)
end)


--game:GetService("ReplicatedStorage").Remotes.PlayAgain:FireServer(true)
--end

--esp
--B
Esp:CreateToggle("ESP Name Items", "Вы способны видеть предметы сквозь стены", function(state)
espB = state
for _, item in pairs(workspace.Map.StealableItems and workspace.Map.StealableItems.Natural:GetChildren()) do
local esp = item:FindFirstChild("ItemESP")
if state then
if not esp then
esp = Instance.new("BillboardGui")
esp.Name = "ItemESP"
esp.Adornee = item
esp.Size = UDim2.new(0, 100, 0, 20)
esp.StudsOffset = Vector3.new(0, 3, 0)
esp.AlwaysOnTop = true 
local text = Instance.new("TextLabel")
text.Text = item.Name
text.Size = UDim2.new(0.8, 0, 0.8, 0)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.new(255, 0, 255)
text.TextScaled = true  
text.Parent = esp
esp.Parent = item
else
esp.Enabled = true
end
else
if esp then
esp.Enabled = false
end
end
end
end)


--workspace.Map.NPCS[""]

Esp:CreateToggle("ESP Guards", "Вы способны видеть охрану сквозь стены", function(state)
espG = state
for _, Guard in pairs(workspace.Map.NPCS:GetChildren()) do
local wha = Guard:FindFirstChild("GESP")
if state then
if not wha then
wha = Instance.new("BillboardGui")
wha.Name = "GESP"
wha.Adornee = Guard
wha.Size = UDim2.new(0, 100, 0, 20)
wha.StudsOffset = Vector3.new(0, 3, 0)
wha.AlwaysOnTop = true 
local text = Instance.new("TextLabel")
text.Text = "Guard!"
text.Size = UDim2.new(0.8, 0, 0.8, 0)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.new(255, 255, 0)
text.TextScaled = true  
text.Parent = wha
wha.Parent = Guard
else
wha.Enabled = true
end
else
if esp then
wha.Enabled = false
end
end
end
end)


