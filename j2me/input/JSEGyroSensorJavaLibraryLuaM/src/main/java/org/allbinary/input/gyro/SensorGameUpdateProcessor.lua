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

local SensorGameUpdateProcessor = {}
package.loaded["org.allbinary.input.gyro.SensorGameUpdateProcessor"] = SensorGameUpdateProcessor

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

local NoCompleteMotionGestureInputEventListener = java_lazy("org.allbinary.game.input.motion.action.NoCompleteMotionGestureInputEventListener")
local AllBinarySensor = java_lazy("org.allbinary.input.AllBinarySensor")
local NoAllBinarySensor = java_lazy("org.allbinary.input.NoAllBinarySensor")
local AccelerometerSensorFactory = java_lazy("org.allbinary.input.accelerometer.AccelerometerSensorFactory")
local GyroSensorFactory = java_lazy("org.allbinary.input.gyro.GyroSensorFactory")

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

-- class table SensorGameUpdateProcessor is declared before the requires
SensorGameUpdateProcessor.__index = SensorGameUpdateProcessor
SensorGameUpdateProcessor.className = "SensorGameUpdateProcessor"
SensorGameUpdateProcessor.javaClassName = "org.allbinary.input.gyro.SensorGameUpdateProcessor"

function SensorGameUpdateProcessor:_init_fields()
    if self.inputSensor == nil then self.inputSensor = nil end
end

function SensorGameUpdateProcessor._jinit(self)
    SensorGameUpdateProcessor._init_fields(self)
    return self
end

function SensorGameUpdateProcessor.new()
    return SensorGameUpdateProcessor._jinit(setmetatable({}, SensorGameUpdateProcessor))
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
        if rawequal(self.inputSensor, NoAllBinarySensor.getInstance()) then
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

