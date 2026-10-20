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
-- package org.allbinary.ai

local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local ArtificialIntelligenceInterface = require("org.allbinary.ai.ArtificialIntelligenceInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ArtificialIntelligence = {}
ArtificialIntelligence.__index = ArtificialIntelligence
ArtificialIntelligence.className = "ArtificialIntelligence"


function ArtificialIntelligence.getInstance()
        return ArtificialIntelligence.instance
end


function ArtificialIntelligence.new()
    local self = setmetatable({}, ArtificialIntelligence)
    return self
end


-- throws Exception
function ArtificialIntelligence:processAI(layerManager)
end


function ArtificialIntelligence:getId()
        return 1
end

ArtificialIntelligence.AI_ID = 2
ArtificialIntelligence.instance = ArtificialIntelligence.new()

return ArtificialIntelligence

