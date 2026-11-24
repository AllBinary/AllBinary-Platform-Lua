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

local AbeClientInformationInterface = {}
package.loaded["org.allbinary.logic.system.security.licensing.AbeClientInformationInterface"] = AbeClientInformationInterface

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

local GenericOperatingSystem = java_lazy("org.allbinary.logic.system.os.GenericOperatingSystem")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

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

-- Java interface
-- class table AbeClientInformationInterface is declared before the requires
AbeClientInformationInterface.__index = AbeClientInformationInterface
AbeClientInformationInterface.className = "AbeClientInformationInterface"
AbeClientInformationInterface.javaClassName = "org.allbinary.logic.system.security.licensing.AbeClientInformationInterface"


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

