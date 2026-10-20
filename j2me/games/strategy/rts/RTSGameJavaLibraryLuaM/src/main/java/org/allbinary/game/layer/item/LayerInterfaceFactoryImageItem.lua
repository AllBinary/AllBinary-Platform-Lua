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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local ABCustomImageItem = require("org.allbinary.graphics.form.item.ABCustomImageItem")
local Animation = require("org.allbinary.animation.Animation")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local LayerInterfaceFactoryInterface = require("org.allbinary.layer.LayerInterfaceFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LayerInterfaceFactoryImageItem = {}
LayerInterfaceFactoryImageItem.__index = LayerInterfaceFactoryImageItem
LayerInterfaceFactoryImageItem.className = "LayerInterfaceFactoryImageItem"
setmetatable(LayerInterfaceFactoryImageItem, {__index = ABCustomImageItem})

function LayerInterfaceFactoryImageItem:_init_fields()
    self.animationArray = nil
    self.layerInterfaceFactoryInterface = nil
end


function LayerInterfaceFactoryImageItem.new(label, img, layout, altText, basicColor, animationArray, layerInterfaceFactoryInterface)
    local self = setmetatable(ABCustomImageItem.new(label, img, layout, altText, basicColor, 0), LayerInterfaceFactoryImageItem)
    self:_init_fields()
        -- super(...) made self above
        self.animationArray = animationArray
        self.layerInterfaceFactoryInterface = layerInterfaceFactoryInterface
    return self
end


function LayerInterfaceFactoryImageItem:getLayerInterfaceFactoryInterface()
        return self.layerInterfaceFactoryInterface
end


function LayerInterfaceFactoryImageItem:paintXY(graphics, x, y)
        ABCustomImageItem.paintXY(self, graphics, x, y)
        do
            local index = (self.animationArray.n or #self.animationArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationArray[index + 1]:paintXY(graphics, x, y)
            end
        end
end

return LayerInterfaceFactoryImageItem

