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

local AbeNoLicense = {}
package.loaded["org.allbinary.logic.system.security.licensing.AbeNoLicense"] = AbeNoLicense

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

local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local AbeLicenseInterface = require("org.allbinary.logic.system.security.licensing.AbeLicenseInterface")
local LicenseType = java_lazy("org.allbinary.logic.system.security.licensing.LicenseType")
local LicenseTypeFactory = java_lazy("org.allbinary.logic.system.security.licensing.LicenseTypeFactory")

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

-- class table AbeNoLicense is declared before the requires
AbeNoLicense.__index = AbeNoLicense
AbeNoLicense.className = "AbeNoLicense"
AbeNoLicense.javaClassName = "org.allbinary.logic.system.security.licensing.AbeNoLicense"
AbeNoLicense.java_implements = " AbeLicenseInterface "
AbeNoLicense.java_interfaces = function() return {AbeLicenseInterface} end

function AbeNoLicense:_init_fields()
    self.serverVector = BasicArrayListD.new()
end


function AbeNoLicense._jinit(self)
    AbeNoLicense._init_fields(self)
    return self
end

function AbeNoLicense.new(...)
    local self = setmetatable({}, AbeNoLicense)
    AbeNoLicense._jinit(self, ...)
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

