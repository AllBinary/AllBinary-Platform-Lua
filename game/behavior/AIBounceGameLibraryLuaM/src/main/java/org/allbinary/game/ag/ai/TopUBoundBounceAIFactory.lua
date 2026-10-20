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

local ArtificialIntelligenceInterface = require("org.allbinary.ai.ArtificialIntelligenceInterface")
local TopULayerBounds = require("org.allbinary.bounds.TopULayerBounds")
local ArtificialIntelligenceInterfaceFactoryInterface = require("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local GameInput = require("org.allbinary.game.input.GameInput")
local VelocityInterface = require("org.allbinary.game.physics.velocity.VelocityInterface")
local VelocityInterfaceCompositeInterface = require("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TopUBoundBounceAIFactory = {}
TopUBoundBounceAIFactory.__index = TopUBoundBounceAIFactory
TopUBoundBounceAIFactory.className = "TopUBoundBounceAIFactory"

function TopUBoundBounceAIFactory.new()
    local self = setmetatable({}, TopUBoundBounceAIFactory)
    return self
end


-- throws Exception
function TopUBoundBounceAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        local velocityInterfaceCompositeInterface = ownerLayerInterface
        local velocityInterface = velocityInterfaceCompositeInterface:getVelocityProperties()
        local maxDistancePerTick = (((velocityInterface:getMaxForwardVelocity()) // (1 << (velocityInterface:getVelocityXBasicDecimalP():getScaledFactor()))))
        local halfWidth = ownerLayerInterface:getWidth() * 2 + maxDistancePerTick + 1
        local halfHeight = ownerLayerInterface:getHeight() * 2 + maxDistancePerTick + 1
        local point = PointFactory.getInstance():createXY(halfWidth, halfHeight + 60)
        local displayInfo = DisplayInfoSingleton.getInstance()
        local rectangle = Rectangle.new(point, (displayInfo:getLastWidth() - halfWidth - point:getX()), (displayInfo:getLastHeight() - halfHeight - point:getY()))
        return BoundBounceAI.new(ownerLayerInterface, gameInput, TopULayerBounds.new(rectangle), ReverseVelocityBoundsVisitor.new(ownerLayerInterface))
end

return TopUBoundBounceAIFactory

