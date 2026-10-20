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
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local RawKeyEventListener = require("org.allbinary.game.input.event.RawKeyEventListener")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local CustomTextBox = require("org.allbinary.graphics.form.item.CustomTextBox")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TextInterface = require("org.allbinary.animation.text.TextInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomTextBoxIndexedAnimation = {}
CustomTextBoxIndexedAnimation.__index = CustomTextBoxIndexedAnimation
CustomTextBoxIndexedAnimation.className = "CustomTextBoxIndexedAnimation"
setmetatable(CustomTextBoxIndexedAnimation, {__index = IndexedAnimation})

function CustomTextBoxIndexedAnimation:_init_fields()
    self.customTextBox = nil
    self.lastText = StringUtil.getInstance().INIT_STRING
    self.hasChanged = true
    self.textChangeListener = TextChangeListener.getInstance()
end


function CustomTextBoxIndexedAnimation.new(customTextBox)
    local self = setmetatable(IndexedAnimation.new(AnimationBehavior.getInstance()), CustomTextBoxIndexedAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.customTextBox = customTextBox
    return self
end


function CustomTextBoxIndexedAnimation:setBasicColorP(basicColor)
        self.customTextBox:getTextFieldItem():setForegroundBasicColorP(basicColor)
end


function CustomTextBoxIndexedAnimation:setBackgroundBasicColorP(basicColor)
        self.customTextBox:getTextFieldItem():setBackgroundBasicColorP(basicColor)
end


function CustomTextBoxIndexedAnimation:setTextWithOnMeasure(text, textChangeListener)
        self:setText(text)
        self.textChangeListener = textChangeListener
end


function CustomTextBoxIndexedAnimation:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.textChangeListener:onMeasure()
        self.textChangeListener = TextChangeListener.getInstance()
end


function CustomTextBoxIndexedAnimation:setText(text)
        if self.lastText ~= text then
            self.hasChanged = true
            self.lastText = text
            self.customTextBox:getTextFieldItem():setString(text)
        end
end


function CustomTextBoxIndexedAnimation:getText()
        return self.customTextBox:getTextFieldItem():getString()
end


function CustomTextBoxIndexedAnimation:onEventRaw(keyCode, deviceId, repeated)
        self.customTextBox:onEventRaw(keyCode, deviceId, repeated)
end


function CustomTextBoxIndexedAnimation:getFontHeight()
        return self.customTextBox:getTextFieldItem():getFontHeight()
end


function CustomTextBoxIndexedAnimation:paintXY(graphics, x, y)
        self.customTextBox:paintXY(graphics, x, y)
end


function CustomTextBoxIndexedAnimation:paintThreedXYZ(graphics, x, y, z)
end

return CustomTextBoxIndexedAnimation

