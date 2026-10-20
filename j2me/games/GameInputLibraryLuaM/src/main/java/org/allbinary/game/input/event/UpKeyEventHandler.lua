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

local LocalPlayerInputIdFactory = require("org.allbinary.game.input.LocalPlayerInputIdFactory")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local UpKeyEventHandlerBase = require("org.allbinary.game.input.event.UpKeyEventHandlerBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UpKeyEventHandler = {}
UpKeyEventHandler.__index = UpKeyEventHandler
UpKeyEventHandler.className = "UpKeyEventHandler"
setmetatable(UpKeyEventHandler, {__index = UpKeyEventHandlerBase})

function UpKeyEventHandler:_init_fields()
    self.playerInputIdFactory = LocalPlayerInputIdFactory.getInstance()
end


function UpKeyEventHandler.getInstance()
        return UpKeyEventHandler.instance
end


function UpKeyEventHandler:getInstanceForDevice(deviceId)
        local playerInputId = self.playerInputIdFactory:getPlayerForDevice(deviceId)
        return UpKeyEventHandler.instanceArray[playerInputId + 1]
end


function UpKeyEventHandler:getInstanceForPlayer(playerInputId)
        return UpKeyEventHandler.instanceArray[playerInputId + 1]
end


function UpKeyEventHandler.new()
    local self = setmetatable(UpKeyEventHandlerBase.new(), UpKeyEventHandler)
    self:_init_fields()
    return self
end


function UpKeyEventHandler:removeAllListeners()
        UpKeyEventHandlerBase.removeAllListeners(self)
        for index = (UpKeyEventHandler.instanceArray.n or #UpKeyEventHandler.instanceArray) - 1, 0, -1 do
            UpKeyEventHandler.instanceArray[index + 1]:removeAllListeners()
        end
end


function UpKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
        UpKeyEventHandlerBase.removeListenerSingleThreaded(self, eventListenerInterface)
        for index = (UpKeyEventHandler.instanceArray.n or #UpKeyEventHandler.instanceArray) - 1, 0, -1 do
            UpKeyEventHandler.instanceArray[index + 1]:removeListenerSingleThreaded(eventListenerInterface)
        end
end


function UpKeyEventHandler:removeListener(eventListenerInterface)
        UpKeyEventHandlerBase.removeListener(self, eventListenerInterface)
        for index = (UpKeyEventHandler.instanceArray.n or #UpKeyEventHandler.instanceArray) - 1, 0, -1 do
            UpKeyEventHandler.instanceArray[index + 1]:removeListener(eventListenerInterface)
        end
end

UpKeyEventHandler.instance = UpKeyEventHandler.new()
UpKeyEventHandler.instanceArray = {UpKeyEventHandlerBase.new(), UpKeyEventHandlerBase.new(), UpKeyEventHandlerBase.new(), UpKeyEventHandlerBase.new(), UpKeyEventHandlerBase.new(), UpKeyEventHandlerBase.new()}

return UpKeyEventHandler

