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
-- package org.allbinary.game.midlet

local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameMidletEventHandler = {}
GameMidletEventHandler.__index = GameMidletEventHandler
GameMidletEventHandler.className = "GameMidletEventHandler"
setmetatable(GameMidletEventHandler, {__index = BasicEventHandler})


function GameMidletEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), GameMidletEventHandler)
    return self
end


function GameMidletEventHandler.getInstance()
        return GameMidletEventHandler.gameKeyEventHandler
end


-- throws Exception
function GameMidletEventHandler:process(eventObject, eventListenerInterface)
        local gameMidletEventListener = eventListenerInterface
        gameMidletEventListener:onGameEnd(eventObject)
end

GameMidletEventHandler.gameKeyEventHandler = GameMidletEventHandler.new()

return GameMidletEventHandler

