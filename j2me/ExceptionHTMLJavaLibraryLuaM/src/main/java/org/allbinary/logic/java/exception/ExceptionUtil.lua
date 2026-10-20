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
-- package org.allbinary.logic.java.exception

local JsType = require("jsinterop.annotations.JsType")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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
local ExceptionUtil = {}
ExceptionUtil.__index = ExceptionUtil
ExceptionUtil.className = "ExceptionUtil"

function ExceptionUtil:_init_fields()
    self.NONE = "No Stack Trace"
end


function ExceptionUtil.getInstance()
        return ExceptionUtil.instance
end


function ExceptionUtil.new()
    local self = setmetatable({}, ExceptionUtil)
    self:_init_fields()
    return self
end


function ExceptionUtil:getStackTrace(e)
        print(debug.traceback(tostring(e)))
        return self.NONE
end

ExceptionUtil.instance = ExceptionUtil.new()
ExceptionUtil.PRETEND_EXCEPTION = java_exception("Exception", "Not Really An Exception")

return ExceptionUtil

