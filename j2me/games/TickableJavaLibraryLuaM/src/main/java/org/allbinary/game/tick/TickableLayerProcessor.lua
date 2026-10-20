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
-- package org.allbinary.game.tick

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

local TickableLayerProcessor = {}
TickableLayerProcessor.__index = TickableLayerProcessor
TickableLayerProcessor.className = "TickableLayerProcessor"
setmetatable(TickableLayerProcessor, {__index = LayerProcessor})


function TickableLayerProcessor.new()
    local self = setmetatable(LayerProcessor.new(TickableLayerManager.new()), TickableLayerProcessor)
        -- super(...) made self above
    return self
end


-- throws Exception
function TickableLayerProcessor:processAt(allBinaryLayerManager, layerInterface, index)
        local tickableInterface = layerInterface
        tickableInterface:processTick(allBinaryLayerManager)
end


function TickableLayerProcessor:isProcessorLayer(layerInterface)
        if layerInterface:implmentsTickableInterface() then
            return true
        else
            return false
        end
end

return TickableLayerProcessor

