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

-- local IOException = require("java.io.IOException")
-- local Calendar = require("java.util.Calendar")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeLicenseClient = require("org.allbinary.logic.system.security.licensing.client.AbeLicenseClient")
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

local AbeLicenseInterfaceFactory = {}
AbeLicenseInterfaceFactory.__index = AbeLicenseInterfaceFactory
AbeLicenseInterfaceFactory.className = "AbeLicenseInterfaceFactory"

function AbeLicenseInterfaceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.time = 0
    self.check = false
    self.checkPeriod = 36000000
    self.abeLicenseInterface = nil
end


function AbeLicenseInterfaceFactory.getInstance()
        return AbeLicenseInterfaceFactory.SINGLETON
end


function AbeLicenseInterfaceFactory.new()
    local self = setmetatable({}, AbeLicenseInterfaceFactory)
    self:_init_fields()
    return self
end


-- throws LicensingException
function AbeLicenseInterfaceFactory:getLicenseInstance(abeClientInformation)
        if self:isTimeToGetKey() then
            return self:get(abeClientInformation)
        else
            return self.abeLicenseInterface
        end
end


-- throws LicensingException
function AbeLicenseInterfaceFactory:get(abeClientInformation)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Getting Keys", self, self.commonStrings.GET)
            self.abeLicenseInterface = AbeNoLicense.getInstance()
            local licenseClient = AbeLicenseClient.new()
            self.abeLicenseInterface = licenseClient:get(abeClientInformation)
            if self.abeLicenseInterface ~= nil then
                self.logUtil:putF("Default Key: " .. tostring(self.abeLicenseInterface:getKey(AbeClientInformationData.getInstance().KEY)), self, self.commonStrings.GET)
            end
            return self.abeLicenseInterface
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("Licensing IO Error", self, self.commonStrings.GET, e)
            error(LicensingException.new("License Server Connection Error"), 0)
        end
end


function AbeLicenseInterfaceFactory:isTimeToGetKey()
        local calendar = Calendar.getInstance()
        local currentTime = calendar:getTimeInMillis()
        if self.abeLicenseInterface == nil or self.abeLicenseInterface == AbeNoLicense.getInstance() or not self.abeLicenseInterface:hasKey() or self:isCheck() or currentTime - self.checkPeriod > self.time then
            self.abeLicenseInterface = nil
            self.time = currentTime
            return true
        else
            return false
        end
end


function AbeLicenseInterfaceFactory:setCheck(check)
        self.check = check
end


function AbeLicenseInterfaceFactory:isCheck()
        return self.check
end

AbeLicenseInterfaceFactory.SINGLETON = AbeLicenseInterfaceFactory.new()

return AbeLicenseInterfaceFactory

