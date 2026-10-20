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

-- local Level = require("java.util.logging.Level")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
-- local Logger = require("java.util.logging.Logger")
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
local LogUtil = {}
LogUtil.__index = LogUtil
LogUtil.className = "LogUtil"

function LogUtil:_init_fields()
    self.logger = Logger.getLogger(LogUtil:getName())
    self.logFormatUtil = LogFormatUtil.getInstance()
end


function LogUtil.getInstance()
        return LogUtil.instance
end


function LogUtil.new()
    local self = setmetatable({}, LogUtil)
    self:_init_fields()
    return self
end


function LogUtil:init()
        PreLogUtil.put("Loggin Initialized", self, "init()")
end


function LogUtil:putL(log)
        local exception = log:getThrowable()
        local try_ok, try_error = pcall(function()
            if exception ~= nil then
                local specialMessage = log:getSpecialMessage()
                local anyType = log:getObject()
                local functionName = log:getFunctionName()
                local className = CommonStrings.getInstance().EMPTY
                local clazz = getmetatable(anyType)
                if clazz:getName() ~= nil then
                    className = clazz:getName()
                end
                local message = self.logFormatUtil:get(className, functionName, specialMessage, exception)
                self.logger:log(Level.INFO, message)
            end
        end)
        if not try_ok then
            local e = try_error
        end
end


function LogUtil:put(specialMessage, anyType, functionName, exception)
        local try_ok, try_error = pcall(function()
            local className = CommonStrings.getInstance().EMPTY
            local clazz = getmetatable(anyType)
            if clazz:getName() ~= nil then
                className = clazz:getName()
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
        end
end

LogUtil.instance = LogUtil.new()

return LogUtil

