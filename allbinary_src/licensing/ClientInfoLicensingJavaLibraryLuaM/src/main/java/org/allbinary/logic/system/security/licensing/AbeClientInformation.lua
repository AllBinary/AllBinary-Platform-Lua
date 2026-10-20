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

local LicenseInitInfo = require("org.allbinary.business.init.LicenseInitInfo")
local LicenseInitInfoUtil = require("org.allbinary.business.init.LicenseInitInfoUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ClientInformation = require("org.allbinary.logic.system.security.licensing.ClientInformation")

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
local AbeClientInformation = {}
AbeClientInformation.__index = AbeClientInformation
AbeClientInformation.className = "AbeClientInformation"
setmetatable(AbeClientInformation, {__index = ClientInformation})

function AbeClientInformation:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AbeClientInformation.new(name, version, specialName, shortName)
    local self = setmetatable(ClientInformation.new(name, version, specialName, shortName), AbeClientInformation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AbeClientInformation:init()
        local try_ok, try_error = pcall(function()
            self:setOperatingSystemInterface(OperatingSystemFactory.getInstance():getOperatingSystemInstance())
            local licenseInitInfo = LicenseInitInfoUtil.getInstance():read()
            self:setLicenseId(licenseInitInfo:getLicenseId())
            self:setLicenseServers(licenseInitInfo:getServerList())
            local stringValidationUtil = StringValidationUtil.getInstance()
            if stringValidationUtil:isEmpty(self:getLicenseId()) then
                local NONE = "No License Id"
                self:setLicenseId(NONE)
            end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.put(tostring(StringMaker.new():append("Special Name: "):append(self:getSpecialName())), self, commonStrings.CONSTRUCTOR)
        end)
        if not try_ok then
            local e = try_error
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
end

return AbeClientInformation

