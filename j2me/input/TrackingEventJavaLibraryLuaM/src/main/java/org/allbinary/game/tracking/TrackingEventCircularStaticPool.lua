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

local TrackingEventCircularStaticPool = {}
package.loaded["org.allbinary.game.tracking.TrackingEventCircularStaticPool"] = TrackingEventCircularStaticPool

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryEventCircularPool = java_lazy("org.allbinary.logic.util.event.AllBinaryEventCircularPool")
local TrackingEvent = java_lazy("org.allbinary.game.tracking.TrackingEvent")
local TrackingEventFactory = java_lazy("org.allbinary.game.tracking.TrackingEventFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table TrackingEventCircularStaticPool is declared before the requires
TrackingEventCircularStaticPool.__index = TrackingEventCircularStaticPool
TrackingEventCircularStaticPool.className = "TrackingEventCircularStaticPool"
TrackingEventCircularStaticPool.javaClassName = "org.allbinary.game.tracking.TrackingEventCircularStaticPool"

function TrackingEventCircularStaticPool:_init_fields()
    self.EVENT_POOL = AllBinaryEventCircularPool.new(20)
end

function TrackingEventCircularStaticPool._jinit(self)
    TrackingEventCircularStaticPool._init_fields(self)
    return self
end

function TrackingEventCircularStaticPool.new()
    return TrackingEventCircularStaticPool._jinit(setmetatable({}, TrackingEventCircularStaticPool))
end


function TrackingEventCircularStaticPool.getInstance()
        return TrackingEventCircularStaticPool.instance_f
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

TrackingEventCircularStaticPool.instance_f = TrackingEventCircularStaticPool.new()

return TrackingEventCircularStaticPool

