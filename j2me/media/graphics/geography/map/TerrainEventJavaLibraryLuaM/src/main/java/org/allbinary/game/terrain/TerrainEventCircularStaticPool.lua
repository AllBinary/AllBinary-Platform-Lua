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

local TerrainEventCircularStaticPool = {}
package.loaded["org.allbinary.game.terrain.TerrainEventCircularStaticPool"] = TerrainEventCircularStaticPool

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

local AllBinaryEventCircularPool = java_lazy("org.allbinary.logic.util.event.AllBinaryEventCircularPool")
local BasicTerrainInfo = java_lazy("org.allbinary.game.terrain.BasicTerrainInfo")
local TerrainEvent = java_lazy("org.allbinary.game.terrain.TerrainEvent")
local TerrainEventFactory = java_lazy("org.allbinary.game.terrain.TerrainEventFactory")

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

-- class table TerrainEventCircularStaticPool is declared before the requires
TerrainEventCircularStaticPool.__index = TerrainEventCircularStaticPool
TerrainEventCircularStaticPool.className = "TerrainEventCircularStaticPool"
TerrainEventCircularStaticPool.javaClassName = "org.allbinary.game.terrain.TerrainEventCircularStaticPool"

function TerrainEventCircularStaticPool:_init_fields()
    self.EVENT_POOL = AllBinaryEventCircularPool.new(20)
end

function TerrainEventCircularStaticPool._jinit(self)
    TerrainEventCircularStaticPool._init_fields(self)
    return self
end

function TerrainEventCircularStaticPool.new()
    return TerrainEventCircularStaticPool._jinit(setmetatable({}, TerrainEventCircularStaticPool))
end


function TerrainEventCircularStaticPool.getInstance()
        return TerrainEventCircularStaticPool.instance_f
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

TerrainEventCircularStaticPool.instance_f = TerrainEventCircularStaticPool.new()

return TerrainEventCircularStaticPool

