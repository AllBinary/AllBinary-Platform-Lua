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
local DownKeyEventHandlerBase = require("org.allbinary.game.input.event.DownKeyEventHandlerBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DownKeyEventHandler = {}
DownKeyEventHandler.__index = DownKeyEventHandler
DownKeyEventHandler.className = "DownKeyEventHandler"
setmetatable(DownKeyEventHandler, {__index = DownKeyEventHandlerBase})

function DownKeyEventHandler:_init_fields()
    self.playerInputIdFactory = LocalPlayerInputIdFactory.getInstance()
end


function DownKeyEventHandler.getInstance()
        return DownKeyEventHandler.instance
end


function DownKeyEventHandler:getInstanceForDevice(deviceId)
        local playerInputId = self.playerInputIdFactory:getPlayerForDevice(deviceId)
        return DownKeyEventHandler.instanceArray[playerInputId + 1]
end


function DownKeyEventHandler:getInstanceForPlayer(playerInputId)
        return DownKeyEventHandler.instanceArray[playerInputId + 1]
end


function DownKeyEventHandler.new()
    local self = setmetatable(DownKeyEventHandlerBase.new(), DownKeyEventHandler)
    self:_init_fields()
    return self
end


function DownKeyEventHandler:removeAllListeners()
        DownKeyEventHandlerBase.removeAllListeners(self)
        for index = (DownKeyEventHandler.instanceArray.n or #DownKeyEventHandler.instanceArray) - 1, 0, -1 do
            DownKeyEventHandler.instanceArray[index + 1]:removeAllListeners()
        end
end


function DownKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
        DownKeyEventHandlerBase.removeListenerSingleThreaded(self, eventListenerInterface)
        for index = (DownKeyEventHandler.instanceArray.n or #DownKeyEventHandler.instanceArray) - 1, 0, -1 do
            DownKeyEventHandler.instanceArray[index + 1]:removeListenerSingleThreaded(eventListenerInterface)
        end
end


function DownKeyEventHandler:removeListener(eventListenerInterface)
        DownKeyEventHandlerBase.removeListener(self, eventListenerInterface)
        for index = (DownKeyEventHandler.instanceArray.n or #DownKeyEventHandler.instanceArray) - 1, 0, -1 do
            DownKeyEventHandler.instanceArray[index + 1]:removeListener(eventListenerInterface)
        end
end

DownKeyEventHandler.instance = DownKeyEventHandler.new()
DownKeyEventHandler.instanceArray = {DownKeyEventHandlerBase.new(), DownKeyEventHandlerBase.new(), DownKeyEventHandlerBase.new(), DownKeyEventHandlerBase.new(), DownKeyEventHandlerBase.new(), DownKeyEventHandlerBase.new()}

return DownKeyEventHandler

