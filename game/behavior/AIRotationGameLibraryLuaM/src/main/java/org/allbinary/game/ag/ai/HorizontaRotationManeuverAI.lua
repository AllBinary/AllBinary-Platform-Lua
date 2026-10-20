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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local ArtificialIntelligence = require("org.allbinary.ai.ArtificialIntelligence")
local ArtificialIntelligenceTransitionInterface = require("org.allbinary.ai.ArtificialIntelligenceTransitionInterface")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local RotationAnimationInterface = require("org.allbinary.animation.RotationAnimationInterface")
local RotationAnimationInterfaceCompositeInterface = require("org.allbinary.animation.RotationAnimationInterfaceCompositeInterface")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local BasicVelocityProperties = require("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local VelocityInterface = require("org.allbinary.game.physics.velocity.VelocityInterface")
local VelocityInterfaceCompositeInterface = require("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local AngleIncrementInfo = require("org.allbinary.math.AngleIncrementInfo")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HorizontaRotationManeuverAI = {}
HorizontaRotationManeuverAI.__index = HorizontaRotationManeuverAI
HorizontaRotationManeuverAI.className = "HorizontaRotationManeuverAI"
setmetatable(HorizontaRotationManeuverAI, {__index = BasicAI})

function HorizontaRotationManeuverAI:_init_fields()
    self.circularIndexUtil = CircularIndexUtil.createInstanceAt(10, Integer.MAX_VALUE)
    self.currentSpeedDivisor = 5
    self.rotationAnimationInterface = nil
    self.baseVelocityInterface = nil
    self.velocityInterface = nil
end


function HorizontaRotationManeuverAI.new(ownerLayerInterface, gameInput)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), HorizontaRotationManeuverAI)
    self:_init_fields()
        -- super(...) made self above
        local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
        self.rotationAnimationInterface = rotationAnimationInterfaceCompositeInterface:getRotationAnimationInterface()
        local velocityInterfaceCompositeInterface = self:getOwnerLayerInterface()
        self.baseVelocityInterface = velocityInterfaceCompositeInterface:getVelocityProperties()
        self.velocityInterface = self.baseVelocityInterface
        local rotationAnimationInterface = self.rotationAnimationInterface
        local angleIncrementInfo = rotationAnimationInterface:getAngleInfoP():getAngleIncrementInfo()
        rotationAnimationInterfaceCompositeInterface:setFrame(math.tointeger(angleIncrementInfo.RIGHT_FRAME // 1))
    return self
end


function HorizontaRotationManeuverAI:transition()
        local rotationAnimationInterface = self.rotationAnimationInterface
        local angleIncrementInfo = rotationAnimationInterface:getAngleInfoP():getAngleIncrementInfo()
        local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
        rotationAnimationInterfaceCompositeInterface:setFrame(math.tointeger(angleIncrementInfo.RIGHT_FRAME // 1))
        local allbinaryLayer = self:getOwnerLayerInterface()
        allbinaryLayer:setPosition(allbinaryLayer:getXP(), 1, allbinaryLayer:getZP())
end


-- throws Exception
function HorizontaRotationManeuverAI:processAI(allBinaryLayerManager)
        local rotationAnimationInterface = (self.rotationAnimationInterface)
        local angleIncrementInfo = rotationAnimationInterface:getAngleInfoP():getAngleIncrementInfo()
        local frame = self.rotationAnimationInterface:getFrame()
        local ownerLayerInterface = self:getOwnerLayerInterface()
        if ownerLayerInterface:getXP() - ownerLayerInterface:getWidth() <= 0 and frame == math.tointeger(angleIncrementInfo.LEFT_FRAME // 1) then
            self:reverse()
            self:drop()
        end
        local displayInfo = DisplayInfoSingleton.getInstance()
        if ownerLayerInterface:getX2() + ownerLayerInterface:getWidth() > displayInfo:getLastWidth() and frame == math.tointeger(angleIncrementInfo.RIGHT_FRAME // 1) then
            self:reverse()
            self:accelerate()
            self:drop()
        end
        local index = self.circularIndexUtil:getIndex()
        if math.fmod(index, self.currentSpeedDivisor) == 0 and math.fmod(index, 2) == 0 then
            BasicAI.processKeyAI(self, Canvas.UP)
            self.velocityInterface:limitMaxXYVelocity(self.velocityInterface:getMaxForwardVelocity() / self.currentSpeedDivisor)
        end
        self.circularIndexUtil:next()
        if frame == math.tointeger(angleIncrementInfo.LEFT_FRAME // 1) then
            BasicAI.processKeyAI(self, Canvas.KEY_NUM0)
        elseif frame == math.tointeger(angleIncrementInfo.RIGHT_FRAME // 1) then
            BasicAI.processKeyAI(self, Canvas.KEY_POUND)
        end
end


function HorizontaRotationManeuverAI:reverse()
        local rotationAnimationInterface = self.rotationAnimationInterface
        local angleIncrementInfo = rotationAnimationInterface:getAngleInfoP():getAngleIncrementInfo()
        local frame = self.rotationAnimationInterface:getFrame()
        if frame == math.tointeger(angleIncrementInfo.LEFT_FRAME // 1) then
            local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
            rotationAnimationInterfaceCompositeInterface:setFrame(math.tointeger(angleIncrementInfo.RIGHT_FRAME // 1))
            self.baseVelocityInterface:zero()
        elseif frame == math.tointeger(angleIncrementInfo.RIGHT_FRAME // 1) then
            local rotationAnimationInterfaceCompositeInterface = self:getOwnerLayerInterface()
            rotationAnimationInterfaceCompositeInterface:setFrame(math.tointeger(angleIncrementInfo.LEFT_FRAME // 1))
            self.baseVelocityInterface:zero()
        end
end


function HorizontaRotationManeuverAI:accelerate()
        if self.currentSpeedDivisor > 1 then
            self.currentSpeedDivisor = self.currentSpeedDivisor - 1
        end
end


function HorizontaRotationManeuverAI:drop()
        local displayInfo = DisplayInfoSingleton.getInstance()
        local ownerLayerInterface = self:getOwnerLayerInterface()
        local y = ownerLayerInterface:getYP()
        if ownerLayerInterface:getY2() + ownerLayerInterface:getHeight() > displayInfo:getLastHeight() then
            y = 0
        else
            y = y + (ownerLayerInterface:getHeight() + 1)
        end
        ownerLayerInterface:setPosition(ownerLayerInterface:getXP(), y, ownerLayerInterface:getZP())
end


function HorizontaRotationManeuverAI:getId()
        return ArtificialIntelligence.AI_ID
end

return HorizontaRotationManeuverAI

