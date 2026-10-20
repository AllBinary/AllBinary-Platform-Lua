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
-- package org.allbinary.game.physics.velocity

local Direction = require("org.allbinary.direction.Direction")
local DirectionUtil = require("org.allbinary.direction.DirectionUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local AxisMathVectorUtil = require("org.allbinary.logic.math.vector.AxisMathVectorUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Angle = require("org.allbinary.math.Angle")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicVelocityInterface = require("org.allbinary.game.physics.velocity.BasicVelocityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicVelocityProperties = {}
BasicVelocityProperties.__index = BasicVelocityProperties
BasicVelocityProperties.className = "BasicVelocityProperties"

function BasicVelocityProperties:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.velocityXBasicDecimal = nil
    self.velocityYBasicDecimal = nil
    self.velocityZBasicDecimal = nil
    self.axisMathVectorUtil = AxisMathVectorUtil.getInstance()
    self.directionUtil = DirectionUtil.getInstance()
end


function BasicVelocityProperties.new()
    local self = setmetatable({}, BasicVelocityProperties)
    self:_init_fields()
        self.velocityXBasicDecimal = BasicDecimal.new(0)
        self.velocityYBasicDecimal = BasicDecimal.new(0)
        self.velocityZBasicDecimal = BasicDecimal.new(0)
    return self
end


function BasicVelocityProperties:zero()
        self.velocityXBasicDecimal:setint(0)
        self.velocityYBasicDecimal:setint(0)
        self.velocityZBasicDecimal:setint(0)
end


function BasicVelocityProperties:getVelocityXBasicDecimalP()
        return self.velocityXBasicDecimal
end


function BasicVelocityProperties:getVelocityYBasicDecimalP()
        return self.velocityYBasicDecimal
end


function BasicVelocityProperties:getVelocityZBasicDecimalP()
        return self.velocityZBasicDecimal
end


function BasicVelocityProperties:setVelocityWithBigDecimalAndDirection(magnitudeBasicDecimal, direction, otherDirection)
        local angle = self.directionUtil:getAngle(direction)
        local otherAngle = self.directionUtil:getAngle(otherDirection)
        self:setVelocityWithBigDecimal(magnitudeBasicDecimal, angle, otherAngle)
end


function BasicVelocityProperties:setVelocityWithDirection(magnitude, direction, otherDirection)
        local angle = self.directionUtil:getAngle(direction)
        local otherAngle = self.directionUtil:getAngle(otherDirection)
        self:setVelocity(magnitude, angle, otherAngle)
end


function BasicVelocityProperties:addVelocityWithBigDecimalAndDirection(magnitudeBasicDecimal, direction, otherDirection)
        local angle = self.directionUtil:getAngle(direction)
        local otherAngle = self.directionUtil:getAngle(otherDirection)
        self:addVelocityWithBigDecimal(magnitudeBasicDecimal, angle, otherAngle)
end


function BasicVelocityProperties:addVelocityWithDirection(magnitude, direction, otherDirection)
        local angle = self.directionUtil:getAngle(direction)
        local otherAngle = self.directionUtil:getAngle(otherDirection)
        self:addVelocity(magnitude, angle, otherAngle)
end


function BasicVelocityProperties:setVelocityWithBigDecimal(magnitudeBasicDecimal, angle, otherAngle)
        local magnitude = magnitudeBasicDecimal:getUnscaled()
        self:setVelocity(magnitude, angle, otherAngle)
end


function BasicVelocityProperties:addVelocityWithBigDecimal(magnitudeBasicDecimal, angle, otherAngle)
        local magnitude = magnitudeBasicDecimal:getUnscaled()
        self:addVelocity(magnitude, angle, otherAngle)
end


function BasicVelocityProperties:setVelocity(magnitude, angle, otherAngle)
        self:setVelocityi(magnitude, java_int(angle:getValue()), java_int(otherAngle:getValue()))
end


function BasicVelocityProperties:addVelocity(magnitude, angle, otherAngle)
        self:addVelocityi(magnitude, java_int(angle:getValue()), java_int(otherAngle:getValue()))
end


function BasicVelocityProperties:setVelocityi(magnitude, angle, otherAngle)
        local xVector = (self.axisMathVectorUtil:calculateX(magnitude, angle) / self.velocityXBasicDecimal:getScaledFactorValue())
        local yVector = (self.axisMathVectorUtil:calculateY(magnitude, angle) / self.velocityYBasicDecimal:getScaledFactorValue())
        local zVector = (self.axisMathVectorUtil:calculateZ(magnitude, otherAngle) / self.velocityZBasicDecimal:getScaledFactorValue())
        self.velocityXBasicDecimal:setlong(xVector)
        self.velocityYBasicDecimal:setlong(yVector)
        self.velocityZBasicDecimal:setlong(zVector)
end


function BasicVelocityProperties:addVelocityi(magnitude, angle, otherAngle)
        local xVector = (self.axisMathVectorUtil:calculateX(magnitude, angle) / self.velocityXBasicDecimal:getScaledFactorValue())
        local yVector = (self.axisMathVectorUtil:calculateY(magnitude, angle) / self.velocityYBasicDecimal:getScaledFactorValue())
        local zVector = (self.axisMathVectorUtil:calculateZ(magnitude, otherAngle) / self.velocityZBasicDecimal:getScaledFactorValue())
        self.velocityXBasicDecimal:addlong(xVector)
        self.velocityYBasicDecimal:addlong(yVector)
        self.velocityZBasicDecimal:addlong(zVector)
end


function BasicVelocityProperties:toString()
        local commonSeps = CommonSeps.getInstance()
        local positionStrings = PositionStrings.getInstance()
        local stringBuffer = StringMaker.new()
        local stringUtil = StringUtil.getInstance()
        stringBuffer:append("Velocity ")
        stringBuffer:append(positionStrings.X_LABEL)
        stringBuffer:append(stringUtil:toString(self.velocityXBasicDecimal))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.Y_LABEL)
        stringBuffer:append(stringUtil:toString(self.velocityYBasicDecimal))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.Z_LABEL)
        stringBuffer:append(stringUtil:toString(self.velocityZBasicDecimal))
        return tostring(stringBuffer)
end
BasicVelocityProperties.__tostring = function(self) return self:toString() end

return BasicVelocityProperties

