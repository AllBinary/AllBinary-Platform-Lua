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
-- package org.allbinary.business.user.commerce.money.payment.types


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AuthorizationTypeFactory = {}
AuthorizationTypeFactory.__index = AuthorizationTypeFactory
AuthorizationTypeFactory.className = "AuthorizationTypeFactory"

function AuthorizationTypeFactory:_init_fields()
    self.NONE = AuthorizationType.new("None")
    self.VOICE = AuthorizationType.new("Voice")
    self.RETINAL = AuthorizationType.new("Retinal")
    self.IMAGE = AuthorizationType.new("Image")
    self.DNA = AuthorizationType.new("DNA")
    self.PRINT = AuthorizationType.new("Print")
    self.CHIP = AuthorizationType.new("Chip")
end

function AuthorizationTypeFactory.new()
    local self = setmetatable({}, AuthorizationTypeFactory)
    self:_init_fields()
    return self
end


function AuthorizationTypeFactory.getInstance()
        return AuthorizationTypeFactory.instance
end

AuthorizationTypeFactory.instance = AuthorizationTypeFactory.new()

return AuthorizationTypeFactory

