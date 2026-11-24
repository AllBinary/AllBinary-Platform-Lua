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
-- package org.allbinary.logic.system.security.licensing

local ClientInformation = {}
package.loaded["org.allbinary.logic.system.security.licensing.ClientInformation"] = ClientInformation

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

local TsUtil = java_lazy("org.allbinary.TsUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local HardwareInterface = java_lazy("org.allbinary.logic.system.hardware.HardwareInterface")
local SystemHardwareFactory = java_lazy("org.allbinary.logic.system.hardware.SystemHardwareFactory")
local GenericOperatingSystem = java_lazy("org.allbinary.logic.system.os.GenericOperatingSystem")
local NoOperatingSystem = java_lazy("org.allbinary.logic.system.os.NoOperatingSystem")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AbeClientInformationData = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationData")

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

-- This is the information sent to the license server
-- class table ClientInformation is declared before the requires
ClientInformation.__index = ClientInformation
ClientInformation.className = "ClientInformation"
ClientInformation.javaClassName = "org.allbinary.logic.system.security.licensing.ClientInformation"
ClientInformation.java_implements = " AbeClientInformationInterface "
ClientInformation.java_interfaces = function() return {AbeClientInformationInterface} end

function ClientInformation:_init_fields()
    self.operatingSystemInterface = NoOperatingSystem.NO_OPERATING_SYSTEM
    self.tsUtil = TsUtil.getInstance()
    if self.name_f == nil then self.name_f = nil end
    if self.shortName == nil then self.shortName = nil end
    if self.version == nil then self.version = nil end
    if self.specialName == nil then self.specialName = nil end
    self.hardSale = true
    self.licenseId = StringUtil.getInstance().EMPTY_STRING
    self.licenseServers = BasicArrayListUtil.getInstance():getImmutableInstance()
end


function ClientInformation._jinit(self, name, version, specialName, shortName)
    ClientInformation._init_fields(self)
        self.name_f = name
        self.version = version
        self.specialName = specialName
        self.shortName = tostring(StringMaker.new():append(shortName):append(CommonSeps.getInstance().UNDERSCORE):append(version))
        self:init()
    return self
end

function ClientInformation.new(...)
    local self = setmetatable({}, ClientInformation)
    ClientInformation._jinit(self, ...)
    return self
end


function ClientInformation:init()
end


function ClientInformation:getOperatingSystemInterface()
        return self.operatingSystemInterface
end


function ClientInformation:getName()
        return self.name_f
end


function ClientInformation:getSpecialName()
        return self.specialName
end


function ClientInformation:getVersion()
        return self.version
end


function ClientInformation:getLicenseId()
        return self.licenseId
end


function ClientInformation:getLicenseServers()
        return self.licenseServers
end


function ClientInformation:getLicenseServer(index)
        return self.licenseServers.objectArray[index + 1]
end


function ClientInformation:getNumberOfLicenseServers()
        return self.licenseServers:size()
end


function ClientInformation:toHashtable()
        local abeClientInformationData = AbeClientInformationData.getInstance()
        local genericOperatingSystem = self:getOperatingSystemInterface()
        local clientInfoHashtable = StdUtil.getInstance():createHashtable()
        clientInfoHashtable:put(abeClientInformationData.NAME, self.name_f)
        clientInfoHashtable:put(abeClientInformationData.VERSION, self.version)
        clientInfoHashtable:put(abeClientInformationData.SPECIALNAME, self.specialName)
        clientInfoHashtable:put(abeClientInformationData.LICENSEID, self:getLicenseId())
        clientInfoHashtable:put(abeClientInformationData.OSNAME, genericOperatingSystem:getName())
        clientInfoHashtable:put(abeClientInformationData.OSARCH, genericOperatingSystem:getArch())
        clientInfoHashtable:put(abeClientInformationData.OSVERSION, genericOperatingSystem:getVersion())
        clientInfoHashtable:put(abeClientInformationData.OS, tostring(genericOperatingSystem))
        local hardwareInterface = SystemHardwareFactory.getInstance():getInstance(genericOperatingSystem)
        local hardwareString = tostring(hardwareInterface)
        clientInfoHashtable:put(abeClientInformationData.HARDWARE, hardwareString)
        return clientInfoHashtable
end


function ClientInformation:isSameId(alicenseId)
        if self.tsUtil:compareTo(self:getLicenseId(), alicenseId) == 0 then
            return true
        else
            return false
        end
end


function ClientInformation:isLargerOrDifferentServerList(list)
        local size = list:size() - 1
        local currentSize = self.licenseServers:size() - 1
        if size > currentSize then
            return true
        end
        for index = size, 0, -1 do
            local newServerName = list.objectArray[index + 1]
            for index2 = currentSize, 0, -1 do
                local nextOldServerName = self.licenseServers.objectArray[index + 1]
                if self.tsUtil:compareTo(newServerName, nextOldServerName) ~= 0 then
                    return true
                end
            end
        end
        return false
end


function ClientInformation:setHardSale(hardSale)
        self.hardSale = hardSale
end


function ClientInformation:isHardSale()
        return self.hardSale
end


function ClientInformation:setOperatingSystemInterface(operatingSystemInterface)
        self.operatingSystemInterface = operatingSystemInterface
end


function ClientInformation:setLicenseId(licenseId)
        self.licenseId = licenseId
end


function ClientInformation:setLicenseServers(licenseServers)
        self.licenseServers = licenseServers
end


function ClientInformation:toShortString()
        return self.shortName
end

return ClientInformation

