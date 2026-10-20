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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DemoGameMidletStateFactory = {}
DemoGameMidletStateFactory.__index = DemoGameMidletStateFactory
DemoGameMidletStateFactory.className = "DemoGameMidletStateFactory"

function DemoGameMidletStateFactory:_init_fields()
    self.NONE = DemoGameMidletState.new()
    self.START_DEMO = DemoGameMidletState.new()
    self.START_GAME = DemoGameMidletState.new()
    self.START_INPUT_MAPPING = DemoGameMidletState.new()
end


function DemoGameMidletStateFactory.new()
    local self = setmetatable({}, DemoGameMidletStateFactory)
    self:_init_fields()
    return self
end


function DemoGameMidletStateFactory.getInstance()
        return DemoGameMidletStateFactory.STATE
end

DemoGameMidletStateFactory.STATE = DemoGameMidletStateFactory.new()

return DemoGameMidletStateFactory

