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

local LogUtil = {}
package.loaded["org.allbinary.logic.communication.log.LogUtil"] = LogUtil

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

-- local Level = require("java.util.logging.Level")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
-- local Logger = require("java.util.logging.Logger")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Log = java_lazy("org.allbinary.logic.communication.log.Log")
local LogFormatUtil = java_lazy("org.allbinary.logic.communication.log.LogFormatUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")

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
-- class table LogUtil is declared before the requires
LogUtil.__index = LogUtil
LogUtil.className = "LogUtil"
LogUtil.javaClassName = "org.allbinary.logic.communication.log.LogUtil"

function LogUtil:_init_fields()
    self.logger = Logger.getLogger(LogUtil:getName())
    self.logFormatUtil = LogFormatUtil.getInstance()
end


function LogUtil.getInstance()
        return LogUtil.instance_f
end


function LogUtil._jinit(self)
    LogUtil._init_fields(self)
    return self
end

function LogUtil.new(...)
    local self = setmetatable({}, LogUtil)
    LogUtil._jinit(self, ...)
    return self
end


function LogUtil:init()
        PreLogUtil.put("Loggin Initialized", self, "init()")
end


function LogUtil:putL(log)
        local exception = log:getThrowable()
        local try_ok, try_error, try_value = pcall(function()
            if exception ~= nil then
                local specialMessage = log:getSpecialMessage()
                local anyType = log:getObject()
                local functionName = log:getFunctionName()
                local className = CommonStrings.getInstance().EMPTY
                local clazz = getmetatable(anyType)
                if (clazz.javaClassName or clazz.className) ~= nil then
                    className = (clazz.javaClassName or clazz.className)
                end
                local message = self.logFormatUtil:get(className, functionName, specialMessage, exception)
                self.logger:log(Level.INFO, message)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
        end
end


function LogUtil:put(specialMessage, anyType, functionName, exception)
        local try_ok, try_error, try_value = pcall(function()
            local className = CommonStrings.getInstance().EMPTY
            local clazz = getmetatable(anyType)
            if (clazz.javaClassName or clazz.className) ~= nil then
                className = (clazz.javaClassName or clazz.className)
            end
            local message = self.logFormatUtil:getS(className, functionName, specialMessage)
            if exception ~= nil then
                self.logger:log(Level.SEVERE, message, exception)
            else
                self.logger:log(Level.INFO, message)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
        end
end

LogUtil.instance_f = LogUtil.new()

return LogUtil

