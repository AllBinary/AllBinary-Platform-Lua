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
-- package org.allbinary.logic.system.os

local CharacterSet = require("org.allbinary.logic.java.character.CharacterSet")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local OperatingSystemInterface = require("org.allbinary.logic.system.os.OperatingSystemInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericOperatingSystem = {}
GenericOperatingSystem.__index = GenericOperatingSystem
GenericOperatingSystem.className = "GenericOperatingSystem"

function GenericOperatingSystem:_init_fields()
    self.osName = nil
    self.osArch = nil
    self.osVersion = nil
    self.characterSet = CharacterSet.new()
    self.scalable = false
end


function GenericOperatingSystem.new()
    local self = setmetatable({}, GenericOperatingSystem)
    self:_init_fields()
        local systemProperties = SystemProperties.getInstance()
        local stringValidationUtil = StringValidationUtil.getInstance()
        local EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
        if stringValidationUtil:isEmpty(systemProperties:getName()) then
            self.osName = EMPTY_STRING
        else
            self.osName = systemProperties:getName()
        end
        if stringValidationUtil:isEmpty(systemProperties:getArch()) then
            self.osArch = EMPTY_STRING
        else
            self.osArch = systemProperties:getArch()
        end
        if stringValidationUtil:isEmpty(systemProperties:getVersion()) then
            self.osVersion = EMPTY_STRING
        else
            self.osVersion = systemProperties:getVersion()
        end
    return self
end


function GenericOperatingSystem:getName()
        return self.osName
end


function GenericOperatingSystem:getVersion()
        return self.osVersion
end


function GenericOperatingSystem:getArch()
        return self.osArch
end


function GenericOperatingSystem:getCharacterSet()
        return self.characterSet
end


function GenericOperatingSystem:isOverScan()
        return false
end


function GenericOperatingSystem:getOverScanXPercent()
        return 100
end


function GenericOperatingSystem:getOverScanYPercent()
        return 100
end


function GenericOperatingSystem:isScalable()
        return self.scalable
end


function GenericOperatingSystem:isAutoHide()
        return false
end


function GenericOperatingSystem:toString()
        local NEW_LINE = CommonSeps.getInstance().NEW_LINE
        local osBuffer = StringMaker.new()
        osBuffer:append("Operating System Info: \n")
        osBuffer:append(self:getName())
        osBuffer:append(NEW_LINE)
        osBuffer:append(self:getArch())
        osBuffer:append(NEW_LINE)
        osBuffer:append(self:getVersion())
        osBuffer:append(NEW_LINE)
        osBuffer:append(StringUtil.getInstance():toString(self:getCharacterSet()))
        osBuffer:append(NEW_LINE)
        return tostring(osBuffer)
end
GenericOperatingSystem.__tostring = function(self) return self:toString() end

return GenericOperatingSystem

