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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Rectangle = {}
Rectangle.__index = Rectangle
Rectangle.className = "Rectangle"

function Rectangle:_init_fields()
    self.point = nil
    self.width = nil
    self.height = nil
end


function Rectangle.new(point, width, height)
    local self = setmetatable({}, Rectangle)
    self:_init_fields()
        self.point = point
        self.width = width
        self.height = height
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

