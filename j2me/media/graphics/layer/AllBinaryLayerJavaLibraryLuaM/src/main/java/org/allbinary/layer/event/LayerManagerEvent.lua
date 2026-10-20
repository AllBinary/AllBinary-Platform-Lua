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
-- package org.allbinary.layer.event

local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local LayerManager = require("org.allbinary.layer.LayerManager")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LayerManagerEvent = {}
LayerManagerEvent.__index = LayerManagerEvent
LayerManagerEvent.className = "LayerManagerEvent"
setmetatable(LayerManagerEvent, {__index = AllBinaryEventObject})

function LayerManagerEvent:_init_fields()
    self.layerInterface = AllBinaryLayer.NULL_ALLBINARY_LAYER
    self.crud = nil
end


function LayerManagerEvent.new(layerManager, crud)
    local self = setmetatable(AllBinaryEventObject.new(layerManager), LayerManagerEvent)
    self:_init_fields()
        -- super(...) made self above
        self.crud = crud
    return self
end


function LayerManagerEvent:getLayerInterface()
        return self.layerInterface
end


function LayerManagerEvent:setLayerInterface(layerInterface)
        self.layerInterface = layerInterface
end


function LayerManagerEvent:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("LayerManagerEvent: \n")
        stringBuffer:append("LayerInterface: ")
        stringBuffer:append(tostring(self:getLayerInterface()))
        stringBuffer:append("\nCRUD: ")
        stringBuffer:append(self.crud)
        return tostring(stringBuffer)
end
LayerManagerEvent.__tostring = function(self) return self:toString() end

return LayerManagerEvent

