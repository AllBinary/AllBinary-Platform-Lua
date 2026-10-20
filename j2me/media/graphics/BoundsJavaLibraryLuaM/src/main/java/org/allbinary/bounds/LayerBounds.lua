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
-- package org.allbinary.bounds

local BoundsChangeEvent = require("org.allbinary.bounds.event.BoundsChangeEvent")
local BoundsChangeEventListener = require("org.allbinary.bounds.event.BoundsChangeEventListener")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LayerBounds = {}
LayerBounds.__index = LayerBounds
LayerBounds.className = "LayerBounds"

function LayerBounds:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.rectangle = nil
end


function LayerBounds.new(rectangle)
    local self = setmetatable({}, LayerBounds)
    self:_init_fields()
        self.rectangle = rectangle
    return self
end


function LayerBounds:getRectangleP()
        return self.rectangle
end


function LayerBounds:visit(boundsVisitorInterface)
end


function LayerBounds:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function LayerBounds:onBoundsChangeEvent(boundsChangeEvent)
        self.rectangle = boundsChangeEvent:getRectangle()
end

return LayerBounds

