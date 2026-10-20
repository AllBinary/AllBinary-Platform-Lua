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
-- package org.allbinary.logic.system.security.crypt.jcehelper

local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BaseSecretComposite = {}
BaseSecretComposite.__index = BaseSecretComposite
BaseSecretComposite.className = "BaseSecretComposite"

function BaseSecretComposite.new()
    local self = setmetatable({}, BaseSecretComposite)
    return self
end


-- throws Exception
function BaseSecretComposite:encrypt(array)
        return NullUtil.getInstance().NULL_BYTE_ARRAY
end


-- throws Exception
function BaseSecretComposite:decrypt(array)
        return NullUtil.getInstance().NULL_BYTE_ARRAY
end

BaseSecretComposite.NULL_SECRET_COMPOSITE = BaseSecretComposite.new()

return BaseSecretComposite

