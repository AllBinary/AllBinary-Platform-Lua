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

local RectangleFilledAnimation = {}
RectangleFilledAnimation.__index = RectangleFilledAnimation
RectangleFilledAnimation.className = "RectangleFilledAnimation"
setmetatable(RectangleFilledAnimation, {__index = Animation})

function RectangleFilledAnimation:_init_fields()
    self.widthP = nil
    self.heightP = nil
end


function RectangleFilledAnimation.new(width, height, basicColor)
    local self = setmetatable(Animation.new(), RectangleFilledAnimation)
    self:_init_fields()
        self.widthP = width
        self.heightP = height
        self:setBasicColorP(basicColor)
    return self
end


function RectangleFilledAnimation:nextFrame()
end


function RectangleFilledAnimation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
        graphics:fillRect(x, y, self.widthP, self.heightP)
end


function RectangleFilledAnimation:setWidth(width)
        self.widthP = width
end


function RectangleFilledAnimation:setHeight(height)
        self.heightP = height
end

return RectangleFilledAnimation

