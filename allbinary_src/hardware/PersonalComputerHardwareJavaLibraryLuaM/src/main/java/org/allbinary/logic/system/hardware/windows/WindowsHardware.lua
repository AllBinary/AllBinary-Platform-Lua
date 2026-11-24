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

local WindowsHardware = {}
package.loaded["org.allbinary.logic.system.hardware.windows.WindowsHardware"] = WindowsHardware

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local HardwareInterface = java_lazy("org.allbinary.logic.system.hardware.HardwareInterface")
local ComponentFactory = java_lazy("org.allbinary.logic.system.hardware.components.ComponentFactory")
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
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
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

-- class table WindowsHardware is declared before the requires
WindowsHardware.__index = WindowsHardware
WindowsHardware.className = "WindowsHardware"
WindowsHardware.javaClassName = "org.allbinary.logic.system.hardware.windows.WindowsHardware"
WindowsHardware.java_implements = " HardwareInterface "
WindowsHardware.java_interfaces = function() return {HardwareInterface} end

function WindowsHardware:_init_fields()
    if self.componentInterfaceVector == nil then self.componentInterfaceVector = nil end
    if self.videoInterfaceVector == nil then self.videoInterfaceVector = nil end
    if self.hardDriveControllerInterfaceVector == nil then self.hardDriveControllerInterfaceVector = nil end
    if self.cpuInterfaceVector == nil then self.cpuInterfaceVector = nil end
    if self.usbInterfaceVector == nil then self.usbInterfaceVector = nil end
    if self.ethernetInterfaceVector == nil then self.ethernetInterfaceVector = nil end
    if self.multimediaInterfaceVector == nil then self.multimediaInterfaceVector = nil end
    if self.fireWireInterfaceVector == nil then self.fireWireInterfaceVector = nil end
    if self.bridgeInterfaceVector == nil then self.bridgeInterfaceVector = nil end
    if self.hardDriveInterfaceVector == nil then self.hardDriveInterfaceVector = nil end
    if self.macInterfaceVector == nil then self.macInterfaceVector = nil end
    if self.monitorInterfaceVector == nil then self.monitorInterfaceVector = nil end
    self.NAME = "Windows Hardware Profile"
    self.MINHARDWARE = 0
    self.componentFactory = ComponentFactory.getInstance()
end


function WindowsHardware._jinit(self)
    WindowsHardware._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
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
                error(require("java.lang.Exception").new("Not Enough Data For A Valid License On Windows"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
    return self
end

function WindowsHardware.new(...)
    local self = setmetatable({}, WindowsHardware)
    WindowsHardware._jinit(self, ...)
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

