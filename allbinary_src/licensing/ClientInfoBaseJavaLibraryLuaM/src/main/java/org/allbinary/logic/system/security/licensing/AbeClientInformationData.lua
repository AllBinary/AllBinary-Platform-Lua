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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbeClientInformationData = {}
AbeClientInformationData.__index = AbeClientInformationData
AbeClientInformationData.className = "AbeClientInformationData"

function AbeClientInformationData:_init_fields()
    self.KEY = "KEY"
    self.NAME = "NAME"
    self.VERSION = "VERSION"
    self.SPECIALNAME = "SPECIALNAME"
    self.LICENSEID = "LICENSEID"
    self.LICENSE_TYPE = "LICENSETYPE"
    self.PREVIOUSLICENSEID = "PREVIOUSLICENSEID"
    self.OSNAME = "OSNAME"
    self.OSARCH = "OSARCH"
    self.OSVERSION = "OSVERSION"
    self.OS = "OS"
    self.HARDWARE = "HARDWARE"
    self.LICENSESERVERS = "LICENSESERVERS"
    self.NEWLICENSE = "NEWLICENSE"
    self.ISNEW = "ISNEW"
    self.SPECIAL = "SPECIAL"
end


function AbeClientInformationData.getInstance()
        return AbeClientInformationData.instance
end


function AbeClientInformationData.new()
    local self = setmetatable({}, AbeClientInformationData)
    self:_init_fields()
    return self
end

AbeClientInformationData.instance = AbeClientInformationData.new()

return AbeClientInformationData

