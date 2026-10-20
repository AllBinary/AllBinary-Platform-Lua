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

local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local AllBinarySensorListener = require("org.allbinary.input.AllBinarySensorListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinarySensor = {}
AllBinarySensor.__index = AllBinarySensor
AllBinarySensor.className = "AllBinarySensor"

function AllBinarySensor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function AllBinarySensor.new()
    local self = setmetatable({}, AllBinarySensor)
    self:_init_fields()
    return self
end


function AllBinarySensor:init()
end


-- throws Exception
function AllBinarySensor:update()
end


function AllBinarySensor.setMax(max)
        AllBinarySensor.max = max
end


function AllBinarySensor.getMax()
        return AllBinarySensor.max
end


function AllBinarySensor:getId()
        return AllBinarySensor.getMax()
end


function AllBinarySensor:shutdown()
        self.logUtil:putF(self.commonStrings.START, self, "shutdown")
end


function AllBinarySensor:onSensorChange()
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end

AllBinarySensor.NULL_ALLBINARY_SENSOR = AllBinarySensor.new()
AllBinarySensor.max = 100

return AllBinarySensor

