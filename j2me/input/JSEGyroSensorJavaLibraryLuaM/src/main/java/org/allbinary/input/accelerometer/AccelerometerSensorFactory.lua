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

local AccelerometerSensorFactory = {}
package.loaded["org.allbinary.input.accelerometer.AccelerometerSensorFactory"] = AccelerometerSensorFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local SensorFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.SensorFeatureFactory")
local AllBinaryOrientationSensor = java_lazy("org.allbinary.input.gyro.AllBinaryOrientationSensor")
local NoAccelerometerSensor = java_lazy("org.allbinary.input.accelerometer.NoAccelerometerSensor")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AccelerometerSensorFactory is declared before the requires
AccelerometerSensorFactory.__index = AccelerometerSensorFactory
AccelerometerSensorFactory.className = "AccelerometerSensorFactory"
AccelerometerSensorFactory.javaClassName = "org.allbinary.input.accelerometer.AccelerometerSensorFactory"

function AccelerometerSensorFactory._jinit(self)
    return self
end

function AccelerometerSensorFactory.new()
    return AccelerometerSensorFactory._jinit(setmetatable({}, AccelerometerSensorFactory))
end


-- throws Exception
function AccelerometerSensorFactory.init()
        local features = Features.getInstance()
        local sensorFeatureFactory = SensorFeatureFactory.getInstance()
        if features:isFeature(sensorFeatureFactory.ORIENTATION_SENSORS) then
            error(require("java.lang.Exception").new("No Orientation Sensors"), 0)
        elseif features:isFeature(sensorFeatureFactory.SIMULATED_ORIENTATION_SENSORS) then
            error(require("java.lang.Exception").new("No Simulation Sensors"), 0)
        elseif features:isFeature(sensorFeatureFactory.NO_ORIENTATION) then
            AccelerometerSensorFactory.allBinaryAccelerometerSensor = NoAccelerometerSensor.new()
        else
            error(require("java.lang.Exception").new("Not Such SensorFeature"), 0)
        end
end


function AccelerometerSensorFactory.getInstance()
        return AccelerometerSensorFactory.allBinaryAccelerometerSensor
end

AccelerometerSensorFactory.allBinaryAccelerometerSensor = nil

return AccelerometerSensorFactory

