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
-- package org.allbinary.game.terrain

local NullUtil = require("org.allbinary.logic.NullUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local AllBinaryEventObjectFactoryInterface = require("org.allbinary.logic.util.event.AllBinaryEventObjectFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TerrainEventFactory = {}
TerrainEventFactory.__index = TerrainEventFactory
TerrainEventFactory.className = "TerrainEventFactory"


function TerrainEventFactory.new()
    local self = setmetatable({}, TerrainEventFactory)
    return self
end


function TerrainEventFactory:getInstance()
        return TerrainEvent.new(NullUtil.getInstance().NULL_OBJECT)
end

return TerrainEventFactory

