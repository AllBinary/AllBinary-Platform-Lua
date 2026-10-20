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
-- package org.allbinary.collision

-- local awt = require("java.awt")
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

local RectangleCollisionUtil = {}
RectangleCollisionUtil.__index = RectangleCollisionUtil
RectangleCollisionUtil.className = "RectangleCollisionUtil"


function RectangleCollisionUtil.new()
    local self = setmetatable({}, RectangleCollisionUtil)
    return self
end


function RectangleCollisionUtil.isCollision(rectangle, point)
        if point:getX() > (java_int(rectangle.x) + rectangle:getWidth()) or point:getY() > (java_int(rectangle.y) + rectangle:getHeight()) or point:getX() < rectangle.x or point:getY() < rectangle.y then
            return false
        else
            return true
        end
end


-- Java overloaded method: Lua keeps the last definition
function RectangleCollisionUtil.isCollision(rectangle1, rectangle2)
        return RectangleCollisionUtil.isCollision(rectangle1.x, rectangle1.y, rectangle1.x + rectangle1.width, rectangle1.y + rectangle1.height, rectangle2.x, rectangle2.y, rectangle2.x + rectangle2.width, rectangle2.y + rectangle2.height)
end


-- Java overloaded method: Lua keeps the last definition
function RectangleCollisionUtil.isCollision(rectX1, rectY1, rectX2, rectY2, rect2X1, rect2Y1, rect2X2, rect2Y2)
        if rect2X1 >= rectX2 or rect2Y1 >= rectY2 or rect2X2 <= rectX1 or rect2Y2 <= rectY1 then
            return false
        else
            return true
        end
end

return RectangleCollisionUtil

