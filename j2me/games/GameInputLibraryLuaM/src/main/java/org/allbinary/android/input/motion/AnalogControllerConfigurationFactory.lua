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

local AnalogControllerConfigurationFactory = {}
package.loaded["org.allbinary.android.input.motion.AnalogControllerConfigurationFactory"] = AnalogControllerConfigurationFactory

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

local AnalogControllerConfigurationEvent = java_lazy("org.allbinary.android.input.motion.event.AnalogControllerConfigurationEvent")
local AnalogControllerConfigurationEventHandler = java_lazy("org.allbinary.android.input.motion.event.AnalogControllerConfigurationEventHandler")
local ScaleFactorFactory = java_lazy("org.allbinary.logic.math.ScaleFactorFactory")

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

-- class table AnalogControllerConfigurationFactory is declared before the requires
AnalogControllerConfigurationFactory.__index = AnalogControllerConfigurationFactory
AnalogControllerConfigurationFactory.className = "AnalogControllerConfigurationFactory"
AnalogControllerConfigurationFactory.javaClassName = "org.allbinary.android.input.motion.AnalogControllerConfigurationFactory"

function AnalogControllerConfigurationFactory:_init_fields()
    self.SCALE_FACTOR = ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR
    self.SCALE_VALUE = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE
    if self.available == nil then self.available = false end
    self.analogControllerConfigurationEvent = AnalogControllerConfigurationEvent.new(self)
end


function AnalogControllerConfigurationFactory.getInstance()
        return AnalogControllerConfigurationFactory.instance_f
end


function AnalogControllerConfigurationFactory._jinit(self)
    AnalogControllerConfigurationFactory._init_fields(self)
    return self
end

function AnalogControllerConfigurationFactory.new(...)
    local self = setmetatable({}, AnalogControllerConfigurationFactory)
    AnalogControllerConfigurationFactory._jinit(self, ...)
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

AnalogControllerConfigurationFactory.instance_f = AnalogControllerConfigurationFactory.new()

return AnalogControllerConfigurationFactory

