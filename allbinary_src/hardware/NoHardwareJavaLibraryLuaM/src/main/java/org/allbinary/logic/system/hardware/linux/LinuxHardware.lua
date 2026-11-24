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
-- package org.allbinary.logic.system.hardware.linux

local LinuxHardware = {}
package.loaded["org.allbinary.logic.system.hardware.linux.LinuxHardware"] = LinuxHardware

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

local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local HardwareInterface = java_lazy("org.allbinary.logic.system.hardware.HardwareInterface")
local BridgeInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.BridgeInterface")
local CpuInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.CpuInterface")
local EthernetInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.EthernetInterface")
local FireWireInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.FireWireInterface")
local HardDriveControllerInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.HardDriveControllerInterface")
local HardDriveInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.HardDriveInterface")
local HardwareComponentInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local MachineAccessControlAddressInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.MachineAccessControlAddressInterface")
local MediaInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.MediaInterface")
local MonitorInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.MonitorInterface")
local UsbInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.UsbInterface")
local VideoInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.VideoInterface")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table LinuxHardware is declared before the requires
LinuxHardware.__index = LinuxHardware
LinuxHardware.className = "LinuxHardware"
LinuxHardware.javaClassName = "org.allbinary.logic.system.hardware.linux.LinuxHardware"
LinuxHardware.java_implements = " HardwareInterface "
LinuxHardware.java_interfaces = function() return {HardwareInterface} end


function LinuxHardware._jinit(self)
    return self
end

function LinuxHardware.new(...)
    local self = setmetatable({}, LinuxHardware)
    LinuxHardware._jinit(self, ...)
    return self
end


function LinuxHardware:getMultimedia(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getBridge(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getCpu(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getEthernet(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getFireWire(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getHardDriveController(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getHardDrive(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getMachineAccessControlAddress(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getMonitor(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getUsb(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getVideo(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:getComponent(index)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LinuxHardware:toString()
        return StringUtil.getInstance().EMPTY_STRING
end
LinuxHardware.__tostring = function(self) return self:toString() end


function LinuxHardware:compareTo(hardwareInterface)
        return true
end


function LinuxHardware:difference(hardwareInterface)
        return StdUtil.getInstance().NULL_TABLE
end


function LinuxHardware:isNextHardware(nextLine)
        return false
end

return LinuxHardware

