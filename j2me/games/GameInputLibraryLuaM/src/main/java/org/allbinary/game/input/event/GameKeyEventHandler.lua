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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameKeyEventHandler = {}
GameKeyEventHandler.__index = GameKeyEventHandler
GameKeyEventHandler.className = "GameKeyEventHandler"

function GameKeyEventHandler:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.pressGameKeyEventHandler = PressGameKeyEventHandler.getInstance()
    self.upGameKeyEventHandler = UpGameKeyEventHandler.getInstance()
    self.downGameKeyEventHandler = DownGameKeyEventHandler.getInstance()
end

function GameKeyEventHandler.new()
    local self = setmetatable({}, GameKeyEventHandler)
    self:_init_fields()
    return self
end


function GameKeyEventHandler.getInstance()
        return GameKeyEventHandler.instance
end


function GameKeyEventHandler:removeAllListeners()
        self.pressGameKeyEventHandler:removeAllListeners()
        self.upGameKeyEventHandler:removeAllListeners()
        self.downGameKeyEventHandler:removeAllListeners()
end


function GameKeyEventHandler:addListenerForPlayer(eventListenerInterface, playerInputId)
        self.logUtil:putF(tostring(eventListenerInterface), self, self.commonStrings.ADD_LISTENER)
        self.pressGameKeyEventHandler:addListenerSingleThreaded(eventListenerInterface)
        self.upGameKeyEventHandler:getInstanceForPlayer(playerInputId):addListenerSingleThreaded(eventListenerInterface)
        self.downGameKeyEventHandler:getInstanceForPlayer(playerInputId):addListenerSingleThreaded(eventListenerInterface)
end


function GameKeyEventHandler:addListener(eventListenerInterface)
        self.logUtil:putF(tostring(eventListenerInterface), self, self.commonStrings.ADD_LISTENER)
        self.pressGameKeyEventHandler:addListenerSingleThreaded(eventListenerInterface)
        self.upGameKeyEventHandler:addListenerSingleThreaded(eventListenerInterface)
        self.downGameKeyEventHandler:addListenerSingleThreaded(eventListenerInterface)
end


function GameKeyEventHandler:removeListener(eventListenerInterface)
        self.logUtil:putF(tostring(eventListenerInterface), self, self.commonStrings.REMOVE_LISTENER)
        self.pressGameKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
        self.upGameKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
        self.downGameKeyEventHandler:removeListenerSingleThreaded(eventListenerInterface)
end

GameKeyEventHandler.instance = GameKeyEventHandler.new()

return GameKeyEventHandler

