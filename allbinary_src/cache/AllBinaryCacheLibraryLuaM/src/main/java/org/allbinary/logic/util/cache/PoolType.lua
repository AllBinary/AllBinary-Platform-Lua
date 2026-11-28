-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2007 AllBinary 
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

local PoolType = {}
package.loaded["org.allbinary.logic.util.cache.PoolType"] = PoolType

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local CacheType = java_lazy("org.allbinary.logic.util.cache.CacheType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table PoolType is declared before the requires
PoolType.__index = PoolType
PoolType.className = "PoolType"
PoolType.javaClassName = "org.allbinary.logic.util.cache.PoolType"

function PoolType:_init_fields()
    if self.cacheType == nil then self.cacheType = nil end
end


function PoolType._jinit(self, cacheType)
    PoolType._init_fields(self)
        self.cacheType = cacheType
    return self
end

function PoolType.new(...)
    local self = setmetatable({}, PoolType)
    PoolType._jinit(self, ...)
    return self
end


function PoolType:getCacheType()
        return self.cacheType
end


function PoolType:toString()
        local POOL_TYPE = "PoolType: "
        return require("allbinary_java").to_string(POOL_TYPE) .. require("allbinary_java").to_string(tostring(self:getCacheType()))
end
PoolType.__tostring = function(self) return self:toString() end

return PoolType

