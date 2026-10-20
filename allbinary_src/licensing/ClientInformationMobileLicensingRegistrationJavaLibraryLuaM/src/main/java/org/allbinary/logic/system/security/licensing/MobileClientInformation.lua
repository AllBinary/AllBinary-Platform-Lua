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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local RegistrationConfiguration = require("org.allbinary.logic.system.security.licensing.registration.RegistrationConfiguration")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local AbeClientInformation = require("org.allbinary.logic.system.security.licensing.AbeClientInformation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MobileClientInformation = {}
MobileClientInformation.__index = MobileClientInformation
MobileClientInformation.className = "MobileClientInformation"
setmetatable(MobileClientInformation, {__index = AbeClientInformation})


function MobileClientInformation.new(name, version, specialName, shortName)
    local self = setmetatable(AbeClientInformation.new(name, version, tostring(StringMaker.new():append(specialName):append(CommonSeps.getInstance().SPACE):append(PartnerIdentifierFileUtil.getInstance():get())), shortName), MobileClientInformation)
        -- super(...) made self above
        local string = self:getSpecialName()
        local number = string.sub(string, (#string - 1) + 1)
        if Integer.getInteger(number) == nil then
            self:setHardSale(false)
        end
        local commonStrings = CommonStrings.getInstance()
        if self:isHardSale() then
            self.logUtil:putF("Use Hard Coded Selling", self, commonStrings.CONSTRUCTOR)
        else
            self.logUtil:putF("Don't Use Hard Coded Selling", self, commonStrings.CONSTRUCTOR)
        end
    return self
end


function MobileClientInformation:toHashtable()
        local hashtable = AbeClientInformation.toHashtable(self)
        local registrationConfiguration = RegistrationConfiguration.getInstance()
        hashtable:put(registrationConfiguration.NAME, registrationConfiguration:getRegistrationCode())
        return hashtable
end

MobileClientInformation.DESC = "Mobile"
MobileClientInformation.ANDROID_DESC = "Android" .. tostring(MobileClientInformation.DESC)

return MobileClientInformation

