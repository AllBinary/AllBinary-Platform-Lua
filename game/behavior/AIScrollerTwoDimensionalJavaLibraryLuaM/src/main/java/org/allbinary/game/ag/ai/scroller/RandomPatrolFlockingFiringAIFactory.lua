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
-- package org.allbinary.game.ag.ai.scroller

local RandomPatrolFlockingFiringAIFactory = {}
package.loaded["org.allbinary.game.ag.ai.scroller.RandomPatrolFlockingFiringAIFactory"] = RandomPatrolFlockingFiringAIFactory

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
local ArrayAI = java_lazy("org.allbinary.game.ag.ai.ArrayAI")
local ArtificialIntelligenceInterfaceFactoryInterface = java_lazy("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local RandomPatrolAI = java_lazy("org.allbinary.game.ag.ai.scroller.RandomPatrolAI")
local TimedFireAI = java_lazy("org.allbinary.game.ag.ai.scroller.TimedFireAI")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table RandomPatrolFlockingFiringAIFactory is declared before the requires
RandomPatrolFlockingFiringAIFactory.__index = RandomPatrolFlockingFiringAIFactory
RandomPatrolFlockingFiringAIFactory.className = "RandomPatrolFlockingFiringAIFactory"
RandomPatrolFlockingFiringAIFactory.javaClassName = "org.allbinary.game.ag.ai.scroller.RandomPatrolFlockingFiringAIFactory"
RandomPatrolFlockingFiringAIFactory.java_implements = " ArtificialIntelligenceInterfaceFactoryInterface "
RandomPatrolFlockingFiringAIFactory.java_interfaces = function() return {ArtificialIntelligenceInterfaceFactoryInterface} end

function RandomPatrolFlockingFiringAIFactory._jinit(self)
    return self
end

function RandomPatrolFlockingFiringAIFactory.new()
    return RandomPatrolFlockingFiringAIFactory._jinit(setmetatable({}, RandomPatrolFlockingFiringAIFactory))
end


-- throws Exception
function RandomPatrolFlockingFiringAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        local artificialIntelligenceInterface = java_new_array(nil, 2)
        artificialIntelligenceInterface[1] = RandomPatrolAI.new(hashtable, ownerLayerInterface, gameInput)
        artificialIntelligenceInterface[2] = TimedFireAI.new(1800, ownerLayerInterface, gameInput)
        return ArrayAI.new(artificialIntelligenceInterface, ownerLayerInterface, gameInput)
end

return RandomPatrolFlockingFiringAIFactory

