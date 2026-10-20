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

local BasicVelocityProperties = require("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local VelocityInterface = require("org.allbinary.game.physics.velocity.VelocityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VelocityProperties = {}
VelocityProperties.__index = VelocityProperties
VelocityProperties.className = "VelocityProperties"
setmetatable(VelocityProperties, {__index = BasicVelocityProperties})

function VelocityProperties:_init_fields()
    self.maxForwardVelocity = 0
    self.maxReverseVelocity = 0
end


function VelocityProperties.new(maxForwardVelocity, maxReverseVelocity)
    local self = setmetatable(BasicVelocityProperties.new(), VelocityProperties)
    self:_init_fields()
        self:setMaxForwardVelocity(maxForwardVelocity)
        self:setMaxReverseVelocity(maxReverseVelocity)
    return self
end


function VelocityProperties:getMaxForwardVelocity()
        return self.maxForwardVelocity
end


function VelocityProperties:setMaxForwardVelocity(maxForwardVelocity)
        self.maxForwardVelocity = maxForwardVelocity
end


function VelocityProperties:getMaxReverseVelocity()
        return self.maxReverseVelocity
end


function VelocityProperties:setMaxReverseVelocity(maxReverseVelocity)
        self.maxReverseVelocity = maxReverseVelocity
end


function VelocityProperties:limitMaxXYForwardVelocity()
        self:limitMaxXYVelocity(self:getMaxForwardVelocity())
end


function VelocityProperties:limitMaxXYReverseVelocity()
        self:limitMaxXYVelocity(self:getMaxReverseVelocity())
end


function VelocityProperties:limitMaxYForwardVelocity()
        self:limitMaxYVelocity(self:getMaxForwardVelocity())
end


function VelocityProperties:limitMaxYReverseVelocity()
        self:limitMaxYVelocity(self:getMaxReverseVelocity())
end


function VelocityProperties:limitMaxXForwardVelocity()
        self:limitMaxXVelocity(self:getMaxForwardVelocity())
end


function VelocityProperties:limitMaxXReverseVelocity()
        self:limitMaxXVelocity(self:getMaxReverseVelocity())
end


function VelocityProperties:isOverXYMaxForwardVelocity()
        return self:isOverXYMaxVelocity(self:getMaxForwardVelocity())
end


function VelocityProperties:isOverXYMaxReverseVelocity()
        return self:isOverXYMaxVelocity(self:getMaxReverseVelocity())
end


function VelocityProperties:limitXYToForwardAndReverseMaxVelocity()
        self:limitMaxXYForwardVelocity()
        self:limitMaxXYReverseVelocity()
end


function VelocityProperties:limitMaxXYVelocity(maxVelocity)
        self:limitMaxXVelocity(maxVelocity)
        self:limitMaxYVelocity(maxVelocity)
end


function VelocityProperties:limitMaxPositiveYVelocity(maxVelocity)
        if self.velocityYBasicDecimal:getUnscaled() > maxVelocity then
            self.velocityYBasicDecimal:setint(maxVelocity)
        end
end


function VelocityProperties:limitMaxNegativeYVelocity(maxVelocity)
        if self.velocityYBasicDecimal:getUnscaled() < -maxVelocity then
            self.velocityYBasicDecimal:setint(-maxVelocity)
        end
end


function VelocityProperties:limitMaxYVelocity(maxVelocity)
        self:limitMaxPositiveYVelocity(maxVelocity)
        self:limitMaxNegativeYVelocity(maxVelocity)
end


function VelocityProperties:limitMaxXVelocity(maxVelocity)
        if self.velocityXBasicDecimal:getUnscaled() > maxVelocity then
            self.velocityXBasicDecimal:setint(maxVelocity)
        end
        if self.velocityXBasicDecimal:getUnscaled() < -maxVelocity then
            self.velocityXBasicDecimal:setint(-maxVelocity)
        end
end


function VelocityProperties:isOverXYMaxVelocity(maxVelocity)
        if self.velocityXBasicDecimal:getUnscaled() > maxVelocity then
            return true
        end
        if self.velocityXBasicDecimal:getUnscaled() < -maxVelocity then
            return true
        end
        if self.velocityYBasicDecimal:getUnscaled() > maxVelocity then
            return true
        end
        if self.velocityYBasicDecimal:getUnscaled() < -maxVelocity then
            return true
        end
        return false
end


function VelocityProperties:setVelocityi(magnitude, angle, otherAngle)
        BasicVelocityProperties.setVelocityi(self, magnitude, angle, otherAngle)
        self:limitXYToForwardAndReverseMaxVelocity()
end


function VelocityProperties:addVelocityi(magnitude, angle, otherAngle)
        BasicVelocityProperties.addVelocityi(self, magnitude, angle, otherAngle)
        self:limitXYToForwardAndReverseMaxVelocity()
end

VelocityProperties.NULL_VELOCITY_PROPERTIES = VelocityProperties.new(0, 0)

return VelocityProperties

