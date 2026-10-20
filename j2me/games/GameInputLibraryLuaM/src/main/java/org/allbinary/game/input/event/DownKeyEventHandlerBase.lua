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
-- package org.allbinary.game.input.event

local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local DownKeyEventHandlerBase = {}
DownKeyEventHandlerBase.__index = DownKeyEventHandlerBase
DownKeyEventHandlerBase.className = "DownKeyEventHandlerBase"
setmetatable(DownKeyEventHandlerBase, {__index = BasicEventHandler})

function DownKeyEventHandlerBase:_init_fields()
    self.list = BasicArrayListD.new()
end


function DownKeyEventHandlerBase.new()
    local self = setmetatable(BasicEventHandler.new(), DownKeyEventHandlerBase)
    self:_init_fields()
    return self
end


function DownKeyEventHandlerBase:addListener(playerGameInput)
        if not self.list:contains(playerGameInput) then
            self.list:add(playerGameInput)
        end
end


function DownKeyEventHandlerBase:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function DownKeyEventHandlerBase:removeListenerSingleThreaded(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListenerSingleThreaded(self, eventListenerInterface)
end


function DownKeyEventHandlerBase:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


-- throws Exception
function DownKeyEventHandlerBase:fireEventI(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local playerGameInput = self.list.objectArray[index + 1]
                playerGameInput:onDownKey(eventObject)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            end
        end
        local index = 0
        local eventListenerInterface = nil
        while index < self.eventListenerInterfaceList:size() do
            local try_ok, try_error = pcall(function()
                eventListenerInterface = self.eventListenerInterfaceList:get(index)
                self:processI(eventObject, eventListenerInterface)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            index = index + 1
        end
end


-- throws Exception
function DownKeyEventHandlerBase:fireEventForGameKeyEvent(eventObject)
        local size = self.list:size()
        do
            local index = size
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local playerGameInput = self.list.objectArray[index + 1]
                playerGameInput:onDownKeyEvent(eventObject)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            end
        end
        local index = 0
        local eventListenerInterface = nil
        while index < self.eventListenerInterfaceList:size() do
            local try_ok, try_error = pcall(function()
                eventListenerInterface = self.eventListenerInterfaceList:get(index)
                self:processEvent(eventObject, eventListenerInterface)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            index = index + 1
        end
end


-- throws Exception
function DownKeyEventHandlerBase:processI(eventObject, eventListenerInterface)
        local downKeyEventListenerInterface = eventListenerInterface
        downKeyEventListenerInterface:onDownKey(eventObject)
end


-- throws Exception
function DownKeyEventHandlerBase:processEvent(eventObject, eventListenerInterface)
        local downKeyEventListenerInterface = eventListenerInterface
        downKeyEventListenerInterface:onDownKeyEvent(eventObject)
end


function DownKeyEventHandlerBase:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(BasicEventHandler))
        stringBuffer:append(DownKeyEventHandlerBase.TOTAL_LISTENERS)
        stringBuffer:appendint(self.list:size())
        local eventListenerInterface = nil
        for index = 0, self.list:size() - 1 do
            local try_ok, try_error = pcall(function()
                eventListenerInterface = self.list:get(index)
                stringBuffer:append(DownKeyEventHandlerBase.LISTENER_LABEL)
                stringBuffer:append(tostring(eventListenerInterface))
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.TOSTRING, e)
            end
        end
        return tostring(stringBuffer)
end
DownKeyEventHandlerBase.__tostring = function(self) return self:toString() end

DownKeyEventHandlerBase.TOTAL_LISTENERS = " Total PlayerGameInput Listeners: "
DownKeyEventHandlerBase.LISTENER_LABEL = " PlayerGameInput Listener: "

return DownKeyEventHandlerBase

