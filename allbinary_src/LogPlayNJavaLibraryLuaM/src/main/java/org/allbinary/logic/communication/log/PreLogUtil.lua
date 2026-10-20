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

local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local PlayN = require("playn.core.PlayN")

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
local PreLogUtil = {}
PreLogUtil.__index = PreLogUtil
PreLogUtil.className = "PreLogUtil"


function PreLogUtil.new()
    local self = setmetatable({}, PreLogUtil)
    return self
end


function PreLogUtil.put(specialMessage, anyType, functionName)
        local className = PreLogUtil.getClassName(anyType)
        if className == nil then
            className = CommonStrings.getInstance().EMPTY
        end
        className = tostring(StringMaker.new():append(className):append(CommonSeps.getInstance().FORWARD_SLASH):append(StringUtil.getInstance():toString(anyType)))
        local message = LogFormatUtil.getInstance():getS(className, functionName, specialMessage)
        PlayN.log():debug(tostring(PreLogUtil.LOG_SUCCESS) .. message)
end


function PreLogUtil.putOE(specialMessage, anyType, functionName, exception)
        local className = PreLogUtil.getClassName(anyType)
        if className == nil then
            className = CommonStrings.getInstance().EMPTY
        end
        className = tostring(StringMaker.new():append(className):append(CommonSeps.getInstance().FORWARD_SLASH):append(StringUtil.getInstance():toString(anyType)))
        local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
        PlayN.log():error(tostring(PreLogUtil.LOG_SUCCESS) .. message, exception)
end


function PreLogUtil.putS(specialMessage, className, functionName)
        local message = LogFormatUtil.getInstance():getS(className, functionName, specialMessage)
        PlayN.log():debug(tostring(PreLogUtil.LOG_SUCCESS) .. message)
end


function PreLogUtil.putSE(specialMessage, className, functionName, exception)
        local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
        PlayN.log():error(tostring(PreLogUtil.LOG_SUCCESS) .. message, exception)
end


function PreLogUtil.getClassName(anyType)
    error("abstract method getClassName")
end

PreLogUtil.LOG_SUCCESS = "org.allbinary: "

return PreLogUtil

