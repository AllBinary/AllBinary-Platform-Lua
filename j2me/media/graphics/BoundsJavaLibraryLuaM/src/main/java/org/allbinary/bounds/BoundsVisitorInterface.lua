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
-- package org.allbinary.bounds


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
local BoundsVisitorInterface = {}
BoundsVisitorInterface.__index = BoundsVisitorInterface
BoundsVisitorInterface.className = "BoundsVisitorInterface"


function BoundsVisitorInterface:getX()
    error("abstract method getX")
end


function BoundsVisitorInterface:getY()
    error("abstract method getY")
end


function BoundsVisitorInterface:maxX()
    error("abstract method maxX")
end


function BoundsVisitorInterface:maxY()
    error("abstract method maxY")
end


function BoundsVisitorInterface:minX()
    error("abstract method minX")
end


function BoundsVisitorInterface:minY()
    error("abstract method minY")
end

return BoundsVisitorInterface

