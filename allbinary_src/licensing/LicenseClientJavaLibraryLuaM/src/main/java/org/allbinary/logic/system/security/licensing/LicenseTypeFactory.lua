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

local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LicenseTypeFactory = {}
LicenseTypeFactory.__index = LicenseTypeFactory
LicenseTypeFactory.className = "LicenseTypeFactory"

function LicenseTypeFactory:_init_fields()
    self.UNKNOWN = LicenseType.new(CommonStrings.getInstance().UNKNOWN)
    self.DEMO = LicenseType.new("Demo")
    self.NORMAL = LicenseType.new("Normal")
end

function LicenseTypeFactory.new()
    local self = setmetatable({}, LicenseTypeFactory)
    self:_init_fields()
    return self
end


function LicenseTypeFactory.getInstance()
        return LicenseTypeFactory.instance
end


-- Java overloaded method: Lua keeps the last definition
function LicenseTypeFactory:getInstance(name)
        if self.DEMO:getName():compareTo(name) == 0 then
            return self.DEMO
        elseif self.NORMAL:getName():compareTo(name) == 0 then
            return self.NORMAL
        end
        return self.UNKNOWN
end

LicenseTypeFactory.instance = LicenseTypeFactory.new()

return LicenseTypeFactory

