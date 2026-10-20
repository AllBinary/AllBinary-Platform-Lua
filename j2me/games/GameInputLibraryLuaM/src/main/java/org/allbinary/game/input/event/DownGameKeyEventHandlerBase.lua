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

local DownGameKeyEventHandlerBase = {}
DownGameKeyEventHandlerBase.__index = DownGameKeyEventHandlerBase
DownGameKeyEventHandlerBase.className = "DownGameKeyEventHandlerBase"
setmetatable(DownGameKeyEventHandlerBase, {__index = BasicEventHandler})

function DownGameKeyEventHandlerBase:_init_fields()
    self.list = BasicArrayListD.new()
end


function DownGameKeyEventHandlerBase.new()
    local self = setmetatable(BasicEventHandler.new(), DownGameKeyEventHandlerBase)
    self:_init_fields()
    return self
end


function DownGameKeyEventHandlerBase:addListener(playerGameInput)
        if not self.list:contains(playerGameInput) then
            self.list:add(playerGameInput)
        end
end


function DownGameKeyEventHandlerBase:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function DownGameKeyEventHandlerBase:removeListenerSingleThreaded(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListenerSingleThreaded(self, eventListenerInterface)
end


function DownGameKeyEventHandlerBase:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


-- throws Exception
function DownGameKeyEventHandlerBase:fireEvent(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local playerGameInput = self.list.objectArray[index + 1]
                playerGameInput:onDownGameKeyEvent(eventObject)
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
function DownGameKeyEventHandlerBase:process(eventObject, eventListenerInterface)
        local downGameKeyEventListenerInterface = eventListenerInterface
        downGameKeyEventListenerInterface:onDownGameKeyEvent(eventObject)
end


function DownGameKeyEventHandlerBase:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(BasicEventHandler))
        stringBuffer:append(DownGameKeyEventHandlerBase.TOTAL_LISTENERS)
        stringBuffer:appendint(self.list:size())
        local eventListenerInterface = nil
        local size = self.list:size()
        local index = 0
        while index < size do
            local try_ok, try_error = pcall(function()
                eventListenerInterface = self.list:get(index)
                stringBuffer:append(DownGameKeyEventHandlerBase.LISTENER_LABEL)
                stringBuffer:append(tostring(eventListenerInterface))
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.TOSTRING, e)
            end
            index = index + 1
        end
        return tostring(stringBuffer)
end
DownGameKeyEventHandlerBase.__tostring = function(self) return self:toString() end

DownGameKeyEventHandlerBase.TOTAL_LISTENERS = " Total PlayerGameInput Listeners: "
DownGameKeyEventHandlerBase.LISTENER_LABEL = " PlayerGameInput Listener: "

return DownGameKeyEventHandlerBase

