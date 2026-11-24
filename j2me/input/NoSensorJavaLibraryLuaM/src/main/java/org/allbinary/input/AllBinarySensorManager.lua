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
-- package org.allbinary.input

local AllBinarySensorManager = {}
package.loaded["org.allbinary.input.AllBinarySensorManager"] = AllBinarySensorManager

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

local AccelerometerSensorFactory = java_lazy("org.allbinary.input.accelerometer.AccelerometerSensorFactory")
local GyroSensorFactory = java_lazy("org.allbinary.input.gyro.GyroSensorFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table AllBinarySensorManager is declared before the requires
AllBinarySensorManager.__index = AllBinarySensorManager
AllBinarySensorManager.className = "AllBinarySensorManager"
AllBinarySensorManager.javaClassName = "org.allbinary.input.AllBinarySensorManager"

function AllBinarySensorManager:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.ORIENTATION_SENSOR_INPUT = "Orientation Sensor Input"
    self.ORIENTATION_TYPE = "Orientation Type"
    self.list = BasicArrayListD.new()
end


function AllBinarySensorManager.getInstance()
        if AllBinarySensorManager.instance_f == NullUtil.getInstance().NULL_OBJECT then
            AllBinarySensorManager.instance_f = AllBinarySensorManager.new()
        end
        return AllBinarySensorManager.instance_f
end


function AllBinarySensorManager._jinit(self)
    AllBinarySensorManager._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            GyroSensorFactory.init()
            AccelerometerSensorFactory.init()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
    return self
end

function AllBinarySensorManager.new(...)
    local self = setmetatable({}, AllBinarySensorManager)
    AllBinarySensorManager._jinit(self, ...)
    return self
end


function AllBinarySensorManager:init()
end


function AllBinarySensorManager:getSensorNamesList()
        return self.list
end


function AllBinarySensorManager:shutdown()
end

AllBinarySensorManager.instance_f = NullUtil.getInstance().NULL_OBJECT

return AllBinarySensorManager

