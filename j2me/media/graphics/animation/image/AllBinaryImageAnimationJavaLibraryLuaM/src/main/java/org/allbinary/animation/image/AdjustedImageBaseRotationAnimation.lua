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
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ImageBaseRotationAnimation = require("org.allbinary.animation.image.ImageBaseRotationAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdjustedImageBaseRotationAnimation = {}
AdjustedImageBaseRotationAnimation.__index = AdjustedImageBaseRotationAnimation
AdjustedImageBaseRotationAnimation.className = "AdjustedImageBaseRotationAnimation"
setmetatable(AdjustedImageBaseRotationAnimation, {__index = ImageBaseRotationAnimation})

function AdjustedImageBaseRotationAnimation:_init_fields()
    self.dx = 0
    self.dy = 0
end


function AdjustedImageBaseRotationAnimation.new(image, angleInfo, totalAngle, dx, dy, animationBehavior)
    local self = setmetatable(ImageBaseRotationAnimation.new(image, angleInfo, totalAngle, animationBehavior), AdjustedImageBaseRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:init(dx, dy)
    return self
end


-- throws Exception
function AdjustedImageBaseRotationAnimation:init(dx, dy)
        self.dx = dx
        self.dy = dy
end


function AdjustedImageBaseRotationAnimation:paintXY(graphics, x, y)
        ImageBaseRotationAnimation.paintXY(self, graphics, x + self.dx, y + self.dy)
end

return AdjustedImageBaseRotationAnimation

