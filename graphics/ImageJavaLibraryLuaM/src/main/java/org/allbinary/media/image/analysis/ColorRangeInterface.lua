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
-- package org.allbinary.media.image.analysis

-- local awt = require("java.awt")

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
local ColorRangeInterface = {}
ColorRangeInterface.__index = ColorRangeInterface
ColorRangeInterface.className = "ColorRangeInterface"


function ColorRangeInterface:getMinRed()
    error("abstract method getMinRed")
end


function ColorRangeInterface:setMinRed(minRed)
    error("abstract method setMinRed")
end


function ColorRangeInterface:getMaxRed()
    error("abstract method getMaxRed")
end


function ColorRangeInterface:setMaxRed(maxRed)
    error("abstract method setMaxRed")
end


function ColorRangeInterface:getMinGreen()
    error("abstract method getMinGreen")
end


function ColorRangeInterface:setMinGreen(minGreen)
    error("abstract method setMinGreen")
end


function ColorRangeInterface:getMaxGreen()
    error("abstract method getMaxGreen")
end


function ColorRangeInterface:setMaxGreen(maxGreen)
    error("abstract method setMaxGreen")
end


function ColorRangeInterface:getMinBlue()
    error("abstract method getMinBlue")
end


function ColorRangeInterface:setMinBlue(minBlue)
    error("abstract method setMinBlue")
end


function ColorRangeInterface:getMaxBlue()
    error("abstract method getMaxBlue")
end


function ColorRangeInterface:setMaxBlue(maxBlue)
    error("abstract method setMaxBlue")
end


function ColorRangeInterface:isInRange(color)
    error("abstract method isInRange")
end

return ColorRangeInterface

