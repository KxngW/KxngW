game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Kingdom Hub Notice";
    Text = "More Scripts Coming Soon.";
    Duration = 25;
})

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "[DISCORD]";
    Text = "https://discord.gg/JwVw4UuDat";
    Duration = 25;
})


if setclipboard then
    setclipboard("https://discord.gg/JwVw4UuDat")
end

if game.PlaceId == 9498006165 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Kingdom Hub", HidePremium = false, IntroText = "Kingdom Hub", SaveConfig = false, ConfigFolder = "Kingdom Hub"})

--Valuses
_G.autoTap = true
_G.autoRebirth = true

--Functions

function autoTap()
    while _G.autoTap == true do 
        game:GetService("ReplicatedStorage").Events.Tap:FireServer()
        wait()
    end
end
function autoRebirth()
    while _G.autoRebirth == true do
        game:GetService("ReplicatedStorage").Events.Rebirth:FireServer((game.Players.LocalPlayer.PlayerGui.UI.QuickRebirth.CurrentRebirth.Amount.LocalizedText))
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
    Name = "Auto Tap",
    Default = false,
    Callback = function(Value)
        _G.autoTap = Value
        autoTap()
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

end
OrionLib:Init()
