-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
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
-- package org.allbinary.logic.control.crypt.jcehelper


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbCrypt = {}
AbCrypt.__index = AbCrypt
AbCrypt.className = "AbCrypt"


function AbCrypt.new(algorithm, key)
    local self = setmetatable({}, AbCrypt)
    return self
end


function AbCrypt:encrypt(array)
        return nil
end


function AbCrypt:decrypt(array)
        return nil
end


function AbCrypt:mutilate(array)
        return nil
end

return AbCrypt

