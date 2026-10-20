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

local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
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

local LayerManagerEventHandler = {}
LayerManagerEventHandler.__index = LayerManagerEventHandler
LayerManagerEventHandler.className = "LayerManagerEventHandler"
setmetatable(LayerManagerEventHandler, {__index = BasicEventHandler})

function LayerManagerEventHandler:_init_fields()
    self.list = BasicArrayListD.new()
    self.CREATE = "Create"
    self.DELETE = "Delete"
end


function LayerManagerEventHandler.getInstance()
        return LayerManagerEventHandler.instance
end


function LayerManagerEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), LayerManagerEventHandler)
    self:_init_fields()
    return self
end


function LayerManagerEventHandler:addListener(layerManagerEventListener)
        if not self.list:contains(layerManagerEventListener) then
            self.list:add(layerManagerEventListener)
        end
end


function LayerManagerEventHandler:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function LayerManagerEventHandler:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


-- throws Exception
function LayerManagerEventHandler:fireEvent(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local layerManagerEventListener = self.list.objectArray[index + 1]
                layerManagerEventListener:onCreateLayerManagerEvent(eventObject)
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
function LayerManagerEventHandler:fireDeleteEvent(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local layerManagerEventListener = self.list.objectArray[index + 1]
                layerManagerEventListener:onDeleteLayerManagerEvent(eventObject)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            end
        end
        local eventListenerInterfaceList = self.eventListenerInterfaceList
        local eventListenerInterface = nil
        local layerManagerEventListenerInterface = nil
        local index = 0
        while index < eventListenerInterfaceList:size() do
            local try_ok, try_error = pcall(function()
                eventListenerInterface = eventListenerInterfaceList.objectArray[index + 1]
                layerManagerEventListenerInterface = (eventListenerInterface)
                layerManagerEventListenerInterface:onDeleteLayerManagerEvent(eventObject)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            index = index + 1
        end
end


-- throws Exception
function LayerManagerEventHandler:process(eventObject, eventListenerInterface)
        local layerManagerEventListenerInterface = (eventListenerInterface)
        layerManagerEventListenerInterface:onCreateLayerManagerEvent(eventObject)
end

LayerManagerEventHandler.instance = LayerManagerEventHandler.new()

return LayerManagerEventHandler

