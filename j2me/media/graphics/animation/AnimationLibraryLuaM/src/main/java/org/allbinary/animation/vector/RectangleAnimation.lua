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

local RectangleAnimation = {}
RectangleAnimation.__index = RectangleAnimation
RectangleAnimation.className = "RectangleAnimation"
setmetatable(RectangleAnimation, {__index = Animation})

function RectangleAnimation:_init_fields()
    self.width = nil
    self.height = nil
end


function RectangleAnimation.new(width, height, basicColor)
    local self = setmetatable(Animation.new(), RectangleAnimation)
    self:_init_fields()
        self.width = width
        self.height = height
        self:setBasicColorP(basicColor)
    return self
end


function RectangleAnimation:nextFrame()
end


function RectangleAnimation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
        graphics:drawRect(x, y, self.width, self.height)
end


function RectangleAnimation:setWidth(width)
        self.width = width
end


function RectangleAnimation:setHeight(height)
        self.height = height
end

return RectangleAnimation

