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

local CircleFilledAnimation = {}
CircleFilledAnimation.__index = CircleFilledAnimation
CircleFilledAnimation.className = "CircleFilledAnimation"
setmetatable(CircleFilledAnimation, {__index = Animation})

function CircleFilledAnimation:_init_fields()
    self.width = nil
    self.height = nil
end


function CircleFilledAnimation.new(width, height, basicColor)
    local self = setmetatable(Animation.new(), CircleFilledAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.width = width
        self.height = height
        self:setBasicColorP(basicColor)
    return self
end


function CircleFilledAnimation:nextFrame()
end


function CircleFilledAnimation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
        graphics:fillRect(x, y, self.width, self.height)
end

return CircleFilledAnimation

