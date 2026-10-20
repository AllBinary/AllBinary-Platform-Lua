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
local CommonStrings = require("org.allbinary.string.CommonStrings")

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
        PreLogUtil.putOE(specialMessage, anyType, functionName, NullUtil.getInstance().NULL_OBJECT)
end


function PreLogUtil.putOE(specialMessage, anyType, functionName, exception)
        local className = CommonStrings.getInstance().EMPTY
        if getmetatable(anyType).className ~= nil then
            className = tostring(getmetatable(anyType).className)
        end
        local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
        io.write(tostring(PreLogUtil.LOG_SUCCESS))
        print(message)
end


function PreLogUtil.putS(specialMessage, className, functionName)
        PreLogUtil.putSE(specialMessage, className, functionName, NullUtil.getInstance().NULL_OBJECT)
end


function PreLogUtil.putSE(specialMessage, className, functionName, exception)
        local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
        io.write(tostring(PreLogUtil.LOG_SUCCESS))
        print(message)
end

PreLogUtil.LOG_SUCCESS = "org.allbinary: "

return PreLogUtil

