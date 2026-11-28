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

local PCComponentFactory = {}
package.loaded["org.allbinary.logic.system.hardware.linux.PCComponentFactory"] = PCComponentFactory

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ComponentFactory = java_lazy("org.allbinary.logic.system.hardware.components.ComponentFactory")
local HardwareComponentInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local Bridge = java_lazy("org.allbinary.logic.system.hardware.components.linux.Bridge")
local Ethernet = java_lazy("org.allbinary.logic.system.hardware.components.linux.Ethernet")
local HardDriveController = java_lazy("org.allbinary.logic.system.hardware.components.linux.HardDriveController")
local Media = java_lazy("org.allbinary.logic.system.hardware.components.linux.Media")
local PCI = java_lazy("org.allbinary.logic.system.hardware.components.linux.PCI")
local Unknown = java_lazy("org.allbinary.logic.system.hardware.components.linux.Unknown")
local Usb = java_lazy("org.allbinary.logic.system.hardware.components.linux.Usb")
local Video = java_lazy("org.allbinary.logic.system.hardware.components.linux.Video")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table PCComponentFactory is declared before the requires
PCComponentFactory.__index = PCComponentFactory
PCComponentFactory.className = "PCComponentFactory"
PCComponentFactory.javaClassName = "org.allbinary.logic.system.hardware.linux.PCComponentFactory"

function PCComponentFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.componentFactory = ComponentFactory.getInstance()
end


function PCComponentFactory.getInstance()
        return PCComponentFactory.instance_f
end
PCComponentFactory.getInstance__static = PCComponentFactory.getInstance


function PCComponentFactory._jinit(self)
    PCComponentFactory._init_fields(self)
    return self
end

function PCComponentFactory.new(...)
    local self = setmetatable({}, PCComponentFactory)
    PCComponentFactory._jinit(self, ...)
    return self
end


function PCComponentFactory:getInstance(component, componentData)
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(component, nil) then
                if rawequal(((component < tostring(self.componentFactory.ETHERNET) and -1) or (component > tostring(self.componentFactory.ETHERNET) and 1) or 0), 0) then
                    do return "__jreturn", Ethernet.new(componentData) end
                elseif rawequal(((component < tostring(self.componentFactory.BRIDGE) and -1) or (component > tostring(self.componentFactory.BRIDGE) and 1) or 0), 0) then
                    do return "__jreturn", Bridge.new(componentData) end
                elseif rawequal(((component < tostring(self.componentFactory.IDE) and -1) or (component > tostring(self.componentFactory.IDE) and 1) or 0), 0) then
                    do return "__jreturn", HardDriveController.new(componentData) end
                elseif rawequal(((component < tostring(self.componentFactory.MULTIMEDIA) and -1) or (component > tostring(self.componentFactory.MULTIMEDIA) and 1) or 0), 0) then
                    do return "__jreturn", Media.new(componentData) end
                elseif rawequal(((component < tostring(self.componentFactory.SCSI) and -1) or (component > tostring(self.componentFactory.SCSI) and 1) or 0), 0) then
                    do return "__jreturn", HardDriveController.new(componentData) end
                elseif rawequal(((component < tostring(self.componentFactory.USB) and -1) or (component > tostring(self.componentFactory.USB) and 1) or 0), 0) then
                    do return "__jreturn", Usb.new(componentData) end
                elseif rawequal(((component < tostring(self.componentFactory.VGA) and -1) or (component > tostring(self.componentFactory.VGA) and 1) or 0), 0) then
                    do return "__jreturn", Video.new(componentData) end
                elseif rawequal(((component < tostring(self.componentFactory.PCI) and -1) or (component > tostring(self.componentFactory.PCI) and 1) or 0), 0) then
                    do return "__jreturn", PCI.new(componentData) end
                end
            end
            do return "__jreturn", Unknown.new(componentData) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().FACTORYERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            return Unknown.new(commonStrings.EXCEPTION)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
PCComponentFactory.getInstance__instance = PCComponentFactory.getInstance
function PCComponentFactory.getInstance(...)
                
    if select("#", ...) == 0 then return PCComponentFactory.getInstance__static() end
                
    return PCComponentFactory.getInstance__instance(...)
                
end


function PCComponentFactory:getComponentType(component)
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
        elseif rawequal(((component < tostring(self.componentFactory.PCI) and -1) or (component > tostring(self.componentFactory.PCI) and 1) or 0), 0) then
            return tostring(self.componentFactory.PCI)
        end
        return tostring(self.componentFactory.UNKNOWN)
end

PCComponentFactory.instance_f = PCComponentFactory.new()

return PCComponentFactory

