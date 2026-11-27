-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.logic.communication.log.config.type

local LogConfigTypeFactory = {}
package.loaded["org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory"] = LogConfigTypeFactory

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

local LogConfigType = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigType")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table LogConfigTypeFactory is declared before the requires
LogConfigTypeFactory.__index = LogConfigTypeFactory
LogConfigTypeFactory.className = "LogConfigTypeFactory"
LogConfigTypeFactory.javaClassName = "org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory"

function LogConfigTypeFactory:_init_fields()
    self.NO_DESCRIPTION = "No Description"
    self.OS = LogConfigType.new("Operating System", self.NO_DESCRIPTION)
    self.FACTORYERROR = LogConfigType.new("Factory Error", self.NO_DESCRIPTION)
end


function LogConfigTypeFactory.getInstance()
        return LogConfigTypeFactory.instance_f
end


function LogConfigTypeFactory._jinit(self)
    LogConfigTypeFactory._init_fields(self)
        LogConfigTypes.LOGGING:add(self.OS)
        LogConfigTypes.LOGGING:add(self.FACTORYERROR)
    return self
end

function LogConfigTypeFactory.new(...)
    local self = setmetatable({}, LogConfigTypeFactory)
    LogConfigTypeFactory._jinit(self, ...)
    return self
end

LogConfigTypeFactory.instance_f = LogConfigTypeFactory.new()

return LogConfigTypeFactory

