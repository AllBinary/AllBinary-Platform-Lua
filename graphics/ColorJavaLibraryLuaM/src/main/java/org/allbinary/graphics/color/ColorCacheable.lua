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
-- package org.allbinary.graphics.color

local ColorCacheable = {}
package.loaded["org.allbinary.graphics.color.ColorCacheable"] = ColorCacheable

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

-- local Color = require("java.awt.Color")
local CacheableInterface = java_lazy("org.allbinary.logic.util.cache.CacheableInterface")

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

-- class table ColorCacheable is declared before the requires
ColorCacheable.__index = ColorCacheable
ColorCacheable.className = "ColorCacheable"
ColorCacheable.javaClassName = "org.allbinary.graphics.color.ColorCacheable"
ColorCacheable.java_implements = " CacheableInterface "
ColorCacheable.java_interfaces = function() return {CacheableInterface} end

function ColorCacheable:_init_fields()
    if self.key == nil then self.key = nil end
    if self.color == nil then self.color = nil end
end


function ColorCacheable._jinit(self, key)
    ColorCacheable._init_fields(self)
        self.key = key
        self.color = Color.new(math.tointeger((key) // 1))
    return self
end

function ColorCacheable.new(...)
    local self = setmetatable({}, ColorCacheable)
    ColorCacheable._jinit(self, ...)
    return self
end


function ColorCacheable:getKey()
        return self.key
end


function ColorCacheable:getColor()
        return self.color
end


function ColorCacheable:setColor(color)
        self.color = color
end

return ColorCacheable

