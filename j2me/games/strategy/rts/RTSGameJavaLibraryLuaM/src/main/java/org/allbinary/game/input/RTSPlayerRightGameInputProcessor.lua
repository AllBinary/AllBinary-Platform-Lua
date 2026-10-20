-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
local RTSPlayerGameInputProcessor = require("org.allbinary.game.input.RTSPlayerGameInputProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSPlayerRightGameInputProcessor = {}
RTSPlayerRightGameInputProcessor.__index = RTSPlayerRightGameInputProcessor
RTSPlayerRightGameInputProcessor.className = "RTSPlayerRightGameInputProcessor"
setmetatable(RTSPlayerRightGameInputProcessor, {__index = RTSPlayerGameInputProcessor})


function RTSPlayerRightGameInputProcessor.new(rtsPlayerGameInput)
    local self = setmetatable(RTSPlayerGameInputProcessor.new(rtsPlayerGameInput), RTSPlayerRightGameInputProcessor)
        -- super(...) made self above
    return self
end


-- throws Exception
function RTSPlayerRightGameInputProcessor:processEvent(allbinaryLayerManager, gameKeyEvent)
        self.rtsPlayerGameInput:right()
end

return RTSPlayerRightGameInputProcessor

