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
-- package org.allbinary.logic.util.cache

-- local Set = require("java.util.Set")
local AutomaticCacheInterface = require("org.allbinary.logic.util.cache.AutomaticCacheInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local J2SECacheInterface = {}
J2SECacheInterface.__index = J2SECacheInterface
J2SECacheInterface.className = "J2SECacheInterface"
setmetatable(J2SECacheInterface, {__index = AutomaticCacheInterface})


function J2SECacheInterface:keySet()
    error("abstract method keySet")
end

return J2SECacheInterface

