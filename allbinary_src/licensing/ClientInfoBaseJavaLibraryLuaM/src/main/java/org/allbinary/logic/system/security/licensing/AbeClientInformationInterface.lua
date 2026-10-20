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

local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local ABHashtable = require("org.allbinary.util.ABHashtable")
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

-- Java interface
local AbeClientInformationInterface = {}
AbeClientInformationInterface.__index = AbeClientInformationInterface
AbeClientInformationInterface.className = "AbeClientInformationInterface"


function AbeClientInformationInterface:init()
    error("abstract method init")
end


function AbeClientInformationInterface:getOperatingSystemInterface()
    error("abstract method getOperatingSystemInterface")
end


function AbeClientInformationInterface:getName()
    error("abstract method getName")
end


function AbeClientInformationInterface:getSpecialName()
    error("abstract method getSpecialName")
end


function AbeClientInformationInterface:getVersion()
    error("abstract method getVersion")
end


function AbeClientInformationInterface:getLicenseId()
    error("abstract method getLicenseId")
end


function AbeClientInformationInterface:getLicenseServers()
    error("abstract method getLicenseServers")
end


function AbeClientInformationInterface:getLicenseServer(index)
    error("abstract method getLicenseServer")
end


function AbeClientInformationInterface:getNumberOfLicenseServers()
    error("abstract method getNumberOfLicenseServers")
end


function AbeClientInformationInterface:toHashtable()
    error("abstract method toHashtable")
end


function AbeClientInformationInterface:isSameId(alicenseId)
    error("abstract method isSameId")
end


function AbeClientInformationInterface:isLargerOrDifferentServerList(vector)
    error("abstract method isLargerOrDifferentServerList")
end


function AbeClientInformationInterface:isHardSale()
    error("abstract method isHardSale")
end


function AbeClientInformationInterface:toShortString()
    error("abstract method toShortString")
end

return AbeClientInformationInterface

