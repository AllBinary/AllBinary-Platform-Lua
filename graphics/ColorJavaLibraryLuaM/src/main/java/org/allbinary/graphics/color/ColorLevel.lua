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
-- package org.allbinary.graphics.color


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorLevel = {}
ColorLevel.__index = ColorLevel
ColorLevel.className = "ColorLevel"


function ColorLevel.new()
    local self = setmetatable({}, ColorLevel)
    return self
end

ColorLevel.COLOR_MASK = 0x00FFFFFF
ColorLevel.MIN = 0x44
ColorLevel.AVG = 0x77
ColorLevel.LIGHT = 0xAA
ColorLevel.HIGH = 0xEE

return ColorLevel

