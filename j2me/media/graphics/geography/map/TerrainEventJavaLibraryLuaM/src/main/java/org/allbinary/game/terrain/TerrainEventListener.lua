-- Generated Code Do Not Modify
-- package org.allbinary.game.terrain

local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TerrainEventListenerInterface = require("org.allbinary.game.terrain.TerrainEventListenerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TerrainEventListener = {}
TerrainEventListener.__index = TerrainEventListener
TerrainEventListener.className = "TerrainEventListener"

function TerrainEventListener:_init_fields()
    self.list = BasicArrayListD.new()
end

function TerrainEventListener.new()
    local self = setmetatable({}, TerrainEventListener)
    self:_init_fields()
    return self
end


function TerrainEventListener:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function TerrainEventListener:onTerrainEvent(terrainEvent)
        self.list:clear()
        self.list:add(terrainEvent)
end


function TerrainEventListener:getList()
        return self.list
end

return TerrainEventListener

