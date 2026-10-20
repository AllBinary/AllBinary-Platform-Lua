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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ComponentFactory = require("org.allbinary.logic.system.hardware.components.ComponentFactory")
local HardwareComponentInterface = require("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local Bridge = require("org.allbinary.logic.system.hardware.components.linux.Bridge")
local Ethernet = require("org.allbinary.logic.system.hardware.components.linux.Ethernet")
local HardDriveController = require("org.allbinary.logic.system.hardware.components.linux.HardDriveController")
local Media = require("org.allbinary.logic.system.hardware.components.linux.Media")
local PCI = require("org.allbinary.logic.system.hardware.components.linux.PCI")
local Unknown = require("org.allbinary.logic.system.hardware.components.linux.Unknown")
local Usb = require("org.allbinary.logic.system.hardware.components.linux.Usb")
local Video = require("org.allbinary.logic.system.hardware.components.linux.Video")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PCComponentFactory = {}
PCComponentFactory.__index = PCComponentFactory
PCComponentFactory.className = "PCComponentFactory"

function PCComponentFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.componentFactory = ComponentFactory.getInstance()
end


function PCComponentFactory.getInstance()
        return PCComponentFactory.instance
end


function PCComponentFactory.new()
    local self = setmetatable({}, PCComponentFactory)
    self:_init_fields()
    return self
end


-- Java overloaded method: Lua keeps the last definition
function PCComponentFactory:getInstance(component, componentData)
        local try_ok, try_error = pcall(function()
            if component ~= nil then
                if ((component < tostring(self.componentFactory.ETHERNET) and -1) or (component > tostring(self.componentFactory.ETHERNET) and 1) or 0) == 0 then
                    return Ethernet.new(componentData)
                elseif ((component < tostring(self.componentFactory.BRIDGE) and -1) or (component > tostring(self.componentFactory.BRIDGE) and 1) or 0) == 0 then
                    return Bridge.new(componentData)
                elseif ((component < tostring(self.componentFactory.IDE) and -1) or (component > tostring(self.componentFactory.IDE) and 1) or 0) == 0 then
                    return HardDriveController.new(componentData)
                elseif ((component < tostring(self.componentFactory.MULTIMEDIA) and -1) or (component > tostring(self.componentFactory.MULTIMEDIA) and 1) or 0) == 0 then
                    return Media.new(componentData)
                elseif ((component < tostring(self.componentFactory.SCSI) and -1) or (component > tostring(self.componentFactory.SCSI) and 1) or 0) == 0 then
                    return HardDriveController.new(componentData)
                elseif ((component < tostring(self.componentFactory.USB) and -1) or (component > tostring(self.componentFactory.USB) and 1) or 0) == 0 then
                    return Usb.new(componentData)
                elseif ((component < tostring(self.componentFactory.VGA) and -1) or (component > tostring(self.componentFactory.VGA) and 1) or 0) == 0 then
                    return Video.new(componentData)
                elseif ((component < tostring(self.componentFactory.PCI) and -1) or (component > tostring(self.componentFactory.PCI) and 1) or 0) == 0 then
                    return PCI.new(componentData)
                end
            end
            return Unknown.new(componentData)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().FACTORYERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            return Unknown.new(commonStrings.EXCEPTION)
        end
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
        elseif ((component < tostring(self.componentFactory.PCI) and -1) or (component > tostring(self.componentFactory.PCI) and 1) or 0) == 0 then
            return tostring(self.componentFactory.PCI)
        end
        return tostring(self.componentFactory.UNKNOWN)
end

PCComponentFactory.instance = PCComponentFactory.new()

return PCComponentFactory

