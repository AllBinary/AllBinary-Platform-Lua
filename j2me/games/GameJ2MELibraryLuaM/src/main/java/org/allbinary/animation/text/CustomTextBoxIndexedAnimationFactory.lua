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
-- local TextField = require("javax.microedition.lcdui.TextField")
local CustomTextBox = require("org.allbinary.graphics.form.item.CustomTextBox")
local Animation = require("org.allbinary.animation.Animation")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ABToGBUtil = require("org.allbinary.game.canvas.ABToGBUtil")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

local CustomTextBoxIndexedAnimationFactory = {}
CustomTextBoxIndexedAnimationFactory.__index = CustomTextBoxIndexedAnimationFactory
CustomTextBoxIndexedAnimationFactory.className = "CustomTextBoxIndexedAnimationFactory"

function CustomTextBoxIndexedAnimationFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.scaleProperties = nil
    self.maxLength = nil
end


function CustomTextBoxIndexedAnimationFactory.new(fontSize, maxLength)
    local self = setmetatable({}, CustomTextBoxIndexedAnimationFactory)
    self:_init_fields()
        self.scaleProperties = ScaleProperties.new()
        self.scaleProperties.scaleHeight = fontSize
        self.maxLength = maxLength
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

