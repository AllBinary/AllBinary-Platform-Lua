-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.animation.text

-- local Font = require("javax.microedition.lcdui.Font")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomTextAnimationFactory = {}
CustomTextAnimationFactory.__index = CustomTextAnimationFactory
CustomTextAnimationFactory.className = "CustomTextAnimationFactory"

function CustomTextAnimationFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.animationBehaviorFactory = nil
    self.basicColor = BasicColorFactory.getInstance().BLACK
    self.text = nil
    self.initScaleHeight = nil
    self.dx = 0
    self.dy = 0
    self.font = nil
    self.scaleProperties = nil
end


function CustomTextAnimationFactory.createDXY(text, fontSize, dx, dy, animationBehaviorFactory)
        local customTextAnimationFactory = CustomTextAnimationFactory.new(text, fontSize, animationBehaviorFactory)
        customTextAnimationFactory.dx = dx
        customTextAnimationFactory.dy = dy
        return customTextAnimationFactory
end


function CustomTextAnimationFactory.new(text, fontSize, animationBehaviorFactory)
    local self = setmetatable({}, CustomTextAnimationFactory)
    self:_init_fields()
        self.scaleProperties = ScaleProperties.new()
        self.text = text
        self.scaleProperties.scaleHeight = fontSize - (java_idiv(fontSize, 4))
        self.initScaleHeight = self.scaleProperties.scaleHeight
        self.animationBehaviorFactory = animationBehaviorFactory
        self.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, self.initScaleHeight)
    return self
end


-- throws Exception
function CustomTextAnimationFactory:getInstance(instanceId)
        local customTextAnimation = nil
        if self.dx ~= 0 or self.dy ~= 0 then
            customTextAnimation = AdjustCustomTextAnimation.new(self.text, self.scaleProperties.scaleHeight, self.dx, self.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            customTextAnimation = CustomTextAnimation.new(self.text, self.scaleProperties.scaleHeight, self.animationBehaviorFactory:getOrCreateInstance())
        end
        customTextAnimation:setBasicColorP(self.basicColor)
        return customTextAnimation
end


function CustomTextAnimationFactory:setInitialScale(scaleProperties)
end


function CustomTextAnimationFactory:getWidth()
        return self.font:stringWidth(self.text)
end


function CustomTextAnimationFactory:getHeight()
        return self.font:getHeight()
end

return CustomTextAnimationFactory

