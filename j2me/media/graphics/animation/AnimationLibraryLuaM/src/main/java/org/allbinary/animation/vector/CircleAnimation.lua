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
local AngleFactory = require("org.allbinary.math.AngleFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CircleAnimation = {}
CircleAnimation.__index = CircleAnimation
CircleAnimation.className = "CircleAnimation"
setmetatable(CircleAnimation, {__index = Animation})

function CircleAnimation:_init_fields()
    self.TOTAL_ANGLE = java_int(AngleFactory.getInstance().TOTAL_ANGLE)
    self.width = nil
    self.height = nil
end


function CircleAnimation.new(width, height, basicColor)
    local self = setmetatable(Animation.new(), CircleAnimation)
    self:_init_fields()
        self.width = width
        self.height = height
        self:setBasicColorP(basicColor)
    return self
end


function CircleAnimation:nextFrame()
end


function CircleAnimation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
        graphics:drawArc(x, y, self.width, self.height, 0, self.TOTAL_ANGLE)
end

return CircleAnimation

