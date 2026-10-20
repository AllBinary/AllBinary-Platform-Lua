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

-- local FileReader = require("java.io.FileReader")
-- local LineNumberReader = require("java.io.LineNumberReader")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FilePathData = require("org.allbinary.logic.io.file.FilePathData")
local SubDirectory = require("org.allbinary.logic.io.file.directory.SubDirectory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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
local Cpu = require("org.allbinary.logic.system.hardware.components.linux.Cpu")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

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

local LinuxHardware = {}
LinuxHardware.__index = LinuxHardware
LinuxHardware.className = "LinuxHardware"

function LinuxHardware:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
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
    self.NAME = "Linux Hardware Profile"
    self.MINHARDWARE = 5
end

function LinuxHardware.new(...)
    local count = select("#", ...)
    if count == 1 then return LinuxHardware._new1(...)
    elseif count == 0 then return LinuxHardware._new0(...)
    end
end


function LinuxHardware._new1(path)
    local self = setmetatable({}, LinuxHardware)
    self:_init_fields()
        self:init(path)
    return self
end


function LinuxHardware._new0()
    local self = setmetatable({}, LinuxHardware)
    self:_init_fields()
        self:init(LinuxHardware.PCIFILE)
        if self.componentInterfaceVector:size() < self.MINHARDWARE then
            error(java_exception("Exception", "Not Enough Data For A Valid License On Linux"), 0)
        end
        local cpu = Cpu.new()
        if cpu ~= nil then
            self.cpuInterfaceVector:add(cpu)
            self.componentInterfaceVector:add(cpu)
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
            self.logUtil:putF("Hardware Data: " .. tostring(self), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


-- throws Exception
function LinuxHardware:init(filePath)
        local lineNumberReader = nil
        local try_ok, try_error = pcall(function()
            self:init(lineNumberReader, filePath)
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
                self.logUtil:put("Hardware Data: " .. tostring(self), self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function LinuxHardware:init(lineNumberReader, filePath)
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
            local pciFile = FileReader.new(filePath)
            lineNumberReader = LineNumberReader.new(pciFile)
            if lineNumberReader == nil then
                local fileVector = SubDirectory.getInstance():search(filePath, AbFile.createAbFile(FilePathData.getInstance().PATH_START))
                if not fileVector:isEmpty() then
                    local file = fileVector:get(0)
                    lineNumberReader = LineNumberReader.new(FileReader.new(file:getPath()))
                end
                if lineNumberReader == nil then
                    error(java_exception("Exception", "No Linux File Data"), 0)
                end
            end
            if lineNumberReader ~= nil then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
                    self.logUtil:putF("PCI File Found", self, self.commonStrings.CONSTRUCTOR)
                end
                local nextLine = lineNumberReader:readLine()
                while lineNumberReader ~= nil and nextLine ~= nil do
                    if self:isNextHardware(nextLine) then
                        break
                    end
                    nextLine = lineNumberReader:readLine()
                end
                while self:isNextHardware(nextLine) do
                    local componentData = StringMaker.new()
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
                        self.logUtil:putF("Found Hardware Device: " .. tostring(self.componentInterfaceVector:size()), self, self.commonStrings.CONSTRUCTOR)
                    end
                    componentData:append(nextLine)
                    componentData:append(CommonSeps.getInstance().NEW_LINE)
                    nextLine = lineNumberReader:readLine()
                    local componentType = PCComponentFactory.getInstance():getComponentType(nextLine)
                    while lineNumberReader ~= nil do
                        componentData:append(nextLine)
                        componentData:append(CommonSeps.getInstance().NEW_LINE)
                        nextLine = lineNumberReader:readLine()
                        if nextLine == nil or self:isNextHardware(nextLine) then
                            break
                        end
                    end
                    local componentInterface = PCComponentFactory.getInstance():getInstance(componentType, tostring(componentData))
                    if componentInterface ~= nil then
                        self.componentInterfaceVector:add(componentInterface)
                    end
                end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
                    self.logUtil:putF("Could not load PCI File", self, self.commonStrings.CONSTRUCTOR)
                end
            end
            lineNumberReader:close()
        end)
        do -- finally
            if lineNumberReader ~= nil then
                lineNumberReader:close()
            end
        end
        if not try_ok then error(try_error, 0) end
end


function LinuxHardware:getMultimedia(index)
        return self.multimediaInterfaceVector:get(index)
end


function LinuxHardware:getBridge(index)
        return self.bridgeInterfaceVector:get(index)
end


function LinuxHardware:getCpu(index)
        return self.cpuInterfaceVector:get(index)
end


function LinuxHardware:getEthernet(index)
        return self.ethernetInterfaceVector:get(index)
end


function LinuxHardware:getFireWire(index)
        return self.fireWireInterfaceVector:get(index)
end


function LinuxHardware:getHardDriveController(index)
        return self.hardDriveControllerInterfaceVector:get(index)
end


function LinuxHardware:getHardDrive(index)
        return self.hardDriveInterfaceVector:get(index)
end


function LinuxHardware:getMachineAccessControlAddress(index)
        return self.macInterfaceVector:get(index)
end


function LinuxHardware:getMonitor(index)
        return self.monitorInterfaceVector:get(index)
end


function LinuxHardware:getUsb(index)
        return self.usbInterfaceVector:get(index)
end


function LinuxHardware:getVideo(index)
        return self.videoInterfaceVector:get(index)
end


function LinuxHardware:getComponent(index)
        return self.componentInterfaceVector:get(index)
end


function LinuxHardware:toString()
        local hardwareBuffer = StringMaker.new()
        local size = self.componentInterfaceVector:size()
        for index = 0, size - 1 do
            local componentInterface = self.componentInterfaceVector:get(index)
            hardwareBuffer:append("Component ")
            hardwareBuffer:appendint(index)
            hardwareBuffer:append(": \n")
            hardwareBuffer:append(tostring(componentInterface))
            hardwareBuffer:append(CommonSeps.getInstance().NEW_LINE)
        end
        return tostring(hardwareBuffer)
end
LinuxHardware.__tostring = function(self) return self:toString() end


function LinuxHardware:compareTo(hardwareInterface)
        return true
end


function LinuxHardware:difference(hardwareInterface)
        return StdUtil.getInstance().NULL_TABLE
end


function LinuxHardware:isNextHardware(nextLine)
        if nextLine ~= nil then
            local index = ((string.find(nextLine, "Bus", 1, true) or 0) - 1)
            if index >= 0 and index < 4 then
                return true
            end
        end
        return false
end

LinuxHardware.PCIFILE = "/proc/pci"

return LinuxHardware

