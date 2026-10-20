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

local BasicAI = require("org.allbinary.game.ai.BasicAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local BasicVelocityProperties = require("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local VelocityInterfaceCompositeInterface = require("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StopAtEdgeAI = {}
StopAtEdgeAI.__index = StopAtEdgeAI
StopAtEdgeAI.className = "StopAtEdgeAI"
setmetatable(StopAtEdgeAI, {__index = BasicAI})


function StopAtEdgeAI.new(ownerLayerInterface, gameInput)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), StopAtEdgeAI)
        -- super(...) made self above
    return self
end


-- throws Exception
function StopAtEdgeAI:processAI(allBinaryLayerManager)
        local ownerLayerInterface = self:getOwnerLayerInterface()
        local velocityInterfaceCompositeInterface = (ownerLayerInterface)
        local velocityProperties = velocityInterfaceCompositeInterface:getVelocityProperties()
        local x = ownerLayerInterface:getXP()
        local y = ownerLayerInterface:getYP()
        local x2 = ownerLayerInterface:getX2()
        local y2 = ownerLayerInterface:getY2()
        local width = ownerLayerInterface:getWidth()
        local height = ownerLayerInterface:getHeight()
        local displayInfo = DisplayInfoSingleton.getInstance()
        if x2 + velocityProperties:getVelocityXBasicDecimalP():getScaled() > displayInfo:getLastWidth() then
            ownerLayerInterface:setPosition(displayInfo:getLastWidth() - width, y, ownerLayerInterface:getZP())
            velocityProperties:getVelocityYBasicDecimalP():setint(0)
        end
        if y2 + velocityProperties:getVelocityYBasicDecimalP():getScaled() > displayInfo:getLastHeight() then
            ownerLayerInterface:setPosition(x, displayInfo:getLastHeight() - height, ownerLayerInterface:getZP())
            velocityProperties:getVelocityXBasicDecimalP():setint(0)
        end
        if x + velocityProperties:getVelocityXBasicDecimalP():getScaled() < 0 then
            ownerLayerInterface:setPosition(0, y, ownerLayerInterface:getZP())
            velocityProperties:getVelocityYBasicDecimalP():setint(0)
        end
        if y + velocityProperties:getVelocityYBasicDecimalP():getScaled() < 0 then
            ownerLayerInterface:setPosition(x, 0, ownerLayerInterface:getZP())
            velocityProperties:getVelocityXBasicDecimalP():setint(0)
        end
end

return StopAtEdgeAI

