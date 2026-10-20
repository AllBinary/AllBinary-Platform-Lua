-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local ABCustomImageItem = require("org.allbinary.graphics.form.item.ABCustomImageItem")
local CharArrayFactory = require("org.allbinary.logic.java.character.CharArrayFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local PrimitiveLongUtil = require("org.allbinary.logic.math.PrimitiveLongUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TechnologyRTSInterfaceImageItem = {}
TechnologyRTSInterfaceImageItem.__index = TechnologyRTSInterfaceImageItem
TechnologyRTSInterfaceImageItem.className = "TechnologyRTSInterfaceImageItem"
setmetatable(TechnologyRTSInterfaceImageItem, {__index = ABCustomImageItem})

function TechnologyRTSInterfaceImageItem:_init_fields()
    self.rtsInterface = nil
    self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(10000)
    self.LEVEL = "Level"
    self.COST = "Cost"
    self.DOLLAR = "$"
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.costString = CharArrayFactory.getInstance():getZeroCharArray()
    self.costLength = 0
    self.levelString = CharArrayFactory.getInstance():getZeroCharArray()
    self.levelLength = 0
    self.adjustedCostLabelY = 0
    self.adjustedCostX = 0
    self.adjustedCostY = 0
    self.adjustedLevelX = 0
    self.adjustedLevelY = 0
end


function TechnologyRTSInterfaceImageItem.new(label, img, layout, altText, basicColor, rtsInterface)
    local self = setmetatable(ABCustomImageItem.new(label, img, layout, altText, basicColor, 0), TechnologyRTSInterfaceImageItem)
    self:_init_fields()
        -- super(...) made self above
        self.rtsInterface = rtsInterface
        self:update()
    return self
end


function TechnologyRTSInterfaceImageItem:updateMeasurement(graphics)
        local font = graphics:getFont()
        local fontHeight = font:getHeight()
        local imageHeight = 0
        local image = self:getImage()
        if image ~= NullImage.NULL_IMAGE then
            imageHeight = image:getHeight()
        end
        self.adjustedCostLabelY = -self.yOffset + imageHeight - (3 * fontHeight)
        self.adjustedCostY = -self.yOffset + imageHeight - (2 * fontHeight)
        self.adjustedCostX = 2 + (#self.DOLLAR * (fontHeight - 1))
        self.adjustedLevelY = -self.yOffset + imageHeight - fontHeight
        self.adjustedLevelX = 2 + (#self.LEVEL * (fontHeight - 1))
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function TechnologyRTSInterfaceImageItem:getRtsInterface()
        return self.rtsInterface
end


function TechnologyRTSInterfaceImageItem:update()
        self.costString = self.primitiveLongUtil:getCharArray(self:getRtsInterface():getUpgradeCost())
        self.levelString = self.primitiveLongUtil:getCharArray(self:getRtsInterface():getLevel())
end


function TechnologyRTSInterfaceImageItem:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        ABCustomImageItem.paintXY(self, graphics, x, y)
        local xa = x + 2
        graphics:drawString(self.COST, xa, y + self.adjustedCostLabelY, 0)
        graphics:drawString(self.DOLLAR, xa, y + self.adjustedCostY, 0)
        graphics:drawChars(self.costString, 0, self.costLength, x + self.adjustedCostX, y + self.adjustedCostY, 0)
        graphics:drawString(self.LEVEL, xa, y + self.adjustedLevelY, 0)
        graphics:drawChars(self.levelString, 0, self.levelLength, x + self.adjustedLevelX, y + self.adjustedLevelY, 0)
end

return TechnologyRTSInterfaceImageItem

