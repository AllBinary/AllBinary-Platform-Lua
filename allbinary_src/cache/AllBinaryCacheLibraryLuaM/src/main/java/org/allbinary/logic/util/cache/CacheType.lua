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

local CacheType = {}
package.loaded["org.allbinary.logic.util.cache.CacheType"] = CacheType

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

-- class table CacheType is declared before the requires
CacheType.__index = CacheType
CacheType.className = "CacheType"
CacheType.javaClassName = "org.allbinary.logic.util.cache.CacheType"

function CacheType:_init_fields()
    if self.vendor == nil then self.vendor = nil end
    if self.type == nil then self.type = nil end
end


function CacheType._jinit(self, vendor, type)
    CacheType._init_fields(self)
        self.vendor = vendor
        self.type = type
    return self
end

function CacheType.new(...)
    local self = setmetatable({}, CacheType)
    CacheType._jinit(self, ...)
    return self
end


function CacheType:getVendor()
        return self.vendor
end


function CacheType:getType()
        return self.type
end


function CacheType:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("CacheType: Vendor: ")
        stringBuffer:append(self:getVendor())
        stringBuffer:append(" Type: ")
        stringBuffer:append(self:getType())
        return tostring(stringBuffer)
end
CacheType.__tostring = function(self) return self:toString() end

return CacheType

