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
-- package org.allbinary.animation

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local LocationPaintableInterface = require("org.allbinary.graphics.paint.LocationPaintableInterface")

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
local AnimationInterface = {}
AnimationInterface.__index = AnimationInterface
AnimationInterface.className = "AnimationInterface"
setmetatable(AnimationInterface, {__index = LocationPaintableInterface})


-- throws Exception
function AnimationInterface:nextFrame()
    error("abstract method nextFrame")
end


function AnimationInterface:paintThreedXYZ(graphics, x, y, z)
    error("abstract method paintThreedXYZ")
end

return AnimationInterface

