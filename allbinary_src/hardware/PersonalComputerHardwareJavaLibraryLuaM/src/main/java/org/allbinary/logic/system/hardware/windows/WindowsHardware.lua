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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local HardwareInterface = require("org.allbinary.logic.system.hardware.HardwareInterface")
local ComponentFactory = require("org.allbinary.logic.system.hardware.components.ComponentFactory")
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
local CommonSeps = require("org.allbinary.string.CommonSeps")
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

function WindowsHardware:_init_fields()
    self.componentInterfaceVector = nil
    self.videoInterfaceVector = nil
    self.hardDriveControllerInterfaceVector = nil
    self.cpuInterfaceVector = nil
    self.usbInterfaceVector = nil
    self.ethernetInterfaceVector = nil
    self.multimediaInterfaceVector = nil
    self.fireWireInterfaceVector = nil
    self.bridgeInterfaceVector = nil
    self.hardDriveInterfaceVector = nil
    self.macInterfaceVector = nil
    self.monitorInterfaceVector = nil
    self.NAME = "Windows Hardware Profile"
    self.MINHARDWARE = 0
    self.componentFactory = ComponentFactory.getInstance()
end


function WindowsHardware.new()
    local self = setmetatable({}, WindowsHardware)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self.componentInterfaceVector = BasicArrayListD.new()
            self.videoInterfaceVector = BasicArrayListD.new()
            self.hardDriveControllerInterfaceVector = BasicArrayListD.new()
            self.cpuInterfaceVector = BasicArrayListD.new()
            self.usbInterfaceVector = BasicArrayListD.new()
            self.ethernetInterfaceVector = BasicArrayListD.new()
            self.multimediaInterfaceVector = BasicArrayListD.new()
            self.fireWireInterfaceVector = BasicArrayListD.new()
            self.bridgeInterfaceVector = BasicArrayListD.new()
            self.hardDriveInterfaceVector = BasicArrayListD.new()
            self.macInterfaceVector = BasicArrayListD.new()
            self.monitorInterfaceVector = BasicArrayListD.new()
            if self.componentInterfaceVector:size() < self.MINHARDWARE then
                error(java_exception("Exception", "Not Enough Data For A Valid License On Windows"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
    return self
end


function WindowsHardware:getComponentType(component)
        if ((string.find(component, tostring(self.componentFactory.ETHERNET), 1, true) or 0) - 1) >= 0 then
            return tostring(self.componentFactory.ETHERNET)
        elseif ((string.find(component, tostring(self.componentFactory.BRIDGE), 1, true) or 0) - 1) >= 0 then
            return tostring(self.componentFactory.BRIDGE)
        elseif ((string.find(component, tostring(self.componentFactory.IDE), 1, true) or 0) - 1) >= 0 then
            return tostring(self.componentFactory.IDE)
        elseif ((string.find(component, tostring(self.componentFactory.MULTIMEDIA), 1, true) or 0) - 1) >= 0 then
            return tostring(self.componentFactory.MULTIMEDIA)
        elseif ((string.find(component, tostring(self.componentFactory.SCSI), 1, true) or 0) - 1) >= 0 then
            return tostring(self.componentFactory.SCSI)
        elseif ((string.find(component, tostring(self.componentFactory.USB), 1, true) or 0) - 1) >= 0 then
            return tostring(self.componentFactory.USB)
        elseif ((string.find(component, tostring(self.componentFactory.VGA), 1, true) or 0) - 1) >= 0 then
            return tostring(self.componentFactory.VGA)
        else
            return nil
        end
end


function WindowsHardware:getMultimedia(index)
        return self.multimediaInterfaceVector:get(index)
end


function WindowsHardware:getBridge(index)
        return self.bridgeInterfaceVector:get(index)
end


function WindowsHardware:getCpu(index)
        return self.cpuInterfaceVector:get(index)
end


function WindowsHardware:getEthernet(index)
        return self.ethernetInterfaceVector:get(index)
end


function WindowsHardware:getFireWire(index)
        return self.fireWireInterfaceVector:get(index)
end


function WindowsHardware:getHardDriveController(index)
        return self.hardDriveControllerInterfaceVector:get(index)
end


function WindowsHardware:getHardDrive(index)
        return self.hardDriveInterfaceVector:get(index)
end


function WindowsHardware:getMachineAccessControlAddress(index)
        return self.macInterfaceVector:get(index)
end


function WindowsHardware:getMonitor(index)
        return self.monitorInterfaceVector:get(index)
end


function WindowsHardware:getUsb(index)
        return self.usbInterfaceVector:get(index)
end


function WindowsHardware:getVideo(index)
        return self.videoInterfaceVector:get(index)
end


function WindowsHardware:getComponent(index)
        return self.componentInterfaceVector:get(index)
end


function WindowsHardware:toString()
        local hardwareBuffer = StringMaker.new()
        local size = self.componentInterfaceVector:size()
        for index = 0, size - 1 do
            local componentInterface = self.componentInterfaceVector:get(index)
            hardwareBuffer:append(tostring(componentInterface))
            hardwareBuffer:append(CommonSeps.getInstance().NEW_LINE)
        end
        return tostring(hardwareBuffer)
end
WindowsHardware.__tostring = function(self) return self:toString() end


function WindowsHardware:compareTo(hardwareInterface)
        return true
end


function WindowsHardware:difference(hardwareInterface)
        return StdUtil.getInstance().NULL_TABLE
end

return WindowsHardware

