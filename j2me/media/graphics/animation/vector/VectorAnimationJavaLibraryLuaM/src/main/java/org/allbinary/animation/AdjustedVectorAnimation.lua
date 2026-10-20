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
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
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

local AdjustedVectorAnimation = {}
AdjustedVectorAnimation.__index = AdjustedVectorAnimation
AdjustedVectorAnimation.className = "AdjustedVectorAnimation"
setmetatable(AdjustedVectorAnimation, {__index = VectorAnimation})

function AdjustedVectorAnimation:_init_fields()
    self.dx = nil
    self.dy = nil
end


function AdjustedVectorAnimation.new(currentPoints, basicColor, dx, dy, animationBehavior)
    local self = setmetatable(VectorAnimation.new(currentPoints, basicColor, animationBehavior), AdjustedVectorAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.dx = dx
        self.dy = dy
    return self
end


function AdjustedVectorAnimation:paintXY(graphics, x, y)
        VectorAnimation.paintXY(self, graphics, x + self.dx, y + self.dy)
end

return AdjustedVectorAnimation

