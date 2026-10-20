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
local RightToLeftImageAnimation = require("org.allbinary.animation.image.RightToLeftImageAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdjustedRightToLeftImageAnimation = {}
AdjustedRightToLeftImageAnimation.__index = AdjustedRightToLeftImageAnimation
AdjustedRightToLeftImageAnimation.className = "AdjustedRightToLeftImageAnimation"
setmetatable(AdjustedRightToLeftImageAnimation, {__index = RightToLeftImageAnimation})

function AdjustedRightToLeftImageAnimation:_init_fields()
    self.dx = 0
    self.dy = 0
end


function AdjustedRightToLeftImageAnimation.new(image, dx, dy, animationBehavior)
    local self = setmetatable(RightToLeftImageAnimation.new(image, animationBehavior), AdjustedRightToLeftImageAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:init(dx, dy)
    return self
end


-- throws Exception
function AdjustedRightToLeftImageAnimation:init(dx, dy)
        self.dx = dx
        self.dy = dy
end


function AdjustedRightToLeftImageAnimation:paintXY(graphics, x, y)
        RightToLeftImageAnimation.paintXY(self, graphics, x + self.dx, y + self.dy)
end

return AdjustedRightToLeftImageAnimation

