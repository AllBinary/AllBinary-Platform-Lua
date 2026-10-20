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

local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystems = require("org.allbinary.logic.system.os.OperatingSystems")
local LinuxHardware = require("org.allbinary.logic.system.hardware.linux.LinuxHardware")
local WindowsHardware = require("org.allbinary.logic.system.hardware.windows.WindowsHardware")

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


function HardwareFactory.getInstance()
        return HardwareFactory.instance
end


function HardwareFactory.new()
    local self = setmetatable({}, HardwareFactory)
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function HardwareFactory.getInstance(os)
        local try_ok, try_error = pcall(function()
            local operatingSystems = OperatingSystems.getInstance()
            if os:getName():compareTo(operatingSystems.LINUX) == 0 then
                return LinuxHardware.new()
            elseif os:getName():indexOf(operatingSystems.WINDOWS) >= 0 then
                return WindowsHardware.new()
            end
            error(java_exception("Exception", "No Hardware Imp for: " .. os:getName()), 0)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end

HardwareFactory.instance = HardwareFactory.new()

return HardwareFactory

