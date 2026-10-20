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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameFeatureEvent = {}
GameFeatureEvent.__index = GameFeatureEvent
GameFeatureEvent.className = "GameFeatureEvent"
setmetatable(GameFeatureEvent, {__index = AllBinaryEventObject})

function GameFeatureEvent:_init_fields()
    self.whatChanged = nil
end


function GameFeatureEvent.new(anyType, whatChanged)
    local self = setmetatable(AllBinaryEventObject.new(anyType), GameFeatureEvent)
    self:_init_fields()
        -- super(...) made self above
        self.whatChanged = whatChanged
    return self
end


function GameFeatureEvent:getWhatChanged()
        return self.whatChanged
end


function GameFeatureEvent:getGameOption()
        return self:getSource()
end

return GameFeatureEvent

