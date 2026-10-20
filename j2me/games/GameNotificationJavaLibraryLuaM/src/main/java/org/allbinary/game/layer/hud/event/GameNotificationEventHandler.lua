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
-- package org.allbinary.game.layer.hud.event

local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local NullEventListener = require("org.allbinary.logic.util.event.NullEventListener")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameNotificationEventHandler = {}
GameNotificationEventHandler.__index = GameNotificationEventHandler
GameNotificationEventHandler.className = "GameNotificationEventHandler"
setmetatable(GameNotificationEventHandler, {__index = BasicEventHandler})

function GameNotificationEventHandler:_init_fields()
    self.enabled = true
end


function GameNotificationEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), GameNotificationEventHandler)
    self:_init_fields()
    return self
end


function GameNotificationEventHandler:removeAllListeners()
        local eventListenerInterface = NullEventListener.NULL_EVENT_LISTENER
        local list = self.eventListenerInterfaceList
        if list:size() > 0 then
            eventListenerInterface = list.objectArray[1]
        end
        BasicEventHandler.removeAllListeners(self)
        if eventListenerInterface ~= NullEventListener.NULL_EVENT_LISTENER then
            self:addListenerInterface(eventListenerInterface)
        end
end


function GameNotificationEventHandler.getInstance()
        return GameNotificationEventHandler.instance
end


-- throws Exception
function GameNotificationEventHandler:process(eventObject, eventListenerInterface)
        if not self.enabled then
            return
        end
        local gameNotificationListenerInterface = eventListenerInterface
        gameNotificationListenerInterface:onGameNotificationEvent(eventObject)
end

GameNotificationEventHandler.instance = GameNotificationEventHandler.new()

return GameNotificationEventHandler

