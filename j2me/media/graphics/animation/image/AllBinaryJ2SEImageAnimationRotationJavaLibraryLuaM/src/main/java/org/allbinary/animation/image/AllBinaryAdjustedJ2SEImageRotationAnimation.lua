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
local AllBinaryJ2SEImageRotationAnimation = require("org.allbinary.animation.image.AllBinaryJ2SEImageRotationAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryAdjustedJ2SEImageRotationAnimation = {}
AllBinaryAdjustedJ2SEImageRotationAnimation.__index = AllBinaryAdjustedJ2SEImageRotationAnimation
AllBinaryAdjustedJ2SEImageRotationAnimation.className = "AllBinaryAdjustedJ2SEImageRotationAnimation"
setmetatable(AllBinaryAdjustedJ2SEImageRotationAnimation, {__index = AllBinaryJ2SEImageRotationAnimation})

function AllBinaryAdjustedJ2SEImageRotationAnimation:_init_fields()
    self.dx = 0
    self.dy = 0
end


function AllBinaryAdjustedJ2SEImageRotationAnimation.new(originalImage, image, angleInfo, totalAngle, dx, dy, animationBehavior)
    local self = setmetatable(AllBinaryJ2SEImageRotationAnimation.new(originalImage, image, angleInfo, totalAngle, animationBehavior), AllBinaryAdjustedJ2SEImageRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:init(dx, dy)
    return self
end


-- throws Exception
function AllBinaryAdjustedJ2SEImageRotationAnimation:init(dx, dy)
        self.dx = dx
        self.dy = dy
end


function AllBinaryAdjustedJ2SEImageRotationAnimation:setDx(dx)
        self.dx = dx
end


function AllBinaryAdjustedJ2SEImageRotationAnimation:getDx()
        return self.dx
end


function AllBinaryAdjustedJ2SEImageRotationAnimation:setDy(dy)
        self.dy = dy
end


function AllBinaryAdjustedJ2SEImageRotationAnimation:getDy()
        return self.dy
end


function AllBinaryAdjustedJ2SEImageRotationAnimation:paintXY(graphics, x, y)
        AllBinaryJ2SEImageRotationAnimation.paintXY(self, graphics, x + self.dx, y + self.dy)
end

return AllBinaryAdjustedJ2SEImageRotationAnimation

