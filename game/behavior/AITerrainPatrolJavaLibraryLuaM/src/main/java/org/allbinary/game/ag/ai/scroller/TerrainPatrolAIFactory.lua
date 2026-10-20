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

local ArtificialIntelligenceInterface = require("org.allbinary.ai.ArtificialIntelligenceInterface")
local ArtificialIntelligenceInterfaceFactoryInterface = require("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
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

local TerrainPatrolAIFactory = {}
TerrainPatrolAIFactory.__index = TerrainPatrolAIFactory
TerrainPatrolAIFactory.className = "TerrainPatrolAIFactory"

function TerrainPatrolAIFactory.new()
    local self = setmetatable({}, TerrainPatrolAIFactory)
    return self
end


-- throws Exception
function TerrainPatrolAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        hashtable:put(BasePatrolAI.MAX_DISTANCE, SmallIntegerSingletonFactory.getInstance():getAt(220))
        return TerrainPatrolAI.new(hashtable, ownerLayerInterface, gameInput)
end

return TerrainPatrolAIFactory

