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

local AbeLicenseClient = {}
package.loaded["org.allbinary.logic.system.security.licensing.client.AbeLicenseClient"] = AbeLicenseClient

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

local LicenseInitInfo = java_lazy("org.allbinary.business.init.LicenseInitInfo")
local LicenseInitInfoUtil = java_lazy("org.allbinary.business.init.LicenseInitInfoUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local XmlRpcAbeClient = java_lazy("org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AbeLicenseInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeLicenseInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local XmlRpcAbeLicenseRetrievalClient = java_lazy("org.allbinary.logic.system.security.licensing.client.XmlRpcAbeLicenseRetrievalClient")

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

-- class table AbeLicenseClient is declared before the requires
AbeLicenseClient.__index = AbeLicenseClient
AbeLicenseClient.className = "AbeLicenseClient"
AbeLicenseClient.javaClassName = "org.allbinary.logic.system.security.licensing.client.AbeLicenseClient"

function AbeLicenseClient:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.MINSERVERS = 3
end


function AbeLicenseClient._jinit(self)
    AbeLicenseClient._init_fields(self)
    return self
end

function AbeLicenseClient.new(...)
    local self = setmetatable({}, AbeLicenseClient)
    AbeLicenseClient._jinit(self, ...)
    return self
end


-- throws Exception
function AbeLicenseClient:get(abeClientInformation)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.GET)
            local xmlRpcAbeLicenseClient = XmlRpcAbeLicenseRetrievalClient.new(abeClientInformation)
            local abeLicenseInterface = xmlRpcAbeLicenseClient:get(nil)
            local licenseId = abeLicenseInterface:getLicenseId()
            local servers = abeLicenseInterface:getServers()
            local isNewLicenseId = false
            local isBetterServerList = false
            local stringValidationUtil = StringValidationUtil.getInstance()
            if stringValidationUtil:isEmpty(abeClientInformation:getLicenseId()) and not (abeClientInformation:isSameId(licenseId)) then
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
            do return "__jreturn", abeLicenseInterface end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return AbeLicenseClient

