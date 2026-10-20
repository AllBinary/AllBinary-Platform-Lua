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
-- package org.allbinary.media.image.comparison.motion

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")

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
local MotionRectangleConstraintsInterface = {}
MotionRectangleConstraintsInterface.__index = MotionRectangleConstraintsInterface
MotionRectangleConstraintsInterface.className = "MotionRectangleConstraintsInterface"


function MotionRectangleConstraintsInterface:getMaxMotionRectangles()
    error("abstract method getMaxMotionRectangles")
end


function MotionRectangleConstraintsInterface:getMinDimension()
    error("abstract method getMinDimension")
end


function MotionRectangleConstraintsInterface:getMinArea()
    error("abstract method getMinArea")
end


function MotionRectangleConstraintsInterface:getMaxDimension()
    error("abstract method getMaxDimension")
end


function MotionRectangleConstraintsInterface:isTooSmall(rectangle)
    error("abstract method isTooSmall")
end


function MotionRectangleConstraintsInterface:isAreaTooSmall(rectangle)
    error("abstract method isAreaTooSmall")
end


function MotionRectangleConstraintsInterface:isTooBig(rectangle)
    error("abstract method isTooBig")
end


-- throws Exception
function MotionRectangleConstraintsInterface:isValid(frame, bufferedImage, rectangle)
    error("abstract method isValid")
end

return MotionRectangleConstraintsInterface

