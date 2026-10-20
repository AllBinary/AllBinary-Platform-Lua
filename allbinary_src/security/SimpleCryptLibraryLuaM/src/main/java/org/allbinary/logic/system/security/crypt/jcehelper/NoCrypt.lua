-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

local CryptInterface = require("org.allbinary.init.crypt.jcehelper.CryptInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NoCrypt = {}
NoCrypt.__index = NoCrypt
NoCrypt.className = "NoCrypt"

function NoCrypt.new()
    local self = setmetatable({}, NoCrypt)
    return self
end


function NoCrypt:encrypt(array)
        return array
end


function NoCrypt:decrypt(array)
        return array
end

return NoCrypt

