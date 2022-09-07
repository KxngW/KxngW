local CollectionService = game:GetService("CollectionService")
if game.PlaceId == 10204162989 then
    local autofarm = false
    local autohatch = false
    local autochest = false
    local autopet = false
    local autopickaxe = false
    local autorebirth = false

    function bestpet()
        spawn(
            function()
                while autopet == true do
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.Inventory.EquipBestPet:FireServer()
                    if not autopet then
                        break
                    end
                end
            end
        )
    end

    function bestpickaxe()
        spawn(
            function()
                while autopickaxe == true do
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.Inventory.EquipBestPickaxe:FireServer()
                    if not autopickaxe then
                        break
                    end
                end
            end
        )
    end

    function opening()
        spawn(
            function()
                while autochest == true do
                    task.wait()
                    if striple == true then
                        local args = {
                            [1] = schest,
                            [2] = 3,
                            [3] = {
                                ["Legendary"] = slegend,
                                ["Common"] = scommon,
                                ["Epic"] = sepic,
                                ["Uncommon"] = suncommon,
                                ["Rare"] = srare
                            }
                        }

                        game:GetService("ReplicatedStorage").Remotes.Chest.OpenChest:InvokeServer(unpack(args))
                    else
                        local args = {
                            [1] = schest,
                            [2] = 1,
                            [3] = {
                                ["Legendary"] = slegend,
                                ["Common"] = scommon,
                                ["Epic"] = sepic,
                                ["Uncommon"] = suncommon,
                                ["Rare"] = srare
                            }
                        }

                        game:GetService("ReplicatedStorage").Remotes.Chest.OpenChest:InvokeServer(unpack(args))
                        if not autochest then
                            break
                        end
                    end
                end
            end
        )
    end

    function hatching()
        spawn(
            function()
                while autohatch == true do
                    task.wait()
                    if striple == true then
                        local args = {
                            [1] = segg,
                            [2] = 3,
                            [3] = {
                                ["Legendary"] = slegend,
                                ["Common"] = scommon,
                                ["Epic"] = sepic,
                                ["Uncommon"] = suncommon,
                                ["Rare"] = srare
                            }
                        }
                        game:GetService("ReplicatedStorage").Remotes.Hatcher.OpenHatcher:InvokeServer(unpack(args))
                    elseif striple == false then
                        local args = {
                            [1] = segg,
                            [2] = 1,
                            [3] = {
                                ["Legendary"] = slegend,
                                ["Common"] = scommon,
                                ["Epic"] = sepic,
                                ["Uncommon"] = suncommon,
                                ["Rare"] = srare
                            }
                        }
                        game:GetService("ReplicatedStorage").Remotes.Hatcher.OpenHatcher:InvokeServer(unpack(args))
                        if not autohatch then
                            break
                        end
                    end
                end
            end
        )
    end
    function farming()
        spawn(
            function()
                while autofarm == true do
                    for i, v in next, game:GetService("Workspace").Blocks:GetChildren() do
                        local args = {
                            [1] = v.Name
                        }

                        game:GetService("ReplicatedStorage").Remotes.Mining.MineBlock:FireServer(unpack(args))
                        task.wait()
                    end
                    if not autofarm then
                        break
                    end
                end
            end
        )
    end

    eggs = {}
    for i, v in pairs(game:GetService("Workspace").Hatchers:GetChildren()) do
        table.insert(eggs, v.Name)
    end

    chests = {}
    for i, v in pairs(game:GetService("Workspace").Prompts.Chests:GetChildren()) do
        table.insert(chests, v.Name)
    end


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



    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "👑 Kingdom Hub", HidePremium = true, IntroText = "👑 Kingdom Hub", SaveConfig = false, ConfigFolder = "Kingdom Hub"})
    local Tab =
        Window:MakeTab(
        {
            Name = "Auto Farm",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        }
    )

    Tab:AddToggle(
        {
            Name = "Auto Mine Blocks",
            Default = false,
            Callback = function(x)
                autofarm = x
                if autofarm then
                    farming()
                end
            end
        }
    )

    local Tab =
        Window:MakeTab(
        {
            Name = "Auto Hatch",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        }
    )

    Tab:AddToggle(
        {
            Name = "Auto Open Egg",
            Default = false,
            Callback = function(x)
                autohatch = x
                if autohatch then
                    hatching()
                end
            end
        }
    )

    Tab:AddToggle(
        {
            Name = "Auto Open Chest",
            Default = false,
            Callback = function(x)
                autochest = x
                if autochest then
                    opening()
                end
            end
        }
    )

    Tab:AddToggle(
        {
            Name = "Triple Hatch",
            Default = false,
            Callback = function(x)
                striple = x
            end
        }
    )

    local eggcost = Tab:AddLabel("Egg Cost: None")

    Tab:AddDropdown(
        {
            Name = "Select Egg",
            Default = "",
            Options = eggs,
            Callback = function(x)
                segg = x
                eggcost:Set("Egg Cost: " .. game:GetService("Workspace").Hatchers[segg]["Meshes/Egg"].Price.Amount.Text .. " Coins")
            end
        }
    )
    local chestcost = Tab:AddLabel("Chest Cost: None")

    Tab:AddDropdown(
        {
            Name = "Select Chest",
            Default = "",
            Options = chests,
            Callback = function(x)
                schest = x
                chestcost:Set("Chest Cost: " .. game:GetService("Workspace").Chests[schest].Price.Amount.Text .. " Coins")
            end
        }
    )

  
    local Tab =
        Window:MakeTab(
        {
            Name = "Auto Delete",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        }
    )

    Tab:AddToggle(
        {
            Name = "Legendary",
            Default = false,
            Callback = function(Value)
                slegend = Value
            end
        }
    )

    Tab:AddToggle(
        {
            Name = "Common",
            Default = false,
            Callback = function(Value)
                scommon = Value
            end
        }
    )

    Tab:AddToggle(
        {
            Name = "Epic",
            Default = false,
            Callback = function(Value)
                sepic = Value
            end
        }
    )

    Tab:AddToggle(
        {
            Name = "Uncommon",
            Default = false,
            Callback = function(Value)
                suncommon = Value
            end
        }
    )

    Tab:AddToggle(
        {
            Name = "Rare",
            Default = false,
            Callback = function(Value)
                srare = Value
            end
        }
    )

    local Tab =
        Window:MakeTab(
        {
            Name = "Misc",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        }
    )

    Tab:AddButton(
        {
            Name = "Remove all barriers",
            Callback = function()
                for i, v in pairs(game:GetService("Workspace").ZoneBarriers:GetChildren()) do
                    v:Destroy()
                end
                game:GetService("Workspace").OtherBarriers.Vip:Destroy()
            end
        }
    )

    Tab:AddToggle(
        {
            Name = "Auto Equip Best Pickaxes",
            Default = false,
            Callback = function(x)
                autopickaxe = x
                if autopickaxe then
                    bestpickaxe()
                end
            end
        }
    )

    Tab:AddToggle(
        {
            Name = "Auto Equip Best Pets",
            Default = false,
            Callback = function(x)
                autopet = x
                if autopet then
                    bestpet()
                end
            end
        }
    )

    local Section =
        Tab:AddSection(
        {
            Name = "Teleports"
        }
    )

    zones = {}
    for i, v in pairs(game:GetService("Workspace").Zones:GetChildren()) do
        table.insert(zones, v.Name)
    end

    Tab:AddButton(
        {
            Name = "Teleport To Zone",
            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    game:GetService("Workspace").Zones[szone].SurfaceTeleport.CFrame
            end
        }
    )

    Tab:AddDropdown(
        {
            Name = "Select Zone",
            Default = "",
            Options = zones,
            Callback = function(x)
                szone = x
            end
        }
    )

    local Section =
        Tab:AddSection(
        {
            Name = "GUI"
        }
    )

    Tab:AddButton(
        {
            Name = "Destroy GUI",
            Callback = function()
                game:GetService("CoreGui").Orion:Destroy()
            end
        }
    )

    local Tab =
        Window:MakeTab(
        {
            Name = "Local Player",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        }
    )

    Tab:AddSlider(
        {
            Name = "WalkSpeed",
            Min = 16,
            Max = 500,
            Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 1,
            ValueName = "",
            Callback = function(x)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = x
            end
        }
    )

    Tab:AddSlider(
        {
            Name = "JumpPower",
            Min = 50,
            Max = 500,
            Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 1,
            ValueName = "",
            Callback = function(x)
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = x
            end
        }
    )

    Tab:AddSlider(
        {
            Name = "FOV",
            Min = 0,
            Max = 200,
            Default = game.Workspace.Camera.FieldOfView,
            Color = Color3.fromRGB(255, 255, 255),
            Increment = 1,
            ValueName = "",
            Callback = function(x)
                game.Workspace.Camera.FieldOfView = x
            end
        }
    )
    Tab:AddButton({
        Name = "Teleport To Player",
        Callback = function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[splayer].Character.HumanoidRootPart.CFrame
          end    
    })

    Tab:AddToggle({
        Name = "View Player",
        Default = false,
        Callback = function(Value)
            if Value == true then 
                game.Workspace.CurrentCamera.CameraSubject = game.Players[splayer].Character.Humanoid
            else 
                game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
            end
        end    
    })

players = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(players, v.Name)
end


    Tab:AddDropdown({
        Name = "Select Player",
        Default = "",
        Options = players,
        Callback = function(Value)
            splayer = Value
        end    
    })
    


    local Tab = Window:MakeTab({
        Name = "Credits",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("By 👑 Kingdom Hub")


    OrionLib:Init()
end
