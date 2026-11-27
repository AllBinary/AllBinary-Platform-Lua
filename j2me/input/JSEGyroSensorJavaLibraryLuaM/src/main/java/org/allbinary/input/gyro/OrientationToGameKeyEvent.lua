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

local OrientationToGameKeyEvent = {}
package.loaded["org.allbinary.input.gyro.OrientationToGameKeyEvent"] = OrientationToGameKeyEvent

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
local Orientation = java_lazy("org.allbinary.logic.math.Orientation")
local AllBinaryOrientationSensor = java_lazy("org.allbinary.input.gyro.AllBinaryOrientationSensor")
local NoGyroSensor = java_lazy("org.allbinary.input.gyro.NoGyroSensor")

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

-- class table OrientationToGameKeyEvent is declared before the requires
OrientationToGameKeyEvent.__index = OrientationToGameKeyEvent
OrientationToGameKeyEvent.className = "OrientationToGameKeyEvent"
OrientationToGameKeyEvent.javaClassName = "org.allbinary.input.gyro.OrientationToGameKeyEvent"

function OrientationToGameKeyEvent:_init_fields()
    if self.allBinaryGyroSensor == nil then self.allBinaryGyroSensor = nil end
    self.MIN = 15
end


function OrientationToGameKeyEvent._jinit(self)
    OrientationToGameKeyEvent._init_fields(self)
        if Features.getInstance():isFeature(SensorFeatureFactory.getInstance().NO_ORIENTATION) then
            self.allBinaryGyroSensor = NoGyroSensor.new()
        else
            error(require("java.lang.Exception").new("Not Such Feature"), 0)
        end
    return self
end

function OrientationToGameKeyEvent.new(...)
    local self = setmetatable({}, OrientationToGameKeyEvent)
    OrientationToGameKeyEvent._jinit(self, ...)
    return self
end


function OrientationToGameKeyEvent:setAllBinaryGyroSensor(allBinaryGyroSensor)
        self.allBinaryGyroSensor = allBinaryGyroSensor
end


function OrientationToGameKeyEvent:getAllBinaryGyroSensor()
        return self.allBinaryGyroSensor
end


-- throws Exception
function OrientationToGameKeyEvent:process()
end


-- throws Exception
function OrientationToGameKeyEvent:updateGameKeyEvents(orientation, yaw, pitch, roll)
end

return OrientationToGameKeyEvent

