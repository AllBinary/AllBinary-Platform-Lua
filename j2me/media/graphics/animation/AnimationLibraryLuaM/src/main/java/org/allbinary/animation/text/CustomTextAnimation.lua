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
-- package org.allbinary.animation.text

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local FontDebugFactory = require("org.allbinary.graphics.font.FontDebugFactory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TextAnimation = require("org.allbinary.animation.text.TextAnimation")
local TextInterface = require("org.allbinary.animation.text.TextInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomTextAnimation = {}
CustomTextAnimation.__index = CustomTextAnimation
CustomTextAnimation.className = "CustomTextAnimation"
setmetatable(CustomTextAnimation, {__index = TextAnimation})

function CustomTextAnimation:_init_fields()
    self.fontDebugFactory = FontDebugFactory.getInstance()
    self.fontSize = nil
    self.font = nil
    self.lastText = StringUtil.getInstance().INIT_STRING
    self.hasChanged = true
    self.textWidth = 0
end


function CustomTextAnimation.new(text, fontSize, animationBehavior)
    local self = setmetatable(TextAnimation.new(text, animationBehavior), CustomTextAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.fontSize = fontSize
        self.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, fontSize)
    return self
end


function CustomTextAnimation:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        local existingFont = graphics:getFont()
        self.fontDebugFactory:setFont(self.font, graphics)
        TextAnimation.paintXYNoUpdate(self, graphics, x, y)
        self.fontDebugFactory:setFont(existingFont, graphics)
end


function CustomTextAnimation:setScale(scaleX, scaleY)
        if scaleX ~= scaleY then
            error(java_exception("RuntimeException"), 0)
        end
        self.hasChanged = true
        self.font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, java_int(((self.fontSize + 0.0) * scaleX)))
end


function CustomTextAnimation:setText(text)
        if self.lastText ~= text then
            self.hasChanged = true
            self.lastText = text
            TextAnimation.setText(self, text)
        end
end


function CustomTextAnimation:getText()
        return self.lastText
end


function CustomTextAnimation:getWidth()
        if self.hasChanged then
            self.textWidth = self.font:stringWidth(self.textArrayP[1])
            self.hasChanged = false
        end
        return self.textWidth
end


function CustomTextAnimation:getFontHeight()
        return self.font:getHeight()
end

return CustomTextAnimation

