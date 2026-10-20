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
-- package org.allbinary.thirdparty.store

local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThirdPartyStore = {}
ThirdPartyStore.__index = ThirdPartyStore
ThirdPartyStore.className = "ThirdPartyStore"

function ThirdPartyStore:_init_fields()
    self.authorized = false
    self.name = nil
end


function ThirdPartyStore.new(name)
    local self = setmetatable({}, ThirdPartyStore)
    self:_init_fields()
        self.name = name
    return self
end


function ThirdPartyStore:authorize(clientInformationInterface)
end


function ThirdPartyStore:isAuthorized()
        return self.authorized
end


function ThirdPartyStore:setAuthorized(authorized)
        self.authorized = authorized
end


function ThirdPartyStore:getName()
        return self.name
end

return ThirdPartyStore

