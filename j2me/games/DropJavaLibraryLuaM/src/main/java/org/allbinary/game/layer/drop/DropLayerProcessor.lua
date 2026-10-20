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
-- package org.allbinary.game.layer.drop

local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local BasicLayerProcessor = require("org.allbinary.layer.BasicLayerProcessor")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DropLayerProcessor = {}
DropLayerProcessor.__index = DropLayerProcessor
DropLayerProcessor.className = "DropLayerProcessor"
setmetatable(DropLayerProcessor, {__index = BasicLayerProcessor})


function DropLayerProcessor.new()
    local self = setmetatable(BasicLayerProcessor.new(), DropLayerProcessor)
    return self
end


function DropLayerProcessor.getInstance()
        return DropLayerProcessor.LAYER_PROCESSOR
end


-- throws Exception
function DropLayerProcessor:process(allBinaryLayerManager)
        local list = self:getList()
        local size = list:size()
        local layerInterface = nil
        local dropLayerInterface = nil
        for index = 0, size - 1 do
            layerInterface = list.objectArray[index + 1]
            dropLayerInterface = layerInterface
            layerInterface = dropLayerInterface:getDroppedLayer()
            allBinaryLayerManager:append(layerInterface)
        end
        list:clear()
end

DropLayerProcessor.LAYER_PROCESSOR = DropLayerProcessor.new()

return DropLayerProcessor

