local dragToggle = nil
local dragSpeed = 0.25
local dragInput = nil
local dragStart = nil
local startPos = nil

local Maiin = script.Parent  
local function update(input)
    local delta = input.Position - dragStart
    Maiin.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Maiin.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragToggle = true
        dragStart = input.Position
        startPos = Maiin.Position

        
        input.Changed:Connect(function()
            if dragToggle then
                update(input)
            end
        end)
    end
end)

Maiin.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragToggle = false
    end
end)
