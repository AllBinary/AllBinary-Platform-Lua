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
local ArrayAI = require("org.allbinary.game.ag.ai.ArrayAI")
local ArtificialIntelligenceInterfaceFactoryInterface = require("org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface")
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RandomPatrolFlockingFiringAIFactory = {}
RandomPatrolFlockingFiringAIFactory.__index = RandomPatrolFlockingFiringAIFactory
RandomPatrolFlockingFiringAIFactory.className = "RandomPatrolFlockingFiringAIFactory"

function RandomPatrolFlockingFiringAIFactory.new()
    local self = setmetatable({}, RandomPatrolFlockingFiringAIFactory)
    return self
end


-- throws Exception
function RandomPatrolFlockingFiringAIFactory:getInstance(hashtable, ownerLayerInterface, gameInput)
        local artificialIntelligenceInterface = java_new_array(nil, 2)
        artificialIntelligenceInterface[1] = RandomPatrolAI.new(hashtable, ownerLayerInterface, gameInput)
        artificialIntelligenceInterface[2] = TimedFireAI.new(1800, ownerLayerInterface, gameInput)
        return ArrayAI.new(artificialIntelligenceInterface, ownerLayerInterface, gameInput)
end

return RandomPatrolFlockingFiringAIFactory

