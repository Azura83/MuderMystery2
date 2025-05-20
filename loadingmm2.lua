-- Custom Loading Screen GUI (Long Load)

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Name = "CustomLoadingScreen"

-- Black Background
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.Parent = screenGui

-- Loading Bar Container
local barFrame = Instance.new("Frame")
barFrame.AnchorPoint = Vector2.new(0.5, 0.5)
barFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
barFrame.Size = UDim2.new(0.6, 0, 0.05, 0)
barFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
barFrame.BorderSizePixel = 0
barFrame.Parent = background

-- Fill Bar
local fill = Instance.new("Frame")
fill.Size = UDim2.new(0, 0, 1, 0)
fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
fill.BorderSizePixel = 0
fill.Parent = barFrame

-- Percentage Text
local percentText = Instance.new("TextLabel")
percentText.AnchorPoint = Vector2.new(0.5, 0.5)
percentText.Position = UDim2.new(0.5, 0, 0.45, 0)
percentText.Size = UDim2.new(0, 200, 0, 50)
percentText.BackgroundTransparency = 1
percentText.Text = "Loading: 0%"
percentText.TextColor3 = Color3.new(1, 1, 1)
percentText.TextScaled = true
percentText.Font = Enum.Font.SourceSansBold
percentText.Parent = background

-- Tips Label (under the bar)
local tips = Instance.new("TextLabel")
tips.AnchorPoint = Vector2.new(0.5, 0)
tips.Position = UDim2.new(0.5, 0, 0.56, 0)
tips.Size = UDim2.new(0, 400, 0, 30)
tips.BackgroundTransparency = 1
tips.Text = "Tips: Please wait patiently"
tips.TextColor3 = Color3.new(1, 1, 1)
tips.TextScaled = true
tips.Font = Enum.Font.SourceSansItalic
tips.Parent = background

-- Randomized 3-4 minutes delay
local loadTime = math.random(180, 240) -- in seconds (3-4 mins)
local delayPerStep = loadTime / 100

-- Simulate Loading Progress
for i = 1, 100 do
	fill.Size = UDim2.new(i / 100, 0, 1, 0)
	percentText.Text = "Loading: " .. i .. "%"
	wait(delayPerStep)
end

-- Cleanup and show error
barFrame:Destroy()
tips:Destroy()

percentText.Text = "Script can't be run.\nError 404: There seems to be a problem in the script.\nMaybe try running it again."
percentText.TextColor3 = Color3.fromRGB(255, 0, 0)
percentText.TextSize = 40
percentText.Size = UDim2.new(0.8, 0, 0.2, 0)
percentText.Position = UDim2.new(0.5, 0, 0.5, 0)
percentText.Font = Enum.Font.SourceSansBold
percentText.TextWrapped = true
