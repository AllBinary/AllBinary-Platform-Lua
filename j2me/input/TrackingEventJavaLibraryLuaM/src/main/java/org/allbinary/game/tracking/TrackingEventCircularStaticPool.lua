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
local AllBinaryEventCircularPool = require("org.allbinary.logic.util.event.AllBinaryEventCircularPool")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TrackingEventCircularStaticPool = {}
TrackingEventCircularStaticPool.__index = TrackingEventCircularStaticPool
TrackingEventCircularStaticPool.className = "TrackingEventCircularStaticPool"

function TrackingEventCircularStaticPool:_init_fields()
    self.EVENT_POOL = AllBinaryEventCircularPool.new(20)
end

function TrackingEventCircularStaticPool.new()
    local self = setmetatable({}, TrackingEventCircularStaticPool)
    self:_init_fields()
    return self
end


function TrackingEventCircularStaticPool.getInstance()
        return TrackingEventCircularStaticPool.instance
end


function TrackingEventCircularStaticPool:init()
        self.EVENT_POOL:initAllBinaryEventCircularPool(TrackingEventFactory.new())
end


-- throws Exception
function TrackingEventCircularStaticPool:getNextInstance(layerInterface)
        local trackingEvent = self.EVENT_POOL:getNextInstance()
        trackingEvent:setLayerInterfaceForCircularStaticPool(layerInterface)
        return trackingEvent
end

TrackingEventCircularStaticPool.instance = TrackingEventCircularStaticPool.new()

return TrackingEventCircularStaticPool

