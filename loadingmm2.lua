
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local player = game:GetService("Players").LocalPlayer

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local visitedPositions = {}
local collected = 0
local flySpeed = 15
local isActive = false
local antiAFK = false

if game.PlaceId ~= 142823291 then return end -- only one game support ahh script
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Backlostunking/ScriptLua/refs/heads/main/Orion-GB-V2.Lua"))()
local executor = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or "Unknow"
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Window = OrionLib:MakeWindow({IntroText = "Script made By Xatoyago3",IntroIcon = "rbxassetid://7733955511",Name = ("SLAHUB • "..GameName.." ✓ Executor "..executor),IntroToggleIcon = "rbxassetid://4335489011",HidePremium = false,SaveConfig = false,IntroEnabled = true,ConfigFolder = "Mm2SHub"})
local MainTab = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local PlayerTab = Window:MakeTab({Name = "Local", Icon = "rbxassetid://4335489011", PremiumOnly = false})
local AutoFarmTab = Window:MakeTab({Name = "Auto Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local env = getgenv and getgenv() or getrenv and getrenv() or getfenv and getfenv(0) or _G
local cloneref = cloneref or (function()
local s, func = pcall(function()
return loadstring(game:HttpGet("https://raw.githubusercontent.com/Backlostunking/Open-Source/refs/heads/main/cloneref-TheCloneVM"))()
end)
return s and func or function(s) return s end
end)()
local Players = cloneref(game:GetService("Players"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local Tween = cloneref(game:GetService("TweenService"))
local RunService = cloneref(game:GetService("RunService"))
local Workspace = cloneref(game:GetService("Workspace"))
local LocalPlayer = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() -- should clone this localplayer method if the game have anticlient modified
local backpack = LocalPlayer:FindFirstChild("Backpack") or LocalPlayer:WaitForChild("Backpack")
local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() --and LocalPlayer.CharacterAppearanceLoaded:Wait()
local Hum = Char and Char:FindFirstChildWhichIsA("Humanoid")
local Root = (Hum and Hum.RootPart) or Char:FindFirstChild("HumanoidRootPart") or Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso")
LocalPlayer.CharacterAdded:Connect(function()
	repeat task.wait()
	LocalPlayer = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    backpack = LocalPlayer:FindFirstChild("Backpack") or LocalPlayer:WaitForChild("Backpack")
    Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    Hum = Char and Char:FindFirstChildWhichIsA("Humanoid")
    Root = (Hum and Hum.RootPart) or Char:FindFirstChild("HumanoidRootPart") or Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso")
until LocalPlayer and backpack and Char and Hum and Root
end)
local function SHubFling(TargetPlayer)
    if not (Char and Hum and Root) then return end
    local TCharacter = TargetPlayer.Character
    if not TCharacter then return end
    local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart
    local THead = TCharacter:FindFirstChild("Head")
    local Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    local Handle = Accessory and Accessory:FindFirstChild("Handle")
    env.OldPos = Root.CFrame
     repeat task.wait()
    Workspace.CurrentCamera.CameraSubject = THead or Handle or THumanoid
     until Workspace.CurrentCamera.CameraSubject == THead or Handle or THumanoid
    local function FPos(BasePart, Pos, Ang)
        local targetCF = CFrame.new(BasePart.Position) * Pos * Ang
        Root.CFrame = targetCF
        Char:SetPrimaryPartCFrame(targetCF)
        Root.Velocity = Vector3.new(9e7, 9e8, 9e7)
        Root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
    end
    local function SFBasePart(BasePart)
        local start = tick()
        local angle = 0
        env.timeout = env.timeout or 2.5
        repeat
            if Root and THumanoid then
                angle += 100
                for _, offset in ipairs{CFrame.new(0, 1.5, 0),CFrame.new(0, -1.5, 0),CFrame.new(2.25, 1.5, -2.25),CFrame.new(-2.25, -1.5, 2.25)} do
                    FPos(BasePart, offset + THumanoid.MoveDirection, CFrame.Angles(math.rad(angle), 0, 0))
                    task.wait()
                end
            end
        until BasePart.Velocity.Magnitude > 500 or tick() - start > env.timeout
    end
    --Workspace.FallenPartsDestroyHeight = 1000
    local BV = Instance.new("BodyVelocity")
    BV.Name = "SeYyyVel!?"
    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BV.Parent = Root
    Hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    local target = TRootPart or THead or Handle
    if target then SFBasePart(target) end
    BV:Destroy()
   Hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
   repeat task.wait()
    Workspace.CurrentCamera.CameraSubject = Hum
   until Workspace.CurrentCamera.CameraSubject == Hum
    repeat
        local cf = env.OldPos * CFrame.new(0, .5, 0)
        Root.CFrame = cf
        Char:SetPrimaryPartCFrame(cf)
        Hum:ChangeState("GettingUp")
        for _, part in ipairs(Char:GetChildren()) do
            if part:IsA("BasePart") then
                part.Velocity, part.RotVelocity = Vector3.zero, Vector3.zero
            end
        end
        task.wait()
    until (Root.Position - env.OldPos.p).Magnitude < 25
end
local function getRoles()
    local data = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
    local roles = {}
    for plr, plrData in pairs(data) do
         if not plrData.Dead then
        roles[plr] = plrData.Role
     end
    end
    return roles
end
MainTab:AddToggle({
	Name = "Esp Player (Role&Name)",
	Default = false,
	Callback = function(Value)
env.ESP_ENABLED = Value
local updateLoop = nil
local roleColors = {
    Murderer = Color3.fromRGB(255, 0, 0),
    Sheriff = Color3.fromRGB(0, 0, 255),
    Hero = Color3.fromRGB(255, 255, 0),
    Innocent = Color3.fromRGB(0, 255, 0),
    Default = Color3.fromRGB(200, 200, 200)
}
local function clearESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local esp = head:FindFirstChild("RoleESP")
                if esp then esp:Destroy() end
            end
            local hl = player.Character:FindFirstChild("RoleHighlight")
            if hl then hl:Destroy() end
        end
    end
end
local function applyHighlight(character, role)
    local existing = character:FindFirstChild("RoleHighlight")
    if existing then existing:Destroy() end
    local hl = Instance.new("Highlight")
    hl.Name = "RoleHighlight"
    hl.FillColor = roleColors[role] or roleColors.Default
    hl.OutlineColor = Color3.new(1, 1, 1)
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.FillTransparency = 0.4
    hl.OutlineTransparency = 0
    hl.Parent = character
end
local function createBillboard(head, role, playerName)
    local esp = Instance.new("BillboardGui")
    esp.Name = "RoleESP"
    esp.Adornee = head
    esp.Size = UDim2.new(5, 0, 5, 0)
    esp.AlwaysOnTop = true
    esp.Parent = head
    local label = Instance.new("TextLabel")
    label.Name = "RoleLabel"
    label.Parent = esp
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextStrokeTransparency = 0
    label.TextSize = 14
    label.TextColor3 = roleColors[role] or roleColors.Default
    label.Font = Enum.Font.FredokaOne
    label.Text = ("Role: %s • Name: %s"):format(role, playerName)
-- Example: If you don't know what this means
-- The () around the string allow us to immediately call a string method (like :format, :match, etc).
-- It works the same as writing:
-- string.format("Role: %s • Name: %s", role, playerName)
-- But this version is cleaner and faster to type (I think)
end
local function updateESP()
    local roles = getRoles()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local role = roles[player.Name] or "Default"
                if not head:FindFirstChild("RoleESP") then
                    createBillboard(head, role, player.Name)
                else
                    local label = head.RoleESP:FindFirstChild("RoleLabel")
                    if label then
                        label.Text = ("Role: %s • Name: %s"):format(role, player.Name)
                        label.TextColor3 = roleColors[role] or roleColors.Default
                    end
                end
              local light = player.Character:FindFirstChild("RoleHighlight")
              if not light then
                applyHighlight(player.Character, role)
                 else
                 light.FillColor = roleColors[role] or roleColors.Default
                end
            end
        end
    end
end
local function startESP()
    if updateLoop then return end
    updateLoop = task.spawn(function()
        while env.ESP_ENABLED do
            pcall(updateESP)
            task.wait(0.25)
        end
        clearESP()
        updateLoop = nil
    end)
end
if Value then
        startESP()
    else
        clearESP()
    end
end
})
MainTab:AddToggle({
	Name = "Esp Gun",
	Default = false,
	Callback = function(Value)
env.GunEsp = Value
local gun = Workspace:FindFirstChild("GunDrop", true)
if not env.GunEsp then
if gun then
if gun:FindFirstChild("GunHighlight") then
gun:FindFirstChild("GunHighlight"):Destroy()
end
if gun:FindFirstChild("GunEsp") then
gun:FindFirstChild("GunEsp"):Destroy()
end
end
end
while env.GunEsp do
gun = Workspace:FindFirstChild("GunDrop", true)
if gun then
if not gun:FindFirstChild("GunHighlight") then
    local gunh = Instance.new("Highlight", gun)
    gunh.Name = "GunHighlight"
    gunh.FillColor = Color3.new(1, 1, 0)
    gunh.OutlineColor = Color3.new(1, 1, 1)
    gunh.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    gunh.FillTransparency = 0.4
    gunh.OutlineTransparency = 0.5
end
    if not gun:FindFirstChild("GunEsp") then
        local esp = Instance.new("BillboardGui")
        esp.Name = "GunEsp"
        esp.Adornee = gun
        esp.Size = UDim2.new(5, 0, 5, 0)
        esp.AlwaysOnTop = true
        esp.Parent = gun
        local text = Instance.new("TextLabel", esp)
        text.Name = "GunLabel"
        text.Size = UDim2.new(1, 0, 1, 0)
        text.BackgroundTransparency = 1
        text.TextStrokeTransparency = 0
        text.TextColor3 = Color3.fromRGB(255, 255, 0)
        text.Font = Enum.Font.FredokaOne
        text.TextSize = 16
        text.Text = "Gun Drop"
    end
end
task.wait(0.1)
end
	end    
})
MainTab:AddButton({
	Name = "Grab Gun",
	Callback = function()
if Char and Char ~= nil and Root then
local gun = Workspace:FindFirstChild("GunDrop",true)
if gun then
if firetouchinterest then
firetouchinterest(Root, gun, 0)
firetouchinterest(Root, gun, 1)
else
gun.CFrame = Root.CFrame
end
end
end
  	end    
})
MainTab:AddToggle({
	Name = "Auto Grab Gun",
	Default = false,
	Callback = function(Value)
env.AGG = Value
while env.AGG do
if Char and Char ~= nil and Root then
gun = Workspace:FindFirstChild("GunDrop",true)
 if gun then
if firetouchinterest then
firetouchinterest(Root, gun, 0)
firetouchinterest(Root, gun, 1)
else
gun.CFrame = Root.CFrame
end
end
end
task.wait(0.1)
end
	end    
})
MainTab:AddButton({
	Name = "Steal Gun (From Sheriff&Hero)",
	Callback = function()
if Char and Char ~= nil and Hum and backpack then
for _, p in pairs(Players:GetPlayers()) do
if p ~= LocalPlayer then
if p.Character and p.Character:FindFirstChild("Gun") then
p.Character:FindFirstChild("Gun").Parent = Char
Hum:EquipTool(Char:FindFirstChild("Gun"))
Hum:UnequipTools()
elseif p:FindFirstChild("Backpack") and p.Backpack:FindFirstChild("Gun") then
p.Backpack:FindFirstChild("Gun").Parent = backpack
Hum:EquipTool(backpack:FindFirstChild("Gun"))
Hum:UnequipTools()
end
end
end
end
  	end    
})
local function getMurdererTarget()
local data = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
for plr, plrData in pairs(data) do
if plrData.Role == "Murderer" then
local player = Players:FindFirstChild(plr)
if player then
if player == LocalPlayer then return nil, true end
local char = player.Character
if char then
local hrp = char:FindFirstChild("HumanoidRootPart")
if hrp then return hrp.Position, false end
local head = char:FindFirstChild("Head")
if head then return head.Position, false end
end
end
end
end
return nil, false
end
MainTab:AddToggle({
	Name = "Shoot Murder Button",
	Default = false,
	Callback = function(Value)
local guip, CoreGui = nil, game:FindService("CoreGui")
if gethui then
guip = gethui()
elseif CoreGui and CoreGui:FindFirstChild("RobloxGui") then
guip = CoreGui.RobloxGui
elseif CoreGui then
guip = CoreGui
else
guip = LocalPlayer:FindFirstChild("PlayerGui")
end
 if Value then
if not guip:FindFirstChild("GunW") then
local GunGui = Instance.new("ScreenGui", guip)
GunGui.Name = "GunW"
local TextButton = Instance.new("TextButton", GunGui)
TextButton.Draggable = true
TextButton.Position = UDim2.new(0.5, 187, 0.5, -176)
TextButton.Size = UDim2.new(0, 50, 0, 40)
TextButton.TextStrokeTransparency = 0
TextButton.BackgroundTransparency = 0.2
TextButton.BackgroundColor3 = Color3.fromRGB(44, 44, 45)
TextButton.BorderColor3 = Color3.new(1, 1, 1)
TextButton.Text = "Shoot Murder"
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.TextSize = 8
TextButton.Visible = true
TextButton.AnchorPoint = Vector2.new(0.4, 0.2)
TextButton.Active = true
TextButton.TextWrapped = true
local corner = Instance.new("UICorner", TextButton)
local UIStroke = Instance.new("UIStroke", TextButton)
UIStroke.Color = Color3.new(0, 0, 0)
UIStroke.Thickness = 4
UIStroke.Transparency = 0.4
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint", TextButton)
UIAspectRatioConstraint.AspectRatio = 1.5
local UIGradient = Instance.new("UIGradient", TextButton)
UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.new(0.3, 0.3, 0.3)),ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
    local function rotateGradient()
    local tween = Tween:Create(UIGradient, TweenInfo.new(2, Enum.EasingStyle.Linear), {Rotation = UIGradient.Rotation + 360})
    tween:Play()
    tween.Completed:Connect(rotateGradient)
end
rotateGradient()
TextButton.MouseButton1Click:Connect(function()
if Char:FindFirstChild("Gun") then
pcall(function()
Char.Gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(1, (getMurdererTarget()), "AH2")
end)
end
end)
end
else
if guip:FindFirstChild("GunW") then
guip:FindFirstChild("GunW"):Destroy()
end
end
	end    
})
local function check()
	local success, hookFunc = false, nil
        if not getnamecallmethod or not checkcaller then return success end
	local mt = getrawmetatable and getrawmetatable(game) or debug.getmetatable and debug.getmetatable(game)
	local function handleNamecall(self, ...)
		local method = getnamecallmethod and getnamecallmethod()
		local args = {...}
		if not checkcaller() then
			if method == "InvokeServer" and tostring(self) == "RemoteFunction" and env.enabledGunBot then
				return nil
			end
		end
		return hookFunc(self, unpack(args))
	end
	if hookmetamethod and newcclosure then
		hookFunc = hookmetamethod(game, "__namecall", newcclosure(handleNamecall))
		success = true
	elseif mt and setreadonly and newcclosure then
		setreadonly(mt, false)
		hookFunc = mt.__namecall
		mt.__namecall = newcclosure(handleNamecall)
		setreadonly(mt, true)
		success = true
	elseif hookmetamethod then
		hookFunc = hookmetamethod(game, "__namecall", handleNamecall)
		success = true
	elseif mt and setreadonly then
		setreadonly(mt, false)
		hookFunc = mt.__namecall
		mt.__namecall = handleNamecall
		setreadonly(mt, true)
		success = true
	elseif mt and (makewriteable or make_writeable) then
		(makewriteable or make_writeable)(mt)
		hookFunc = mt.__namecall
		mt.__namecall = handleNamecall
		success = true
	end
	return success
end
local isUseHook = check()
local AimbotMem = MainTab:AddToggle({
	Name = "Gun Aimbot",
	Default = false,
	Callback = function(Value)
if isUseHook then
env.enabledGunBot = Value
env.GunBotConnection = env.GunBotConnection or {}
local function setupGunBot(character)
	if not character then return end
	local gun = character:FindFirstChild("Gun")
	if not gun then
		if env.GunBotConnection.Connection then
			env.GunBotConnection.Connection:Disconnect()
			env.GunBotConnection.Connection = nil
		end
		return
	end
	local knifeScript = gun:FindFirstChild("KnifeLocal")
	local cb = knifeScript and knifeScript:FindFirstChild("CreateBeam")
	local remote = cb and cb:FindFirstChild("RemoteFunction")
	if not knifeScript or not cb or not remote then return end
	if env.enabledGunBot then
		if env.GunBotConnection.Connection then
			env.GunBotConnection.Connection:Disconnect()
			env.GunBotConnection.Connection = nil
		end
		env.GunBotConnection.Connection = gun.Activated:Connect(function()
			local targetPos, isSelf = getMurdererTarget()
			if not targetPos or isSelf or not remote then return end
			remote:InvokeServer(1, targetPos, "AH2")
		end)
	else
		if env.GunBotConnection.Connection then
			env.GunBotConnection.Connection:Disconnect()
			env.GunBotConnection.Connection = nil
		end
	end
end
while env.enabledGunBot do
	if Char and Char:FindFirstChild("Gun") then
		setupGunBot(Char)
	end
	task.wait(0.25)
end
if not env.enabledGunBot then
	if env.GunBotConnection.Connection then
		env.GunBotConnection.Connection:Disconnect()
		env.GunBotConnection.Connection = nil
	end
end
else
if not env.AsChange then return end
if env.AsChange.Value then
env.AsChange:Set(false)
OrionLib:MakeNotification({Name = "Your Executor Is Not Support This Function",Content = "Sorry, use a better one",Image = "rbxassetid://7733658504",Time = 3})
end
end
	end    
})
env.AsChange = AimbotMem
MainTab:AddToggle({
	Name = "Seconds Life",
	Default = false,
	Callback = function(Value)
local godcon, deathcon
env.enableGodmode = Value
local function IsGodmode()
    return env.enableGodmode
end
local function UpdateGod()
    if godcon then
        godcon:Disconnect()
        godcon = nil
    end
    if Hum then
        godcon = Hum.HealthChanged:Connect(function()
            if IsGodmode() and Hum.Health < Hum.MaxHealth then
                Hum.Health = Hum.MaxHealth
            end
        end)
    end
end
local function OnCharacterAdded(newChar)
    Char = newChar
    Hum = Char:WaitForChild("Humanoid")
    UpdateGod()
end
if deathcon then deathcon:Disconnect() end
deathcon = LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)
UpdateGod()
task.spawn(function()
        if not env.enableGodmode then
            if godcon then
                godcon:Disconnect()
                godcon = nil
             end
        else
            if not godcon then
                UpdateGod()
            end
        end
end)
	end    
})
MainTab:AddToggle({
	Name = "Touch Fling",
	Default = false,
	Callback = function(Value)
env.isTouchfling = Value
local vel, movel = nil, 0.1
while env.isTouchfling do
RunService.Heartbeat:Wait()
vel = Root.Velocity
Root.Velocity = vel * 9e8 + Vector3.new(0, 9e8, 0)
RunService.RenderStepped:Wait()
if Char and Char.Parent and Root and Root.Parent then
Root.Velocity = vel
end
RunService.Stepped:Wait()
if Char and Char.Parent and Root and Root.Parent then
Root.Velocity = vel + Vector3.new(0, movel, 0)
movel = movel * -1
end
end
end
})
MainTab:AddToggle({
    Name = "Noclip Players (AntiFling)",
    Default = false,
    Callback = function(value)
        env.NoclipPlr = value
if not env.NoclipPlr then
for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                for _, v in pairs(player.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
end
while env.NoclipPlr do
for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                for _, v in pairs(player.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
          task.wait()
        end
    end
})
MainTab:AddButton({
	Name = "Teleport To Map",
	Callback = function()
local map = Workspace:FindFirstChild("CoinContainer", true)
if map and map.Parent then
local part = map:FindFirstChildWhichIsA("BasePart", true)
local parts = map.Parent:FindFirstChildWhichIsA("BasePart", true)
if Char and part and part.CFrame then
Char:PivotTo(part.CFrame * CFrame.new(0, 2, 0))
elseif Char and parts and parts.CFrame then
Char:PivotTo(parts.CFrame * CFrame.new(0, 2, 0))
elseif Root and part and part.CFrame then
Root.CFrame = part.CFrame * CFrame.new(0, 2, 0)
elseif Root and parts and parts.CFrame then
Root.CFrame = parts.CFrame * CFrame.new(0, 2, 0)
end
end
  	end    
})
MainTab:AddButton({
	Name = "Teleport To Lobby",
	Callback = function()
local lobby = Workspace:FindFirstChild("Lobby", true)
if lobby and lobby.Parent then
local part = lobby:FindFirstChildWhichIsA("BasePart", true)
local parts = lobby.Parent:FindFirstChildWhichIsA("BasePart", true)
if Char and part and part.CFrame then
Char:PivotTo(part.CFrame * CFrame.new(0, 2, 0))
elseif Char and parts and parts.CFrame then
Char:PivotTo(parts.CFrame * CFrame.new(0, 2, 0))
elseif Root and part and part.CFrame then
Root.CFrame = part.CFrame * CFrame.new(0, 2, 0)
elseif Root and parts and parts.CFrame then
Root.CFrame = parts.CFrame * CFrame.new(0, 2, 0)
end
end
  	end    
})
MainTab:AddSlider({
	Name = "Set Timeout Fling",
	Min = 0.5,
	Max = 10,
	Default = 2.5,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 0.1,
	ValueName = "Timeout",
	Callback = function(Value)
		env.timeout = Value
	end    
})
MainTab:AddButton({
	Name = "Fling Murderer",
	Callback = function()
local Murderer = nil
for plr, role in getRoles() do
if role == "Murderer" then
Murderer = Players:FindFirstChild(plr)
break
end
end
if Murderer and Murderer ~= LocalPlayer then
    SHubFling(Murderer)
end
	end    
})
MainTab:AddButton({
	Name = "Fling Sheriff/Hero",
	Callback = function()
local Target = nil
for plr, role in getRoles() do
if role == "Sheriff" or role == "Hero" then
Target = Players:FindFirstChild(plr)
break
end
end
if Target and Target ~= LocalPlayer then
    SHubFling(Target)
end
	end    
})
local function getPlayerNames()
    local name = {}
    for _, player in ipairs(Players:GetPlayers()) do
         if player ~= LocalPlayer then
            table.insert(name, player.Name)
      end
    end
    return name
end
local TargetPlayer = nil
local PlayerDropdown = MainTab:AddDropdown({
    Name = "Select Player",
    Default = nil,
    Options = getPlayerNames(),
    Callback = function(Value)
        TargetPlayer = Value
    end
})
local function updateDropdown()
    PlayerDropdown:Refresh(getPlayerNames(), true)
    PlayerDropdown:Set(TargetPlayer)
end
Players.PlayerAdded:Connect(updateDropdown)
Players.PlayerRemoving:Connect(updateDropdown)
MainTab:AddButton({
	Name = "Fling Select Player",
	Callback = function()
if TargetPlayer then
local get = Players:FindFirstChild(TargetPlayer)
if get and get ~= LocalPlayer then
    SLAHUBFling(get)
end
end
	end    
})
PlayerTab:AddToggle({
	Name = "Infinity Jump",
	Default = false,
	Callback = function(Value)
env.InfiniteJump = Value
game:GetService("UserInputService").JumpRequest:Connect(function()
if env.InfiniteJump then
if Char and Char ~= nil and Hum then
Hum:ChangeState("Jumping")
end
end
end)
	end    
})
PlayerTab:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(value)
        env.Noclip = value

        if not env.Noclip then
            -- Turn collisions back ON when disabled
            if Char and Char ~= nil then
                for _, c in pairs(Char:GetChildren()) do
                    if c:IsA("BasePart") then
                        c.CanCollide = true
                    end
                end
            end
        else
            -- Run a loop while noclip is enabled
            task.spawn(function()
                while env.Noclip do
                    if Char and Char ~= nil then
                        for _, c in pairs(Char:GetChildren()) do
                            if c:IsA("BasePart") then
                                c.CanCollide = false
                            end
                        end
                    end
                    task.wait() -- prevents lag
                end
            end)
        end
    end
})

PlayerTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 350,
    Default = env.Walkspeed or 16,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "WalkSpeed",
    Callback = function(Value)
if Char and Char ~= nil and Hum then
Hum.WalkSpeed = Value or 16
end
env.Walkspeed = Value or 16
    end    
})
PlayerTab:AddTextbox({
    Name = "WalkSpeed",
    Default = env.Walkspeed or "16",
    TextDisappear = false,
    Callback = function(Value)
if Char and Char ~= nil and Hum then
Hum.WalkSpeed = tonumber(Value) or 16
end
env.Walkspeed = tonumber(Value) or 16
    end	  
})
PlayerTab:AddToggle({
    Name = "WalkSpeed Set Auto",
    Default = false,
    Callback = function(Value)
env.KeepWalkspeed = Value
while env.KeepWalkspeed do
if Char and Char ~= nil and Hum then
      if Hum.WalkSpeed ~= env.Walkspeed then
        Hum.WalkSpeed = env.Walkspeed
      end
end
            task.wait()
        end
    end    
})
PlayerTab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 500,
    Default = env.Jumppower or 50,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "JumpPower",
    Callback = function(Value)
if Char and Char ~= nil and Hum then
    Hum.JumpPower = Value or 50
end
        env.Jumppower = Value or 50
    end    
})
PlayerTab:AddTextbox({
    Name = "JumpPower",
    Default = env.Jumppower or "50",
    TextDisappear = false,
    Callback = function(Value)
if Char and Char ~= nil and Hum then
   Hum.JumpPower = tonumber(Value) or 50
  end
        env.Jumppower = tonumber(Value) or 50
    end	  
})
PlayerTab:AddToggle({
    Name = "JumpPower Set Auto",
    Default = false,
    Callback = function(Value)
env.KeepJumppower = Value
while env.KeepJumppower do
if Char and Char ~= nil and Hum then
            if Hum.JumpPower ~= env.Jumppower then
                Hum.JumpPower = env.Jumppower
            end
       end
            task.wait()
        end
    end    
})
-- ✅ Auto Farm Section
local flySpeed = 15
local visitedPositions = {}
local collected = 0
local isActive = false

-- Create a simple counter label
local counterLabel = Instance.new("TextLabel")
counterLabel.Size = UDim2.new(0, 300, 0, 50)
counterLabel.Position = UDim2.new(0.5, -150, 0, 50)
counterLabel.BackgroundTransparency = 0.5
counterLabel.BackgroundColor3 = Color3.fromRGB(0,0,0)
counterLabel.TextColor3 = Color3.fromRGB(255,255,255)
counterLabel.TextScaled = true
counterLabel.Text = "Coins/Eggs/Balls Collected: 0"
counterLabel.Parent = game.CoreGui

-- Collect sound
local collectSound = Instance.new("Sound")
collectSound.SoundId = "rbxassetid://12222216" -- replace with your preferred sound
collectSound.Volume = 1
collectSound.Parent = game:GetService("SoundService")

local function flyTo(position, speed)
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    while (rootPart.Position - position).Magnitude > 2 do
        if not isActive then break end
        local direction = (position - rootPart.Position).Unit
        rootPart.CFrame = CFrame.new(rootPart.Position + direction * speed * task.wait())
        task.wait()
    end
end

-- =========================
-- GUI BUTTONS FUNCTIONALITY
-- =========================

-- Function to create a button
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

-- Function to create a label
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

-- Buttons & Labels
local toggleBtn = makeButton(60, "Auto Farm: OFF")
local afkBtn = makeButton(100, "Anti-AFK: OFF")
local speedBtn = makeButton(140, "Tween Speed: 15")
local counterLabel = makeLabel(180, "Coins/Eggs/Balls Collected: 0")
local timerLabel = makeLabel(205, "Time Active: 0s")
local rateLabel = makeLabel(230, "Est. Coins/Hour: 0")
local resetBtn = makeButton(255, "🔄 Reset Counter")

-- Reset Counter Button
resetBtn.MouseButton1Click:Connect(function()
    collected = 0
    startTime = tick()
    counterLabel.Text = "Coins/Eggs Collected: 0"
    timerLabel.Text = "Time Active: 0s"
    rateLabel.Text = "Est. Coins/Hour: 0"
end)

-- Anti-AFK Button
afkBtn.MouseButton1Click:Connect(function()
    antiAFK = not antiAFK
    afkBtn.Text = antiAFK and "Anti-AFK: ON" or "Anti-AFK: OFF"
end)

player.Idled:Connect(function()
    if antiAFK then
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end
end)

-- Speed Button
speedBtn.MouseButton1Click:Connect(function()
    flySpeed += 1
    if flySpeed > 25 then flySpeed = 10 end
    speedBtn.Text = "Tween Speed: " .. flySpeed
end)

-- FlyTo Function (Tween-based)
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

-- Assuming 'AutoFarmTab' is your existing Orion tab

-- Toggle Auto Farm
AutoFarmTab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(value)
        isActive = value
        if isActive then
            collected = 0
            startTime = tick()
            visitedPositions = {}
            -- spawn your main autofarm loop here
            task.spawn(function()
                while isActive do
                    character = player.Character or player.CharacterAdded:Wait()
                    rootPart = character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        local closest, shortest = nil, math.huge
                        for _, obj in ipairs(workspace:GetDescendants()) do
                            if obj:IsA("BasePart") and (obj.Name == "Coin_Server" or obj.Name == "BeachBall") then
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
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Toggle Anti-AFK
AutoFarmTab:AddToggle({
    Name = "Anti-AFK",
    Default = false,
    Callback = function(value)
        antiAFK = value
    end
})

-- Tween Speed Slider
AutoFarmTab:AddSlider({
    Name = "Tween Speed",
    Min = 5,
    Max = 25,
    Default = 25,
    Increment = 1,
    ValueName = "speed",
    Callback = function(value)
        flySpeed = value
    end
})

-- Reset Counter Button
AutoFarmTab:AddButton({
    Name = "Reset Counter",
    Callback = function()
        collected = 0
        startTime = tick()
    end
})
-- Labels for stats
local collectedLabel = AutoFarmTab:AddLabel("Collected: 0")
local timeLabel = AutoFarmTab:AddLabel("Time Active: 0s")
local rateLabel = AutoFarmTab:AddLabel("Est. Coins/Hour: 0")

-- Start time for calculation
startTime = tick()

-- Update stats every 0.5s
task.spawn(function()
    while true do
        if isActive then
            local elapsed = tick() - startTime
            timeLabel:Set("Time Active: " .. math.floor(elapsed) .. "s")
            collectedLabel:Set("Collected: " .. collected)
            local rate = elapsed > 0 and math.floor((collected / elapsed) * 3600) or 0
            rateLabel:Set("Est. Coins/Hour: " .. rate)
        else
            -- Optional: pause stats when Auto Farm is off
        end
        task.wait(0.5)
    end
end)
local player = game.Players.LocalPlayer

if identifyexecutor and identifyexecutor() == "Delta" then
    -- Create ScreenGui
    local gui = Instance.new("ScreenGui")
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui") -- Parent to PlayerGui

    -- Create warning frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 480, 0, 60)
    frame.Position = UDim2.new(0.5, -240, 0, 10) -- Top center
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.AnchorPoint = Vector2.new(0.5, 0)
    frame.Parent = gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(110, 110, 160)
    stroke.Thickness = 2

    -- Warning text
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 1, -10)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamBlack
    label.TextScaled = true
    label.TextWrapped = true
    label.Text = "⚠ Warning! Delta Executor detected. Turn off all Delta settings and rejoin (You might get kick)."
    label.Parent = frame

    -- Auto remove after 10 seconds
    task.delay(10, function()
        gui:Destroy()
    end)
end
