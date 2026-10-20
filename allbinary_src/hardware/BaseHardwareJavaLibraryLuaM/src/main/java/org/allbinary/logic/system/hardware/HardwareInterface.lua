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
-- package org.allbinary.logic.system.hardware

local HardwareComponentInterface = require("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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
local HardwareInterface = {}
HardwareInterface.__index = HardwareInterface
HardwareInterface.className = "HardwareInterface"


function HardwareInterface:getComponent(index)
    error("abstract method getComponent")
end


function HardwareInterface:toString()
    error("abstract method toString")
end
HardwareInterface.__tostring = function(self) return self:toString() end


function HardwareInterface:compareTo(hardwareInterface)
    error("abstract method compareTo")
end


function HardwareInterface:difference(hardwareInterface)
    error("abstract method difference")
end

return HardwareInterface

