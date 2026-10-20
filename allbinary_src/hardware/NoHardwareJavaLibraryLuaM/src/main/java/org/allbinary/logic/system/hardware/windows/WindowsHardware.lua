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
-- package org.allbinary.logic.system.hardware.windows

local StdUtil = require("org.allbinary.logic.StdUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local HardwareInterface = require("org.allbinary.logic.system.hardware.HardwareInterface")
local BridgeInterface = require("org.allbinary.logic.system.hardware.components.interfaces.BridgeInterface")
local CpuInterface = require("org.allbinary.logic.system.hardware.components.interfaces.CpuInterface")
local EthernetInterface = require("org.allbinary.logic.system.hardware.components.interfaces.EthernetInterface")
local FireWireInterface = require("org.allbinary.logic.system.hardware.components.interfaces.FireWireInterface")
local HardDriveControllerInterface = require("org.allbinary.logic.system.hardware.components.interfaces.HardDriveControllerInterface")
local HardDriveInterface = require("org.allbinary.logic.system.hardware.components.interfaces.HardDriveInterface")
local HardwareComponentInterface = require("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local MachineAccessControlAddressInterface = require("org.allbinary.logic.system.hardware.components.interfaces.MachineAccessControlAddressInterface")
local MediaInterface = require("org.allbinary.logic.system.hardware.components.interfaces.MediaInterface")
local MonitorInterface = require("org.allbinary.logic.system.hardware.components.interfaces.MonitorInterface")
local UsbInterface = require("org.allbinary.logic.system.hardware.components.interfaces.UsbInterface")
local VideoInterface = require("org.allbinary.logic.system.hardware.components.interfaces.VideoInterface")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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

local WindowsHardware = {}
WindowsHardware.__index = WindowsHardware
WindowsHardware.className = "WindowsHardware"


function WindowsHardware.new()
    local self = setmetatable({}, WindowsHardware)
    return self
end


function WindowsHardware:getMultimedia(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getBridge(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getCpu(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getEthernet(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getFireWire(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getHardDriveController(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getHardDrive(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getMachineAccessControlAddress(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getMonitor(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getUsb(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getVideo(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:getComponent(index)
        error(java_exception("RuntimeException"), 0)
end


function WindowsHardware:toString()
        return StringUtil.getInstance().EMPTY_STRING
end
WindowsHardware.__tostring = function(self) return self:toString() end


function WindowsHardware:compareTo(hardwareInterface)
        return true
end


function WindowsHardware:difference(hardwareInterface)
        return StdUtil.getInstance().NULL_TABLE
end

return WindowsHardware

