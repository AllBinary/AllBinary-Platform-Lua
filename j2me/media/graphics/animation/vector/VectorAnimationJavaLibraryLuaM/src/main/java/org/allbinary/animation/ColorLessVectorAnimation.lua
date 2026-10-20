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
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local VectorAnimation = require("org.allbinary.animation.VectorAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorLessVectorAnimation = {}
ColorLessVectorAnimation.__index = ColorLessVectorAnimation
ColorLessVectorAnimation.className = "ColorLessVectorAnimation"
setmetatable(ColorLessVectorAnimation, {__index = VectorAnimation})


function ColorLessVectorAnimation.new(currentPoints, animationBehavior)
    local self = setmetatable(VectorAnimation.new(currentPoints, BasicColorFactory.getInstance().WHITE, animationBehavior), ColorLessVectorAnimation)
        -- super(...) made self above
    return self
end


function ColorLessVectorAnimation:paintXY(graphics, x, y)
        self:paintVectors(graphics, x, y)
end

return ColorLessVectorAnimation

