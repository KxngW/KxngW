game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Kingdom Hub Notice";
    Text = "More Scripts Coming Soon.";
    Duration = 25;
})

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "[DISCORD]";
    Text = "https://discord.gg/JwVw4UuDat";
    Duration = 0;
})


if setclipboard then
    setclipboard("https://discord.gg/JwVw4UuDat")
end

if game.PlaceId == 8884334497 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Kingdom Hub", HidePremium = false, IntroText = "Kingdom Hub", SaveConfig = false, ConfigFolder = "Kingdom Hub"})

--Valuses
_G.autoClick = true
_G.autoRebirth = true
--Functions

function autoClick()
    while _G.autoClick == true do 
        game:GetService("ReplicatedStorage").Remotes.Click:InvokeServer()
        wait()
    end
end

function autoRebirth()
    while _G.autoRebirth == true do 
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
        wait()
    end
end

--Tabs
local FarmTab = Window:MakeTab({
	Name = "AutoFarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--Toggles
FarmTab:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
		_G.autoClick = Value
        autoClick()
	end    
})

FarmTab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		_G.autoRebirth = Value
        autoRebirth()
	end    
})






OrionLib:Init()
end