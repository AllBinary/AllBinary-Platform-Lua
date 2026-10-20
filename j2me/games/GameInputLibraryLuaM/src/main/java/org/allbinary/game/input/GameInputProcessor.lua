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
-- package org.allbinary.game.input

local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInputProcessor = {}
GameInputProcessor.__index = GameInputProcessor
GameInputProcessor.className = "GameInputProcessor"


function GameInputProcessor.getInstance()
        return GameInputProcessor.instance
end


function GameInputProcessor.new()
    local self = setmetatable({}, GameInputProcessor)
    return self
end


-- throws Exception
function GameInputProcessor:processEvent(allbinaryLayerManager, gameKeyEvent)
end


-- throws Exception
function GameInputProcessor:processReleasedEvent(allbinaryLayerManager, gameKeyEvent)
end


-- throws Exception
function GameInputProcessor:processAnalog(allbinaryLayerManager, gameKeyEvent, analogValue)
end


-- throws Exception
function GameInputProcessor:process(allbinaryLayerManager, keyAsInteger)
end


-- throws Exception
function GameInputProcessor:processReleased(allbinaryLayerManager, keyAsInteger)
end

GameInputProcessor.instance = GameInputProcessor.new()

return GameInputProcessor

