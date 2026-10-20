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

local GameInputProcessor = require("org.allbinary.game.input.GameInputProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSPlayerGameInputProcessor = {}
RTSPlayerGameInputProcessor.__index = RTSPlayerGameInputProcessor
RTSPlayerGameInputProcessor.className = "RTSPlayerGameInputProcessor"
setmetatable(RTSPlayerGameInputProcessor, {__index = GameInputProcessor})

function RTSPlayerGameInputProcessor:_init_fields()
    self.rtsPlayerGameInput = nil
end


function RTSPlayerGameInputProcessor.new(rtsPlayerGameInput)
    local self = setmetatable(GameInputProcessor.new(), RTSPlayerGameInputProcessor)
    self:_init_fields()
        self.rtsPlayerGameInput = rtsPlayerGameInput
    return self
end

return RTSPlayerGameInputProcessor

