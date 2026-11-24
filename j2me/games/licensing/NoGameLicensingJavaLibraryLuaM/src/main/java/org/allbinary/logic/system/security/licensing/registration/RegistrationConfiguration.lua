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

local RegistrationConfiguration = {}
package.loaded["org.allbinary.logic.system.security.licensing.registration.RegistrationConfiguration"] = RegistrationConfiguration

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

-- class table RegistrationConfiguration is declared before the requires
RegistrationConfiguration.__index = RegistrationConfiguration
RegistrationConfiguration.className = "RegistrationConfiguration"
RegistrationConfiguration.javaClassName = "org.allbinary.logic.system.security.licensing.registration.RegistrationConfiguration"

function RegistrationConfiguration:_init_fields()
    self.registrationCode = "No Registration Code"
    self.NAME = "registrationid"
end


function RegistrationConfiguration._jinit(self)
    RegistrationConfiguration._init_fields(self)
    return self
end

function RegistrationConfiguration.new(...)
    local self = setmetatable({}, RegistrationConfiguration)
    RegistrationConfiguration._jinit(self, ...)
    return self
end


function RegistrationConfiguration.getInstance()
        return RegistrationConfiguration.SINGLETON
end


-- throws Exception
function RegistrationConfiguration:read()
end


-- throws Exception
function RegistrationConfiguration:write()
end


function RegistrationConfiguration:toString()
        return tostring(StringMaker.new():append("Registration Code: "):append(self:getRegistrationCode()))
end
RegistrationConfiguration.__tostring = function(self) return self:toString() end


function RegistrationConfiguration:setRegistrationCode(registrationCode)
        self.registrationCode = registrationCode
end


function RegistrationConfiguration:getRegistrationCode()
        return self.registrationCode
end

RegistrationConfiguration.SINGLETON = RegistrationConfiguration.new()

return RegistrationConfiguration

