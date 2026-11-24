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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
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
        PreLogUtil.putOE(specialMessage, anyType, functionName, NullUtil.getInstance().NULL_OBJECT)
end


function PreLogUtil.putOE(specialMessage, anyType, functionName, exception)
        local className = PreLogUtil.LABEL
        local actualClassName = (getmetatable(anyType).javaClassName or getmetatable(anyType).className)
        if actualClassName ~= nil then
            className = actualClassName
        end
        local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
        android.util.Log:i(PreLogUtil.LABEL, message)
end


function PreLogUtil.putS(specialMessage, className, functionName)
        PreLogUtil.putSE(specialMessage, className, functionName, NullUtil.getInstance().NULL_OBJECT)
end


function PreLogUtil.putSE(specialMessage, className, functionName, exception)
        local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
        android.util.Log:i(className, message)
end

PreLogUtil.LABEL = "org.allbinary"

return PreLogUtil

