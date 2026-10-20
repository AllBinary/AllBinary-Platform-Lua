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

local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogFormatUtil = require("org.allbinary.logic.communication.log.LogFormatUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Log = {}
Log.__index = Log
Log.className = "Log"

function Log:_init_fields()
    self.logFormatUtil = LogFormatUtil.getInstance()
    self.specialMessage = nil
    self.anyType = nil
    self.functionName = nil
    self.exception = nil
end


function Log.new(specialMessage, anyType, functionName, exception)
    local self = setmetatable({}, Log)
    self:_init_fields()
        self.specialMessage = specialMessage
        self.anyType = anyType
        self.functionName = functionName
        self.exception = exception
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
        if clazz:getName() ~= nil then
            className = clazz:getName()
        end
        return self.logFormatUtil:get(className, self.functionName, self.specialMessage, self.exception)
end
Log.__tostring = function(self) return self:toString() end

return Log

