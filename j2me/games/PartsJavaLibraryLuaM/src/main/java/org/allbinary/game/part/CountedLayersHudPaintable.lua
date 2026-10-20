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
-- package org.allbinary.game.part

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local PickedUpLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CountedLayersHudPaintable = {}
CountedLayersHudPaintable.__index = CountedLayersHudPaintable
CountedLayersHudPaintable.className = "CountedLayersHudPaintable"

function CountedLayersHudPaintable:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.partInterfaceArray = nil
    self.countedTotalStringColor = nil
    self.countedPartsBorder = nil
    self.startIndex = nil
    self.dropSize = nil
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.height = 0
end


function CountedLayersHudPaintable.new(partInterfaceArray, dropSize, startIndex, countedTotalStringColor, countedPartsBorder)
    local self = setmetatable({}, CountedLayersHudPaintable)
    self:_init_fields()
        self.partInterfaceArray = partInterfaceArray
        self.startIndex = startIndex
        self.countedTotalStringColor = countedTotalStringColor
        self.countedPartsBorder = countedPartsBorder
        self.dropSize = dropSize
    return self
end


function CountedLayersHudPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.height = font:getHeight()
        if self.dropSize > font:getHeight() then
            self.height = self.dropSize
        end
        if CountedLayersHudPaintable.XXStringWidth == 0 then
            local XXString = "XX"
            CountedLayersHudPaintable.XXStringWidth = font:stringWidth(XXString)
        end
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function CountedLayersHudPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local lastWidth = self.displayInfoSingleton:getLastWidth()
        local widthEdge = lastWidth - self.dropSize
        local size = (self.partInterfaceArray.n or #self.partInterfaceArray)
        local count = 0
        local y = 0
        local countedLayerInterfaceFactory = nil
        local pickedUpLayerInterfaceFactoryInterface = nil
        local layerInterface = nil
        local charArray = nil
        for index = self.startIndex, size - 1 do
            countedLayerInterfaceFactory = self.partInterfaceArray[index + 1]
            if countedLayerInterfaceFactory:getTotal() > 0 then
                pickedUpLayerInterfaceFactoryInterface = countedLayerInterfaceFactory:getCountedPickedUpLayerInterfaceFactory()
                layerInterface = pickedUpLayerInterfaceFactoryInterface:getIconLayer()
                y = 40 + (count * self.height)
                layerInterface:setPosition(widthEdge, y, layerInterface:getZP())
                layerInterface:paint(graphics)
                graphics:setColor(self.countedTotalStringColor)
                countedLayerInterfaceFactory:paint(graphics)
                charArray = countedLayerInterfaceFactory:getTotalString()
                graphics:drawChars(charArray, 0, (charArray.n or #charArray), widthEdge - countedLayerInterfaceFactory:getXOffset(), y, 0)
                count = count + 1
            end
        end
        if count > 0 then
            graphics:setColor(self.countedPartsBorder)
            graphics:drawRect(lastWidth - (CountedLayersHudPaintable.XXStringWidth + self.dropSize), 40, CountedLayersHudPaintable.XXStringWidth + self.dropSize, (count * self.height) + 3)
        end
end


function CountedLayersHudPaintable:paintThreed(graphics)
end

CountedLayersHudPaintable.XXStringWidth = 0

return CountedLayersHudPaintable

