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
-- package org.allbinary.logic.system.loader

local AbKeys = require("org.allbinary.logic.system.security.AbKeys")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local NativeLibraryHelperWrapper = require("org.allbinary.logic.system.loader.NativeLibraryHelperWrapper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SecuredNativeLibraryHelperWrapper = {}
SecuredNativeLibraryHelperWrapper.__index = SecuredNativeLibraryHelperWrapper
SecuredNativeLibraryHelperWrapper.className = "SecuredNativeLibraryHelperWrapper"
setmetatable(SecuredNativeLibraryHelperWrapper, {__index = NativeLibraryHelperWrapper})

function SecuredNativeLibraryHelperWrapper:_init_fields()
    self.securedNativeLibraryInterface = nil
end


function SecuredNativeLibraryHelperWrapper.new(securedNativeLibraryInterface)
    local self = setmetatable(NativeLibraryHelperWrapper.new(securedNativeLibraryInterface:getLibraryName()), SecuredNativeLibraryHelperWrapper)
    self:_init_fields()
        -- super(...) made self above
        self.securedNativeLibraryInterface = securedNativeLibraryInterface
    return self
end


-- throws LicensingException
function SecuredNativeLibraryHelperWrapper:unlock(abeClientInformation)
        return self.securedNativeLibraryInterface:unlock(AbKeys.getInstance():getKey(abeClientInformation, self.securedNativeLibraryInterface:getName()))
end

return SecuredNativeLibraryHelperWrapper

