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

local AbeClientLicense = {}
package.loaded["org.allbinary.logic.system.security.licensing.AbeClientLicense"] = AbeClientLicense

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

local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local AbeLicenseInterface = require("org.allbinary.logic.system.security.licensing.AbeLicenseInterface")
local AbeClientInformationData = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationData")
local LicenseType = java_lazy("org.allbinary.logic.system.security.licensing.LicenseType")
local LicenseTypeFactory = java_lazy("org.allbinary.logic.system.security.licensing.LicenseTypeFactory")

local function java_instanceof(object, class)
    class = java_real(class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

-- class table AbeClientLicense is declared before the requires
AbeClientLicense.__index = AbeClientLicense
AbeClientLicense.className = "AbeClientLicense"
AbeClientLicense.javaClassName = "org.allbinary.logic.system.security.licensing.AbeClientLicense"
AbeClientLicense.java_implements = " AbeLicenseInterface "
AbeClientLicense.java_interfaces = function() return {AbeLicenseInterface} end

function AbeClientLicense:_init_fields()
    if self.hashtable == nil then self.hashtable = nil end
    if self.id == nil then self.id = nil end
    if self.servers == nil then self.servers = nil end
    if self.special == nil then self.special = nil end
    if self.licenseType == nil then self.licenseType = nil end
end


function AbeClientLicense._jinit(self, hashtable)
    AbeClientLicense._init_fields(self)
        self.hashtable = StdUtil.getInstance():createHashtable()
        local abeClientInformationData = AbeClientInformationData.getInstance()
        local keyValue = hashtable:get(abeClientInformationData.KEY)
        if keyValue ~= nil then
            if java_instanceof(keyValue, String) then
                self.hashtable:put(abeClientInformationData.KEY, keyValue)
            end
        end
        self.id = hashtable:get(abeClientInformationData.LICENSEID)
        local vector = hashtable:get(abeClientInformationData.LICENSESERVERS)
        self.servers = BasicArrayListD.new()
        local size = vector:size()
        for index = 0, size - 1 do
            self.servers:add(vector:get(index))
        end
        local stringUtil = StringUtil.getInstance()
        self:setSpecial(stringUtil:getNonNull(hashtable:get(abeClientInformationData.SPECIAL)))
        local licenseTypeString = stringUtil:getNonNull(hashtable:get(abeClientInformationData.LICENSE_TYPE))
        self.licenseType = LicenseTypeFactory.getInstance():getInstance(licenseTypeString)
    return self
end

function AbeClientLicense.new(...)
    local self = setmetatable({}, AbeClientLicense)
    AbeClientLicense._jinit(self, ...)
    return self
end


function AbeClientLicense.hasRequiredKeys(resultHashtable)
        local abeClientInformationData = AbeClientInformationData.getInstance()
        if resultHashtable:containsKey(abeClientInformationData.LICENSEID) and resultHashtable:containsKey(abeClientInformationData.LICENSESERVERS) and resultHashtable:containsKey(abeClientInformationData.KEY) and resultHashtable:containsKey(abeClientInformationData.LICENSE_TYPE) then
            return true
        else
            return false
        end
end


function AbeClientLicense:hasKey()
        return self:isValid()
end


function AbeClientLicense:getKey(keyName)
        return self.hashtable:get(keyName)
end


function AbeClientLicense:getLicenseId()
        return self.id
end


function AbeClientLicense:getServers()
        return self.servers
end


function AbeClientLicense:isValid()
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not stringValidationUtil:isEmpty(self:getKey(AbeClientInformationData.getInstance().KEY)) then
            return true
        end
        return false
end


function AbeClientLicense:toString()
        local stringBuffer = StringMaker.new()
        local BREAK = "<br/>"
        stringBuffer:append("License Id: ")
        stringBuffer:append(self:getLicenseId())
        stringBuffer:append(BREAK)
        stringBuffer:append("Is Valid: ")
        stringBuffer:appendboolean(self:isValid())
        stringBuffer:append(BREAK)
        stringBuffer:append("Keys: ")
        stringBuffer:append(tostring(self.hashtable))
        stringBuffer:append(BREAK)
        local serverVector = self:getServers()
        local size = serverVector:size()
        for index = 0, size - 1 do
            local nextServerString = serverVector:get(index)
            stringBuffer:append("Server: ")
            stringBuffer:append(nextServerString)
            stringBuffer:append(BREAK)
        end
        return tostring(stringBuffer)
end
AbeClientLicense.__tostring = function(self) return self:toString() end


function AbeClientLicense:setSpecial(special)
        self.special = special
end


function AbeClientLicense:getSpecial()
        return self.special
end


function AbeClientLicense:getLicenseType()
        return self.licenseType
end

return AbeClientLicense

