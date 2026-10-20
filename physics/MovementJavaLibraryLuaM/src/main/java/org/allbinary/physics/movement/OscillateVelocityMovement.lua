--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.physics.movement

local AllBinaryGameLayer = require("org.allbinary.game.layer.AllBinaryGameLayer")
local VelocityProperties = require("org.allbinary.game.physics.velocity.VelocityProperties")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local BasicConstantVelocityMovement = require("org.allbinary.physics.movement.BasicConstantVelocityMovement")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OscillateVelocityMovement = {}
OscillateVelocityMovement.__index = OscillateVelocityMovement
OscillateVelocityMovement.className = "OscillateVelocityMovement"
setmetatable(OscillateVelocityMovement, {__index = BasicConstantVelocityMovement})

function OscillateVelocityMovement:_init_fields()
    self.oscillateMin = nil
    self.oscillateMax = nil
    self.oscillate = 0
    self.oscillatePositive = false
end


function OscillateVelocityMovement.new(speedBasicDecimal, oscillateMin, oscillateMax)
    local self = setmetatable(BasicConstantVelocityMovement.new(speedBasicDecimal, VelocityProperties.new(java_int(speedBasicDecimal:getUnscaled()), java_int(speedBasicDecimal:getUnscaled()))), OscillateVelocityMovement)
    self:_init_fields()
        -- super(...) made self above
        self.oscillateMin = oscillateMin
        self.oscillateMax = oscillateMax
    return self
end


-- throws Exception
function OscillateVelocityMovement:process(layer)
        BasicConstantVelocityMovement.process(self, layer)
        if self.oscillate < self.oscillateMin then
            self.oscillatePositive = true
        elseif self.oscillate > self.oscillateMax then
            self.oscillatePositive = false
        end
        if self.oscillatePositive then
            self.oscillate = self.oscillate + 1
            self:getVelocityProperties():getVelocityXBasicDecimalP():addint(2000)
        else
            self.oscillate = self.oscillate - 1
            self:getVelocityProperties():getVelocityXBasicDecimalP():subtractint(2000)
        end
end

return OscillateVelocityMovement

