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

local StdUtil = require("org.allbinary.logic.StdUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local AbeLicenseInterface = require("org.allbinary.logic.system.security.licensing.AbeLicenseInterface")

local function java_instanceof(object, class)
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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbeClientLicense = {}
AbeClientLicense.__index = AbeClientLicense
AbeClientLicense.className = "AbeClientLicense"

function AbeClientLicense:_init_fields()
    self.hashtable = nil
    self.id = nil
    self.servers = nil
    self.special = nil
    self.licenseType = nil
end


function AbeClientLicense.new(hashtable)
    local self = setmetatable({}, AbeClientLicense)
    self:_init_fields()
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

