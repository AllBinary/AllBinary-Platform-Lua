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

local AbeLicenseInterfaceFactory = {}
package.loaded["org.allbinary.logic.system.security.licensing.AbeLicenseInterfaceFactory"] = AbeLicenseInterfaceFactory

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

-- local IOException = require("java.io.IOException")
local Calendar = java_lazy("java.util.Calendar")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbeLicenseClient = java_lazy("org.allbinary.logic.system.security.licensing.client.AbeLicenseClient")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AbeClientInformationData = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationData")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local AbeLicenseInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeLicenseInterface")
local AbeNoLicense = java_lazy("org.allbinary.logic.system.security.licensing.AbeNoLicense")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")

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

-- class table AbeLicenseInterfaceFactory is declared before the requires
AbeLicenseInterfaceFactory.__index = AbeLicenseInterfaceFactory
AbeLicenseInterfaceFactory.className = "AbeLicenseInterfaceFactory"
AbeLicenseInterfaceFactory.javaClassName = "org.allbinary.logic.system.security.licensing.AbeLicenseInterfaceFactory"

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


function AbeLicenseInterfaceFactory._jinit(self)
    AbeLicenseInterfaceFactory._init_fields(self)
    return self
end

function AbeLicenseInterfaceFactory.new(...)
    local self = setmetatable({}, AbeLicenseInterfaceFactory)
    AbeLicenseInterfaceFactory._jinit(self, ...)
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
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF("Getting Keys", self, self.commonStrings.GET)
            self.abeLicenseInterface = AbeNoLicense.getInstance()
            local licenseClient = AbeLicenseClient.new()
            self.abeLicenseInterface = licenseClient:get(abeClientInformation)
            if self.abeLicenseInterface ~= nil then
                self.logUtil:putF("Default Key: " .. tostring(self.abeLicenseInterface:getKey(AbeClientInformationData.getInstance().KEY)), self, self.commonStrings.GET)
            end
            do return "__jreturn", self.abeLicenseInterface end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Licensing IO Error", self, self.commonStrings.GET, e)
            error(LicensingException.new("License Server Connection Error"), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
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

