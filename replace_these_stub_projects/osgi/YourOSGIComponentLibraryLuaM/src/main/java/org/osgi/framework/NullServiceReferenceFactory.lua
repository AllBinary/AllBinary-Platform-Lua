-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.osgi.framework


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullServiceReferenceFactory = {}
NullServiceReferenceFactory.__index = NullServiceReferenceFactory
NullServiceReferenceFactory.className = "NullServiceReferenceFactory"

function NullServiceReferenceFactory:_init_fields()
    self.NULL_SERVICE_REFERENCE = NullServiceReference.new()
end

function NullServiceReferenceFactory.new()
    local self = setmetatable({}, NullServiceReferenceFactory)
    self:_init_fields()
    return self
end


function NullServiceReferenceFactory.getInstance()
        return NullServiceReferenceFactory.instance
end

NullServiceReferenceFactory.instance = NullServiceReferenceFactory.new()

return NullServiceReferenceFactory

