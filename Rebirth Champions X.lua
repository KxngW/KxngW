if game.PlaceId == 8540346411 then
getgenv().AutoClick = false
getgenv().AutoRebirth = false
getgenv().AutoEgg = false
getgenv().AutoCraft = false
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "👑 Kingdom Hub", HidePremium = false, IntroText = "Kingdom Hub", SaveConfig = false, ConfigFolder = "Kingdom Hub"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})



function AutoClick()
    if getgenv().AutoClick then
        while getgenv().AutoClick do
            game:GetService("ReplicatedStorage").Events.Click3:FireServer()
            wait();
        end
    end
end

function AutoRebirth(Number)
    if getgenv().AutoRebirth then
        while getgenv().AutoRebirth do
            game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(Number)
            wait();
        end
    end
end

local EggsArray = {}
for i , v in pairs(game:GetService("ReplicatedStorage").Assets.Eggs:GetChildren()) do
    table.insert(EggsArray, v.Name)
end

function AutoEgg(Type)
    if getgenv().AutoEgg then
        while getgenv().AutoEgg do
            game:GetService("ReplicatedStorage").Functions.Unbox:InvokeServer(Type,"Triple")
            wait();
        end
    end
   
end

function AutoCraft()
    if getgenv().AutoCraft then
        while getgenv().AutoCraft do
            game:GetService("ReplicatedStorage").Functions.Request:InvokeServer("CraftAll",{})
            wait();
        end
    end
end
Tab:AddLabel("AutoClick")
Tab:AddToggle({
	Name = "Auto Click On/Off",
	Default = false,
	Callback = function(Value)
		getgenv().AutoClick = Value
        if getgenv().AutoClick then
            AutoClick()
        end
	end    
})

Tab:AddLabel("AutoRebirth")

local SelectedNumber
local RebirthsArray = {}
for i = 1, 67 do
    table.insert(RebirthsArray, i)
end

Tab:AddDropdown({
	Name = "Select Number of Rebirths",
	Default = "1",
	Options = RebirthsArray,
	Callback = function(Value)
		SelectedNumber = Value
        print("Selected Number: "..SelectedNumber)
	end    
})

if SelectedNumber == nil then
    SelectedNumber = 1
end

Tab:AddToggle({
	Name = "Auto Rebirths On/Off",
	Default = false,
	Callback = function(Value)
		getgenv().AutoRebirth = Value
        if getgenv().AutoRebirth then
            AutoRebirth(SelectedNumber)
        end
	end    
})
Tab:AddLabel("Auto Eggs")

local SelectedEgg 
Tab:AddDropdown({
	Name = "Select Type of Eggs",
	Default = "1",
	Options = EggsArray,
	Callback = function(Value)
		SelectedEgg = Value
        print("Selected Egg: "..SelectedEgg)
	end    
})

if SelectedEgg == nil then
    SelectedEgg = EggsArray[0]
end

Tab:AddToggle({
	Name = "Auto Eggs On/Off",
	Default = false,
	Callback = function(Value)
		getgenv().AutoEgg = Value
        if getgenv().AutoEgg then
            AutoEgg(SelectedEgg)
        end
	end    
})
Tab:AddLabel("Auto CraftAll")
Tab:AddToggle({
	Name = "Auto CraftAll On/Off",
	Default = false,
	Callback = function(Value)
		getgenv().AutoCraft = Value
        if getgenv().AutoCraft then
            AutoCraft()
        end
	end    
})
OrionLib:Init()
end
