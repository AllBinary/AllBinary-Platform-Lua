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
-- package org.allbinary.animation.caption

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CaptionAnimation = {}
CaptionAnimation.__index = CaptionAnimation
CaptionAnimation.className = "CaptionAnimation"
setmetatable(CaptionAnimation, {__index = Animation})

function CaptionAnimation:_init_fields()
    self.animationInterface = nil
    self.overlayAnimationInterface = nil
    self.captionDx = nil
    self.captionDy = nil
    self.dx = nil
    self.dy = nil
end


function CaptionAnimation.new(animationInterface, overlayAnimationInterface, captionDx, captionDy, dx, dy)
    local self = setmetatable(Animation.new(), CaptionAnimation)
    self:_init_fields()
        self.animationInterface = animationInterface
        self.overlayAnimationInterface = overlayAnimationInterface
        self.captionDx = captionDx
        self.captionDy = captionDy
        self.dx = dx
        self.dy = dy
    return self
end


-- throws Exception
function CaptionAnimation:nextFrame()
end


function CaptionAnimation:paintXY(graphics, x, y)
        self.animationInterface:paintXY(graphics, x + self.captionDx, y + self.captionDy)
        self.overlayAnimationInterface:paintXY(graphics, x + self.captionDx + self.dx, y + self.captionDy + self.dy)
end


function CaptionAnimation:paintThreedXYZ(graphics, x, y, z)
        self.animationInterface:paintThreedXYZ(graphics, x + self.captionDx, y + self.captionDy, z)
        self.overlayAnimationInterface:paintThreedXYZ(graphics, x + self.captionDx + self.dx, y + self.captionDy + self.dy, z)
end

return CaptionAnimation

