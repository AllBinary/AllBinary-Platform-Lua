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
local UpGameKeyEventHandlerBase = require("org.allbinary.game.input.event.UpGameKeyEventHandlerBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UpGameKeyEventHandler = {}
UpGameKeyEventHandler.__index = UpGameKeyEventHandler
UpGameKeyEventHandler.className = "UpGameKeyEventHandler"
setmetatable(UpGameKeyEventHandler, {__index = UpGameKeyEventHandlerBase})

function UpGameKeyEventHandler:_init_fields()
    self.playerInputIdFactory = LocalPlayerInputIdFactory.getInstance()
end


function UpGameKeyEventHandler.getInstance()
        return UpGameKeyEventHandler.instance
end


function UpGameKeyEventHandler:getInstanceForDevice(deviceId)
        local playerInputId = self.playerInputIdFactory:getPlayerForDevice(deviceId)
        return UpGameKeyEventHandler.instanceArray[playerInputId + 1]
end


function UpGameKeyEventHandler:getInstanceForPlayer(playerInputId)
        return UpGameKeyEventHandler.instanceArray[playerInputId + 1]
end


function UpGameKeyEventHandler.new()
    local self = setmetatable(UpGameKeyEventHandlerBase.new(), UpGameKeyEventHandler)
    self:_init_fields()
    return self
end


function UpGameKeyEventHandler:removeAllListeners()
        UpGameKeyEventHandlerBase.removeAllListeners(self)
        for index = (UpGameKeyEventHandler.instanceArray.n or #UpGameKeyEventHandler.instanceArray) - 1, 0, -1 do
            UpGameKeyEventHandler.instanceArray[index + 1]:removeAllListeners()
        end
end


function UpGameKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
        UpGameKeyEventHandlerBase.removeListenerSingleThreaded(self, eventListenerInterface)
        for index = (UpGameKeyEventHandler.instanceArray.n or #UpGameKeyEventHandler.instanceArray) - 1, 0, -1 do
            UpGameKeyEventHandler.instanceArray[index + 1]:removeListenerSingleThreaded(eventListenerInterface)
        end
end


function UpGameKeyEventHandler:removeListener(eventListenerInterface)
        UpGameKeyEventHandlerBase.removeListener(self, eventListenerInterface)
        for index = (UpGameKeyEventHandler.instanceArray.n or #UpGameKeyEventHandler.instanceArray) - 1, 0, -1 do
            UpGameKeyEventHandler.instanceArray[index + 1]:removeListener(eventListenerInterface)
        end
end

UpGameKeyEventHandler.instance = UpGameKeyEventHandler.new()
UpGameKeyEventHandler.instanceArray = {UpGameKeyEventHandlerBase.new(), UpGameKeyEventHandlerBase.new(), UpGameKeyEventHandlerBase.new(), UpGameKeyEventHandlerBase.new(), UpGameKeyEventHandlerBase.new(), UpGameKeyEventHandlerBase.new()}

return UpGameKeyEventHandler

