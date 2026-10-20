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
local DownGameKeyEventHandlerBase = require("org.allbinary.game.input.event.DownGameKeyEventHandlerBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DownGameKeyEventHandler = {}
DownGameKeyEventHandler.__index = DownGameKeyEventHandler
DownGameKeyEventHandler.className = "DownGameKeyEventHandler"
setmetatable(DownGameKeyEventHandler, {__index = DownGameKeyEventHandlerBase})

function DownGameKeyEventHandler:_init_fields()
    self.playerInputIdFactory = LocalPlayerInputIdFactory.getInstance()
end


function DownGameKeyEventHandler.getInstance()
        return DownGameKeyEventHandler.instance
end


function DownGameKeyEventHandler:getInstanceForDevice(deviceId)
        local playerInputId = self.playerInputIdFactory:getPlayerForDevice(deviceId)
        return DownGameKeyEventHandler.instanceArray[playerInputId + 1]
end


function DownGameKeyEventHandler:getInstanceForPlayer(playerInputId)
        return DownGameKeyEventHandler.instanceArray[playerInputId + 1]
end


function DownGameKeyEventHandler.new()
    local self = setmetatable(DownGameKeyEventHandlerBase.new(), DownGameKeyEventHandler)
    self:_init_fields()
    return self
end


function DownGameKeyEventHandler:removeAllListeners()
        DownGameKeyEventHandlerBase.removeAllListeners(self)
        for index = (DownGameKeyEventHandler.instanceArray.n or #DownGameKeyEventHandler.instanceArray) - 1, 0, -1 do
            DownGameKeyEventHandler.instanceArray[index + 1]:removeAllListeners()
        end
end


function DownGameKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
        DownGameKeyEventHandlerBase.removeListenerSingleThreaded(self, eventListenerInterface)
        for index = (DownGameKeyEventHandler.instanceArray.n or #DownGameKeyEventHandler.instanceArray) - 1, 0, -1 do
            DownGameKeyEventHandler.instanceArray[index + 1]:removeListenerSingleThreaded(eventListenerInterface)
        end
end


function DownGameKeyEventHandler:removeListener(eventListenerInterface)
        DownGameKeyEventHandlerBase.removeListener(self, eventListenerInterface)
        for index = (DownGameKeyEventHandler.instanceArray.n or #DownGameKeyEventHandler.instanceArray) - 1, 0, -1 do
            DownGameKeyEventHandler.instanceArray[index + 1]:removeListener(eventListenerInterface)
        end
end

DownGameKeyEventHandler.instance = DownGameKeyEventHandler.new()
DownGameKeyEventHandler.instanceArray = {DownGameKeyEventHandlerBase.new(), DownGameKeyEventHandlerBase.new(), DownGameKeyEventHandlerBase.new(), DownGameKeyEventHandlerBase.new(), DownGameKeyEventHandlerBase.new(), DownGameKeyEventHandlerBase.new()}

return DownGameKeyEventHandler

