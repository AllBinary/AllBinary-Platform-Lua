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

local AbeClientInformationData = {}
package.loaded["org.allbinary.logic.system.security.licensing.AbeClientInformationData"] = AbeClientInformationData

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

-- class table AbeClientInformationData is declared before the requires
AbeClientInformationData.__index = AbeClientInformationData
AbeClientInformationData.className = "AbeClientInformationData"
AbeClientInformationData.javaClassName = "org.allbinary.logic.system.security.licensing.AbeClientInformationData"

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
        return AbeClientInformationData.instance_f
end


function AbeClientInformationData._jinit(self)
    AbeClientInformationData._init_fields(self)
    return self
end

function AbeClientInformationData.new(...)
    local self = setmetatable({}, AbeClientInformationData)
    AbeClientInformationData._jinit(self, ...)
    return self
end

AbeClientInformationData.instance_f = AbeClientInformationData.new()

return AbeClientInformationData

