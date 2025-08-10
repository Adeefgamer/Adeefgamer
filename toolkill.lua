local Range = math.huge

if not firetouchinterest then
    warn("exploit unsupported")
    return
end

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Tool = LocalCharacter:FindFirstChildWhichIsA("Tool")
if not Tool then return end

local Handle = Tool:FindFirstChild("Handle")
if not Handle then return end

print("start")

while task.wait() and LocalCharacter.Parent and Tool:IsDescendantOf(LocalCharacter) do
    for _, Player in next, Players:GetPlayers() do
        if LocalPlayer == Player then continue end
        local Character = Player.Character
        if not Character then continue end
        local RootPart = Character.PrimaryPart or Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
        if not RootPart or not Humanoid or Humanoid.Health <= 0 or Humanoid:GetState() == Enum.HumanoidStateType.Dead or LocalPlayer:DistanceFromCharacter(RootPart.Position) > Range then continue end
        firetouchinterest(Handle, RootPart, true)
        firetouchinterest(Handle, RootPart, false)
    end
end

print("done")