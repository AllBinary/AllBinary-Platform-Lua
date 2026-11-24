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

local Log = {}
package.loaded["org.allbinary.logic.communication.log.Log"] = Log

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

local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogFormatUtil = java_lazy("org.allbinary.logic.communication.log.LogFormatUtil")

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

-- class table Log is declared before the requires
Log.__index = Log
Log.className = "Log"
Log.javaClassName = "org.allbinary.logic.communication.log.Log"

function Log:_init_fields()
    self.logFormatUtil = LogFormatUtil.getInstance()
    if self.specialMessage == nil then self.specialMessage = nil end
    if self.anyType == nil then self.anyType = nil end
    if self.functionName == nil then self.functionName = nil end
    if self.exception == nil then self.exception = nil end
end


function Log._jinit(self, specialMessage, anyType, functionName, exception)
    Log._init_fields(self)
        self.specialMessage = specialMessage
        self.anyType = anyType
        self.functionName = functionName
        self.exception = exception
    return self
end

function Log.new(...)
    local self = setmetatable({}, Log)
    Log._jinit(self, ...)
    return self
end


function Log:getSpecialMessage()
        return self.specialMessage
end


function Log:getObject()
        return self.anyType
end


function Log:getFunctionName()
        return self.functionName
end


function Log:getThrowable()
        return self.exception
end


function Log:toString()
        local className = CommonStrings.getInstance().EMPTY
        local clazz = getmetatable(self.anyType)
        if (clazz.javaClassName or clazz.className) ~= nil then
            className = (clazz.javaClassName or clazz.className)
        end
        return self.logFormatUtil:get(className, self.functionName, self.specialMessage, self.exception)
end
Log.__tostring = function(self) return self:toString() end

return Log

