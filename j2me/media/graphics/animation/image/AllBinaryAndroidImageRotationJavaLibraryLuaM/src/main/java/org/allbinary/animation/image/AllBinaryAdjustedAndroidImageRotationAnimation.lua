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
local AllBinaryFlickerAndroidImageRotationAnimation = require("org.allbinary.animation.image.AllBinaryFlickerAndroidImageRotationAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryAdjustedAndroidImageRotationAnimation = {}
AllBinaryAdjustedAndroidImageRotationAnimation.__index = AllBinaryAdjustedAndroidImageRotationAnimation
AllBinaryAdjustedAndroidImageRotationAnimation.className = "AllBinaryAdjustedAndroidImageRotationAnimation"
setmetatable(AllBinaryAdjustedAndroidImageRotationAnimation, {__index = AllBinaryFlickerAndroidImageRotationAnimation})

function AllBinaryAdjustedAndroidImageRotationAnimation:_init_fields()
    self.dx = 0
    self.dy = 0
end


function AllBinaryAdjustedAndroidImageRotationAnimation.new(originalImage, image, angleInfo, totalAngle, dx, dy, animationBehavior)
    local self = setmetatable(AllBinaryFlickerAndroidImageRotationAnimation.new(originalImage, image, angleInfo, totalAngle, animationBehavior), AllBinaryAdjustedAndroidImageRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:init(dx, dy)
    return self
end


-- throws Exception
function AllBinaryAdjustedAndroidImageRotationAnimation:init(dx, dy)
        self.dx = dx
        self.dy = dy
end


function AllBinaryAdjustedAndroidImageRotationAnimation:setDx(dx)
        self.dx = dx
end


function AllBinaryAdjustedAndroidImageRotationAnimation:getDx()
        return self.dx
end


function AllBinaryAdjustedAndroidImageRotationAnimation:setDy(dy)
        self.dy = dy
end


function AllBinaryAdjustedAndroidImageRotationAnimation:getDy()
        return self.dy
end


function AllBinaryAdjustedAndroidImageRotationAnimation:paintXY(graphics, x, y)
        AllBinaryFlickerAndroidImageRotationAnimation.paintXY(self, graphics, x + self.dx, y + self.dy)
end

return AllBinaryAdjustedAndroidImageRotationAnimation

