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
-- package org.allbinary.input.accelerometer

local AllBinaryOrientationSensor = require("org.allbinary.input.gyro.AllBinaryOrientationSensor")
local Orientation = require("org.allbinary.logic.math.Orientation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoAccelerometerSensor = {}
NoAccelerometerSensor.__index = NoAccelerometerSensor
NoAccelerometerSensor.className = "NoAccelerometerSensor"
setmetatable(NoAccelerometerSensor, {__index = AllBinaryOrientationSensor})


function NoAccelerometerSensor.new()
    local self = setmetatable(AllBinaryOrientationSensor.new(), NoAccelerometerSensor)
    return self
end


-- throws Exception
function NoAccelerometerSensor:getOrientation()
        return Orientation.NONE
end


function NoAccelerometerSensor:onSensorChange()
end

return NoAccelerometerSensor

