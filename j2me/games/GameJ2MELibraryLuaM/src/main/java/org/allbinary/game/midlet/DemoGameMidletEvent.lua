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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DemoGameMidletEvent = {}
DemoGameMidletEvent.__index = DemoGameMidletEvent
DemoGameMidletEvent.className = "DemoGameMidletEvent"
setmetatable(DemoGameMidletEvent, {__index = AllBinaryEventObject})

function DemoGameMidletEvent:_init_fields()
    self.demoGameMidletState = nil
end


function DemoGameMidletEvent.new(anyType, demoGameMidletState)
    local self = setmetatable(AllBinaryEventObject.new(anyType), DemoGameMidletEvent)
    self:_init_fields()
        -- super(...) made self above
        self.demoGameMidletState = demoGameMidletState
    return self
end


function DemoGameMidletEvent:init(anyType)
        self:setSource(anyType)
end


function DemoGameMidletEvent:setDemoGameMidletState(demoGameMidletState)
        self.demoGameMidletState = demoGameMidletState
end


function DemoGameMidletEvent:getDemoGameMidletState()
        return self.demoGameMidletState
end

return DemoGameMidletEvent

