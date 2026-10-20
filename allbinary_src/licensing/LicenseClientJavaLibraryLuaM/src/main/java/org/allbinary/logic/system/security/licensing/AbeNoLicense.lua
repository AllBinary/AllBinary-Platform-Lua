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

local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local AbeLicenseInterface = require("org.allbinary.logic.system.security.licensing.AbeLicenseInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbeNoLicense = {}
AbeNoLicense.__index = AbeNoLicense
AbeNoLicense.className = "AbeNoLicense"

function AbeNoLicense:_init_fields()
    self.serverVector = BasicArrayListD.new()
end


function AbeNoLicense.new()
    local self = setmetatable({}, AbeNoLicense)
    self:_init_fields()
    return self
end


function AbeNoLicense.getInstance()
        return AbeNoLicense.abeNoLicense
end


function AbeNoLicense:hasKey()
        return false
end


function AbeNoLicense:getKey(keyName)
        return StringUtil.getInstance().EMPTY_STRING
end


function AbeNoLicense:getLicenseId()
        return StringUtil.getInstance().EMPTY_STRING
end


function AbeNoLicense:getSpecial()
        return StringUtil.getInstance().EMPTY_STRING
end


function AbeNoLicense:getServers()
        return self.serverVector
end


function AbeNoLicense:isValid()
        return false
end


function AbeNoLicense:getLicenseType()
        return LicenseTypeFactory.getInstance().UNKNOWN
end

AbeNoLicense.abeNoLicense = AbeNoLicense.new()

return AbeNoLicense

