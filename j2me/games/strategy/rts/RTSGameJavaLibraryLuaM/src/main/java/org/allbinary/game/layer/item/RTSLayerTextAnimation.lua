-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer.item

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local Animation = require("org.allbinary.animation.Animation")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSLayerTextAnimation = {}
RTSLayerTextAnimation.__index = RTSLayerTextAnimation
RTSLayerTextAnimation.className = "RTSLayerTextAnimation"
setmetatable(RTSLayerTextAnimation, {__index = Animation})

function RTSLayerTextAnimation:_init_fields()
    self.image = nil
    self.text = nil
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.fontHeight = 0
end


function RTSLayerTextAnimation.new(text, image)
    local self = setmetatable(Animation.new(), RTSLayerTextAnimation)
    self:_init_fields()
        self.text = text
        self.image = image
    return self
end


function RTSLayerTextAnimation:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function RTSLayerTextAnimation:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        Animation.paintXY(self, graphics, x, y)
        local adjustedCostY = self.image:getHeight() - self.fontHeight
        graphics:drawString(self.text, x, y + adjustedCostY, 0)
end

return RTSLayerTextAnimation

