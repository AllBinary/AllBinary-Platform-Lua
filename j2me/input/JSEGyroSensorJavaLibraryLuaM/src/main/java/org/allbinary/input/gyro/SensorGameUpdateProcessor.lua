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

local NoCompleteMotionGestureInputEventListener = require("org.allbinary.game.input.motion.action.NoCompleteMotionGestureInputEventListener")
local AllBinarySensor = require("org.allbinary.input.AllBinarySensor")
local NoAllBinarySensor = require("org.allbinary.input.NoAllBinarySensor")
local AccelerometerSensorFactory = require("org.allbinary.input.accelerometer.AccelerometerSensorFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SensorGameUpdateProcessor = {}
SensorGameUpdateProcessor.__index = SensorGameUpdateProcessor
SensorGameUpdateProcessor.className = "SensorGameUpdateProcessor"

function SensorGameUpdateProcessor:_init_fields()
    self.inputSensor = nil
end

function SensorGameUpdateProcessor.new()
    local self = setmetatable({}, SensorGameUpdateProcessor)
    self:_init_fields()
    return self
end


function SensorGameUpdateProcessor:setInputSensor(inputSensor)
        self.inputSensor = inputSensor
end


function SensorGameUpdateProcessor:getInputSensor()
        return self.inputSensor
end


-- throws Exception
function SensorGameUpdateProcessor:process(anyType)
end


-- throws Exception
function SensorGameUpdateProcessor:sendNotifications(anyType)
end


function SensorGameUpdateProcessor:isAnySensor()
        if self.inputSensor == NoAllBinarySensor.getInstance() then
            return false
        else
            return true
        end
end


function SensorGameUpdateProcessor:setNoSensors()
        GyroSensorFactory.getInstance():setCompleteMotionGestureInputEventListener(NoCompleteMotionGestureInputEventListener.getInstance())
        AccelerometerSensorFactory.getInstance():setCompleteMotionGestureInputEventListener(NoCompleteMotionGestureInputEventListener.getInstance())
        self:setInputSensor(NoAllBinarySensor.getInstance())
end

return SensorGameUpdateProcessor

