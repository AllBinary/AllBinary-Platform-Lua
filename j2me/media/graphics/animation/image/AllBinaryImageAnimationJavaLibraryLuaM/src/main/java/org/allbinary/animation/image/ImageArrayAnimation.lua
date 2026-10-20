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
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local Anchor = require("org.allbinary.graphics.Anchor")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
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

local ImageArrayAnimation = {}
ImageArrayAnimation.__index = ImageArrayAnimation
ImageArrayAnimation.className = "ImageArrayAnimation"
setmetatable(ImageArrayAnimation, {__index = IndexedAnimation})

function ImageArrayAnimation:_init_fields()
    self.imageArray = NullImage.NULL_IMAGE_ARRAY
    self.totalFrames = 0
    self.circularIndexUtil = CircularIndexUtil.NULL_CIRCULAR_INDEX_UTIL
    self.anchor = Anchor.TOP_LEFT
end


function ImageArrayAnimation.new(imageArray, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), ImageArrayAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:setImageArray(imageArray)
    return self
end


-- throws Exception
function ImageArrayAnimation:getAnimationSize()
        return self:getSize()
end


function ImageArrayAnimation:nextFrame()
        self.circularIndexUtil:next()
end


function ImageArrayAnimation:previousFrame()
        self.circularIndexUtil:previous()
end


function ImageArrayAnimation:setFrame(index)
        self.circularIndexUtil:setIndex(index)
end


function ImageArrayAnimation:getFrame()
        return self.circularIndexUtil:getIndex()
end


function ImageArrayAnimation:getSize()
        return self.totalFrames
end


function ImageArrayAnimation:setSequence(sequence)
end


function ImageArrayAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function ImageArrayAnimation:getImage(index)
        return self.imageArray[index + 1]
end


function ImageArrayAnimation:getImageArray()
        return self.imageArray
end


function ImageArrayAnimation:setImageArray(imageArray)
        self.imageArray = imageArray
        self.totalFrames = (imageArray.n or #imageArray)
        self.circularIndexUtil = CircularIndexUtil.createInstance(self.totalFrames)
end


function ImageArrayAnimation:paintXY(graphics, x, y)
        graphics:drawImage(self.imageArray[self.circularIndexUtil:getIndex() + 1], x, y, self.anchor)
end

return ImageArrayAnimation

