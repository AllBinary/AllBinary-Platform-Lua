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
-- package org.allbinary.logic.util.cache

local CacheInterface = require("org.allbinary.logic.util.cache.CacheInterface")

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
local AutomaticCacheInterface = {}
AutomaticCacheInterface.__index = AutomaticCacheInterface
AutomaticCacheInterface.className = "AutomaticCacheInterface"
setmetatable(AutomaticCacheInterface, {__index = CacheInterface})


-- throws Exception
function AutomaticCacheInterface:get(key)
    error("abstract method get")
end

return AutomaticCacheInterface

