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
local DisposalUtil = require("org.allbinary.DisposalUtil")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local Anchor = require("org.allbinary.graphics.Anchor")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageBaseRotationAnimation = {}
ImageBaseRotationAnimation.__index = ImageBaseRotationAnimation
ImageBaseRotationAnimation.className = "ImageBaseRotationAnimation"
setmetatable(ImageBaseRotationAnimation, {__index = RotationAnimation})

function ImageBaseRotationAnimation:_init_fields()
    self.image = nil
    self.anchor = Anchor.TOP_LEFT
end


function ImageBaseRotationAnimation.new(image, angleInfo, totalAngle, animationBehavior)
    local self = setmetatable(RotationAnimation.new(angleInfo, CircularIndexUtil.createInstance(totalAngle / angleInfo:getAngleIncrementInfo():getAngleIncrement()), animationBehavior), ImageBaseRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.image = image
    return self
end


-- throws Exception
function ImageBaseRotationAnimation:getAnimationSize()
        return self:getSize()
end


function ImageBaseRotationAnimation:setSequence(sequence)
end


function ImageBaseRotationAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function ImageBaseRotationAnimation:paintXY(graphics, x, y)
        graphics:drawImage(self.image, x, y, self.anchor)
end


function ImageBaseRotationAnimation:getImage()
        return self.image
end


function ImageBaseRotationAnimation:getWidth()
        return self.image:getWidth()
end


function ImageBaseRotationAnimation:getHeight()
        return self.image:getHeight()
end


-- throws Exception
function ImageBaseRotationAnimation:close()
        DisposalUtil.getInstance():disposeImage(self.image)
end


-- throws Throwable
function ImageBaseRotationAnimation:finalize()
        DisposalUtil.getInstance():disposeImage(self.image)
end

return ImageBaseRotationAnimation

