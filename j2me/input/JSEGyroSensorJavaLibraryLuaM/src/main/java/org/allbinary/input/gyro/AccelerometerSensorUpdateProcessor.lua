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

local Processor = require("org.allbinary.canvas.Processor")
local Features = require("org.allbinary.game.configuration.feature.Features")
local SensorFeatureFactory = require("org.allbinary.game.configuration.feature.SensorFeatureFactory")
local NoCompleteMotionGestureInputEventListener = require("org.allbinary.game.input.motion.action.NoCompleteMotionGestureInputEventListener")
local SingleKeyPressGameKeyFromMotionGestureEventListener = require("org.allbinary.game.input.motion.action.SingleKeyPressGameKeyFromMotionGestureEventListener")
local AccelerometerSensorFactory = require("org.allbinary.input.accelerometer.AccelerometerSensorFactory")

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

local AccelerometerSensorUpdateProcessor = {}
AccelerometerSensorUpdateProcessor.__index = AccelerometerSensorUpdateProcessor
AccelerometerSensorUpdateProcessor.className = "AccelerometerSensorUpdateProcessor"
setmetatable(AccelerometerSensorUpdateProcessor, {__index = Processor})

function AccelerometerSensorUpdateProcessor.new()
    local self = setmetatable(Processor.new(), AccelerometerSensorUpdateProcessor)
    return self
end


-- throws Exception
function AccelerometerSensorUpdateProcessor:process()
        local sensorFeatureFactory = SensorFeatureFactory.getInstance()
        if Features.getInstance():isFeature(sensorFeatureFactory.ORIENTATION_SENSORS) then
            AccelerometerSensorFactory.getInstance():setCompleteMotionGestureInputEventListener(SingleKeyPressGameKeyFromMotionGestureEventListener.new())
        elseif Features.getInstance():isFeature(sensorFeatureFactory.SIMULATED_ORIENTATION_SENSORS) then
            AccelerometerSensorFactory.getInstance():setCompleteMotionGestureInputEventListener(SingleKeyPressGameKeyFromMotionGestureEventListener.new())
        elseif Features.getInstance():isFeature(sensorFeatureFactory.NO_ORIENTATION) then
            AccelerometerSensorFactory.getInstance():setCompleteMotionGestureInputEventListener(NoCompleteMotionGestureInputEventListener.getInstance())
        else
            error(java_exception("Exception", "Sensor Feature Not Set"), 0)
        end
end

return AccelerometerSensorUpdateProcessor

