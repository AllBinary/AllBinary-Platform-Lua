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
-- package org.allbinary.animation.image

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local ImageAnimation = require("org.allbinary.animation.image.ImageAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdjustedImageAnimation = {}
AdjustedImageAnimation.__index = AdjustedImageAnimation
AdjustedImageAnimation.className = "AdjustedImageAnimation"
setmetatable(AdjustedImageAnimation, {__index = ImageAnimation})

function AdjustedImageAnimation:_init_fields()
    self.dx = 0
    self.dy = 0
end


function AdjustedImageAnimation.new(image, dx, dy, animationBehavior)
    local self = setmetatable(ImageAnimation.new(image, animationBehavior), AdjustedImageAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:init(dx, dy)
    return self
end


-- throws Exception
function AdjustedImageAnimation:init(dx, dy)
        self:setDx(dx)
        self:setDy(dy)
end


function AdjustedImageAnimation:paintXY(graphics, x, y)
        ImageAnimation.paintXY(self, graphics, x + self.dx, y + self.dy)
end


function AdjustedImageAnimation:setDx(dx)
        self.dx = dx
end


function AdjustedImageAnimation:getDx()
        return self.dx
end


function AdjustedImageAnimation:setDy(dy)
        self.dy = dy
end


function AdjustedImageAnimation:getDy()
        return self.dy
end

return AdjustedImageAnimation

