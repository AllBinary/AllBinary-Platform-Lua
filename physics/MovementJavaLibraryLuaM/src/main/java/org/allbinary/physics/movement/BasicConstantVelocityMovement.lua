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

local BasicConstantVelocityMovement = {}
BasicConstantVelocityMovement.__index = BasicConstantVelocityMovement
BasicConstantVelocityMovement.className = "BasicConstantVelocityMovement"
setmetatable(BasicConstantVelocityMovement, {__index = Movement})

function BasicConstantVelocityMovement:_init_fields()
    self.velocityProperties = nil
    self.speedBasicDecimal = BasicDecimal.ZERO_BIGDECIMAL
    self.axisMathVectorUtil = AxisMathVectorUtil.getInstance()
end


function BasicConstantVelocityMovement.new(basicDecimal, velocityProperties)
    local self = setmetatable(Movement.new(), BasicConstantVelocityMovement)
    self:_init_fields()
        self:setSpeedBasicDecimal(basicDecimal)
        self.velocityProperties = velocityProperties
    return self
end


function BasicConstantVelocityMovement:init(speedBasicDecimal, angle, otherAngle)
        self.speedBasicDecimal = speedBasicDecimal
        local angleFactory = AngleFactory.getInstance()
        self.velocityProperties:setVelocityWithBigDecimal(speedBasicDecimal, angleFactory:getAt(angle), angleFactory:getAt(otherAngle))
end


function BasicConstantVelocityMovement:moveOutsideRadius(layer, radius, angle, otherAngle)
        local scaleFactorValue = self.speedBasicDecimal:getScaledFactorValue()
        local xVector = java_int((self.axisMathVectorUtil:calculateX(radius, angle) / scaleFactorValue))
        local yVector = java_int((self.axisMathVectorUtil:calculateY(radius, angle) / scaleFactorValue))
        local zVector = java_int((self.axisMathVectorUtil:calculateZ(radius, otherAngle) / scaleFactorValue))
        layer:moveDXYZ(xVector, yVector, zVector)
end


-- throws Exception
function BasicConstantVelocityMovement:process(layer)
        layer:moveDXYZ(self.velocityProperties:getVelocityXBasicDecimalP():getScaled(), self.velocityProperties:getVelocityYBasicDecimalP():getScaled(), self.velocityProperties:getVelocityZBasicDecimalP():getScaled())
end


function BasicConstantVelocityMovement:toString()
        return tostring(self.velocityProperties)
end
BasicConstantVelocityMovement.__tostring = function(self) return self:toString() end


function BasicConstantVelocityMovement:stop()
        self.velocityProperties:zero()
end


function BasicConstantVelocityMovement:getVelocityProperties()
        return self.velocityProperties
end


function BasicConstantVelocityMovement:setVelocityProperties(velocityProperties)
        self.velocityProperties = velocityProperties
end


function BasicConstantVelocityMovement:setSpeedBasicDecimal(speedBasicDecimal)
        self.speedBasicDecimal = speedBasicDecimal
end


function BasicConstantVelocityMovement:getSpeedBasicDecimal()
        return self.speedBasicDecimal
end

return BasicConstantVelocityMovement

