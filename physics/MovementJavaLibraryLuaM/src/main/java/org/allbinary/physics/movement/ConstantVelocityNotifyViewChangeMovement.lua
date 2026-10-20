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

local ConstantVelocityNotifyViewChangeMovement = {}
ConstantVelocityNotifyViewChangeMovement.__index = ConstantVelocityNotifyViewChangeMovement
ConstantVelocityNotifyViewChangeMovement.className = "ConstantVelocityNotifyViewChangeMovement"
setmetatable(ConstantVelocityNotifyViewChangeMovement, {__index = Movement})

function ConstantVelocityNotifyViewChangeMovement:_init_fields()
    self.basicVelocityProperties = nil
    self.speedBasicDecimal = nil
    self.axisMathVectorUtil = AxisMathVectorUtil.getInstance()
end


function ConstantVelocityNotifyViewChangeMovement.new()
    local self = setmetatable(Movement.new(), ConstantVelocityNotifyViewChangeMovement)
    self:_init_fields()
        self.speedBasicDecimal = BasicDecimal.ZERO_BIGDECIMAL
        self.basicVelocityProperties = BasicVelocityProperties.new()
    return self
end


function ConstantVelocityNotifyViewChangeMovement:init(speedBasicDecimal, angle, otherAngle)
        self.speedBasicDecimal = speedBasicDecimal
        local angleFactory = AngleFactory.getInstance()
        self.basicVelocityProperties:setVelocityWithBigDecimal(speedBasicDecimal, angleFactory:getAt(angle), angleFactory:getAt(otherAngle))
end


function ConstantVelocityNotifyViewChangeMovement:moveOutsideRadius(layer, radius, angle, otherAngle)
        local scaleFactorValue = self.speedBasicDecimal:getScaledFactorValue()
        local xVector = java_int((self.axisMathVectorUtil:calculateX(radius, angle) / scaleFactorValue))
        local yVector = java_int((self.axisMathVectorUtil:calculateY(radius, angle) / scaleFactorValue))
        local zVector = java_int((self.axisMathVectorUtil:calculateZ(radius, otherAngle) / scaleFactorValue))
        layer:moveDXYZ(xVector, yVector, zVector)
end


-- throws Exception
function ConstantVelocityNotifyViewChangeMovement:process(layer)
        local x = self.basicVelocityProperties:getVelocityXBasicDecimalP():getScaled()
        local y = self.basicVelocityProperties:getVelocityYBasicDecimalP():getScaled()
        local z = self.basicVelocityProperties:getVelocityZBasicDecimalP():getScaled()
        layer:moveDXYZ(x, y, z)
        if x ~= 0 or y ~= 0 or z ~= 0 then
            layer:onViewPositionChangeEvent()
        end
end


function ConstantVelocityNotifyViewChangeMovement:stop()
        self.basicVelocityProperties:zero()
end

return ConstantVelocityNotifyViewChangeMovement

