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
local BasicVelocityProperties = require("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local VelocityInterfaceCompositeInterface = require("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local AxisMathVectorUtil = require("org.allbinary.logic.math.vector.AxisMathVectorUtil")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local Movement = require("org.allbinary.physics.movement.Movement")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoZBasicConstantVelocityMovement = {}
NoZBasicConstantVelocityMovement.__index = NoZBasicConstantVelocityMovement
NoZBasicConstantVelocityMovement.className = "NoZBasicConstantVelocityMovement"
setmetatable(NoZBasicConstantVelocityMovement, {__index = Movement})

function NoZBasicConstantVelocityMovement:_init_fields()
    self.velocityProperties = nil
    self.speedBasicDecimal = BasicDecimal.ZERO_BIGDECIMAL
    self.axisMathVectorUtil = AxisMathVectorUtil.getInstance()
end


function NoZBasicConstantVelocityMovement.new(basicDecimal, velocityProperties)
    local self = setmetatable(Movement.new(), NoZBasicConstantVelocityMovement)
    self:_init_fields()
        self:setSpeedBasicDecimal(basicDecimal)
        self.velocityProperties = velocityProperties
    return self
end


function NoZBasicConstantVelocityMovement:init(speedBasicDecimal, angle, otherAngle)
        self.speedBasicDecimal = speedBasicDecimal
        local angleFactory = AngleFactory.getInstance()
        self.velocityProperties:setVelocityWithBigDecimal(speedBasicDecimal, angleFactory:getAt(angle), angleFactory:getAt(otherAngle))
end


function NoZBasicConstantVelocityMovement:moveOutsideRadius(layer, radius, angle, otherAngle)
        local scaleFactorValue = self.speedBasicDecimal:getScaledFactorValue()
        local xVector = java_int((self.axisMathVectorUtil:calculateX(radius, angle) / scaleFactorValue))
        local yVector = java_int((self.axisMathVectorUtil:calculateY(radius, angle) / scaleFactorValue))
        layer:moveDXYZ(xVector, yVector, 0)
end


-- throws Exception
function NoZBasicConstantVelocityMovement:process(layer)
        layer:moveDXYZ(self.velocityProperties:getVelocityXBasicDecimalP():getScaled(), self.velocityProperties:getVelocityYBasicDecimalP():getScaled(), 0)
end


function NoZBasicConstantVelocityMovement:toString()
        return tostring(self.velocityProperties)
end
NoZBasicConstantVelocityMovement.__tostring = function(self) return self:toString() end


function NoZBasicConstantVelocityMovement:stop()
        self.velocityProperties:zero()
end


function NoZBasicConstantVelocityMovement:getVelocityProperties()
        return self.velocityProperties
end


function NoZBasicConstantVelocityMovement:setVelocityProperties(velocityProperties)
        self.velocityProperties = velocityProperties
end


function NoZBasicConstantVelocityMovement:setSpeedBasicDecimal(speedBasicDecimal)
        self.speedBasicDecimal = speedBasicDecimal
end


function NoZBasicConstantVelocityMovement:getSpeedBasicDecimal()
        return self.speedBasicDecimal
end

return NoZBasicConstantVelocityMovement

