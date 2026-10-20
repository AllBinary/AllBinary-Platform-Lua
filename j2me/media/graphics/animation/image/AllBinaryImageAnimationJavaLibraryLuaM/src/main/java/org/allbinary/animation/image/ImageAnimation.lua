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
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local Anchor = require("org.allbinary.graphics.Anchor")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageAnimation = {}
ImageAnimation.__index = ImageAnimation
ImageAnimation.className = "ImageAnimation"
setmetatable(ImageAnimation, {__index = IndexedAnimation})

function ImageAnimation:_init_fields()
    self.image = nil
    self.anchor = Anchor.TOP_LEFT
end


function ImageAnimation.new(image, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), ImageAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.image = image
    return self
end


-- throws Exception
function ImageAnimation:getAnimationSize()
        return self:getSize()
end


function ImageAnimation:nextFrame()
end


function ImageAnimation:previousFrame()
end


function ImageAnimation:setFrame(index)
end


function ImageAnimation:getFrame()
        return 0
end


function ImageAnimation:getSize()
        return 1
end


function ImageAnimation:setSequence(sequence)
end


function ImageAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function ImageAnimation:paintXY(graphics, x, y)
        graphics:drawImage(self.image, x, y, self.anchor)
end


function ImageAnimation:getImage()
        return self.image
end


-- throws Exception
function ImageAnimation:close()
        DisposalUtil.getInstance():disposeImage(self.image)
end


-- throws Throwable
function ImageAnimation:finalize()
        DisposalUtil.getInstance():disposeImage(self.image)
end

return ImageAnimation

