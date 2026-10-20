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
-- package org.allbinary.android.input.motion

local AnalogControllerConfigurationEvent = require("org.allbinary.android.input.motion.event.AnalogControllerConfigurationEvent")
local AnalogControllerConfigurationEventHandler = require("org.allbinary.android.input.motion.event.AnalogControllerConfigurationEventHandler")
local ScaleFactorFactory = require("org.allbinary.logic.math.ScaleFactorFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AnalogControllerConfigurationFactory = {}
AnalogControllerConfigurationFactory.__index = AnalogControllerConfigurationFactory
AnalogControllerConfigurationFactory.className = "AnalogControllerConfigurationFactory"

function AnalogControllerConfigurationFactory:_init_fields()
    self.SCALE_FACTOR = ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR
    self.SCALE_VALUE = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE
    self.available = false
    self.analogControllerConfigurationEvent = AnalogControllerConfigurationEvent.new(self)
end


function AnalogControllerConfigurationFactory.getInstance()
        return AnalogControllerConfigurationFactory.instance
end


function AnalogControllerConfigurationFactory.new()
    local self = setmetatable({}, AnalogControllerConfigurationFactory)
    self:_init_fields()
    return self
end


function AnalogControllerConfigurationFactory:isAvailable()
        return self.available
end


-- throws Exception
function AnalogControllerConfigurationFactory:setAvailable(available)
        self.available = available
        AnalogControllerConfigurationEventHandler.getInstance():fireEvent(self.analogControllerConfigurationEvent)
end

AnalogControllerConfigurationFactory.instance = AnalogControllerConfigurationFactory.new()

return AnalogControllerConfigurationFactory

