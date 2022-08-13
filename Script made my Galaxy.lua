---AutoHtc---
repeat
    wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game:IsLoaded()

local ts = game:service'TweenService'

-- Instances:

local Holder = Instance.new("ScreenGui")
local Notif = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Desc = Instance.new("TextLabel")
local NotifGradient = Instance.new("UIGradient")
local NotifCorner = Instance.new("UICorner")
local StarLabel = Instance.new("ImageLabel")
local SideFrame = Instance.new("Frame")
local SideFrameCorner = Instance.new("UICorner")
local Sound = Instance.new("Sound")
local Blur = Instance.new("BlurEffect")

--Properties:

Holder.Parent = game.CoreGui
Holder.Name = "Notification"


Notif.Name = "Notif"
Notif.Parent = Holder
Notif.BackgroundColor3 = Color3.fromRGB(30, 0, 45)
Notif.BorderSizePixel = 0
Notif.Position = UDim2.new(-5, 0, 0.440935671, 0)
Notif.Size = UDim2.new(0, 240, 0, 50)

Title.Name = "Title"
Title.Parent = Notif
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.0583333373, 0, 0.119999997, 0)
Title.Size = UDim2.new(0, 200, 0, 25)
Title.Font = Enum.Font.GothamSemibold
Title.Text = "Infinte Yield and AntiAFK has now been Executed"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13.000
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextTransparency = 1.000

Desc.Name = "Desc"
Desc.Parent = Title
Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Desc.BackgroundTransparency = 1.000
Desc.Position = UDim2.new(0, 0, 0.680000007, 0)
Desc.Size = UDim2.new(0, 200, 0, 16)
Desc.Font = Enum.Font.Gotham
Desc.Text = "Script made by Galaxy or Kxng#0001"
Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc.TextSize = 12.000
Desc.TextTransparency = 1.000

NotifGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(8, 8, 8))}
NotifGradient.Name = "NotifGradient"
NotifGradient.Parent = Notif

NotifCorner.CornerRadius = UDim.new(0, 4)
NotifCorner.Name = "NotifCorner"
NotifCorner.Parent = Notif

StarLabel.Name = "StarLabel"
StarLabel.Parent = Notif
StarLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StarLabel.BackgroundTransparency = 1.000
StarLabel.Size = UDim2.new(0, 240, 0, 51)
StarLabel.Image = "rbxassetid://8818997469"
StarLabel.ScaleType = Enum.ScaleType.Crop

SideFrame.Name = "SideFrame"
SideFrame.Parent = Notif
SideFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SideFrame.BorderSizePixel = 0
SideFrame.Position = UDim2.new(0.975000024, 0, 0, 0)
SideFrame.Size = UDim2.new(0, 6, 0, 50)

SideFrameCorner.Name = "SideFrameCorner"
SideFrameCorner.Parent = SideFrame

Sound.Name = "Notif Sound"
Sound.Parent = Holder
Sound.SoundId = "rbxassetid://6026984224"

Blur.Parent = game.Lighting
Blur.Name = "Notification Blur"
Blur.Size = 1400
Blur.Enabled = true

ts:create(Notif, TweenInfo.new(.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.00525920372, 0, 0.440935671, 0)}):Play()
Sound:Play()
wait(.6)
ts:create(Title, TweenInfo.new(.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
wait(.2)
ts:create(Desc, TweenInfo.new(.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
wait(6)
ts:create(Title, TweenInfo.new(.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
ts:create(Desc, TweenInfo.new(.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
wait(.5)
ts:create(Notif, TweenInfo.new(.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(-1, 0, 0.440935671, 0)}):Play()
Blur:Destroy()
wait(.1)
Holder:Destroy()

repeat
    wait()
until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and game:IsLoaded()
local vu = game:GetService("VirtualUser")
game:service "Players".LocalPlayer.Idled:connect(
    function()
        wait(.2)
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(.2)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
)

loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
