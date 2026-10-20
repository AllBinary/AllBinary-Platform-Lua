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
-- package org.allbinary.animation.image

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local ImageArrayAnimation = require("org.allbinary.animation.image.ImageArrayAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdjustedImageArrayAnimation = {}
AdjustedImageArrayAnimation.__index = AdjustedImageArrayAnimation
AdjustedImageArrayAnimation.className = "AdjustedImageArrayAnimation"
setmetatable(AdjustedImageArrayAnimation, {__index = ImageArrayAnimation})

function AdjustedImageArrayAnimation:_init_fields()
    self.dx = 0
    self.dy = 0
end


function AdjustedImageArrayAnimation.new(imageArray, dx, dy, animationBehavior)
    local self = setmetatable(ImageArrayAnimation.new(imageArray, animationBehavior), AdjustedImageArrayAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:init(dx, dy)
    return self
end


-- throws Exception
function AdjustedImageArrayAnimation:init(dx, dy)
        self:setDx(dx)
        self:setDy(dy)
end


function AdjustedImageArrayAnimation:paintXY(graphics, x, y)
        ImageArrayAnimation.paintXY(self, graphics, x + self.dx, y + self.dy)
end


function AdjustedImageArrayAnimation:setDx(dx)
        self.dx = dx
end


function AdjustedImageArrayAnimation:getDx()
        return self.dx
end


function AdjustedImageArrayAnimation:setDy(dy)
        self.dy = dy
end


function AdjustedImageArrayAnimation:getDy()
        return self.dy
end

return AdjustedImageArrayAnimation

