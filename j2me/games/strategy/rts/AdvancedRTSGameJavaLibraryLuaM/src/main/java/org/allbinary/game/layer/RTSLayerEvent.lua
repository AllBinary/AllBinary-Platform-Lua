-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot  
-- Generated Code Do Not Modify
-- package org.allbinary.game.layer

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

local RTSLayerEvent = {}
RTSLayerEvent.__index = RTSLayerEvent
RTSLayerEvent.className = "RTSLayerEvent"
setmetatable(RTSLayerEvent, {__index = AllBinaryEventObject})

function RTSLayerEvent:_init_fields()
    self.rtsLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
end


function RTSLayerEvent.new(rtsLayer)
    local self = setmetatable(AllBinaryEventObject.new(rtsLayer), RTSLayerEvent)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function RTSLayerEvent:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("RTSLayerEvent: \n")
        stringBuffer:append("RTSLayer: ")
        stringBuffer:append(tostring(self:getRtsLayer()))
        return tostring(stringBuffer)
end
RTSLayerEvent.__tostring = function(self) return self:toString() end


function RTSLayerEvent:getRtsLayer()
        return self.rtsLayer
end


function RTSLayerEvent:setRtsLayer(rtsLayer)
        self.rtsLayer = rtsLayer
end

return RTSLayerEvent

