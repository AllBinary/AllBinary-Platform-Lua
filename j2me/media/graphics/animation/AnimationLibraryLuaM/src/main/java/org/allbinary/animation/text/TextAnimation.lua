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
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local Anchor = require("org.allbinary.graphics.Anchor")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local SWTJOGLProcessor = require("org.allbinary.graphics.threed.SWTJOGLProcessor")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local TextAnimation = {}
TextAnimation.__index = TextAnimation
TextAnimation.className = "TextAnimation"
setmetatable(TextAnimation, {__index = IndexedAnimation})

function TextAnimation:_init_fields()
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.textArrayP = StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY
    self.anchor = Anchor.TOP_LEFT
    self.fontHeight = 0
    self.offsetY = 0
    self.textChangeListener = TextChangeListener.getInstance()
end


function TextAnimation.new(text, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), TextAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:setText(text)
    return self
end


function TextAnimation:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        local adjustedFontHeight = java_int(-((self.fontHeight + 0.0) * 2.00))
        self.offsetY = (function() if SWTJOGLProcessor.getInstance():isJOGL() then return adjustedFontHeight else return 0 end end)()
        self.textChangeListener:onMeasure()
        self.textChangeListener = TextChangeListener.getInstance()
        self.myFontProcessor = MyFontProcessor.getInstance()
end


-- throws Exception
function TextAnimation:nextFrame()
end


function TextAnimation:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        self:paintXYNoUpdate(graphics, x, y)
end


function TextAnimation:paintXYNoUpdate(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
        local size = (self.textArrayP.n or #self.textArrayP)
        for index = 0, size - 1 do
            graphics:drawString(self.textArrayP[index + 1], x, y + self.offsetY + (index * self.fontHeight), self.anchor)
        end
end


function TextAnimation:setTextWithOnMeasure(text, textChangeListener)
        self:setText(text)
        self.textChangeListener = textChangeListener
end


function TextAnimation:setText(text)
        local list = BasicArrayListD.new()
        if text ~= nil and #text > 0 then
            local index = 0
            local startIndex = 0
            local endIndex = 0
            while index >= 0 do
                startIndex = index
                index = ((string.find(text, "\n", (startIndex) + 1, true) or 0) - 1)
                endIndex = index
                if index < 0 then
                    endIndex = #text
                end
                list:add(string.sub(text, (startIndex) + 1, endIndex))
                if index < 0 then
                    break
                end
                index = index + 1
            end
        end
        if list:size() > 0 then
            local textArray = java_new_array(nil, list:size())
            local size = list:size()
            for index = 0, size - 1 do
                textArray[index + 1] = list:get(index)
            end
            self.textArrayP = textArray
        else
            self.textArrayP = StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY
        end
        self.myFontProcessor = self.updateMyFontProcessor
end


function TextAnimation:getTextArray()
        return self.textArrayP
end


function TextAnimation:getFontHeight()
        return self.fontHeight
end

return TextAnimation

