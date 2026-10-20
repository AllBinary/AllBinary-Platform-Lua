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

local HorizontalScreenPatrolFiringAIFactory = {}
HorizontalScreenPatrolFiringAIFactory.__index = HorizontalScreenPatrolFiringAIFactory
HorizontalScreenPatrolFiringAIFactory.className = "HorizontalScreenPatrolFiringAIFactory"

function HorizontalScreenPatrolFiringAIFactory.new()
    local self = setmetatable({}, HorizontalScreenPatrolFiringAIFactory)
    return self
end


-- throws Exception
function HorizontalScreenPatrolFiringAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        return HorizontalScreenPatrolAI.new(hashtable, ownerLayerInterface, gameInput)
end

return HorizontalScreenPatrolFiringAIFactory

