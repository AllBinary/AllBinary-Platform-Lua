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
local AndroidUtil = require("org.allbinary.AndroidUtil")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CircleAnimation = require("org.allbinary.animation.vector.CircleAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdjustedCircleAnimation = {}
AdjustedCircleAnimation.__index = AdjustedCircleAnimation
AdjustedCircleAnimation.className = "AdjustedCircleAnimation"
setmetatable(AdjustedCircleAnimation, {__index = CircleAnimation})

function AdjustedCircleAnimation:_init_fields()
    self.xAdjustment = 0
    self.yAdjustment = 0
end


function AdjustedCircleAnimation.createAnimation(width, height, xAdjustment, yAdjustment, basicColor)
        local adjustedCircleAnimation = AdjustedCircleAnimation.new(width, height, basicColor)
        adjustedCircleAnimation:initXY(xAdjustment, yAdjustment)
        return adjustedCircleAnimation
end


function AdjustedCircleAnimation.createW(width, height, innerWidth, basicColor)
        local adjustedCircleAnimation = AdjustedCircleAnimation.new(width, height, basicColor)
        adjustedCircleAnimation:init(innerWidth)
        return adjustedCircleAnimation
end


function AdjustedCircleAnimation.new(width, height, basicColor)
    local self = setmetatable(CircleAnimation.new(width, height, basicColor), AdjustedCircleAnimation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AdjustedCircleAnimation:initXY(xAdjustment, yAdjustment)
        self.xAdjustment = xAdjustment
        self.yAdjustment = yAdjustment
end


function AdjustedCircleAnimation:init(innerWidth)
        if AndroidUtil.isAndroid() then
            local widthPortion = (java_idiv(((java_idiv(innerWidth, 3)) * 10), 7))
            self.xAdjustment = -((((self.width) // (1 << (1)))) - widthPortion)
            self.yAdjustment = self.xAdjustment
        else
            self.xAdjustment = -((((self.width) // (1 << (1)))) - innerWidth)
            self.yAdjustment = self.xAdjustment
        end
end


function AdjustedCircleAnimation:paintXY(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
        graphics:drawArc(x + self.xAdjustment, y + self.yAdjustment, self.width, self.height, 0, self.TOTAL_ANGLE)
end

return AdjustedCircleAnimation

