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

local AllBinarySensor = {}
package.loaded["org.allbinary.input.AllBinarySensor"] = AllBinarySensor

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

local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AllBinarySensorListener = require("org.allbinary.input.AllBinarySensorListener")

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

-- class table AllBinarySensor is declared before the requires
AllBinarySensor.__index = AllBinarySensor
AllBinarySensor.className = "AllBinarySensor"
AllBinarySensor.javaClassName = "org.allbinary.input.AllBinarySensor"
AllBinarySensor.java_implements = " AllBinarySensorListener "
AllBinarySensor.java_interfaces = function() return {AllBinarySensorListener} end

function AllBinarySensor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function AllBinarySensor._jinit(self)
    AllBinarySensor._init_fields(self)
    return self
end

function AllBinarySensor.new(...)
    local self = setmetatable({}, AllBinarySensor)
    AllBinarySensor._jinit(self, ...)
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

