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
-- package org.allbinary.logic.system.security.licensing.registration

local CommonStrings = require("org.allbinary.string.CommonStrings")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local SpecialMessageUtil = require("org.allbinary.canvas.SpecialMessageUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LicenseRegistrationUtil = {}
LicenseRegistrationUtil.__index = LicenseRegistrationUtil
LicenseRegistrationUtil.className = "LicenseRegistrationUtil"


function LicenseRegistrationUtil.new()
    local self = setmetatable({}, LicenseRegistrationUtil)
    return self
end


function LicenseRegistrationUtil.process(abeClientInformation, registrationId)
        local try_ok, try_error = pcall(function()
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.put(tostring(CommonLabels.getInstance().START_LABEL) .. "License Registration", "LicenseRegistrationUtil", commonStrings.PROCESS)
            local registrationConfiguration = RegistrationConfiguration.getInstance()
            registrationConfiguration:setRegistrationCode(registrationId)
            registrationConfiguration:write()
            local hashtable = abeClientInformation:toHashtable()
            hashtable:put(RegistrationConfiguration.getInstance().NAME, registrationId)
            hashtable:put("message", SpecialMessageUtil.getInstance():get())
            XmlRpcRemoteLicenseRegistrationClient.new(abeClientInformation):get(hashtable)
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE("License Registration Exception", "LicenseRegistrationUtil", "License Registration", e)
        end
end

return LicenseRegistrationUtil

