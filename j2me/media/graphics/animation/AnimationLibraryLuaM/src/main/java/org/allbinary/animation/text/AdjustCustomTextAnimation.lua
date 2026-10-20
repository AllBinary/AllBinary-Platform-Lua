-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.animation.text

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local CustomTextAnimation = require("org.allbinary.animation.text.CustomTextAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdjustCustomTextAnimation = {}
AdjustCustomTextAnimation.__index = AdjustCustomTextAnimation
AdjustCustomTextAnimation.className = "AdjustCustomTextAnimation"
setmetatable(AdjustCustomTextAnimation, {__index = CustomTextAnimation})

function AdjustCustomTextAnimation:_init_fields()
    self.dx = nil
    self.dy = nil
end


function AdjustCustomTextAnimation.new(text, fontSize, dx, dy, animationBehavior)
    local self = setmetatable(CustomTextAnimation.new(text, fontSize, animationBehavior), AdjustCustomTextAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.dx = dx
        self.dy = dy
    return self
end


function AdjustCustomTextAnimation:getDx()
        return self.dx
end


function AdjustCustomTextAnimation:setDx(dx)
        self.dx = dx
end


function AdjustCustomTextAnimation:getDy()
        return self.dy
end


function AdjustCustomTextAnimation:setDy(dy)
        self.dy = dy
end


function AdjustCustomTextAnimation:paintXY(graphics, x, y)
        CustomTextAnimation.paintXY(self, graphics, x + self.dx, y + self.dy)
end

return AdjustCustomTextAnimation

