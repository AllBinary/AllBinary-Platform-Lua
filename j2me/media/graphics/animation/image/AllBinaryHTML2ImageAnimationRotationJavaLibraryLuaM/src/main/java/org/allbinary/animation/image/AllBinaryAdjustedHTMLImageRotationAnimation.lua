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
local AllBinaryHTMLImageRotationAnimation = require("org.allbinary.animation.image.AllBinaryHTMLImageRotationAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryAdjustedHTMLImageRotationAnimation = {}
AllBinaryAdjustedHTMLImageRotationAnimation.__index = AllBinaryAdjustedHTMLImageRotationAnimation
AllBinaryAdjustedHTMLImageRotationAnimation.className = "AllBinaryAdjustedHTMLImageRotationAnimation"
setmetatable(AllBinaryAdjustedHTMLImageRotationAnimation, {__index = AllBinaryHTMLImageRotationAnimation})

function AllBinaryAdjustedHTMLImageRotationAnimation:_init_fields()
    self.dx = 0
    self.dy = 0
end


function AllBinaryAdjustedHTMLImageRotationAnimation.new(originalImage, image, angleInfo, totalAngle, dx, dy, animationBehavior)
    local self = setmetatable(AllBinaryHTMLImageRotationAnimation.new(originalImage, image, angleInfo, totalAngle, animationBehavior), AllBinaryAdjustedHTMLImageRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:init(dx, dy)
    return self
end


-- throws Exception
function AllBinaryAdjustedHTMLImageRotationAnimation:init(dx, dy)
        self.dx = dx
        self.dy = dy
end


function AllBinaryAdjustedHTMLImageRotationAnimation:setDx(dx)
        self.dx = dx
end


function AllBinaryAdjustedHTMLImageRotationAnimation:getDx()
        return self.dx
end


function AllBinaryAdjustedHTMLImageRotationAnimation:setDy(dy)
        self.dy = dy
end


function AllBinaryAdjustedHTMLImageRotationAnimation:getDy()
        return self.dy
end


function AllBinaryAdjustedHTMLImageRotationAnimation:paintXY(graphics, x, y)
        AllBinaryHTMLImageRotationAnimation.paintXY(self, graphics, x + self.dx, y + self.dy)
end

return AllBinaryAdjustedHTMLImageRotationAnimation

