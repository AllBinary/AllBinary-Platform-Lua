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

local CustomTextBoxIndexedAnimationFactory = {}
package.loaded["org.allbinary.animation.text.CustomTextBoxIndexedAnimationFactory"] = CustomTextBoxIndexedAnimationFactory

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
-- local TextField = require("javax.microedition.lcdui.TextField")
local CustomTextBox = java_lazy("org.allbinary.graphics.form.item.CustomTextBox")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ABToGBUtil = java_lazy("org.allbinary.game.canvas.ABToGBUtil")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local CustomTextBox2 = java_lazy("org.allbinary.animation.text.CustomTextBox2")
local CustomTextBoxIndexedAnimation = java_lazy("org.allbinary.animation.text.CustomTextBoxIndexedAnimation")

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

-- class table CustomTextBoxIndexedAnimationFactory is declared before the requires
CustomTextBoxIndexedAnimationFactory.__index = CustomTextBoxIndexedAnimationFactory
CustomTextBoxIndexedAnimationFactory.className = "CustomTextBoxIndexedAnimationFactory"
CustomTextBoxIndexedAnimationFactory.javaClassName = "org.allbinary.animation.text.CustomTextBoxIndexedAnimationFactory"
CustomTextBoxIndexedAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface "
CustomTextBoxIndexedAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function CustomTextBoxIndexedAnimationFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.scaleProperties == nil then self.scaleProperties = nil end
    if self.maxLength == nil then self.maxLength = nil end
end


function CustomTextBoxIndexedAnimationFactory._jinit(self, fontSize, maxLength)
    CustomTextBoxIndexedAnimationFactory._init_fields(self)
        self.scaleProperties = ScaleProperties.new()
        self.scaleProperties.scaleHeight = fontSize
        self.maxLength = maxLength
    return self
end

function CustomTextBoxIndexedAnimationFactory.new(...)
    local self = setmetatable({}, CustomTextBoxIndexedAnimationFactory)
    CustomTextBoxIndexedAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function CustomTextBoxIndexedAnimationFactory:getInstance(instanceId)
        local abToGBUtil = ABToGBUtil.getInstance()
        local abCanvas = abToGBUtil.abCanvas
        local font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, self.scaleProperties.scaleHeight)
        local customTextBox = CustomTextBox2.new(abCanvas:getCustomCommandListener(), StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, self.maxLength, TextField.ANY, font, abCanvas:getLayerManager():getBackgroundBasicColor(), abCanvas:getLayerManager():getForegroundBasicColor())
        return CustomTextBoxIndexedAnimation.new(customTextBox)
end


function CustomTextBoxIndexedAnimationFactory:setInitialScale(scaleProperties)
        local fontSize = self.scaleProperties.scaleHeight
        self.scaleProperties = scaleProperties
        if self.scaleProperties.scaleHeight < 6 then
            self.scaleProperties.scaleHeight = fontSize
        end
end

return CustomTextBoxIndexedAnimationFactory

