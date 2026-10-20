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

local TsUtil = require("org.allbinary.TsUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local HardwareInterface = require("org.allbinary.logic.system.hardware.HardwareInterface")
local SystemHardwareFactory = require("org.allbinary.logic.system.hardware.SystemHardwareFactory")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local NoOperatingSystem = require("org.allbinary.logic.system.os.NoOperatingSystem")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- This is the information sent to the license server
local ClientInformation = {}
ClientInformation.__index = ClientInformation
ClientInformation.className = "ClientInformation"

function ClientInformation:_init_fields()
    self.operatingSystemInterface = NoOperatingSystem.NO_OPERATING_SYSTEM
    self.tsUtil = TsUtil.getInstance()
    self.name = nil
    self.shortName = nil
    self.version = nil
    self.specialName = nil
    self.hardSale = true
    self.licenseId = StringUtil.getInstance().EMPTY_STRING
    self.licenseServers = BasicArrayListUtil.getInstance():getImmutableInstance()
end


function ClientInformation.new(name, version, specialName, shortName)
    local self = setmetatable({}, ClientInformation)
    self:_init_fields()
        self.name = name
        self.version = version
        self.specialName = specialName
        self.shortName = tostring(StringMaker.new():append(shortName):append(CommonSeps.getInstance().UNDERSCORE):append(version))
        self:init()
    return self
end


function ClientInformation:init()
end


function ClientInformation:getOperatingSystemInterface()
        return self.operatingSystemInterface
end


function ClientInformation:getName()
        return self.name
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
        clientInfoHashtable:put(abeClientInformationData.NAME, self.name)
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

