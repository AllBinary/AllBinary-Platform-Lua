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
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local PressGameKeyEventHandler = {}
PressGameKeyEventHandler.__index = PressGameKeyEventHandler
PressGameKeyEventHandler.className = "PressGameKeyEventHandler"
setmetatable(PressGameKeyEventHandler, {__index = BasicEventHandler})

function PressGameKeyEventHandler:_init_fields()
    self.list = BasicArrayListD.new()
end


function PressGameKeyEventHandler.getInstance()
        return PressGameKeyEventHandler.instance
end


function PressGameKeyEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), PressGameKeyEventHandler)
    self:_init_fields()
    return self
end


function PressGameKeyEventHandler:addListener(playerGameInput)
        if not self.list:contains(playerGameInput) then
            self.list:add(playerGameInput)
        end
end


function PressGameKeyEventHandler:removeAllListeners()
        self.list:clear()
        BasicEventHandler.removeAllListeners(self)
end


function PressGameKeyEventHandler:removeListener(eventListenerInterface)
        self.list:remove(eventListenerInterface)
        BasicEventHandler.removeListener(self, eventListenerInterface)
end


-- throws Exception
function PressGameKeyEventHandler:fireEvent(eventObject)
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local try_ok, try_error = pcall(function()
                local playerGameInput = self.list.objectArray[index + 1]
                playerGameInput:onPressGameKeyEvent(eventObject)
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
function PressGameKeyEventHandler:process(eventObject, eventListenerInterface)
        local pressGameKeyEventListenerInterface = (eventListenerInterface)
        pressGameKeyEventListenerInterface:onPressGameKeyEvent(eventObject)
end

PressGameKeyEventHandler.instance = PressGameKeyEventHandler.new()

return PressGameKeyEventHandler

