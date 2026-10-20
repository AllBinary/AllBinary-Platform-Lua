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

local UpKeyEventHandlerBase = {}
UpKeyEventHandlerBase.__index = UpKeyEventHandlerBase
UpKeyEventHandlerBase.className = "UpKeyEventHandlerBase"
setmetatable(UpKeyEventHandlerBase, {__index = BasicEventHandler})

function UpKeyEventHandlerBase:_init_fields()
    self.list = BasicArrayListD.new()
end


function UpKeyEventHandlerBase.new()
    local self = setmetatable(BasicEventHandler.new(), UpKeyEventHandlerBase)
    self:_init_fields()
    return self
end


function UpKeyEventHandlerBase:addListener(playerGameInput)
        if not self.list:contains(playerGameInput) then
            self.list:add(playerGameInput)
        end
end


function UpKeyEventHandlerBase:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function UpKeyEventHandlerBase:removeListenerSingleThreaded(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListenerSingleThreaded(self, eventListenerInterface)
end


function UpKeyEventHandlerBase:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


-- throws Exception
function UpKeyEventHandlerBase:fireEventForInteger(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local playerGameInput = self.list.objectArray[index + 1]
                playerGameInput:onUpKeyEvent(eventObject)
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
                self:processForInteger(eventObject, eventListenerInterface)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, EventStrings.getInstance().FIRE_EVENT, e)
            end
            index = index + 1
        end
end


-- throws Exception
function UpKeyEventHandlerBase:processForInteger(eventObject, eventListenerInterface)
        local upKeyEventListenerInterface = eventListenerInterface
        upKeyEventListenerInterface:onUpKeyEvent(eventObject)
end


function UpKeyEventHandlerBase:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(BasicEventHandler))
        stringBuffer:append(UpKeyEventHandlerBase.TOTAL_LISTENERS)
        stringBuffer:appendint(self.list:size())
        for index = 0, self.list:size() - 1 do
            local try_ok, try_error = pcall(function()
                local eventListenerInterface = self.list:get(index)
                stringBuffer:append(UpKeyEventHandlerBase.LISTENER_LABEL)
                stringBuffer:append(tostring(eventListenerInterface))
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.TOSTRING, e)
            end
        end
        return tostring(stringBuffer)
end
UpKeyEventHandlerBase.__tostring = function(self) return self:toString() end

UpKeyEventHandlerBase.TOTAL_LISTENERS = " Total PlayerGameInput Listeners: "
UpKeyEventHandlerBase.LISTENER_LABEL = " PlayerGameInput Listener: "

return UpKeyEventHandlerBase

