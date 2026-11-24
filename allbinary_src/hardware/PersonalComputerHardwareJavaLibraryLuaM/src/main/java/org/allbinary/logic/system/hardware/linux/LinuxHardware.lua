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

-- local FileReader = require("java.io.FileReader")
-- local LineNumberReader = require("java.io.LineNumberReader")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local FilePathData = java_lazy("org.allbinary.logic.io.file.FilePathData")
local SubDirectory = java_lazy("org.allbinary.logic.io.file.directory.SubDirectory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
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
local Cpu = java_lazy("org.allbinary.logic.system.hardware.components.linux.Cpu")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local PCComponentFactory = java_lazy("org.allbinary.logic.system.hardware.linux.PCComponentFactory")

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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

function LinuxHardware:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
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
    self.NAME = "Linux Hardware Profile"
    self.MINHARDWARE = 5
end

function LinuxHardware._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return LinuxHardware._new1(self, ...)
    elseif count == 0 then return LinuxHardware._new0(self, ...)
    end
    error("No constructor of LinuxHardware takes " .. count .. " arguments")
end

function LinuxHardware.new(...)
    local self = setmetatable({}, LinuxHardware)
    LinuxHardware._jinit(self, ...)
    return self
end


function LinuxHardware._new1(self, path)
    LinuxHardware._init_fields(self)
        self:init(path)
    return self
end


function LinuxHardware._new0(self)
    LinuxHardware._init_fields(self)
        self:init(LinuxHardware.PCIFILE)
        if self.componentInterfaceVector:size() < self.MINHARDWARE then
            error(require("java.lang.Exception").new("Not Enough Data For A Valid License On Linux"), 0)
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
function LinuxHardware:init_j1(filePath)
        local lineNumberReader = nil
        local try_ok, try_error, try_value = pcall(function()
            self:init(lineNumberReader, filePath)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
                self.logUtil:put("Hardware Data: " .. tostring(self), self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
end


-- throws Exception
function LinuxHardware:init_j2(lineNumberReader, filePath)
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
            local pciFile = FileReader.new(filePath)
            lineNumberReader = LineNumberReader.new(pciFile)
            if lineNumberReader == nil then
                local fileVector = SubDirectory.getInstance():search(filePath, AbFile.createAbFile(FilePathData.getInstance().PATH_START))
                if not fileVector:isEmpty() then
                    local file = fileVector:get(0)
                    lineNumberReader = LineNumberReader.new(FileReader.new(file:getPath()))
                end
                if lineNumberReader == nil then
                    error(require("java.lang.Exception").new("No Linux File Data"), 0)
                end
            end
            if lineNumberReader ~= nil then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OS) then
                    self.logUtil:putF("PCI File Found", self, self.commonStrings.CONSTRUCTOR)
                end
                local nextLine = lineNumberReader:readLine()
                while nextLine ~= nil do
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
                    while true do
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
function LinuxHardware:init(...)
    local count = select("#", ...)
    if count == 1 then return self:init_j1(...) end
    if count == 2 then return self:init_j2(...) end
    error("No method init takes " .. count .. " arguments")
end
LinuxHardware.init__jdispatcher = LinuxHardware.init


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

