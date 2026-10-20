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
local NamedInterface = require("org.allbinary.layer.NamedInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local TickableInterface = {}
TickableInterface.__index = TickableInterface
TickableInterface.className = "TickableInterface"
setmetatable(TickableInterface, {__index = NamedInterface})


-- throws Exception
function TickableInterface:processTick(allBinaryLayerManager)
    error("abstract method processTick")
end

return TickableInterface

