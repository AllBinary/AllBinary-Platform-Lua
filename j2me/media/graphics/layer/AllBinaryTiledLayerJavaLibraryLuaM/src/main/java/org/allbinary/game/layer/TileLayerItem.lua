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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Screen = require("javax.microedition.lcdui.Screen")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local ABCustomItemInterface = require("org.allbinary.graphics.form.item.ABCustomItemInterface")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TileLayerItem = {}
TileLayerItem.__index = TileLayerItem
TileLayerItem.className = "TileLayerItem"
setmetatable(TileLayerItem, {__index = ABCustomItem})

function TileLayerItem:_init_fields()
    self.tiledLayer = nil
end


function TileLayerItem.new(label, tiledLayer, layout, altText, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ABCustomItem.new(label, backgroundBasicColor, foregroundBasicColor), TileLayerItem)
    self:_init_fields()
        -- super(...) made self above
        self.tiledLayer = tiledLayer
    return self
end


function TileLayerItem:setOwner(owner)
end


function TileLayerItem:getMinimumWidth()
        return self.tiledLayer:getWidth()
end


function TileLayerItem:getMinimumHeight()
        return self.tiledLayer:getHeight()
end


function TileLayerItem:getMinContentHeight()
        return self.tiledLayer:getHeight()
end


function TileLayerItem:getMinContentWidth()
        return self.tiledLayer:getWidth()
end


function TileLayerItem:getPrefContentHeight(width)
        return self.tiledLayer:getHeight()
end


function TileLayerItem:getPrefContentWidth(height)
        return self.tiledLayer:getWidth()
end


function TileLayerItem:paintXY(graphics, x, y)
        self.tiledLayer:setPosition(x, y, self.tiledLayer:getZP())
        self.tiledLayer:paint(graphics)
end


function TileLayerItem:paintUnselected(graphics, x, y)
end

return TileLayerItem

