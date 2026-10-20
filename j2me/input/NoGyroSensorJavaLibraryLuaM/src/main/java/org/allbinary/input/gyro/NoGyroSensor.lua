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
-- package org.allbinary.input.gyro

local AllBinarySensorListener = require("org.allbinary.input.AllBinarySensorListener")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Orientation = require("org.allbinary.logic.math.Orientation")
local AllBinaryOrientationSensor = require("org.allbinary.input.gyro.AllBinaryOrientationSensor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoGyroSensor = {}
NoGyroSensor.__index = NoGyroSensor
NoGyroSensor.className = "NoGyroSensor"
setmetatable(NoGyroSensor, {__index = AllBinaryOrientationSensor})


function NoGyroSensor.new()
    local self = setmetatable(AllBinaryOrientationSensor.new(), NoGyroSensor)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
    return self
end


-- throws Exception
function NoGyroSensor:getOrientation()
        return Orientation.NONE
end


function NoGyroSensor:onSensorChange()
end

return NoGyroSensor

