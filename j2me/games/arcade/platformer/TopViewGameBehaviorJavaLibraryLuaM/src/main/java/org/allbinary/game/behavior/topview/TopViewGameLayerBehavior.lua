-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.behavior.topview

local GameLayerBehavior = require("org.allbinary.game.layer.behavior.GameLayerBehavior")
local BasicAccelerationProperties = require("org.allbinary.game.physics.acceleration.BasicAccelerationProperties")
local VelocityProperties = require("org.allbinary.game.physics.velocity.VelocityProperties")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TopViewGameLayerBehavior = {}
TopViewGameLayerBehavior.__index = TopViewGameLayerBehavior
TopViewGameLayerBehavior.className = "TopViewGameLayerBehavior"
setmetatable(TopViewGameLayerBehavior, {__index = GameLayerBehavior})

function TopViewGameLayerBehavior:_init_fields()
    self.maxGravityActionIndex = nil
    self.isJumpAction = true
    self.isJumpOver = false
    self.isFallingWithoutJumpAttempt = false
    self.gravityActionIndex = 0
end


function TopViewGameLayerBehavior.new(maxGravityActionIndex)
    local self = setmetatable(GameLayerBehavior.new(), TopViewGameLayerBehavior)
    self:_init_fields()
        self.maxGravityActionIndex = maxGravityActionIndex
    return self
end


function TopViewGameLayerBehavior:gravity()
        if self.gravityActionIndex == 0 then
            self.gravityActionIndex = self.gravityActionIndex + 1
            self.isFallingWithoutJumpAttempt = true
        end
end


function TopViewGameLayerBehavior:land(velocityProperties)
        velocityProperties:getVelocityYBasicDecimalP():setint(0)
        self:landReset()
end


function TopViewGameLayerBehavior:landReset()
        self.gravityActionIndex = 0
        self.isFallingWithoutJumpAttempt = false
        self.isJumpAction = true
        self.isJumpOver = false
end


function TopViewGameLayerBehavior:up(velocityProperties, acceleration, jumpBehavior, accelerationMultiplier)
        if not self.isJumpOver then
            if self.gravityActionIndex < self.maxGravityActionIndex then
                local acceleration2 = -acceleration:getForward() * accelerationMultiplier
                velocityProperties:getVelocityYBasicDecimalP():addint(acceleration2)
                velocityProperties:limitXYToForwardAndReverseMaxVelocity()
                self.gravityActionIndex = self.gravityActionIndex + 1
            else
            end
        else
        end
        if self.isJumpAction then
            jumpBehavior:process()
            self.isJumpAction = false
        end
end


function TopViewGameLayerBehavior:inputFrames(velocityProperties)
        if self.gravityActionIndex > 0 and velocityProperties:getVelocityYBasicDecimalP():getUnscaled() > 0 then
            self.isJumpOver = true
        end
end

return TopViewGameLayerBehavior

