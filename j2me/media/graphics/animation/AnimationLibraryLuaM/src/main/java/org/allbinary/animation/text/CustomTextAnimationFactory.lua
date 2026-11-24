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

local CustomTextAnimationFactory = {}
package.loaded["org.allbinary.animation.text.CustomTextAnimationFactory"] = CustomTextAnimationFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local Font = require("javax.microedition.lcdui.Font")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local AdjustCustomTextAnimation = java_lazy("org.allbinary.animation.text.AdjustCustomTextAnimation")
local CustomTextAnimation = java_lazy("org.allbinary.animation.text.CustomTextAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CustomTextAnimationFactory is declared before the requires
CustomTextAnimationFactory.__index = CustomTextAnimationFactory
CustomTextAnimationFactory.className = "CustomTextAnimationFactory"
CustomTextAnimationFactory.javaClassName = "org.allbinary.animation.text.CustomTextAnimationFactory"
CustomTextAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface "
CustomTextAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function CustomTextAnimationFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
    self.basicColor = BasicColorFactory.getInstance().BLACK
    if self.text == nil then self.text = nil end
    if self.initScaleHeight == nil then self.initScaleHeight = nil end
    self.dx = 0
    self.dy = 0
    if self.font == nil then self.font = nil end
    if self.scaleProperties == nil then self.scaleProperties = nil end
end


function CustomTextAnimationFactory.createDXY(text, fontSize, dx, dy, animationBehaviorFactory)
        local customTextAnimationFactory = CustomTextAnimationFactory.new(text, fontSize, animationBehaviorFactory)
        customTextAnimationFactory.dx = dx
        customTextAnimationFactory.dy = dy
        return customTextAnimationFactory
end


function CustomTextAnimationFactory._jinit(self, text, fontSize, animationBehaviorFactory)
    CustomTextAnimationFactory._init_fields(self)
        self.scaleProperties = ScaleProperties.new()
        self.text = text
        self.scaleProperties.scaleHeight = fontSize - (java_idiv(fontSize, 4))
        self.initScaleHeight = self.scaleProperties.scaleHeight
        self.animationBehaviorFactory = animationBehaviorFactory
        self.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, self.initScaleHeight)
    return self
end

function CustomTextAnimationFactory.new(...)
    local self = setmetatable({}, CustomTextAnimationFactory)
    CustomTextAnimationFactory._jinit(self, ...)
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

