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
-- package org.allbinary.graphics

local Rectangle = {}
package.loaded["org.allbinary.graphics.Rectangle"] = Rectangle

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
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")

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

-- class table Rectangle is declared before the requires
Rectangle.__index = Rectangle
Rectangle.className = "Rectangle"
Rectangle.javaClassName = "org.allbinary.graphics.Rectangle"

function Rectangle:_init_fields()
    if self.point == nil then self.point = nil end
    if self.width == nil then self.width = nil end
    if self.height == nil then self.height = nil end
end


function Rectangle._jinit(self, point, width, height)
    Rectangle._init_fields(self)
        self.point = point
        self.width = width
        self.height = height
    return self
end

function Rectangle.new(...)
    local self = setmetatable({}, Rectangle)
    Rectangle._jinit(self, ...)
    return self
end


function Rectangle:getPoint()
        return self.point
end


function Rectangle:setPoint(point)
        self.point = point
end


function Rectangle:getMaxX()
        return self.point:getX() + self.width
end


function Rectangle:getMaxY()
        return self.point:getY() + self.height
end


function Rectangle:getWidth()
        return self.width
end


function Rectangle:setWidth(width)
        self.width = width
end


function Rectangle:getHeight()
        return self.height
end


function Rectangle:setHeight(height)
        self.height = height
end


function Rectangle:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(self:getPoint()))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(CommonLabels.getInstance().WIDTH_LABEL)
        stringBuffer:appendint(self:getWidth())
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(CommonLabels.getInstance().HEIGHT_LABEL)
        stringBuffer:appendint(self:getHeight())
        stringBuffer:append(" MaxX: ")
        stringBuffer:appendint(self:getMaxX())
        stringBuffer:append(" MaxY: ")
        stringBuffer:appendint(self:getMaxY())
        return tostring(stringBuffer)
end
Rectangle.__tostring = function(self) return self:toString() end

return Rectangle

