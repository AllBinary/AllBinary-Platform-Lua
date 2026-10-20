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

local LongArrayIdentifierInterface = require("org.allbinary.thirdparty.store.LongArrayIdentifierInterface")
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

local StoreAppClientInformation = {}
StoreAppClientInformation.__index = StoreAppClientInformation
StoreAppClientInformation.className = "StoreAppClientInformation"
setmetatable(StoreAppClientInformation, {__index = AbeClientInformation})

function StoreAppClientInformation:_init_fields()
    self.longArrayIdentifier = nil
end


function StoreAppClientInformation.new(name, version, specialName, shortName, longArrayIdentifier)
    local self = setmetatable(AbeClientInformation.new(name, version, specialName, shortName), StoreAppClientInformation)
    self:_init_fields()
        -- super(...) made self above
        self.longArrayIdentifier = longArrayIdentifier
    return self
end


function StoreAppClientInformation:getLongArrayIdentifier()
        return self.longArrayIdentifier
end

return StoreAppClientInformation

