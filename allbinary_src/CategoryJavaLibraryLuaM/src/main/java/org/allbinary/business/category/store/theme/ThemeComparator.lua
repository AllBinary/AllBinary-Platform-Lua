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
-- package org.allbinary.business.category.store.theme

local ThemeComparator = {}
package.loaded["org.allbinary.business.category.store.theme.ThemeComparator"] = ThemeComparator

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

-- local Comparator = require("java.util.Comparator")

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

-- class table ThemeComparator is declared before the requires
ThemeComparator.__index = ThemeComparator
ThemeComparator.className = "ThemeComparator"
ThemeComparator.javaClassName = "org.allbinary.business.category.store.theme.ThemeComparator"
ThemeComparator.java_implements = " Comparator "
ThemeComparator.java_interfaces = function() return {Comparator} end


function ThemeComparator._jinit(self)
    return self
end

function ThemeComparator.new(...)
    local self = setmetatable({}, ThemeComparator)
    ThemeComparator._jinit(self, ...)
    return self
end


function ThemeComparator:compare(anyType, object2)
        local string_ = anyType
        local string2 = object2
        return ((string_ < string2 and -1) or (string_ > string2 and 1) or 0)
end

return ThemeComparator

