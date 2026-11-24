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

local CachePolicyFactory = {}
package.loaded["org.allbinary.logic.util.cache.CachePolicyFactory"] = CachePolicyFactory

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

local CachePolicy = java_lazy("org.allbinary.logic.util.cache.CachePolicy")

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

-- class table CachePolicyFactory is declared before the requires
CachePolicyFactory.__index = CachePolicyFactory
CachePolicyFactory.className = "CachePolicyFactory"
CachePolicyFactory.javaClassName = "org.allbinary.logic.util.cache.CachePolicyFactory"

function CachePolicyFactory:_init_fields()
    self.NAME = "lru"
    self.MAX_TIME_THOUSAND_MAX = CachePolicy.new(self.NAME, require("java.lang.Long").MAX_VALUE, 1000)
    self.THIRTY_MINUTES_TEN_THOUSAND_MAX = CachePolicy.new(self.NAME, 1000 * 60 * 30, 10000)
    self.THIRTY_MINUTES_FIFTY_THOUSAND_MAX = CachePolicy.new(self.NAME, 1000 * 60 * 30, 100000)
    self.ONE_MINUTE_FIVE_MAX = CachePolicy.new(self.NAME, 1000 * 60 * 1, 5)
    self.ONE_MINUTE_TEN_MAX = CachePolicy.new(self.NAME, 1000 * 60 * 1, 10)
    self.ONE_MINUTE_ONE_HUNDRED_MAX = CachePolicy.new(self.NAME, 1000 * 60 * 1, 100)
end

function CachePolicyFactory._jinit(self)
    CachePolicyFactory._init_fields(self)
    return self
end

function CachePolicyFactory.new()
    return CachePolicyFactory._jinit(setmetatable({}, CachePolicyFactory))
end


function CachePolicyFactory.getInstance()
        return CachePolicyFactory.instance_f
end

CachePolicyFactory.instance_f = CachePolicyFactory.new()

return CachePolicyFactory

