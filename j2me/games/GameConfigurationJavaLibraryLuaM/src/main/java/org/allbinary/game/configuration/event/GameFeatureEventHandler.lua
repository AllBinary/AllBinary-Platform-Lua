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
-- package org.allbinary.game.configuration.event

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

local GameFeatureEventHandler = {}
GameFeatureEventHandler.__index = GameFeatureEventHandler
GameFeatureEventHandler.className = "GameFeatureEventHandler"
setmetatable(GameFeatureEventHandler, {__index = BasicEventHandler})


function GameFeatureEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), GameFeatureEventHandler)
    return self
end


function GameFeatureEventHandler.getInstance()
        return GameFeatureEventHandler.gameKeyEventHandler
end


-- throws Exception
function GameFeatureEventHandler:process(eventObject, eventListenerInterface)
        local gameFeatureListenerInterface = (eventListenerInterface)
        gameFeatureListenerInterface:onGameFeatureChange(eventObject)
end

GameFeatureEventHandler.gameKeyEventHandler = GameFeatureEventHandler.new()

return GameFeatureEventHandler

