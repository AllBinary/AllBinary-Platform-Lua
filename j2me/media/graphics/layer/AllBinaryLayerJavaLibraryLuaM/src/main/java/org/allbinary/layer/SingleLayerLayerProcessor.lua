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

local SingleLayerLayerProcessor = {}
SingleLayerLayerProcessor.__index = SingleLayerLayerProcessor
SingleLayerLayerProcessor.className = "SingleLayerLayerProcessor"
setmetatable(SingleLayerLayerProcessor, {__index = LayerProcessor})


function SingleLayerLayerProcessor.new()
    local self = setmetatable(LayerProcessor.new(SingleLayerLayerManager.new()), SingleLayerLayerProcessor)
        -- super(...) made self above
    return self
end


-- throws Exception
function SingleLayerLayerProcessor:process(allBinaryLayerManager)
        local layerManager = self:getLayerManager()
        self:processAt(allBinaryLayerManager, layerManager:getLayerAt(0), 0)
end

return SingleLayerLayerProcessor

