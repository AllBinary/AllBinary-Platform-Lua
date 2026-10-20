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
-- package org.allbinary.game.ag.ai

local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local RotationAnimationInterface = require("org.allbinary.animation.RotationAnimationInterface")
local RotationAnimationInterfaceCompositeInterface = require("org.allbinary.animation.RotationAnimationInterfaceCompositeInterface")
local LurchAI = require("org.allbinary.game.ag.ai.tactical.LurchAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AngleIncrementInfo = require("org.allbinary.math.AngleIncrementInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LurchRotationAI = {}
LurchRotationAI.__index = LurchRotationAI
LurchRotationAI.className = "LurchRotationAI"
setmetatable(LurchRotationAI, {__index = LurchAI})

function LurchRotationAI:_init_fields()
    self.rotationAnimationInterface = nil
end


function LurchRotationAI.new(ownerLayerInterface, gameInput)
    local self = setmetatable(LurchAI.new(ownerLayerInterface, gameInput), LurchRotationAI)
    self:_init_fields()
        -- super(...) made self above
        local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
        self.rotationAnimationInterface = rotationAnimationInterfaceCompositeInterface:getRotationAnimationInterface()
        self:update()
    return self
end


function LurchRotationAI:reverse()
        LurchAI.reverse(self)
        self:update()
end


function LurchRotationAI:update()
        if self.currentRelativeAngle == 0 then
            local rotationAnimationInterface = self.rotationAnimationInterface
            local angleIncrementInfo = rotationAnimationInterface:getAngleInfoP():getAngleIncrementInfo()
            local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
            rotationAnimationInterfaceCompositeInterface:setFrame(math.tointeger(angleIncrementInfo.RIGHT_FRAME // 1))
        elseif self.currentRelativeAngle == 180 then
            local rotationAnimationInterface = self.rotationAnimationInterface
            local angleIncrementInfo = rotationAnimationInterface:getAngleInfoP():getAngleIncrementInfo()
            local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
            rotationAnimationInterfaceCompositeInterface:setFrame(math.tointeger(angleIncrementInfo.LEFT_FRAME // 1))
        end
end

return LurchRotationAI

