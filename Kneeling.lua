--[[
	     ___      _______                _     
	   / _ |____/ ___/ /  ___ ____ ___ (_)__ 
	  / __ /___/ /__/ _ \/ _ `(_-<(_-</ (_-<
	 /_/ |_|   \___/_//_/\_,_/___/___/_/___/
 				Chaemin @ saewyflow
]]

-- Keybinding --

local KneelingUp = Enum.KeyCode.Equals
local KneelingDown = Enum.KeyCode.Minus

-- Main Kneeling Script --

local Tw = game:GetService("TweenService")
local Inp = game:GetService("UserInputService")
local car = script.Parent.Car.Value

local function Kneeling(frontSpring, rearSpring, cm, sf)
	local Front = Tw:Create(frontSpring, TweenInfo.new(1, Enum.EasingStyle.Quad), {['Stiffness'] = cm})
	local Rear = Tw:Create(rearSpring, TweenInfo.new(1, Enum.EasingStyle.Quad), {['Stiffness'] = sf})
	
	Front:Play()
	Rear:Play()
end

Inp.InputBegan:Connect(function(n, z)
	local frontSpring = car.Wheels.FR.Spring
	local rearSpring = car.Wheels.RR.Spring

	if n.KeyCode == KneelingUp then
		Kneeling(frontSpring, rearSpring, 18000, 15000)
	elseif n.KeyCode == KneelingDown then
		Kneeling(frontSpring, rearSpring, 12000, 9000)
	end
end)
