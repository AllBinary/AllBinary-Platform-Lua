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
-- package org.allbinary.game.terrain

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

local TerrainEventCircularStaticPool = {}
TerrainEventCircularStaticPool.__index = TerrainEventCircularStaticPool
TerrainEventCircularStaticPool.className = "TerrainEventCircularStaticPool"

function TerrainEventCircularStaticPool:_init_fields()
    self.EVENT_POOL = AllBinaryEventCircularPool.new(20)
end

function TerrainEventCircularStaticPool.new()
    local self = setmetatable({}, TerrainEventCircularStaticPool)
    self:_init_fields()
    return self
end


function TerrainEventCircularStaticPool.getInstance()
        return TerrainEventCircularStaticPool.instance
end


function TerrainEventCircularStaticPool:init()
        self.EVENT_POOL:initAllBinaryEventCircularPool(TerrainEventFactory.new())
end


-- throws Exception
function TerrainEventCircularStaticPool:getNext(basicTerrainInfo)
        local trackingEvent = self.EVENT_POOL:getNextInstance()
        trackingEvent:setBasicTerrainInfoForCircularStaticPool(basicTerrainInfo)
        return trackingEvent
end

TerrainEventCircularStaticPool.instance = TerrainEventCircularStaticPool.new()

return TerrainEventCircularStaticPool

