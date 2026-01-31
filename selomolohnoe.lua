_G.autofarm = true
task.spawn(function()
while _G.autofarm do
for _, coin in pairs(game.workspace.Folder:GetChildren()) do
if coin:IsA("BasePart") then
local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
if firetouchinterest then
firetouchinterest(hrp, coin, 0)
firetouchinterest(hrp, coin, 1)
task.wait(0.1)  
end
end
end
end
end)
