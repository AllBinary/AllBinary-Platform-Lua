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
-- package org.allbinary.layer

local BasicLayerProcessorInterface = require("org.allbinary.layer.BasicLayerProcessorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local LayerProcessorInterface = {}
LayerProcessorInterface.__index = LayerProcessorInterface
LayerProcessorInterface.className = "LayerProcessorInterface"
setmetatable(LayerProcessorInterface, {__index = BasicLayerProcessorInterface})


function LayerProcessorInterface:getLayerManager()
    error("abstract method getLayerManager")
end


-- throws Exception
function LayerProcessorInterface:processAt(allBinaryLayerManager, layerInterface, index)
    error("abstract method processAt")
end


-- throws Exception
function LayerProcessorInterface:isProcessorLayer(layerInterface)
    error("abstract method isProcessorLayer")
end

return LayerProcessorInterface

