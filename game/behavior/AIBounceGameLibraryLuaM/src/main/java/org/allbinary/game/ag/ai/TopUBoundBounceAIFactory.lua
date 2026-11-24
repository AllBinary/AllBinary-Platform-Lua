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

local TopUBoundBounceAIFactory = {}
package.loaded["org.allbinary.game.ag.ai.TopUBoundBounceAIFactory"] = TopUBoundBounceAIFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local ArtificialIntelligenceInterface = java_lazy("org.allbinary.ai.ArtificialIntelligenceInterface")
local TopULayerBounds = java_lazy("org.allbinary.bounds.TopULayerBounds")
local ArtificialIntelligenceInterfaceFactoryInterface = java_lazy("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local VelocityInterface = java_lazy("org.allbinary.game.physics.velocity.VelocityInterface")
local VelocityInterfaceCompositeInterface = java_lazy("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BoundBounceAI = java_lazy("org.allbinary.game.ag.ai.BoundBounceAI")
local ReverseVelocityBoundsVisitor = java_lazy("org.allbinary.game.ag.ai.ReverseVelocityBoundsVisitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table TopUBoundBounceAIFactory is declared before the requires
TopUBoundBounceAIFactory.__index = TopUBoundBounceAIFactory
TopUBoundBounceAIFactory.className = "TopUBoundBounceAIFactory"
TopUBoundBounceAIFactory.javaClassName = "org.allbinary.game.ag.ai.TopUBoundBounceAIFactory"
TopUBoundBounceAIFactory.java_implements = " ArtificialIntelligenceInterfaceFactoryInterface "
TopUBoundBounceAIFactory.java_interfaces = function() return {ArtificialIntelligenceInterfaceFactoryInterface} end

function TopUBoundBounceAIFactory._jinit(self)
    return self
end

function TopUBoundBounceAIFactory.new()
    return TopUBoundBounceAIFactory._jinit(setmetatable({}, TopUBoundBounceAIFactory))
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

