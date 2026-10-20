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

local StdUtil = require("org.allbinary.logic.StdUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TerrainEventHandler = {}
TerrainEventHandler.__index = TerrainEventHandler
TerrainEventHandler.className = "TerrainEventHandler"
setmetatable(TerrainEventHandler, {__index = BasicEventHandler})

function TerrainEventHandler:_init_fields()
    self.list = BasicArrayListD.new()
end


function TerrainEventHandler.init()
        TerrainEventHandler.hashtable = StdUtil.getInstance():createHashtable()
end


function TerrainEventHandler.getInstance(anyType)
        local eventHandlerCanBeNull = TerrainEventHandler.hashtable:get(anyType)
        if eventHandlerCanBeNull == nil then
            eventHandlerCanBeNull = TerrainEventHandler.new()
            TerrainEventHandler.hashtable:put(anyType, eventHandlerCanBeNull)
        end
        return eventHandlerCanBeNull
end


function TerrainEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), TerrainEventHandler)
    self:_init_fields()
    return self
end


function TerrainEventHandler:addListener(terrainEventListener)
        if not self.list:contains(terrainEventListener) then
            self.list:add(terrainEventListener)
        end
end


function TerrainEventHandler:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function TerrainEventHandler:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


-- throws Exception
function TerrainEventHandler:fireEvent(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local terrainEventListener = self.list:get(index)
                terrainEventListener:onTerrainEvent(eventObject)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            end
        end
        BasicEventHandler.fireEvent(self, eventObject)
end


-- throws Exception
function TerrainEventHandler:process(eventObject, eventListenerInterface)
        local terrainEventListenerInterface = eventListenerInterface
        terrainEventListenerInterface:onTerrainEvent(eventObject)
end

TerrainEventHandler.hashtable = StdUtil.getInstance().NULL_TABLE

return TerrainEventHandler

