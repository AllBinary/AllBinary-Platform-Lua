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
local Animation = require("org.allbinary.animation.Animation")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ColorCompositeInterface = require("org.allbinary.graphics.color.ColorCompositeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RectangleAdjustedAnimation = {}
RectangleAdjustedAnimation.__index = RectangleAdjustedAnimation
RectangleAdjustedAnimation.className = "RectangleAdjustedAnimation"
setmetatable(RectangleAdjustedAnimation, {__index = Animation})

function RectangleAdjustedAnimation:_init_fields()
    self.width = nil
    self.height = nil
    self.offsetX = nil
    self.offsetY = nil
end


function RectangleAdjustedAnimation.new(width, height, offsetX, offsetY, basicColor)
    local self = setmetatable(Animation.new(), RectangleAdjustedAnimation)
    self:_init_fields()
        self.width = width
        self.height = height
        self.offsetX = offsetX
        self.offsetY = offsetY
        self:setBasicColorP(basicColor)
    return self
end


function RectangleAdjustedAnimation:nextFrame()
end


function RectangleAdjustedAnimation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
        graphics:drawRect(x + self.offsetX, y + self.offsetY, self.width, self.height)
end


function RectangleAdjustedAnimation:setWidth(width)
        self.width = width
end


function RectangleAdjustedAnimation:setHeight(height)
        self.height = height
end


function RectangleAdjustedAnimation:setOffsetX(offsetX)
        self.offsetX = offsetX
end


function RectangleAdjustedAnimation:setOffsetY(offsetY)
        self.offsetY = offsetY
end

return RectangleAdjustedAnimation

