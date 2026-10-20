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
-- package org.allbinary.logic.system.security.licensing.client

local LicenseInitInfo = require("org.allbinary.business.init.LicenseInitInfo")
local LicenseInitInfoUtil = require("org.allbinary.business.init.LicenseInitInfoUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local XmlRpcAbeClient = require("org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AbeLicenseInterface = require("org.allbinary.logic.system.security.licensing.AbeLicenseInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbeLicenseClient = {}
AbeLicenseClient.__index = AbeLicenseClient
AbeLicenseClient.className = "AbeLicenseClient"

function AbeLicenseClient:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.MINSERVERS = 3
end


function AbeLicenseClient.new()
    local self = setmetatable({}, AbeLicenseClient)
    self:_init_fields()
    return self
end


-- throws Exception
function AbeLicenseClient:get(abeClientInformation)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.GET)
            local xmlRpcAbeLicenseClient = XmlRpcAbeLicenseRetrievalClient.new(abeClientInformation)
            local abeLicenseInterface = xmlRpcAbeLicenseClient:get(nil)
            local licenseId = abeLicenseInterface:getLicenseId()
            local servers = abeLicenseInterface:getServers()
            local isNewLicenseId = false
            local isBetterServerList = false
            local stringValidationUtil = StringValidationUtil.getInstance()
            if stringValidationUtil:isEmpty(abeClientInformation:getLicenseId()) and not abeClientInformation:isSameId(licenseId) then
                isNewLicenseId = true
            end
            if servers:size() >= self.MINSERVERS and abeClientInformation:isLargerOrDifferentServerList(servers) then
                isBetterServerList = true
            end
            if isBetterServerList or isNewLicenseId then
                local initInfo = LicenseInitInfoUtil.getInstance():read()
                initInfo:setLicenseId(licenseId)
                initInfo:setServerList(servers)
                LicenseInitInfoUtil.getInstance():write(initInfo)
                abeClientInformation:init()
            end
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.GET)
            return abeLicenseInterface
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end

return AbeLicenseClient

