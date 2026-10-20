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
-- package org.allbinary.game.tracking

local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
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

local TrackingEvent = {}
TrackingEvent.__index = TrackingEvent
TrackingEvent.className = "TrackingEvent"
setmetatable(TrackingEvent, {__index = AllBinaryEventObject})

function TrackingEvent:_init_fields()
    self.layerInterface = AllBinaryLayer.NULL_ALLBINARY_LAYER
end


function TrackingEvent.new(allBinaryLayerInterface)
    local self = setmetatable(AllBinaryEventObject.new(allBinaryLayerInterface), TrackingEvent)
    self:_init_fields()
        -- super(...) made self above
        if allBinaryLayerInterface ~= TrackingEventHandler.getInstance() then
            self:setLayerInterface(allBinaryLayerInterface)
        end
    return self
end


function TrackingEvent:init(anyType)
        self:setSource(anyType)
end


function TrackingEvent:getLayerInterface()
        return self.layerInterface
end


function TrackingEvent:setLayerInterface(layerInterface)
        self.layerInterface = layerInterface
end


function TrackingEvent:setLayerInterfaceForCircularStaticPool(layerInterface)
        self.layerInterface = layerInterface
end


function TrackingEvent:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("TrackingEvent: \n")
        stringBuffer:append("LayerInterface: ")
        stringBuffer:append(tostring(self.layerInterface))
        return tostring(stringBuffer)
end
TrackingEvent.__tostring = function(self) return self:toString() end

return TrackingEvent

