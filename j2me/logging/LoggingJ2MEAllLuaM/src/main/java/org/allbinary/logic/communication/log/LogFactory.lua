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
-- package org.allbinary.logic.communication.log

local LogFactory = {}
package.loaded["org.allbinary.logic.communication.log.LogFactory"] = LogFactory

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Log = java_lazy("org.allbinary.logic.communication.log.Log")

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

--ActualPlatform
-- class table LogFactory is declared before the requires
LogFactory.__index = LogFactory
LogFactory.className = "LogFactory"
LogFactory.javaClassName = "org.allbinary.logic.communication.log.LogFactory"

function LogFactory._jinit(self)
    return self
end

function LogFactory.new()
    return LogFactory._jinit(setmetatable({}, LogFactory))
end


function LogFactory.getInstanceD()
        local stringUtil = StringUtil.getInstance()
        local nullUtil = NullUtil.getInstance()
        return Log.new(stringUtil.EMPTY_STRING, nullUtil.NULL_OBJECT, stringUtil.EMPTY_STRING, nullUtil.NULL_OBJECT)
end


function LogFactory.getInstanceNoF(specialMessage, anyType, exception)
        return Log.new(specialMessage, anyType, StringUtil.getInstance().EMPTY_STRING, exception)
end


function LogFactory.getInstance(specialMessage, anyType, functionName, exception)
        return Log.new(specialMessage, anyType, functionName, exception)
end


function LogFactory.getInstanceF(specialMessage, anyType, functionName)
        local nullUtil = NullUtil.getInstance()
        return Log.new(specialMessage, anyType, functionName, nullUtil.NULL_OBJECT)
end

return LogFactory

