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
-- package org.allbinary.media.graphics.geography.map.event

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local MiniMapLayer = require("org.allbinary.game.layer.geographic.map.MiniMapLayer")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapCellPositionEventHandler = {}
GeographicMapCellPositionEventHandler.__index = GeographicMapCellPositionEventHandler
GeographicMapCellPositionEventHandler.className = "GeographicMapCellPositionEventHandler"
setmetatable(GeographicMapCellPositionEventHandler, {__index = BasicEventHandler})

function GeographicMapCellPositionEventHandler:_init_fields()
    self.list = BasicArrayListD.new()
end


function GeographicMapCellPositionEventHandler.getInstance()
        return GeographicMapCellPositionEventHandler.instance
end


function GeographicMapCellPositionEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), GeographicMapCellPositionEventHandler)
    self:_init_fields()
    return self
end


function GeographicMapCellPositionEventHandler:addListener(miniMapLayer)
        if not self.list:contains(miniMapLayer) then
            self.list:add(miniMapLayer)
        end
end


function GeographicMapCellPositionEventHandler:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function GeographicMapCellPositionEventHandler:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


-- throws Exception
function GeographicMapCellPositionEventHandler:fireEvent(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local miniMapLayer = self.list:get(index)
                miniMapLayer:onGeographicMapCellPositionEvent(eventObject)
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
function GeographicMapCellPositionEventHandler:fireRemoveEvent(eventObject)
        local list = self.eventListenerInterfaceList
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local miniMapLayer = self.list:get(index)
                miniMapLayer:onRemoveGeographicMapCellPositionEvent(eventObject)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            end
        end
        local eventListenerInterface = nil
        local geographicMapCellPositionEventListenerInterface = nil
        local size = list:size()
        for index = 0, size - 1 do
            local try_ok, try_error = pcall(function()
                eventListenerInterface = list:get(index)
                geographicMapCellPositionEventListenerInterface = (eventListenerInterface)
                geographicMapCellPositionEventListenerInterface:onRemoveGeographicMapCellPositionEvent(eventObject)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
        end
end


-- throws Exception
function GeographicMapCellPositionEventHandler:process(eventObject, eventListenerInterface)
        local geographicMapCellPositionEventListenerInterface = (eventListenerInterface)
        geographicMapCellPositionEventListenerInterface:onGeographicMapCellPositionEvent(eventObject)
end

GeographicMapCellPositionEventHandler.instance = GeographicMapCellPositionEventHandler.new()

return GeographicMapCellPositionEventHandler

