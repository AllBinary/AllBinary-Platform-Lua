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
-- package org.allbinary.animation.vector

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ColorCompositeInterface = require("org.allbinary.graphics.color.ColorCompositeInterface")
local RectangleFilledAnimation = require("org.allbinary.animation.vector.RectangleFilledAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RectangleFilledAdjustedAnimation = {}
RectangleFilledAdjustedAnimation.__index = RectangleFilledAdjustedAnimation
RectangleFilledAdjustedAnimation.className = "RectangleFilledAdjustedAnimation"
setmetatable(RectangleFilledAdjustedAnimation, {__index = RectangleFilledAnimation})

function RectangleFilledAdjustedAnimation:_init_fields()
    self.offsetX = nil
    self.offsetY = nil
end


function RectangleFilledAdjustedAnimation.new(width, height, offsetX, offsetY, basicColor)
    local self = setmetatable(RectangleFilledAnimation.new(width, height, basicColor), RectangleFilledAdjustedAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.offsetX = offsetX
        self.offsetY = offsetY
        self:setBasicColorP(basicColor)
    return self
end


function RectangleFilledAdjustedAnimation:nextFrame()
end


function RectangleFilledAdjustedAnimation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
        RectangleFilledAnimation.paintXY(self, graphics, x + self.offsetX, y + self.offsetY)
end


function RectangleFilledAdjustedAnimation:setOffsetX(offsetX)
        self.offsetX = offsetX
end


function RectangleFilledAdjustedAnimation:setOffsetY(offsetY)
        self.offsetY = offsetY
end

return RectangleFilledAdjustedAnimation

