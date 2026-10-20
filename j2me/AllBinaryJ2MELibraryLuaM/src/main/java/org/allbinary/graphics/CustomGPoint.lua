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

local GPoint = require("org.allbinary.graphics.GPoint")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomGPoint = {}
CustomGPoint.__index = CustomGPoint
CustomGPoint.className = "CustomGPoint"
setmetatable(CustomGPoint, {__index = GPoint})

function CustomGPoint:_init_fields()
    self.cx = 0
    self.cy = 0
    self.cz = 0
end


function CustomGPoint.getInstance(point)
        return CustomGPoint.new(point:getX(), point:getY(), point:getZ())
end


function CustomGPoint.getInstance3(x, y)
        return CustomGPoint.new(x, y, 3)
end


function CustomGPoint.new(x, y, z)
    local self = setmetatable(GPoint.new(x, y, z), CustomGPoint)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function CustomGPoint:setX(x)
        self.cx = x
end


function CustomGPoint:getX()
        return self.cx
end


function CustomGPoint:setY(y)
        self.cy = y
end


function CustomGPoint:getY()
        return self.cy
end


function CustomGPoint:setZ(z)
        self.cz = z
end


function CustomGPoint:getZ()
        return self.cz
end

CustomGPoint.NULL_CUSTOM_POINT = CustomGPoint.new(0, 0, 0)

return CustomGPoint

