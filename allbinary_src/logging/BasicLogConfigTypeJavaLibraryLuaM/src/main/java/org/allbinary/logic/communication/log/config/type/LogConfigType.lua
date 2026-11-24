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
-- package org.allbinary.logic.communication.log.config.type

local LogConfigType = {}
package.loaded["org.allbinary.logic.communication.log.config.type.LogConfigType"] = LogConfigType

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

-- class table LogConfigType is declared before the requires
LogConfigType.__index = LogConfigType
LogConfigType.className = "LogConfigType"
LogConfigType.javaClassName = "org.allbinary.logic.communication.log.config.type.LogConfigType"

function LogConfigType:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.description == nil then self.description = nil end
end


function LogConfigType._jinit(self, name, description)
    LogConfigType._init_fields(self)
        self.name_f = name
        self.description = description
    return self
end

function LogConfigType.new(...)
    local self = setmetatable({}, LogConfigType)
    LogConfigType._jinit(self, ...)
    return self
end


function LogConfigType:getName()
        return self.name_f
end


function LogConfigType:getDescription()
        return self.description
end


function LogConfigType:setName(value)
        self.name_f = value
end


function LogConfigType:setDescription(value)
        self.description = value
end

return LogConfigType

