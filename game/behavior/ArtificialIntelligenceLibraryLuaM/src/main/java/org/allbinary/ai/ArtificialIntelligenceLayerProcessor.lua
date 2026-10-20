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

local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local LayerProcessor = require("org.allbinary.layer.LayerProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ArtificialIntelligenceLayerProcessor = {}
ArtificialIntelligenceLayerProcessor.__index = ArtificialIntelligenceLayerProcessor
ArtificialIntelligenceLayerProcessor.className = "ArtificialIntelligenceLayerProcessor"
setmetatable(ArtificialIntelligenceLayerProcessor, {__index = LayerProcessor})


function ArtificialIntelligenceLayerProcessor.new()
    local self = setmetatable(LayerProcessor.new(ArtificialIntelligenceLayerManager.new()), ArtificialIntelligenceLayerProcessor)
        -- super(...) made self above
    return self
end


-- throws Exception
function ArtificialIntelligenceLayerProcessor:processAt(allBinaryLayerManager, layerInterface, index)
        local artificialIntelligenceCompositeInterface = layerInterface
        artificialIntelligenceCompositeInterface:getArtificialIntelligenceInterface():processAI(allBinaryLayerManager)
end


-- throws Exception
function ArtificialIntelligenceLayerProcessor:isProcessorLayer(layerInterface)
        if layerInterface:implmentsArtificialIntelligenceCompositeInterface() then
            return true
        else
            return false
        end
end

return ArtificialIntelligenceLayerProcessor

