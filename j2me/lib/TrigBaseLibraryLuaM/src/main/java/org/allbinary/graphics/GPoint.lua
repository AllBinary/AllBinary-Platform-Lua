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

local JsType = require("jsinterop.annotations.JsType")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local PositionStrings = require("org.allbinary.math.PositionStrings")
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

local GPoint = {}
GPoint.__index = GPoint
GPoint.className = "GPoint"

function GPoint:_init_fields()
    self.x = nil
    self.y = nil
    self.z = nil
end


function GPoint.getInstance(point)
        return GPoint.new(point:getX(), point:getY(), point:getZ())
end


function GPoint.new(x, y, z)
    local self = setmetatable({}, GPoint)
    self:_init_fields()
        self.x = x
        self.y = y
        self.z = z
    return self
end


function GPoint:getX()
        return self.x
end


function GPoint:getY()
        return self.y
end


function GPoint:getZ()
        return self.z
end


function GPoint:getRawX()
        return self.x
end


function GPoint:getRawY()
        return self.y
end


function GPoint:getRawZ()
        return self.z
end


function GPoint:toString()
        return GPoint.toStringStatic(self:getX(), self:getY(), self:getZ())
end
GPoint.__tostring = function(self) return self:toString() end


function GPoint.toStringStatic(x, y, z)
        local stringBuffer = StringMaker.new()
        local positionStrings = PositionStrings.getInstance()
        stringBuffer:append(GPoint.POINT_LABEL)
        stringBuffer:append(positionStrings.X_LABEL)
        stringBuffer:appendint(x)
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(positionStrings.Y_LABEL)
        stringBuffer:appendint(y)
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(positionStrings.Z_LABEL)
        stringBuffer:appendint(z)
        return tostring(stringBuffer)
end

GPoint.POINT_LABEL = "Point: "

return GPoint

