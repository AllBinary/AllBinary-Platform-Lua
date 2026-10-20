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
-- package org.allbinary.media.image.comparison

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
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

-- Java interface
local ImageComparatorConstraintsInterface = {}
ImageComparatorConstraintsInterface.__index = ImageComparatorConstraintsInterface
ImageComparatorConstraintsInterface.className = "ImageComparatorConstraintsInterface"


function ImageComparatorConstraintsInterface:getMaxNonMatchingPixelDeltas()
    error("abstract method getMaxNonMatchingPixelDeltas")
end


function ImageComparatorConstraintsInterface:isCollisionWithAvoidRectangles(rectangle)
    error("abstract method isCollisionWithAvoidRectangles")
end


-- Java overloaded method: Lua keeps the last definition
function ImageComparatorConstraintsInterface:isCollisionWithAvoidRectangles(point)
    error("abstract method isCollisionWithAvoidRectangles")
end


function ImageComparatorConstraintsInterface:isColorAllowed(frame, point, color)
    error("abstract method isColorAllowed")
end


-- throws Exception
function ImageComparatorConstraintsInterface:isImageValid(bufferedImage)
    error("abstract method isImageValid")
end


function ImageComparatorConstraintsInterface:isFrameAllowed(frame)
    error("abstract method isFrameAllowed")
end

return ImageComparatorConstraintsInterface

