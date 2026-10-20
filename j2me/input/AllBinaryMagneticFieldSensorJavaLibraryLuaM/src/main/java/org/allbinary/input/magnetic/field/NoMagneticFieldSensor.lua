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
-- package org.allbinary.input.magnetic.field

local AllBinarySensorListener = require("org.allbinary.input.AllBinarySensorListener")
local Orientation = require("org.allbinary.logic.math.Orientation")
local AllBinaryMagneticFieldSensor = require("org.allbinary.input.magnetic.field.AllBinaryMagneticFieldSensor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoMagneticFieldSensor = {}
NoMagneticFieldSensor.__index = NoMagneticFieldSensor
NoMagneticFieldSensor.className = "NoMagneticFieldSensor"
setmetatable(NoMagneticFieldSensor, {__index = AllBinaryMagneticFieldSensor})

function NoMagneticFieldSensor.new()
    local self = setmetatable(AllBinaryMagneticFieldSensor.new(), NoMagneticFieldSensor)
    return self
end


-- throws Exception
function NoMagneticFieldSensor:getOrientation()
        return Orientation.NONE
end


function NoMagneticFieldSensor:onSensorChange()
end

return NoMagneticFieldSensor

