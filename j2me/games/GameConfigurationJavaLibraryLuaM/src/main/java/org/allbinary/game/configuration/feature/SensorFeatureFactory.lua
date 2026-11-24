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
-- package org.allbinary.game.configuration.feature

local SensorFeatureFactory = {}
package.loaded["org.allbinary.game.configuration.feature.SensorFeatureFactory"] = SensorFeatureFactory

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

local SensorFeature = java_lazy("org.allbinary.game.configuration.feature.SensorFeature")

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

-- class table SensorFeatureFactory is declared before the requires
SensorFeatureFactory.__index = SensorFeatureFactory
SensorFeatureFactory.className = "SensorFeatureFactory"
SensorFeatureFactory.javaClassName = "org.allbinary.game.configuration.feature.SensorFeatureFactory"

function SensorFeatureFactory:_init_fields()
    self.NO_ORIENTATION = SensorFeature.new("No Orientation")
    self.ORIENTATION_SENSORS = SensorFeature.new("Orientation Sensors")
    self.SIMULATED_ORIENTATION_SENSORS = SensorFeature.new("Simulated Orientation Sensors")
    self.YAW = SensorFeature.new("Yaw")
    self.YAW_MINUS_RIGHT_PLUS_LEFT = SensorFeature.new("Yaw -Right +Left")
    self.YAW_MINUS_LEFT_PLUS_RIGHT = SensorFeature.new("Yaw -Left +Right ")
    self.PITCH = SensorFeature.new("Pitch")
    self.ROLL = SensorFeature.new("Roll")
end


function SensorFeatureFactory.getInstance()
        return SensorFeatureFactory.instance_f
end


function SensorFeatureFactory._jinit(self)
    SensorFeatureFactory._init_fields(self)
    return self
end

function SensorFeatureFactory.new(...)
    local self = setmetatable({}, SensorFeatureFactory)
    SensorFeatureFactory._jinit(self, ...)
    return self
end

SensorFeatureFactory.instance_f = SensorFeatureFactory.new()

return SensorFeatureFactory

