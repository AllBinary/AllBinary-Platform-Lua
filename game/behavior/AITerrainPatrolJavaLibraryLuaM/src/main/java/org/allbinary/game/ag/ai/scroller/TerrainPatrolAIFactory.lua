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

local TerrainPatrolAIFactory = {}
package.loaded["org.allbinary.game.ag.ai.scroller.TerrainPatrolAIFactory"] = TerrainPatrolAIFactory

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
local ArtificialIntelligenceInterfaceFactoryInterface = java_lazy("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local TerrainPatrolAI = java_lazy("org.allbinary.game.ag.ai.scroller.TerrainPatrolAI")

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

-- class table TerrainPatrolAIFactory is declared before the requires
TerrainPatrolAIFactory.__index = TerrainPatrolAIFactory
TerrainPatrolAIFactory.className = "TerrainPatrolAIFactory"
TerrainPatrolAIFactory.javaClassName = "org.allbinary.game.ag.ai.scroller.TerrainPatrolAIFactory"
TerrainPatrolAIFactory.java_implements = " ArtificialIntelligenceInterfaceFactoryInterface "
TerrainPatrolAIFactory.java_interfaces = function() return {ArtificialIntelligenceInterfaceFactoryInterface} end

function TerrainPatrolAIFactory._jinit(self)
    return self
end

function TerrainPatrolAIFactory.new()
    return TerrainPatrolAIFactory._jinit(setmetatable({}, TerrainPatrolAIFactory))
end


-- throws Exception
function TerrainPatrolAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        hashtable:put(BasePatrolAI.MAX_DISTANCE, SmallIntegerSingletonFactory.getInstance():getAt(220))
        return TerrainPatrolAI.new(hashtable, ownerLayerInterface, gameInput)
end

return TerrainPatrolAIFactory

