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

local Features = require("org.allbinary.game.configuration.feature.Features")
local SensorFeatureFactory = require("org.allbinary.game.configuration.feature.SensorFeatureFactory")
local Orientation = require("org.allbinary.logic.math.Orientation")

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

local OrientationToGameKeyEvent = {}
OrientationToGameKeyEvent.__index = OrientationToGameKeyEvent
OrientationToGameKeyEvent.className = "OrientationToGameKeyEvent"

function OrientationToGameKeyEvent:_init_fields()
    self.allBinaryGyroSensor = nil
    self.MIN = 15
end


function OrientationToGameKeyEvent.new()
    local self = setmetatable({}, OrientationToGameKeyEvent)
    self:_init_fields()
        if Features.getInstance():isFeature(SensorFeatureFactory.getInstance().NO_ORIENTATION) then
            self.allBinaryGyroSensor = NoGyroSensor.new()
        else
            error(java_exception("Exception", "Not Such Feature"), 0)
        end
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

