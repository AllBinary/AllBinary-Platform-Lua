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
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
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

local ImageSegmentAnimation = {}
ImageSegmentAnimation.__index = ImageSegmentAnimation
ImageSegmentAnimation.className = "ImageSegmentAnimation"
setmetatable(ImageSegmentAnimation, {__index = ImageAnimation})

function ImageSegmentAnimation:_init_fields()
    self.startX = nil
    self.startY = nil
    self.drawWidth = nil
    self.drawHeight = nil
    self.circularIndexUtil = nil
    self.sequenceArray = nil
end


function ImageSegmentAnimation.new(image, sequenceArray, animationBehavior)
    local self = setmetatable(ImageAnimation.new(image, animationBehavior), ImageSegmentAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.startX = 0
        self.startY = 0
        self.drawWidth = self:getImage():getWidth()
        self.drawHeight = self:getImage():getHeight()
        self.circularIndexUtil = CircularIndexUtil.createInstance(self.drawHeight)
        self.sequenceArray = sequenceArray
    return self
end


function ImageSegmentAnimation:nextFrame()
        self.circularIndexUtil:next()
end


function ImageSegmentAnimation:previousFrame()
        self.circularIndexUtil:previous()
end


function ImageSegmentAnimation:setFrame(index)
        self.circularIndexUtil:setIndex(index)
end


function ImageSegmentAnimation:getFrame()
        return self.circularIndexUtil:getIndex()
end


function ImageSegmentAnimation:getSize()
        return self.circularIndexUtil:getSize()
end


function ImageSegmentAnimation:setSequence(sequenceArray)
        self.sequenceArray = sequenceArray
end


function ImageSegmentAnimation:getSequence()
        return self.sequenceArray
end


function ImageSegmentAnimation:paintXY(graphics, x, y)
end


function ImageSegmentAnimation:getStartX()
        return self.startX
end


function ImageSegmentAnimation:setStartX(startX)
        self.startX = startX
end


function ImageSegmentAnimation:getStartY()
        return self.startY
end


function ImageSegmentAnimation:setStartY(startY)
        self.startY = startY
end


function ImageSegmentAnimation:getDrawWidth()
        return self.drawWidth
end


function ImageSegmentAnimation:setDrawWidth(drawWidth)
        self.drawWidth = drawWidth
end


function ImageSegmentAnimation:getDrawHeight()
        return self.drawHeight
end


function ImageSegmentAnimation:setDrawHeight(drawHeight)
        self.drawHeight = drawHeight
end

return ImageSegmentAnimation

