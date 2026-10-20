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
-- package org.allbinary.game.layer

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local CharArrayFactory = require("org.allbinary.logic.java.character.CharArrayFactory")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local CommonButtons = require("org.allbinary.input.motion.button.CommonButtons")
local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UpgradableRTSLayerHudPaintable = {}
UpgradableRTSLayerHudPaintable.__index = UpgradableRTSLayerHudPaintable
UpgradableRTSLayerHudPaintable.className = "UpgradableRTSLayerHudPaintable"
setmetatable(UpgradableRTSLayerHudPaintable, {__index = SelectionHudPaintable})

function UpgradableRTSLayerHudPaintable:_init_fields()
    self.PERCENT = "%"
    self.rtsLayer = CollidableDestroyableDamageableLayer.getNullInstance()
    self.costY = 0
    self.costY1 = 0
    self.percentCompleteX2 = 0
    self.rtsLayerCompositePaintableLateInit = nil
    self.charHeight = 0
    self.charWidth = 0
    self.percentComplete = 0
    self.percentCompleteX = 0
    self.percentCompleteArray = CharArrayFactory.getInstance():getZeroCharArray()
    self.currentTotalDigits = 0
end


function UpgradableRTSLayerHudPaintable.getInstance()
        return UpgradableRTSLayerHudPaintable.instance
end


function UpgradableRTSLayerHudPaintable.new()
    local self = setmetatable(SelectionHudPaintable.new(), UpgradableRTSLayerHudPaintable)
    self:_init_fields()
    return self
end


function UpgradableRTSLayerHudPaintable:updateMeasurement(graphics)
        SelectionHudPaintable.updateMeasurement(self, graphics)
        local font = graphics:getFont()
        self.charHeight = font:getHeight()
        self.charWidth = MyFontProcessor.defaultCharWidth(font)
end


function UpgradableRTSLayerHudPaintable:update()
        SelectionHudPaintable.update(self)
        local commonButtons = CommonButtons.getInstance()
        self.costY = (self.y + commonButtons.STANDARD_BUTTON_SIZE)
        self.costY1 = (self.y + commonButtons.STANDARD_BUTTON_SIZE - self.charHeight)
        self.percentCompleteX2 = self.imageX + commonButtons.STANDARD_BUTTON_SIZE - self.charWidth
        local displayInfoSingleton = DisplayInfoSingleton.getInstance()
        if displayInfoSingleton:getLastWidth() > 320 then
            self.rtsLayerCompositePaintableLateInit = UpgradableWideRTSLayerPaintable.new(self)
        else
            self.rtsLayerCompositePaintableLateInit = RTSLayerCompositePaintable.new(self)
        end
end


function UpgradableRTSLayerHudPaintable:updateSelectionInfo()
        local rtsLayer = self:getRtsLayer()
        self.rtsLayerCompositePaintableLateInit:update(rtsLayer)
        self:setAnimationInterface(rtsLayer:getVerticleBuildAnimationInterface())
        self:setName(rtsLayer:getName())
end


function UpgradableRTSLayerHudPaintable:updateInfo()
        local rtsLayer = self:getRtsLayer()
        self.percentComplete = rtsLayer:getPercentComplete()
        if self.percentComplete < 10 then
            self.percentCompleteX = 32
        elseif self.percentComplete < 100 then
            self.percentCompleteX = 24
        else
            self.percentCompleteX = 16
        end
        self.percentCompleteArray = self:getPrimitiveLongUtil():getCharArray(self.percentComplete)
        self.currentTotalDigits = self:getPrimitiveLongUtil():getCurrentTotalDigits()
end


function UpgradableRTSLayerHudPaintable:paint(graphics)
        SelectionHudPaintable.paint(self, graphics)
        self.rtsLayerCompositePaintableLateInit:paint(graphics)
        graphics:drawChars(self.percentCompleteArray, 0, self.currentTotalDigits, self.imageX + self.percentCompleteX, self.costY, 0)
        graphics:drawString(self.PERCENT, self.percentCompleteX2, self.costY, 0)
        self:getAnimationInterface():paintXY(graphics, self.imageX, self.y)
end


function UpgradableRTSLayerHudPaintable:setRtsLayer(rtsLayer)
        self.rtsLayer = rtsLayer
end


function UpgradableRTSLayerHudPaintable:getRtsLayer()
        return self.rtsLayer
end

UpgradableRTSLayerHudPaintable.instance = UpgradableRTSLayerHudPaintable.new()

return UpgradableRTSLayerHudPaintable

