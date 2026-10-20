-- Generated Code Do Not Modify
-- package org.allbinary.game.input.analog

local CustomGPoint = require("org.allbinary.graphics.CustomGPoint")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AnalogLocationInput = {}
AnalogLocationInput.__index = AnalogLocationInput
AnalogLocationInput.className = "AnalogLocationInput"

function AnalogLocationInput:_init_fields()
    self.playerId = nil
    self.customGPoint = nil
    self.rz = 0
    self.rightTrigger = 0
    self.leftTrigger = 0
end


function AnalogLocationInput.new(playerId)
    local self = setmetatable({}, AnalogLocationInput)
    self:_init_fields()
        self.playerId = playerId
        self.customGPoint = CustomGPoint.new(0, 0, 0)
    return self
end


function AnalogLocationInput:getPlayerId()
        return self.playerId
end


function AnalogLocationInput:getCustomGPoint()
        return self.customGPoint
end


function AnalogLocationInput:getRz()
        return self.rz
end


function AnalogLocationInput:setRz(rz)
        self.rz = rz
end


function AnalogLocationInput:getRightTrigger()
        return self.rightTrigger
end


function AnalogLocationInput:setRightTrigger(rightTrigger)
        self.rightTrigger = rightTrigger
end


function AnalogLocationInput:getLeftTrigger()
        return self.leftTrigger
end


function AnalogLocationInput:setLeftTrigger(leftTrigger)
        self.leftTrigger = leftTrigger
end

AnalogLocationInput.NULL_ANALOG_LOCATION_INPUT = AnalogLocationInput.new(-1)

return AnalogLocationInput

