
    local UI = loadstring(game:HttpGet'https://raw.githubusercontent.com/10x00/Tools/main/Super%20Hot%20Monke%20UI')()
    
    UI.Title.Text = "roVlox-Scripts-#1"
    
    UI.newTab("Main")
     UI.newTab("Trolling")


 local odefi23 = {
 ["Ламборгини"] = {"SportsCar2", "Spawn2"},
 ["Феррари"] = {"SportsCar", "Spawn1"}, 
 ["Тележка"] = {"ShoppingCart", "Spawn3"}
}

local scar = "Ламборгини"

UI.newDropDown(UI.Main, "Spawn Car", {"Ламборгини", "Феррари", "Тележка"}, function(selected)
 scar = selected
end);
    
UI.newButton(UI.Main, "Spawn", function()
 local cd = odefi23[scar]
 if cd then
local ohString1 = cd[1]
local ohString2 = cd[2]
 game:GetService("ReplicatedStorage").CarMenuButtonClicked:FireServer(ohString1, ohString2)
end
end);

--деф

--[[
local ohString1 = "SportsCar2"
local ohString2 = "Spawn2"

game:GetService("ReplicatedStorage").CarMenuButtonClicked:FireServer(ohString1, ohString2)
]]


--инфаааааа
UI.newHeader(UI.Main, "Информация");
UI.newLabel(UI.Main, "издатель zeferus, скрипт создан для ре-канала");
