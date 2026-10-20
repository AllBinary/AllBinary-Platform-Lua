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
-- package org.allbinary.logic.system.os.windows

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local NoOperatingSystem = require("org.allbinary.logic.system.os.NoOperatingSystem")
local OperatingSystems = require("org.allbinary.logic.system.os.OperatingSystems")
local SystemProperties = require("org.allbinary.logic.system.os.SystemProperties")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local WindowsOperatingSystemFactory = {}
WindowsOperatingSystemFactory.__index = WindowsOperatingSystemFactory
WindowsOperatingSystemFactory.className = "WindowsOperatingSystemFactory"

function WindowsOperatingSystemFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function WindowsOperatingSystemFactory.getInstance()
        return WindowsOperatingSystemFactory.instance
end


function WindowsOperatingSystemFactory.new()
    local self = setmetatable({}, WindowsOperatingSystemFactory)
    self:_init_fields()
    return self
end


function WindowsOperatingSystemFactory:getOperatingSystemInstance()
        local try_ok, try_error = pcall(function()
            local operatingSystems = OperatingSystems.getInstance()
            local osName = SystemProperties.getInstance():getName()
            local operatingSystemInterface = nil
            if ((osName < operatingSystems.WINDOWS_NT and -1) or (osName > operatingSystems.WINDOWS_NT and 1) or 0) == 0 then
                operatingSystemInterface = WindowsOS.new()
            elseif ((osName < operatingSystems.WINDOWS_10 and -1) or (osName > operatingSystems.WINDOWS_10 and 1) or 0) == 0 then
                operatingSystemInterface = WindowsOS.new()
            elseif ((osName < operatingSystems.WINDOWS_11 and -1) or (osName > operatingSystems.WINDOWS_11 and 1) or 0) == 0 then
                operatingSystemInterface = WindowsOS.new()
            elseif ((osName < operatingSystems.WINDOWS2000 and -1) or (osName > operatingSystems.WINDOWS2000 and 1) or 0) == 0 then
                operatingSystemInterface = WindowsOS.new()
            elseif ((osName < operatingSystems.WINDOWS_XP and -1) or (osName > operatingSystems.WINDOWS_XP and 1) or 0) == 0 then
                operatingSystemInterface = WindowsOS.new()
            elseif ((osName < operatingSystems.WINDOWS_VISTA and -1) or (osName > operatingSystems.WINDOWS_VISTA and 1) or 0) == 0 then
                operatingSystemInterface = WindowsOS.new()
            else
                if operatingSystems:isUnknownSpecificOSAllowed() then
                    operatingSystemInterface = WindowsOS.new()
                else
                    error(java_exception("Exception", "Specific Windows OS Not Supported: " .. osName), 0)
                end
            end
            return operatingSystemInterface
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().FACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            return NoOperatingSystem.NO_OPERATING_SYSTEM
        end
end

WindowsOperatingSystemFactory.instance = WindowsOperatingSystemFactory.new()

return WindowsOperatingSystemFactory

