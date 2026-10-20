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

local Features = require("org.allbinary.game.configuration.feature.Features")
local SensorFeatureFactory = require("org.allbinary.game.configuration.feature.SensorFeatureFactory")
local AllBinaryOrientationSensor = require("org.allbinary.input.gyro.AllBinaryOrientationSensor")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AccelerometerSensorFactory = {}
AccelerometerSensorFactory.__index = AccelerometerSensorFactory
AccelerometerSensorFactory.className = "AccelerometerSensorFactory"

function AccelerometerSensorFactory.new()
    local self = setmetatable({}, AccelerometerSensorFactory)
    return self
end


-- throws Exception
function AccelerometerSensorFactory.init()
        local features = Features.getInstance()
        local sensorFeatureFactory = SensorFeatureFactory.getInstance()
        if features:isFeature(sensorFeatureFactory.ORIENTATION_SENSORS) then
            error(java_exception("Exception", "No Orientation Sensors"), 0)
        elseif features:isFeature(sensorFeatureFactory.SIMULATED_ORIENTATION_SENSORS) then
            error(java_exception("Exception", "No Simulation Sensors"), 0)
        elseif features:isFeature(sensorFeatureFactory.NO_ORIENTATION) then
            AccelerometerSensorFactory.allBinaryAccelerometerSensor = NoAccelerometerSensor.new()
        else
            error(java_exception("Exception", "Not Such SensorFeature"), 0)
        end
end


function AccelerometerSensorFactory.getInstance()
        return AccelerometerSensorFactory.allBinaryAccelerometerSensor
end

AccelerometerSensorFactory.allBinaryAccelerometerSensor = nil

return AccelerometerSensorFactory

