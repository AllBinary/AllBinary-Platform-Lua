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

local UpGameKeyEventHandlerBase = {}
UpGameKeyEventHandlerBase.__index = UpGameKeyEventHandlerBase
UpGameKeyEventHandlerBase.className = "UpGameKeyEventHandlerBase"
setmetatable(UpGameKeyEventHandlerBase, {__index = BasicEventHandler})

function UpGameKeyEventHandlerBase:_init_fields()
    self.list = BasicArrayListD.new()
end


function UpGameKeyEventHandlerBase.new()
    local self = setmetatable(BasicEventHandler.new(), UpGameKeyEventHandlerBase)
    self:_init_fields()
    return self
end


function UpGameKeyEventHandlerBase:addListener(playerGameInput)
        if not self.list:contains(playerGameInput) then
            self.list:add(playerGameInput)
        end
end


function UpGameKeyEventHandlerBase:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function UpGameKeyEventHandlerBase:removeListenerSingleThreaded(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListenerSingleThreaded(self, eventListenerInterface)
end


function UpGameKeyEventHandlerBase:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


-- throws Exception
function UpGameKeyEventHandlerBase:fireEvent(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local playerGameInput = self.list.objectArray[index + 1]
                playerGameInput:onUpGameKeyEvent(eventObject)
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
function UpGameKeyEventHandlerBase:process(eventObject, eventListenerInterface)
        local upGameKeyEventListenerInterface = eventListenerInterface
        upGameKeyEventListenerInterface:onUpGameKeyEvent(eventObject)
end


function UpGameKeyEventHandlerBase:toString()
        local stringBuffer = StringMaker.new()
        local size = self.list:size()
        stringBuffer:append(tostring(BasicEventHandler))
        stringBuffer:append(UpGameKeyEventHandlerBase.TOTAL_LISTENERS)
        stringBuffer:appendint(size)
        for index = 0, size - 1 do
            local try_ok, try_error = pcall(function()
                local eventListenerInterface = self.list:get(index)
                stringBuffer:append(UpGameKeyEventHandlerBase.LISTENER_LABEL)
                stringBuffer:append(tostring(eventListenerInterface))
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.TOSTRING, e)
            end
        end
        return tostring(stringBuffer)
end
UpGameKeyEventHandlerBase.__tostring = function(self) return self:toString() end

UpGameKeyEventHandlerBase.TOTAL_LISTENERS = " Total PlayerGameInput Listeners: "
UpGameKeyEventHandlerBase.LISTENER_LABEL = " PlayerGameInput Listener: "

return UpGameKeyEventHandlerBase

