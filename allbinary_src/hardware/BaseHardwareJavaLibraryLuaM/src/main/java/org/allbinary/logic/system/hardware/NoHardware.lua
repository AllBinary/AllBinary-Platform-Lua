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

local StdUtil = require("org.allbinary.logic.StdUtil")
local HardwareComponentInterface = require("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local NoHardwareComponent = require("org.allbinary.logic.system.hardware.components.interfaces.NoHardwareComponent")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local HardwareInterface = require("org.allbinary.logic.system.hardware.HardwareInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoHardware = {}
NoHardware.__index = NoHardware
NoHardware.className = "NoHardware"

function NoHardware.new()
    local self = setmetatable({}, NoHardware)
    return self
end


function NoHardware.getInstance()
        return NoHardware.instance
end


function NoHardware:getComponent(index)
        return NoHardwareComponent.getInstance()
end


function NoHardware:toString()
        return "No Hardware"
end
NoHardware.__tostring = function(self) return self:toString() end


function NoHardware:compareTo(hardwareInterface)
        return true
end


function NoHardware:difference(hardwareInterface)
        return StdUtil.getInstance().NULL_TABLE
end

NoHardware.instance = NoHardware.new()

return NoHardware

