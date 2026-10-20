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

-- local awt = require("java.awt")
local CacheableInterface = require("org.allbinary.logic.util.cache.CacheableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorCacheable = {}
ColorCacheable.__index = ColorCacheable
ColorCacheable.className = "ColorCacheable"

function ColorCacheable:_init_fields()
    self.key = nil
    self.color = nil
end


function ColorCacheable.new(key)
    local self = setmetatable({}, ColorCacheable)
    self:_init_fields()
        self.key = key
        self.color = Color.new(math.tointeger((key) // 1))
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

