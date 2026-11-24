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

local CountedLayersHudPaintable = {}
package.loaded["org.allbinary.game.part.CountedLayersHudPaintable"] = CountedLayersHudPaintable

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
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local PickedUpLayerInterfaceFactoryInterface = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local CountedLayerInterfaceFactoryPart = java_lazy("org.allbinary.game.part.CountedLayerInterfaceFactoryPart")
local PartInterface = java_lazy("org.allbinary.game.part.PartInterface")

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

-- class table CountedLayersHudPaintable is declared before the requires
CountedLayersHudPaintable.__index = CountedLayersHudPaintable
CountedLayersHudPaintable.className = "CountedLayersHudPaintable"
CountedLayersHudPaintable.javaClassName = "org.allbinary.game.part.CountedLayersHudPaintable"
CountedLayersHudPaintable.java_implements = " PaintableInterface UpdateMyFontInterface "
CountedLayersHudPaintable.java_interfaces = function() return {PaintableInterface, UpdateMyFontInterface} end

function CountedLayersHudPaintable:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    if self.partInterfaceArray == nil then self.partInterfaceArray = nil end
    if self.countedTotalStringColor == nil then self.countedTotalStringColor = nil end
    if self.countedPartsBorder == nil then self.countedPartsBorder = nil end
    if self.startIndex == nil then self.startIndex = nil end
    if self.dropSize == nil then self.dropSize = nil end
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    if self.height == nil then self.height = 0 end
end


function CountedLayersHudPaintable._jinit(self, partInterfaceArray, dropSize, startIndex, countedTotalStringColor, countedPartsBorder)
    CountedLayersHudPaintable._init_fields(self)
        self.partInterfaceArray = partInterfaceArray
        self.startIndex = startIndex
        self.countedTotalStringColor = countedTotalStringColor
        self.countedPartsBorder = countedPartsBorder
        self.dropSize = dropSize
    return self
end

function CountedLayersHudPaintable.new(...)
    local self = setmetatable({}, CountedLayersHudPaintable)
    CountedLayersHudPaintable._jinit(self, ...)
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

