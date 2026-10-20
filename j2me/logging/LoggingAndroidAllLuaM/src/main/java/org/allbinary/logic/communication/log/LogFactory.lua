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

local NullUtil = require("org.allbinary.logic.NullUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--ActualPlatform
local LogFactory = {}
LogFactory.__index = LogFactory
LogFactory.className = "LogFactory"

function LogFactory.new()
    local self = setmetatable({}, LogFactory)
    return self
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
        return Log.new(specialMessage, anyType, functionName, NullUtil.getInstance().NULL_OBJECT)
end

return LogFactory

