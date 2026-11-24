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
-- package org.allbinary.time

local TimeStampUtil = {}
package.loaded["org.allbinary.time.TimeStampUtil"] = TimeStampUtil

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

local DateTimeFormat = java_lazy("com.google.gwt.i18n.client.DateTimeFormat")
local Date = java_lazy("java.util.Date")

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
-- class table TimeStampUtil is declared before the requires
TimeStampUtil.__index = TimeStampUtil
TimeStampUtil.className = "TimeStampUtil"
TimeStampUtil.javaClassName = "org.allbinary.time.TimeStampUtil"


function TimeStampUtil.getInstance()
        return TimeStampUtil.instance_f
end


function TimeStampUtil._jinit(self)
    return self
end

function TimeStampUtil.new(...)
    local self = setmetatable({}, TimeStampUtil)
    TimeStampUtil._jinit(self, ...)
    return self
end


function TimeStampUtil:getAsString()
        local simpleDataFormat = DateTimeFormat.getFormat("yyyy-MM-dd HH:mm:ss.SSS")
        local date = Date.new()
        return simpleDataFormat:format(date)
end

TimeStampUtil.instance_f = TimeStampUtil.new()

return TimeStampUtil

