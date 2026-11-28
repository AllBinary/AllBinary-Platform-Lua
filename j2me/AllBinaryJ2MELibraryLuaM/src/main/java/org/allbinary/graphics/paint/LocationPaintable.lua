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
-- package org.allbinary.graphics.paint

local LocationPaintable = {}
package.loaded["org.allbinary.graphics.paint.LocationPaintable"] = LocationPaintable

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local LocationPaintableInterface = require("org.allbinary.graphics.paint.LocationPaintableInterface")

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

-- class table LocationPaintable is declared before the requires
LocationPaintable.__index = LocationPaintable
LocationPaintable.className = "LocationPaintable"
LocationPaintable.javaClassName = "org.allbinary.graphics.paint.LocationPaintable"
LocationPaintable.java_implements = " LocationPaintableInterface "
LocationPaintable.java_interfaces = function() return {LocationPaintableInterface} end

function LocationPaintable._jinit(self)
    return self
end

function LocationPaintable.new()
    return LocationPaintable._jinit(setmetatable({}, LocationPaintable))
end


function LocationPaintable.getInstance()
        return LocationPaintable.instance_f
end


function LocationPaintable:paintXY(graphics, x, y)
end

LocationPaintable.instance_f = LocationPaintable.new()

return LocationPaintable

