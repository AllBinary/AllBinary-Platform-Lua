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
-- package org.allbinary.game.tick

local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local TickableInterface = require("org.allbinary.game.tick.TickableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullTickable = {}
NullTickable.__index = NullTickable
NullTickable.className = "NullTickable"

function NullTickable:_init_fields()
    self.NAME = "NulLTickable"
end

function NullTickable.new()
    local self = setmetatable({}, NullTickable)
    self:_init_fields()
    return self
end


function NullTickable.getInstance()
        return NullTickable.SINGLETON
end


-- throws Exception
function NullTickable:processTick(allBinaryLayerManager)
end


function NullTickable:getName()
        return self.NAME
end

NullTickable.SINGLETON = NullTickable.new()

return NullTickable

