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
-- package org.allbinary.logic.system.hardware

local TsUtil = require("org.allbinary.TsUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AndroidHardware = require("org.allbinary.logic.system.hardware.android.AndroidHardware")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystems = require("org.allbinary.logic.system.os.OperatingSystems")
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

local HardwareFactory = {}
HardwareFactory.__index = HardwareFactory
HardwareFactory.className = "HardwareFactory"

function HardwareFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
end


function HardwareFactory.getInstance()
        return HardwareFactory.instance
end


function HardwareFactory.new()
    local self = setmetatable({}, HardwareFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function HardwareFactory:getInstance(os)
        local try_ok, try_error = pcall(function()
            local operatingSystems = OperatingSystems.getInstance()
            if self.tsUtil:compareTo(os:getName(), operatingSystems.ANDROID) == 0 then
                return AndroidHardware.new()
            elseif self.tsUtil:compareTo(os:getName(), operatingSystems.HARMONY) == 0 then
                return AndroidHardware.new()
            end
            error(java_exception("Exception", "No Hardware Imp for: " .. os:getName()), 0)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put("Ignoring Exception Returning NoHardware", self, commonStrings.GET_INSTANCE, e)
            return NoHardware.new()
        end
end

HardwareFactory.instance = HardwareFactory.new()

return HardwareFactory

