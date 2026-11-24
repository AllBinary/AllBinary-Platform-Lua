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

local PreLogUtil = {}
package.loaded["org.allbinary.logic.communication.log.PreLogUtil"] = PreLogUtil

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local PlayN = java_lazy("playn.core.PlayN")
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

--ActualPlatform
-- class table PreLogUtil is declared before the requires
PreLogUtil.__index = PreLogUtil
PreLogUtil.className = "PreLogUtil"
PreLogUtil.javaClassName = "org.allbinary.logic.communication.log.PreLogUtil"


function PreLogUtil._jinit(self)
    return self
end

function PreLogUtil.new(...)
    local self = setmetatable({}, PreLogUtil)
    PreLogUtil._jinit(self, ...)
    return self
end


function PreLogUtil.put(specialMessage, anyType, functionName)
        local className = PreLogUtil.getClassName(anyType)
        if className == nil then
            className = CommonStrings.getInstance().EMPTY
        end
        className = tostring(StringMaker.new():append(className):append(CommonSeps.getInstance().FORWARD_SLASH):append(StringUtil.getInstance():toString(anyType)))
        local message = LogFormatUtil.getInstance():getS(className, functionName, specialMessage)
        PlayN.getInstance():log():debug(tostring(PreLogUtil.LOG_SUCCESS) .. message)
end


function PreLogUtil.putOE(specialMessage, anyType, functionName, exception)
        local className = PreLogUtil.getClassName(anyType)
        if className == nil then
            className = CommonStrings.getInstance().EMPTY
        end
        className = tostring(StringMaker.new():append(className):append(CommonSeps.getInstance().FORWARD_SLASH):append(StringUtil.getInstance():toString(anyType)))
        local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
        PlayN.getInstance():log():error(tostring(PreLogUtil.LOG_SUCCESS) .. message, exception)
end


function PreLogUtil.putS(specialMessage, className, functionName)
        local message = LogFormatUtil.getInstance():getS(className, functionName, specialMessage)
        PlayN.getInstance():log():debug(tostring(PreLogUtil.LOG_SUCCESS) .. message)
end


function PreLogUtil.putSE(specialMessage, className, functionName, exception)
        local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
        PlayN.getInstance():log():error(tostring(PreLogUtil.LOG_SUCCESS) .. message, exception)
end


function PreLogUtil.getClassName(anyType)
    error(require("java.lang.UnsupportedOperationException").new("native method PreLogUtil.getClassName has a parameter or result type the Lua JNI runtime does not pass"))
end

PreLogUtil.LOG_SUCCESS = "org.allbinary: "

return PreLogUtil

