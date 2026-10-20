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

local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RegistrationConfiguration = {}
RegistrationConfiguration.__index = RegistrationConfiguration
RegistrationConfiguration.className = "RegistrationConfiguration"

function RegistrationConfiguration:_init_fields()
    self.registrationCode = "No Registration Code"
    self.NAME = "registrationid"
end


function RegistrationConfiguration.new()
    local self = setmetatable({}, RegistrationConfiguration)
    self:_init_fields()
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

