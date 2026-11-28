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

local DiveAndDirectionalTrackingAIFactory = {}
package.loaded["org.allbinary.game.ag.ai.DiveAndDirectionalTrackingAIFactory"] = DiveAndDirectionalTrackingAIFactory

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
local BasicRandomAIFactory = java_lazy("org.allbinary.game.ag.ai.tactical.BasicRandomAIFactory")
local ArtificialIntelligenceInterfaceFactoryInterface = java_lazy("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local BasicAI = java_lazy("org.allbinary.game.ai.BasicAI")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local Visitor = java_lazy("org.allbinary.logic.util.visitor.Visitor")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicProbabilityAIDataFactory = java_lazy("org.allbinary.game.ag.ai.BasicProbabilityAIDataFactory")
local DiveAndDirectionalTrackingAI = java_lazy("org.allbinary.game.ag.ai.DiveAndDirectionalTrackingAI")
local LastKeyAIVisitorFactory = java_lazy("org.allbinary.game.ag.ai.LastKeyAIVisitorFactory")
local ThrustAIVisitorFactory = java_lazy("org.allbinary.game.ag.ai.ThrustAIVisitorFactory")

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

-- class table DiveAndDirectionalTrackingAIFactory is declared before the requires
DiveAndDirectionalTrackingAIFactory.__index = DiveAndDirectionalTrackingAIFactory
DiveAndDirectionalTrackingAIFactory.className = "DiveAndDirectionalTrackingAIFactory"
DiveAndDirectionalTrackingAIFactory.javaClassName = "org.allbinary.game.ag.ai.DiveAndDirectionalTrackingAIFactory"
DiveAndDirectionalTrackingAIFactory.java_implements = " ArtificialIntelligenceInterfaceFactoryInterface "
DiveAndDirectionalTrackingAIFactory.java_interfaces = function() return {ArtificialIntelligenceInterfaceFactoryInterface} end

function DiveAndDirectionalTrackingAIFactory._jinit(self)
    return self
end

function DiveAndDirectionalTrackingAIFactory.new()
    return DiveAndDirectionalTrackingAIFactory._jinit(setmetatable({}, DiveAndDirectionalTrackingAIFactory))
end


-- throws Exception
function DiveAndDirectionalTrackingAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        local visitorCanBeNull = hashtable:get(BasicAI.AI_VISITOR)
        if rawequal(visitorCanBeNull, nil) then
            visitorCanBeNull = ThrustAIVisitorFactory.getInstance()
        end
        local hashtable2 = BasicProbabilityAIDataFactory.new():getInstance()
        hashtable2:put(BasicAI.AI_VISITOR, LastKeyAIVisitorFactory.getInstance())
        local artificialIntelligenceInterface = BasicRandomAIFactory.new():getInstance(hashtable2, ownerLayerInterface, gameInput)
        return DiveAndDirectionalTrackingAI.new(ownerLayerInterface, artificialIntelligenceInterface, gameInput, visitorCanBeNull)
end

return DiveAndDirectionalTrackingAIFactory

