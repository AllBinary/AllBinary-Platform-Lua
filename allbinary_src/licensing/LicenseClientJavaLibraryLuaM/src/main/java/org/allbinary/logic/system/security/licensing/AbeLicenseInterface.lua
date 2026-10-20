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
local AbeLicenseInterface = {}
AbeLicenseInterface.__index = AbeLicenseInterface
AbeLicenseInterface.className = "AbeLicenseInterface"


function AbeLicenseInterface:hasKey()
    error("abstract method hasKey")
end


function AbeLicenseInterface:getKey(keyName)
    error("abstract method getKey")
end


function AbeLicenseInterface:getLicenseId()
    error("abstract method getLicenseId")
end


function AbeLicenseInterface:getServers()
    error("abstract method getServers")
end


function AbeLicenseInterface:getSpecial()
    error("abstract method getSpecial")
end


function AbeLicenseInterface:getLicenseType()
    error("abstract method getLicenseType")
end


function AbeLicenseInterface:isValid()
    error("abstract method isValid")
end


function AbeLicenseInterface:toString()
    error("abstract method toString")
end
AbeLicenseInterface.__tostring = function(self) return self:toString() end

return AbeLicenseInterface

